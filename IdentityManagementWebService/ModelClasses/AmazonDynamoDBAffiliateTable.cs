using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using IdentityManagementWebService.Connection;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class AmazonDynamoDBAffiliateTable
        {
            private static AmazonDynamoDBAffiliateTable instance;
            public static AmazonDynamoDBAffiliateTable Instance
                {
                get
                    {
                    if ( null == instance )
                        {
                        instance = new AmazonDynamoDBAffiliateTable();
                        }
                    return instance;
                    }
                }
            private string _tableName = "Affiliates";
            private Table table;

            public Table Table
                {
                get
                    {
                    if ( null == table )
                        {
                        table = GetTableObject(_tableName);
                        }
                    return table;
                    }
                }
            private void CreateTable (string tablename)
                {
                Console.WriteLine("\n*** Creating table ***");
                var request = new CreateTableRequest
                    {
                    AttributeDefinitions = new List<AttributeDefinition>()
            {
                new AttributeDefinition
                {
                    AttributeName = "Name",
                    AttributeType = "S"
                },
            },
                    KeySchema = new List<KeySchemaElement>
            {
                new KeySchemaElement
                {
                    AttributeName = "Name",
                    KeyType = "HASH" //Partition key
                },

            },
                    ProvisionedThroughput = new ProvisionedThroughput
                        {
                        ReadCapacityUnits = 5,
                        WriteCapacityUnits = 6
                        },
                    TableName = tablename
                    };

                var response = AmazonDynamoDBClientConnection.Client.CreateTable(request);

                var tableDescription = response.TableDescription;
                Console.WriteLine("{1}: {0} \t ReadsPerSec: {2} \t WritesPerSec: {3}",
                          tableDescription.TableStatus,
                          tableDescription.TableName,
                          tableDescription.ProvisionedThroughput.ReadCapacityUnits,
                          tableDescription.ProvisionedThroughput.WriteCapacityUnits);

                string status = tableDescription.TableStatus;
                Console.WriteLine(tablename + " - " + status);

                WaitUntilTableReady(tablename);
                }
            private void WaitUntilTableReady (string tableName)
                {
                string status = null;
                // Let us wait until table is created. Call DescribeTable.
                do
                    {
                    System.Threading.Thread.Sleep(5000); // Wait 5 seconds.
                    try
                        {
                        var res = AmazonDynamoDBClientConnection.Client.DescribeTable(new DescribeTableRequest
                            {
                            TableName = tableName
                            });

                        Console.WriteLine("Table name: {0}, status: {1}",
                                  res.Table.TableName,
                                  res.Table.TableStatus);
                        status = res.Table.TableStatus;
                        }
                    catch ( ResourceNotFoundException )
                        {
                        // DescribeTable is eventually consistent. So you might
                        // get resource not found. So we handle the potential exception.
                        }
                    } while ( status != "ACTIVE" );
                }
            public Table GetTableObject (string tableName)
                {
                // Now, create a Table object for the specified table
                Table table = null;
                try
                    {
                    if ( null == table )
                        {
                        //CreateTable(tableName);
                        table = Table.LoadTable(AmazonDynamoDBClientConnection.Client, tableName);
                        }
                    }
                // "The remote name could not be resolved: 'dynamodb.us-east-1.amazonaws.com'";
                catch ( Exception ex )
                    {
                    Console.WriteLine("\n Error: failed to load the table; " + ex.Message);
                    return (null);
                    }
                return (table);
                }
            public Response SaveDataInDynamoDb (AffiliateDataModel affiliate)
                {
                try
                    {

                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                var affiliatename = Table.GetItem(affiliate.Name);
                    if ( null == affiliatename )
                        {
                    Response responseIdentity = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
                    List<IdentityDataModel> Identities = responseIdentity.IdentityDataModel;
                    List<string> affiliateIdentites = new List<string>();
                    foreach ( var identity in Identities )
                        {
                        if ( null != identity.Affiliate && identity.Affiliate.ToLower().Equals(affiliate.Name.ToLower()) )
                            {
                            affiliateIdentites.Add(identity.Email);
                            }
                        }
                    affiliate.Identities = affiliateIdentites;
                    string jsonText = JsonConvert.SerializeObject(affiliate);
                    var item = Document.FromJson(jsonText);
                        Document response = Table.PutItem(item);
                        return new Response(true, null);
                        }
                    return new Response(false, "Identity already Exist");
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }
            public Response UpdateDataInDynamoDb (AffiliateDataModel affiliate,string identityDataEmail=null)
                {
                try
                    {
                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                Document identityemail = Table.GetItem(affiliate.Name);
                    if ( null != identityemail )
                        {
                    if ( null != identityDataEmail )
                        {
                        Response result=GetAllDataInDynamoDb();
                        foreach ( AffiliateDataModel value in result.AffiliateDataModel )
                            {
                            if ( value.Identities.Contains(identityDataEmail) )
                                {
                                value.Identities.Remove(identityDataEmail);
                                string json = JsonConvert.SerializeObject(value);
                                Document val = Document.FromJson(json);
                                Table.UpdateItem(val);
                                }
                            }
                        }
                    Response responseIdentity = AmazonDynamoDBIdentityTable.Instance.GetAllDataInDynamoDb();
                    List<IdentityDataModel> Identities = responseIdentity.IdentityDataModel;
                    List<string> affiliateIdentites = new List<string>();
                    foreach ( var identity in Identities )
                        {
                        if ( null != identity.Affiliate && identity.Affiliate.ToLower().Equals(affiliate.Name.ToLower()) )
                            {
                            affiliateIdentites.Add(identity.Email);
                            }
                        }
                    affiliate.Identities = affiliateIdentites;
                    string jsonText = JsonConvert.SerializeObject(affiliate);
                    Document item = Document.FromJson(jsonText);
                        Document response = Table.UpdateItem(item);
                        return new Response(true, null);
                        }
                    return new Response(false, "Identity no more exist in database");
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }
            public Response GetDataInDynamoDb (string affiliatename)
                {
                List<AffiliateDataModel> Identities = new List<AffiliateDataModel>();
                Dictionary<string, string> identityvalues = new Dictionary<string, string>();
                try
                    {
                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                    Document affiliateIdentity = Table.GetItem(affiliatename);
                    if ( null == affiliateIdentity )
                        {
                        return new Response(false, "Identity no more exist in database");
                        }
                    string json = affiliateIdentity.ToJson();
                    AffiliateDataModel identity = JsonConvert.DeserializeObject<AffiliateDataModel>(json);
                    Identities.Add(identity);
                    return new Response(true, "Found Element", Identities);
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }
      

        internal AffiliateDataModel SetEmptyValuestoNull (AffiliateDataModel affiliateidentity)
                {
                List<WebsiteDataModel> list = new List<WebsiteDataModel>();
                affiliateidentity.Name = string.IsNullOrEmpty(affiliateidentity.Name) ? " " : affiliateidentity.Name;
                affiliateidentity.Identities = new List<string>();
                return affiliateidentity;
                }
            internal AffiliateDataModel ConvertToLowerCase (AffiliateDataModel identityData)
                {
                List<string> list = new List<string>();
                identityData.Name = identityData.Name.ToLower();
                if ( identityData.Identities.Count > 0 )
                    {
                    foreach ( var website in identityData.Identities )
                        {
                        list.Add(website.ToLower());
                        }
                identityData.Identities = list;
                }
                return identityData;
                }
            internal AffiliateDataModel ConvertToTitleCase (AffiliateDataModel affiliateidentity)
                {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            List<string> list = new List<string>();
            affiliateidentity.Name = textInfo.ToTitleCase(affiliateidentity.Name);
            if ( affiliateidentity.Identities.Count > 0 )
                {
                foreach ( var website in affiliateidentity.Identities )
                    {
                    list.Add(textInfo.ToTitleCase(website));
                    }
                affiliateidentity.Identities = list;
                }
                return affiliateidentity;
                }
            internal Response DynamoDbSearchAffiliates (IdentitiesFilterCriteria filterCriteria)
                {
                if ( (null == filterCriteria.FirstName || "" == filterCriteria.FirstName) && (null == filterCriteria.Date || "" == filterCriteria.Date) )
                    {
                    return new Response(false, "First enter Search String");
                    }
                Dictionary<string, Condition> filter = new Dictionary<string, Condition>();
                if ( null != filterCriteria.FirstName && "" != filterCriteria.FirstName )
                    {
                    filter.Add("Name", new Condition
                        {
                        ComparisonOperator = "CONTAINS",
                        AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=filterCriteria.FirstName.ToLower()}
                               }
                        });
                    }
                if ( null != filterCriteria.Date && "" != filterCriteria.Date )
                    {

                    filter.Add("CurrentDate", new Condition
                        {
                        ComparisonOperator = "CONTAINS",
                        AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=filterCriteria.Date.ToLower() }
                               }
                        });
                    }
                ScanRequest request = new ScanRequest
                    {
                    TableName = _tableName,
                    AttributesToGet = new List<string> { "CurrentDate", "Name", "Identities" },
                    ScanFilter = filter
                    };
                ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
                List<AffiliateDataModel> identityList = CovertresponseIntoJSON(response);
                return new Response(true, "Search data found", identityList);
                }
            public Response GetAllDataInDynamoDb ()
                {
                try
                    {
                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                    var request = new ScanRequest
                        {
                        TableName = "Affiliates",
                        };

                    ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
                    List<AffiliateDataModel> identityList = CovertresponseIntoJSON(response);
                    if ( null == identityList )
                        {
                        new Response(false, "Identity no more exist in database");
                        }
                    return new Response(true, "Found Element", identityList);
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }
            private List<AffiliateDataModel> CovertresponseIntoJSON (ScanResponse response)
                {
                List<Dictionary<string, AttributeValue>> result = response.Items;
                if ( null == result )
                    {
                    return null;
                    }
                List<AffiliateDataModel> identityList = new List<AffiliateDataModel>();
                AffiliateDataModel affiliateIdentity = new AffiliateDataModel();
                List<string> listofIdentites;
                foreach ( Dictionary<string, AttributeValue> items in result )
                    {
                    listofIdentites = new List<string>();
                    Dictionary<string, string> item = new Dictionary<string, string>();
                    Dictionary<string, List<string>> websiteDataModel = new Dictionary<string, List<string>>();
                    foreach ( var val in items )
                        {
                        if ( val.Key.ToLower().Equals("identities") )
                            {
                            foreach ( var web in val.Value.L )
                                {
                                listofIdentites.Add(web.S);
                                }
                            }
                        item.Add(val.Key, val.Value.S);
                        }
                    string jsonString = JsonConvert.SerializeObject(item, Formatting.Indented);
                    affiliateIdentity = JsonConvert.DeserializeObject<AffiliateDataModel>(jsonString);
                    affiliateIdentity.Identities = listofIdentites;
                    identityList.Add(affiliateIdentity);
                    }
                return identityList;
                }
            public Response DeleteDataInDynamoDb (string email)
                {
                Document identityemail = Table.GetItem(email);
                if ( null != identityemail )
                    {
                    Document response = Table.DeleteItem(identityemail);
                    return new Response(true, null);
                    }
                return new Response(false, "Identity no more exist in database");
                }
            }
        }
   
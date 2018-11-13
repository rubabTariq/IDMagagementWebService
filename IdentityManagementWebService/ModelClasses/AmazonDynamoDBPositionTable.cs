using System;
using System.Collections.Generic;
using System.Globalization;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using Newtonsoft.Json;
using IdentityManagementWebService.ModelClasses;
using IdentityManagementWebService.Connection;

namespace IdentityManagementWebService.ModelClasses
    {
    public class AmazonDynamoDBPositionTable
        {
            private string _tablename = "Position";
            private static AmazonDynamoDBPositionTable instance;
            public static AmazonDynamoDBPositionTable Instance
                {
                get
                    {
                    if ( null == instance )
                        {
                        instance = new AmazonDynamoDBPositionTable();
                        }
                    return instance;
                    }
                }
            private Table table;

            public Table Table
                {
                get
                    {
                    if ( null == table )
                        {
                        table = GetTableObject(_tablename);
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
                // new AttributeDefinition
                //{
                //    AttributeName = "Email",
                //    AttributeType = "S"
                //},
                  new AttributeDefinition
                {
                    AttributeName = "PositionLabel",
                    AttributeType = "S"
                }
            },
                    KeySchema = new List<KeySchemaElement>
            {
                //new KeySchemaElement
                //{
                //    AttributeName = "Email",
                //    KeyType = "HASH" //Partition key
                //},
                new KeySchemaElement
                {
                    AttributeName = "PositionLabel",
                    KeyType = "HASH" //Partition key
                }
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
            public Response SaveDataInDynamoDb (PositionData positionData)
                {
                try
                    {
                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                        var Positiontaskname = Table.GetItem(positionData.PositionLabel);
                        if ( null == Positiontaskname )
                            {
                            string jsonText = JsonConvert.SerializeObject(positionData);
                            var item = Document.FromJson(jsonText);
                            Document response = Table.PutItem(item);
                            }
                        else
                            {
                            string jsonText = JsonConvert.SerializeObject(positionData);
                            Document item = Document.FromJson(jsonText);
                            Document response = Table.UpdateItem(item);

                            }
                    return new Response(true, "Table updated");
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }
            public Response deleteCustomTaskDataInDynamoDb (string email)
                {
            return null;
                }
            public Response editCustomTaskDataInDynamoDb (string email)
                {
                List<PositionData> Identities = new List<PositionData>();
                Dictionary<string, string> Positionvalues = new Dictionary<string, string>();
                try
                    {
                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                    Response response = GetAllDataInDynamoDb();
                    //   Document Positionemail = Table.GetItem(email);
                    if ( null == response.PositionData || 0 == response.PositionData.Count )
                        {
                        return new Response(false, "Position no more exist in database");
                        }
                    foreach ( PositionData findPosition in response.PositionData )
                        {
                        foreach ( string selectedEmail in findPosition.SelectedIdentities )
                            {

                            if ( selectedEmail == email )
                                {
                                Identities.Add(findPosition);
                                return new Response(true, "Found Element", Identities);
                                }
                            }
                        }
                    return new Response(false, "Position no more exist in database");
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }

            public Response GetDataInDynamoDb (string positionLabel)
                {
                List<PositionData> Position = new List<PositionData>();
                Dictionary<string, string> Positionvalues = new Dictionary<string, string>();
                try
                    {
                    if ( null == Table )
                        {
                        return new Response(false, "Table not Found");
                        }
                    Response response = GetAllDataInDynamoDb();
                    //   Document Positionemail = Table.GetItem(email);
                    if ( null == response.PositionData || 0 == response.PositionData.Count )
                        {
                        return new Response(false, "Position no more exist in database");
                        }
                    foreach ( PositionData findPosition in response.PositionData )
                        {
                        if ( findPosition.PositionLabel == positionLabel )
                            {
                            Position.Add(findPosition);
                            return new Response(true, "Found Element", Position);
                            }
                        }
                    return new Response(false, "Position no more exist in database");
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }

            internal PositionData ConvertToLowerCase (PositionData PositionData)
                {
                PositionData.PositionLabel = PositionData.PositionLabel.ToLower();
                PositionData.PositionWebsite = PositionData.PositionWebsite.ToLower();
                PositionData.Status = PositionData.Status.ToLower();
                return PositionData;
                }
            internal PositionData ConvertToTitleCase (PositionData PositionData)
                {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                PositionData.PositionLabel = textInfo.ToTitleCase(PositionData.PositionLabel);
                PositionData.PositionWebsite = textInfo.ToTitleCase(PositionData.PositionWebsite);
                PositionData.Status = textInfo.ToTitleCase(PositionData.Status);
                return PositionData;
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
                        TableName = "Position",
                        };

                    var response = AmazonDynamoDBClientConnection.Client.Scan(request);
                    List<Dictionary<string, AttributeValue>> result = response.Items;
                    if ( null == result )
                        {
                        return new Response(false, "Position no more exist in database");
                        }

                    List<PositionData> PositionList = CovertresponseIntoJSON(response);
                    return new Response(true, "Found Element", PositionList);
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }

            public Response DeleteDataInDynamoDb (string taskname)
                {
                try
                    {
                    Response response = GetAllDataInDynamoDb();
                    if ( null == response.PositionData || 0 == response.PositionData.Count )
                        {
                        return new Response(false, "Position no more exist in database");
                        }
                    foreach ( PositionData findPosition in response.PositionData )
                        {
                        if ( findPosition.PositionLabel == taskname )
                            {
                            Document responseofDeletion = Table.DeleteItem(findPosition.PositionLabel);
                            return new Response(true, null);
                            }
                        }
                    return new Response(false, "Position not found");
                    }
                catch ( Exception exception )
                    {
                    Console.WriteLine(exception.Message);
                    return new Response(false, exception.Message);
                    }
                }
            internal Response DynamoDbSearchTasks (PositionFilterCriteria positionCriteria)
                {
                if ( (null == positionCriteria.PositionLabel || "" == positionCriteria.PositionLabel)  && (null == positionCriteria.Website || "" == positionCriteria.Website) && 
                (null == positionCriteria.Status || "" == positionCriteria.Status) )
                    {
                    return new Response(false, "First enter Search String");
                    }
                Dictionary<string, Condition> filter = new Dictionary<string, Condition>();
                if ( null != positionCriteria.PositionLabel && "" != positionCriteria.PositionLabel )
                    {

                    filter.Add("PositionLabel", new Condition
                        {
                        ComparisonOperator = "CONTAINS",
                        AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=positionCriteria.PositionLabel.ToLower() }
                               }
                        });
                    }
                if ( null != positionCriteria.Website && "" != positionCriteria.Website )
                    {

                    filter.Add("Website", new Condition
                        {
                        ComparisonOperator = "CONTAINS",
                        AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=positionCriteria.Website.ToLower() }
                               }
                        });
                    }
                if ( null != positionCriteria.Status && "" != positionCriteria.Status )
                    {

                    filter.Add("Status", new Condition
                        {
                        ComparisonOperator = "CONTAINS",
                        AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=positionCriteria.Status.ToLower() }
                               }
                        });
                    }
                

                ScanRequest request = new ScanRequest
                    {
                    TableName = _tablename,
                    AttributesToGet = new List<string> { "PositionLabel", "PositionWebsite", "SelectSelection", "StartDateTime","EndDateTime" , "StartDate", "EndDate", "TotalDateTime", "SelectTasks", "SelectCountries", "SelectedIdentities", "Note" },
                    ScanFilter = filter

                    };
                ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
                List<PositionData> positionList = CovertresponseIntoJSON(response);
                return new Response(true, "Search data found", positionList);
                }

            private List<PositionData> CovertresponseIntoJSON (ScanResponse response)
                {
                List<Dictionary<string, AttributeValue>> result = response.Items;
                List<PositionData> positionList = new List<PositionData>();
                PositionData position = new PositionData();

                foreach ( Dictionary<string, AttributeValue> items in result )
                    {
                    List<string> listofselectedIdentities = new List<string>();
                    List<string> listofTasks = new List<string>();
                List<string> listofCountries = new List<string>();
                Dictionary<string, string> item = new Dictionary<string, string>();
                    foreach ( var val in items )
                        {
                        if ( val.Key == "SelectedIdentities" )
                            {
                            foreach ( var web in val.Value.L )
                                {
                                if ( !listofselectedIdentities.Contains(web.S) )
                                    listofselectedIdentities.Add(web.S);
                                }

                            }
                        if ( val.Key == "SelectTasks" )
                            {
                            foreach ( var web in val.Value.L )
                                {
                                if ( !listofTasks.Contains(web.S) )
                                    listofTasks.Add(web.S);
                                }
                            }
                    if ( val.Key == "SelectCountries" )
                        {
                        foreach ( var web in val.Value.L )
                            {
                            if ( !listofCountries.Contains(web.S) )
                                listofCountries.Add(web.S);
                            }
                        }
                    item.Add(val.Key, val.Value.S);
                        }
                    string jsonString = JsonConvert.SerializeObject(item, Formatting.Indented);
                    position = JsonConvert.DeserializeObject<PositionData>(jsonString);
                    position.SelectedIdentities = listofselectedIdentities;
                    position.SelectTasks = listofTasks;
                    position.SelectCountries = listofCountries;
                   positionList.Add(position);

                    }
                return positionList;
                }
            }
        }

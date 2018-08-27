using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Amazon;
using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using Amazon.Runtime;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
   
    public class AmazonDynamoDBTable
        {
        private AmazonDynamoDBClient client;
        private static AmazonDynamoDBTable instance;
        public static AmazonDynamoDBTable Instance
            {
            get
                {
                if(null==instance)
                    {
                    instance = new AmazonDynamoDBTable();
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
                    table = GetTableObject("Identities");
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
                    AttributeName = "Email",
                    AttributeType = "S"
                },
            },
                KeySchema = new List<KeySchemaElement>
            {
                new KeySchemaElement
                {
                    AttributeName = "Email",
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

            var response = client.CreateTable(request);

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
                    var res = client.DescribeTable(new DescribeTableRequest
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
            // First, set up a DynamoDB client for DynamoDB Local
            AmazonDynamoDBConfig clientConfig = new AmazonDynamoDBConfig();
            // This client will access the US East 1 region.

            clientConfig.AuthenticationRegion = "us-east-1";// RegionEndpoint.USEast1.ToString().Trim();
            clientConfig.ServiceURL = "http://localhost:4059/";
            BasicAWSCredentials b = new BasicAWSCredentials("AKIAJEIYFJM7PDDLCHBA", "OsrTNk8w9QxEj46nEoFUENDBCCqyI+wTzPMHM7oL");
            var t = b.GetCredentials();
            clientConfig.RegionEndpoint = RegionEndpoint.USEast1;
          
            try
                {
                client = new AmazonDynamoDBClient(b,clientConfig);
             
                }
            catch ( Exception ex )
                {
                Console.WriteLine("\n Error: failed to create a DynamoDB client; " + ex.Message);
                return (null);
                }

            // Now, create a Table object for the specified table
            Table table=null;
            try
                {
                if ( null == table )
                    {
                  //  CreateTable(tableName);
                    table = Table.LoadTable(client, tableName);
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
        public Response SaveDataInDynamoDb (string jsonText,IdentityDataModel identity)
            {
            try
                {

                if ( null == Table )
                    {
                    return new Response(false,"Table not Found");
                    }
              
                var identityemail=Table.GetItem(identity.Email);
                if ( null == identityemail )
                    {
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
        public Response UpdateDataInDynamoDb (string jsonText, IdentityDataModel identity)
            {
            try
                {
                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                Document identityemail = Table.GetItem(identity.Email);
                if ( null != identityemail )
                    {
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
        public Response GetDataInDynamoDb (string email)
            {
            List<IdentityDataModel> Identities = new List<IdentityDataModel>();
            Dictionary<string, string> identityvalues = new Dictionary<string, string>();
            try
                {
                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                Document identityemail = Table.GetItem(email);
                if ( null == identityemail )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }
                //foreach ( var item in identityemail )
                //    {
                //    identityvalues.Add(item.Key, item.Value);
                //    }
                string json = identityemail.ToJson();
                IdentityDataModel identity = JsonConvert.DeserializeObject<IdentityDataModel>(json);
                Identities.Add(identity);
                return new Response(true,"Found Element", Identities);
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }

        internal IdentityDataModel SetEmptyValuestoNull (IdentityDataModel identityData)
            {
            List<WebsiteDataModel> list = new List<WebsiteDataModel>();
            identityData.Address = string.IsNullOrEmpty(identityData.Address) ? " " : identityData.Address;
            identityData.City= string.IsNullOrEmpty(identityData.City) ? " " : identityData.City;
            identityData.CountryOfBirth= string.IsNullOrEmpty(identityData.CountryOfBirth) ? " " : identityData.CountryOfBirth;
            identityData.CountryOfResidence = string.IsNullOrEmpty(identityData.CountryOfResidence) ? " " : identityData.CountryOfResidence;
            identityData.Currency = string.IsNullOrEmpty(identityData.Currency) ? " " : identityData.Currency;
            identityData.DateOfBirth = string.IsNullOrEmpty(identityData.DateOfBirth) ? " " : identityData.DateOfBirth;
            identityData.Email = string.IsNullOrEmpty(identityData.Email) ? " " : identityData.Email;
            identityData.FirstName = string.IsNullOrEmpty(identityData.FirstName) ? " " : identityData.FirstName;
            identityData.Gender = string.IsNullOrEmpty(identityData.Gender) ? " " : identityData.Gender;
            identityData.Language = string.IsNullOrEmpty(identityData.Language) ? " " : identityData.Language;
            identityData.LastName= string.IsNullOrEmpty(identityData.LastName) ? " " : identityData.LastName;
            identityData.Phone= string.IsNullOrEmpty(identityData.Phone) ? " " : identityData.Phone;
            identityData.State = string.IsNullOrEmpty(identityData.State) ? " " : identityData.State;
            identityData.Title = string.IsNullOrEmpty(identityData.Title) ? " " : identityData.Title;
            identityData.ZipCode = string.IsNullOrEmpty(identityData.ZipCode) ? " " : identityData.ZipCode;
            if ( identityData.WebsiteDataModel.Count > 0 )
                {
               
                foreach ( var website in identityData.WebsiteDataModel )
                    {
                    website.WebsiteName = string.IsNullOrEmpty(website.WebsiteName) ? " " : website.WebsiteName;
                    website.UserName = string.IsNullOrEmpty(website.UserName) ? " " : website.UserName;
                    website.UserPassword = string.IsNullOrEmpty(website.UserPassword) ? " " : website.UserPassword;
                    website.PIN = string.IsNullOrEmpty(website.PIN) ? " " : website.PIN;
                    website.WebsiteAccountNumber = string.IsNullOrEmpty(website.WebsiteAccountNumber) ? " " : website.WebsiteAccountNumber;
                    website.SecurityQuestion = string.IsNullOrEmpty(website.SecurityQuestion) ? " " : website.SecurityQuestion;
                    website.SecurityAnswer = string.IsNullOrEmpty(website.SecurityAnswer) ? " " : website.SecurityAnswer;
                    list.Add(website);
                    }
              
                }
            identityData.WebsiteDataModel = list;
            return identityData;
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
                    TableName = "Identities",
                    };

                var response = client.Scan(request);
                List<Dictionary<string,AttributeValue>> result = response.Items;
                if ( null == result )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }
                List<IdentityDataModel> identityList = new List<IdentityDataModel>();
                IdentityDataModel identity = new IdentityDataModel();
                List<WebsiteDataModel> listofWebsiteData = new List<WebsiteDataModel>();
                foreach ( Dictionary<string, AttributeValue> items in result )
                    {
                    Dictionary<string, string> item = new Dictionary<string, string>();
                    Dictionary<string, List<string>> websiteDataModel = new Dictionary<string, List<string>>();
                    foreach (var val in items )
                        {
                        if ( val.Key == "WebsiteDataModel" )
                            {
                            foreach ( var web in val.Value.L )
                                {
                                WebsiteDataModel model = new WebsiteDataModel();
                                foreach ( var w in web.M )
                                    {
                                    if( w.Key== "WebsiteAccountNumber" )
                                    model.WebsiteAccountNumber = w.Value.S;
                                    if ( w.Key == "WebsiteName" )
                                        model.WebsiteName = w.Value.S;
                                    if ( w.Key == "PIN" )
                                        model.PIN = w.Value.S;
                                    if ( w.Key == "UserName" )
                                        model.UserName = w.Value.S;
                                    if ( w.Key == "UserPassword" )
                                        model.UserPassword = w.Value.S;
                                    if ( w.Key == "SecurityQuestion" )
                                        model.SecurityQuestion = w.Value.S;
                                    if ( w.Key == "SecurityAnswer" )
                                        model.SecurityAnswer = w.Value.S;
                                    }
                                listofWebsiteData.Add(model);
                                }
                           
                            }
                        item.Add(val.Key, val.Value.S);
                        }
                    string jsonString = JsonConvert.SerializeObject(item, Formatting.Indented);
                    identity = JsonConvert.DeserializeObject<IdentityDataModel>(jsonString);
                    identity.WebsiteDataModel = listofWebsiteData;
                    identityList.Add(identity);
                    }
               
                return new Response(true, "Found Element", identityList);
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }
        }
    }
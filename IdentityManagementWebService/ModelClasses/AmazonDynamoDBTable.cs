using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using Amazon;
using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using Amazon.Runtime;
using IdentityManagementWebService.Connection;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {

    public class AmazonDynamoDBIdentityTable
        {

        private static AmazonDynamoDBIdentityTable instance;
        public static AmazonDynamoDBIdentityTable Instance
            {
            get
                {
                if ( null == instance )
                    {
                    instance = new AmazonDynamoDBIdentityTable();
                    }
                return instance;
                }
            }
        private string _tableName = "Identities";
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
                    //  CreateTable(tableName);
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
        public Response SaveDataInDynamoDb (string jsonText, IdentityDataModel identity)
            {
            try
                {

                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }

                var identityemail = Table.GetItem(identity.Email);
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
                return new Response(true, "Found Element", Identities);
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
            identityData.City = string.IsNullOrEmpty(identityData.City) ? " " : identityData.City;
            identityData.CountryOfBirth = string.IsNullOrEmpty(identityData.CountryOfBirth) ? " " : identityData.CountryOfBirth;
            identityData.CountryOfResidence = string.IsNullOrEmpty(identityData.CountryOfResidence) ? " " : identityData.CountryOfResidence;
            identityData.Currency = string.IsNullOrEmpty(identityData.Currency) ? " " : identityData.Currency;
            identityData.DateOfBirth = string.IsNullOrEmpty(identityData.DateOfBirth) ? " " : identityData.DateOfBirth;
            identityData.Email = string.IsNullOrEmpty(identityData.Email) ? " " : identityData.Email;
            identityData.FirstName = string.IsNullOrEmpty(identityData.FirstName) ? " " : identityData.FirstName;
            identityData.Gender = string.IsNullOrEmpty(identityData.Gender) ? " " : identityData.Gender;
            identityData.Language = string.IsNullOrEmpty(identityData.Language) ? " " : identityData.Language;
            identityData.LastName = string.IsNullOrEmpty(identityData.LastName) ? " " : identityData.LastName;
            identityData.Phone = string.IsNullOrEmpty(identityData.Phone) ? " " : identityData.Phone;
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
                    website.Notes = string.IsNullOrEmpty(website.Notes) ? " " : website.Notes;
                    list.Add(website);
                    }

                }
            identityData.WebsiteDataModel = list;
            return identityData;
            }
        internal IdentityDataModel ConvertToLowerCase (IdentityDataModel identityData)
            {
            List<WebsiteDataModel> list = new List<WebsiteDataModel>();
            //identityData.Address = identityData.Address.ToLower();
            //identityData.City = identityData.City.ToLower();
            //identityData.CountryOfBirth = identityData.CountryOfBirth.ToLower();
            identityData.CountryOfResidence = identityData.CountryOfResidence.ToLower();
            //identityData.Currency = identityData.Currency.ToLower();
            //identityData.DateOfBirth = identityData.DateOfBirth.ToLower();
            identityData.Email = identityData.Email.ToLower();
            identityData.FirstName = identityData.FirstName.ToLower();
            //identityData.Gender = identityData.Gender.ToLower();
            //identityData.Language = identityData.Language.ToLower();
            identityData.LastName = identityData.LastName.ToLower();
            //identityData.Phone = identityData.Phone.ToLower();
            //identityData.State = identityData.State.ToLower();
            //identityData.Title = identityData.Title.ToLower();
            //identityData.ZipCode = identityData.ZipCode.ToLower();
            if ( identityData.WebsiteDataModel.Count > 0 )
                {

                foreach ( var website in identityData.WebsiteDataModel )
                    {
                    //if(!String.IsNullOrEmpty(website.WebsiteName))
                    //website.WebsiteName = website.WebsiteName.ToLower();
                    //if ( !String.IsNullOrEmpty(website.UserName) )
                    //    website.UserName = website.UserName.ToLower();
                    if ( !String.IsNullOrEmpty(website.UserPassword) )
                        website.UserPassword = website.UserPassword.ToLower();
                    if ( !String.IsNullOrEmpty(website.PIN) )
                        website.PIN = website.PIN.ToLower();
                    if ( !String.IsNullOrEmpty(website.WebsiteAccountNumber) )
                        website.WebsiteAccountNumber = website.WebsiteAccountNumber.ToLower();
                    if ( !String.IsNullOrEmpty(website.SecurityQuestion) )
                        website.SecurityQuestion = website.SecurityQuestion.ToLower();
                    if ( !String.IsNullOrEmpty(website.SecurityAnswer) )
                        website.SecurityAnswer = website.SecurityAnswer.ToLower();
                    if ( !String.IsNullOrEmpty(website.Notes) )
                        website.Notes = website.Notes.ToLower();
                    list.Add(website);
                    }

                }
           // identityData.WebsiteDataModel = list;
            return identityData;
            }
        internal IdentityDataModel ConvertToTitleCase (IdentityDataModel identityData)
            {
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            List<WebsiteDataModel> list = new List<WebsiteDataModel>();
            //identityData.Address = textInfo.ToTitleCase(identityData.Address);
            //identityData.City = textInfo.ToTitleCase(identityData.City);
            //identityData.CountryOfBirth = textInfo.ToTitleCase(identityData.CountryOfBirth);
            identityData.CountryOfResidence = textInfo.ToTitleCase(identityData.CountryOfResidence);
            //identityData.Currency = textInfo.ToTitleCase(identityData.Currency);
            //identityData.DateOfBirth = textInfo.ToTitleCase(identityData.DateOfBirth);
            //identityData.Email = textInfo.ToTitleCase(identityData.Email);
            identityData.FirstName = textInfo.ToTitleCase(identityData.FirstName);
            //identityData.Gender = textInfo.ToTitleCase(identityData.Gender);
            //identityData.Language = textInfo.ToTitleCase(identityData.Language);
            identityData.LastName = textInfo.ToTitleCase(identityData.LastName);
            //identityData.Phone = textInfo.ToTitleCase(identityData.Phone);
            //identityData.State = textInfo.ToTitleCase(identityData.State);
            //identityData.Title = textInfo.ToTitleCase(identityData.Title);
            //identityData.ZipCode = textInfo.ToTitleCase(identityData.ZipCode);
            if ( identityData.WebsiteDataModel.Count > 0 )
                {

                foreach ( var website in identityData.WebsiteDataModel )
                    {
                    //website.WebsiteName = textInfo.ToTitleCase(website.WebsiteName);
                    //if ( !String.IsNullOrEmpty(website.UserName) )
                    //    website.UserName = textInfo.ToTitleCase(website.UserName);
                    if ( !String.IsNullOrEmpty(website.UserPassword) )
                        website.UserPassword = textInfo.ToTitleCase(website.UserPassword);
                    if ( !String.IsNullOrEmpty(website.PIN) )
                        website.PIN = textInfo.ToTitleCase(website.PIN);
                    if ( !String.IsNullOrEmpty(website.WebsiteAccountNumber) )
                        website.WebsiteAccountNumber = textInfo.ToTitleCase(website.WebsiteAccountNumber);
                    if ( !String.IsNullOrEmpty(website.SecurityQuestion) )
                        website.SecurityQuestion = textInfo.ToTitleCase(website.SecurityQuestion);
                    if ( !String.IsNullOrEmpty(website.SecurityAnswer) )
                        website.SecurityAnswer = textInfo.ToTitleCase(website.SecurityAnswer);
                    if ( !String.IsNullOrEmpty(website.Notes) )
                        website.Notes = textInfo.ToTitleCase(website.Notes);
                    list.Add(website);
                    }

                }
           // identityData.WebsiteDataModel = list;
            return identityData;
            }
        internal Response DynamoDbSearchIdentities (IdentitiesFilterCriteria filterCriteria)
            {
            if ( (null == filterCriteria.FirstName || "" == filterCriteria.FirstName) && (null == filterCriteria.LastName || "" == filterCriteria.LastName)
                && (null == filterCriteria.Email || "" == filterCriteria.Email) && (null == filterCriteria.CountryofResidence || "" == filterCriteria.CountryofResidence)
                && (null == filterCriteria.Date || "" == filterCriteria.Date) )
                {
                return new Response(false, "First enter Search String");
                }
            Dictionary<string, Condition> filter = new Dictionary<string, Condition>();
            if ( null != filterCriteria.FirstName && ""!= filterCriteria.FirstName )
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
            if ( null != filterCriteria.Email && "" != filterCriteria.Email )
                {

                filter.Add("Email", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=filterCriteria.Email.ToLower() }
                               }
                    });
                }
            if ( null != filterCriteria.CountryofResidence && "" != filterCriteria.CountryofResidence )
                {

                filter.Add("CountryOfResidence", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=filterCriteria.CountryofResidence.ToLower() }
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
                AttributesToGet = new List<string> { "CurrentDate", "FirstName", "LastName", "Email", "CountryOfResidence", "WebsiteDataModel" },
                ScanFilter = filter

                };
            ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
            List<IdentityDataModel> identityList = CovertresponseIntoJSON(response);
            return new Response(true, "Search data found", identityList);
            }
        internal List<WebsiteDataModel> DynamoDbSearchWebsites (IdentitiesFilterCriteria filterCriteria)
            {
            if ( (null == filterCriteria.Email || "" == filterCriteria.Email) && (null == filterCriteria.WebsiteName || "" == filterCriteria.WebsiteName))
                {
                return null;
                }
            Dictionary<string, Condition> filter = new Dictionary<string, Condition>();
            //if ( null != filterCriteria.WebsiteName && "" != filterCriteria.WebsiteName )
            //    {
            //    filter.Add("Name", new Condition
            //        {
            //        ComparisonOperator = "CONTAINS",
            //        AttributeValueList = new List<AttributeValue>()
            //                   {
            //                   new AttributeValue {S=filterCriteria.FirstName.ToLower()}
            //                   }
            //        });
            //    }
            if ( null != filterCriteria.Email && "" != filterCriteria.Email )
                {

                filter.Add("Email", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=filterCriteria.Email.ToLower() }
                               }
                    });
                }
            ScanRequest request = new ScanRequest
                {
                TableName = _tableName,
                AttributesToGet = new List<string> { "Email", "WebsiteDataModel" },
                ScanFilter = filter

                };
            ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
            List<IdentityDataModel> identityList = CovertresponseIntoJSON(response);
            if ( 0 < identityList.FirstOrDefault().WebsiteDataModel.Count )
                {
                List<WebsiteDataModel> websitelist = new List<WebsiteDataModel>();
                foreach ( WebsiteDataModel website in identityList.FirstOrDefault().WebsiteDataModel )
                    {
                    if ( website.WebsiteName.ToLower().Contains(filterCriteria.WebsiteName.ToLower()) )
                        websitelist.Add(website);
                    }
                return websitelist;
                }
            return null;
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

                ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
                List<IdentityDataModel> identityList = CovertresponseIntoJSON(response);
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
        private List<IdentityDataModel> CovertresponseIntoJSON (ScanResponse response)
            {
            List<Dictionary<string, AttributeValue>> result = response.Items;
            if ( null == result )
                {
                return null;
                }
            List<IdentityDataModel> identityList = new List<IdentityDataModel>();
            IdentityDataModel identity = new IdentityDataModel();
            List<WebsiteDataModel> listofWebsiteData;
            foreach ( Dictionary<string, AttributeValue> items in result )
                {
                listofWebsiteData = new List<WebsiteDataModel>();
                Dictionary<string, string> item = new Dictionary<string, string>();
                Dictionary<string, List<string>> websiteDataModel = new Dictionary<string, List<string>>();
                foreach ( var val in items )
                    {
                    if ( val.Key == "WebsiteDataModel" )
                        {
                        foreach ( var web in val.Value.L )
                            {
                            WebsiteDataModel model = new WebsiteDataModel();
                            foreach ( var w in web.M )
                                {
                                if ( w.Key == "WebsiteAccountNumber" )
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
                                if ( w.Key == "Notes" )
                                    model.Notes = w.Value.S;
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
        public Response EditWebsite (string websitename, string email)
            {
            Response response = GetAllDataInDynamoDb();
            foreach ( var identity in response.IdentityDataModel )
                {
                if ( identity.Email == email )
                    {
                    foreach ( var website in identity.WebsiteDataModel )
                        {
                        if ( website.WebsiteName == websitename )
                            {
                            List<IdentityDataModel> listofIdentities = new List<IdentityDataModel>();
                            listofIdentities.Add(identity);
                            return new Response(true, "element found", listofIdentities);
                            }
                        }
                    }
                }
            return new Response(false, "Information not found");
            }
        public Response DeleteWebsite (string websitename, string email)
            {
            Response response = GetAllDataInDynamoDb();
            foreach ( var identity in response.IdentityDataModel )
                {
                if ( identity.Email == email )
                    {
                    foreach ( var website in identity.WebsiteDataModel )
                        {
                        if ( website.WebsiteName == websitename )
                            {
                            identity.WebsiteDataModel.Remove(website);
                            string json = JsonConvert.SerializeObject(identity);
                            Document item = Document.FromJson(json);
                            Document responsecontent = Table.UpdateItem(item);
                            return new Response(true, null);
                            }
                        }
                    }
                }
            return new Response(false, "Information not found");
            }
        }
    }
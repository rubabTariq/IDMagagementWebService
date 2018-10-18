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
    public class AmazonDynamoDBTaskTable
        {
        private string _tablename = "IdentitiesTask";
        private static AmazonDynamoDBTaskTable instance;
        public static AmazonDynamoDBTaskTable Instance
            {
            get
                {
                if ( null == instance )
                    {
                    instance = new AmazonDynamoDBTaskTable();
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
                    AttributeName = "TaskName",
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
                    AttributeName = "TaskName",
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
        public Response SaveDataInDynamoDb (IdentityTaskData identityTaskData)
            {
            try
                {
                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                foreach ( var identityEmail in identityTaskData.SelectedIdentities )
                    {
                    var identitytaskname = Table.GetItem(identityTaskData.TaskName);
                    if ( null == identitytaskname )
                        {
                        string jsonText = JsonConvert.SerializeObject(identityTaskData);
                        var item = Document.FromJson(jsonText);
                        Document response = Table.PutItem(item);
                        }
                    else
                        {
                        string jsonText = JsonConvert.SerializeObject(identityTaskData);
                        Document item = Document.FromJson(jsonText);
                        Document response = Table.UpdateItem(item);

                        }
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
            try
                {
                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                Response response = GetAllDataInDynamoDb();
                if ( null == response.IdentityTaskData || 0 == response.IdentityTaskData.Count )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }
                foreach ( IdentityTaskData findIdentity in response.IdentityTaskData )
                    {
                    foreach ( string selectedEmail in findIdentity.SelectedIdentities )
                        {
                        if ( selectedEmail == email )
                            {
                            findIdentity.BalanceLimit = null;
                            findIdentity.BalanceTarget = "200";
                            findIdentity.BetSize = "5";
                            findIdentity.MaxBetSize = "100";
                            findIdentity.BetSizeOption = "Random";
                            findIdentity.WagerAmount = "4000";
                            findIdentity.StopLoss = null;

                            string jsonText = JsonConvert.SerializeObject(findIdentity);
                            Document item = Document.FromJson(jsonText);
                            Document response1 = Table.UpdateItem(item);
                            return new Response(true, "Custom Data Deleted");
                            }
                        }
                    }
                return new Response(false, "Identity not found");
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }
        public Response editCustomTaskDataInDynamoDb (string email)
            {
            List<IdentityTaskData> Identities = new List<IdentityTaskData>();
            Dictionary<string, string> identityvalues = new Dictionary<string, string>();
            try
                {
                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                Response response = GetAllDataInDynamoDb();
                //   Document identityemail = Table.GetItem(email);
                if ( null == response.IdentityTaskData || 0 == response.IdentityTaskData.Count )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }
                foreach ( IdentityTaskData findIdentity in response.IdentityTaskData )
                    {
                    foreach ( string selectedEmail in findIdentity.SelectedIdentities )
                        {

                        if ( selectedEmail == email )
                            {
                            Identities.Add(findIdentity);
                            return new Response(true, "Found Element", Identities);
                            }
                        }
                    }
                return new Response(false, "Identity no more exist in database");
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }

        public Response GetDataInDynamoDb (string taskname)
            {
            List<IdentityTaskData> Identities = new List<IdentityTaskData>();
            Dictionary<string, string> identityvalues = new Dictionary<string, string>();
            try
                {
                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                Response response = GetAllDataInDynamoDb();
                //   Document identityemail = Table.GetItem(email);
                if ( null == response.IdentityTaskData || 0 == response.IdentityTaskData.Count )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }
                foreach ( IdentityTaskData findIdentity in response.IdentityTaskData )
                    {
                    if ( findIdentity.TaskName == taskname )
                        {
                        Identities.Add(findIdentity);
                        return new Response(true, "Found Element", Identities);
                        }
                    }
                return new Response(false, "Identity no more exist in database");
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }

        internal IdentityTaskData ConvertToLowerCase (IdentityTaskData identityData)
            {
            List<string> listgames = new List<string>();
            List<string> listIdentites = new List<string>();
            //identityData.BalanceLimit = identityData.BalanceLimit.ToLower();
            //identityData.BalanceTarget = identityData.BalanceTarget.ToLower();
            //identityData.BetSize = identityData.BetSize.ToLower();
            //identityData.BetSizeOption = identityData.BetSizeOption.ToLower();
            //identityData.MaxBetSize = identityData.MaxBetSize.ToLower();
            //identityData.Section = identityData.Section.ToLower();
            //identityData.SelectBrowser = identityData.SelectBrowser.ToLower();
            //identityData.SelectMode = identityData.SelectMode.ToLower();
            identityData.SelectTask = identityData.SelectTask.ToLower();
            //identityData.StopLoss = identityData.StopLoss.ToLower();
            identityData.TaskName = identityData.TaskName.ToLower();
            identityData.TaskWebsite = identityData.TaskWebsite.ToLower();
            //identityData.WagerAmount = identityData.WagerAmount.ToLower();
            //if ( identityData.SelectedGames.Count > 0 )
            //    {

            //    foreach ( string game in identityData.SelectedGames )
            //        {
            //        listgames.Add(game.ToLower());
            //        }

            //    }
            //identityData.SelectedGames = listgames;
            //if ( identityData.SelectedIdentities.Count > 0 )
            //    {

            //    foreach ( var identity in identityData.SelectedIdentities )
            //        {
            //        listIdentites.Add(identity.ToLower());
            //        }

            //    }
            //identityData.SelectedIdentities = listIdentites;
            return identityData;
            }
        internal IdentityTaskData ConvertToTitleCase (IdentityTaskData identityData)
            {
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            List<string> listgames = new List<string>();
            List<string> listIdentites = new List<string>();
            //identityData.BalanceLimit = textInfo.ToTitleCase(identityData.BalanceLimit);
            //identityData.BalanceTarget = textInfo.ToTitleCase(identityData.BalanceTarget);
            //identityData.BetSize = textInfo.ToTitleCase(identityData.BetSize);
            //identityData.BetSizeOption = textInfo.ToTitleCase(identityData.BetSizeOption);
            //identityData.Email = textInfo.ToTitleCase(identityData.Email);
            //identityData.MaxBetSize = textInfo.ToTitleCase(identityData.MaxBetSize);
            //identityData.Section = textInfo.ToTitleCase(identityData.Section);
            //identityData.SelectBrowser = textInfo.ToTitleCase(identityData.SelectBrowser);
            //identityData.SelectMode = textInfo.ToTitleCase(identityData.SelectMode);
            identityData.SelectTask = textInfo.ToTitleCase(identityData.SelectTask);
            //identityData.StopLoss = textInfo.ToTitleCase(identityData.StopLoss);
            identityData.TaskName = textInfo.ToTitleCase(identityData.TaskName);
            //identityData.TaskWebsite = textInfo.ToTitleCase(identityData.TaskWebsite);
            //identityData.WagerAmount = textInfo.ToTitleCase(identityData.WagerAmount);
            //if ( identityData.SelectedGames.Count > 0 )
            //    {

            //    foreach ( string game in identityData.SelectedGames )
            //        {
            //        listgames.Add(textInfo.ToTitleCase(game));
            //        }

            //    }
            //identityData.SelectedGames = listgames;
            //if ( identityData.SelectedIdentities.Count > 0 )
            //    {

            //    foreach ( var identity in identityData.SelectedIdentities )
            //        {
            //        listIdentites.Add(textInfo.ToTitleCase(identity));
            //        }

            //    }
            //identityData.SelectedIdentities = listIdentites;
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
                    TableName = "IdentitiesTask",
                    };

                var response = AmazonDynamoDBClientConnection.Client.Scan(request);
                List<Dictionary<string, AttributeValue>> result = response.Items;
                if ( null == result )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }

                List<IdentityTaskData> identityList = CovertresponseIntoJSON(response);
                return new Response(true, "Found Element", identityList);
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
                if ( null == response.IdentityTaskData || 0 == response.IdentityTaskData.Count )
                    {
                    return new Response(false, "Identity no more exist in database");
                    }
                foreach ( IdentityTaskData findIdentity in response.IdentityTaskData )
                    {
                    if ( findIdentity.TaskName == taskname )
                        {
                        Document responseofDeletion = Table.DeleteItem(findIdentity.TaskName);
                        return new Response(true, null);
                        }
                    }
                return new Response(false, "Identity not found");
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }
        internal Response DynamoDbSearchTasks (TasksFilterCriteria taskCriteria)
            {
            if ( (null == taskCriteria.TaskName || "" == taskCriteria.TaskName) && (null == taskCriteria.Task || "" == taskCriteria.Task)
                && (null == taskCriteria.Website || "" == taskCriteria.Website) && (null == taskCriteria.State || "" == taskCriteria.State) )
                {
                return new Response(false, "First enter Search String");
                }
            Dictionary<string, Condition> filter = new Dictionary<string, Condition>();
            if ( null != taskCriteria.TaskName && "" != taskCriteria.TaskName )
                {

                filter.Add("TaskName", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=taskCriteria.TaskName.ToLower() }
                               }
                    });
                }
            if ( null != taskCriteria.Task && "" != taskCriteria.Task )
                {

                filter.Add("SelectTask", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=taskCriteria.Task.ToLower() }
                               }
                    });
                }
            if ( null != taskCriteria.Website && "" != taskCriteria.Website )
                {

                filter.Add("TaskWebsite", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=taskCriteria.Website.ToLower() }
                               }
                    });
                }
            if ( null != taskCriteria.State && "" != taskCriteria.State )
                {

                filter.Add("State", new Condition
                    {
                    ComparisonOperator = "CONTAINS",
                    AttributeValueList = new List<AttributeValue>()
                               {
                               new AttributeValue {S=taskCriteria.State.ToLower() }
                               }
                    });
                }
           
            ScanRequest request = new ScanRequest
                {
                TableName = _tablename,
                AttributesToGet = new List<string> { "TaskName", "SelectTask", "TaskWebsite", "SelectedIdentities" },
                ScanFilter = filter

                };
            ScanResponse response = AmazonDynamoDBClientConnection.Client.Scan(request);
            List<IdentityTaskData> identityList = CovertresponseIntoJSON(response);
            return new Response(true, "Search data found", identityList);
            }

        private List<IdentityTaskData> CovertresponseIntoJSON (ScanResponse response)
            {
            List<Dictionary<string, AttributeValue>> result = response.Items;
            List<IdentityTaskData> identityList = new List<IdentityTaskData>();
            IdentityTaskData identity = new IdentityTaskData();

            foreach ( Dictionary<string, AttributeValue> items in result )
                {
                List<string> listofselectedIdentities = new List<string>();
                List<string> listofSelectedGames = new List<string>();
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
                    if ( val.Key == "SelectedGames" )
                        {
                        foreach ( var web in val.Value.L )
                            {
                            if ( !listofSelectedGames.Contains(web.S) )
                                listofSelectedGames.Add(web.S);
                            }

                        }
                    item.Add(val.Key, val.Value.S);
                    }
                string jsonString = JsonConvert.SerializeObject(item, Formatting.Indented);
                identity = JsonConvert.DeserializeObject<IdentityTaskData>(jsonString);
                identity.SelectedIdentities = listofselectedIdentities;
                identity.SelectedGames = listofSelectedGames;
                identityList.Add(identity);

                }
            return identityList;
            }
        }
    }

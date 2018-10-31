using System;
using System.Collections.Generic;
using System.Globalization;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using Newtonsoft.Json;
using IdentityManagementWebService.ModelClasses;
using IdentityManagementWebService.Connection;

namespace PositionManagementWebService.ModelClasses
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
                    foreach ( var PositionEmail in positionData.SelectedIdentities )
                        {
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
                List<string> listgames = new List<string>();
                List<string> listIdentites = new List<string>();
                //PositionData.BalanceLimit = PositionData.BalanceLimit.ToLower();
                //PositionData.BalanceTarget = PositionData.BalanceTarget.ToLower();
                //PositionData.BetSize = PositionData.BetSize.ToLower();
                //PositionData.BetSizeOption = PositionData.BetSizeOption.ToLower();
                //PositionData.MaxBetSize = PositionData.MaxBetSize.ToLower();
                //PositionData.Section = PositionData.Section.ToLower();
                //PositionData.SelectBrowser = PositionData.SelectBrowser.ToLower();
                //PositionData.SelectMode = PositionData.SelectMode.ToLower();
               // PositionData.SelectTask = PositionData.SelectTask.ToLower();
                //PositionData.StopLoss = PositionData.StopLoss.ToLower();
               // PositionData.TaskName = PositionData.TaskName.ToLower();
               // PositionData.TaskWebsite = PositionData.TaskWebsite.ToLower();
                //PositionData.WagerAmount = PositionData.WagerAmount.ToLower();
                //if ( PositionData.SelectedGames.Count > 0 )
                //    {

                //    foreach ( string game in PositionData.SelectedGames )
                //        {
                //        listgames.Add(game.ToLower());
                //        }

                //    }
                //PositionData.SelectedGames = listgames;
                //if ( PositionData.SelectedIdentities.Count > 0 )
                //    {

                //    foreach ( var Position in PositionData.SelectedIdentities )
                //        {
                //        listIdentites.Add(Position.ToLower());
                //        }

                //    }
                //PositionData.SelectedIdentities = listIdentites;
                return PositionData;
                }
            internal PositionData ConvertToTitleCase (PositionData PositionData)
                {
                TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
                List<string> listgames = new List<string>();
                List<string> listIdentites = new List<string>();
                //PositionData.BalanceLimit = textInfo.ToTitleCase(PositionData.BalanceLimit);
                //PositionData.BalanceTarget = textInfo.ToTitleCase(PositionData.BalanceTarget);
                //PositionData.BetSize = textInfo.ToTitleCase(PositionData.BetSize);
                //PositionData.BetSizeOption = textInfo.ToTitleCase(PositionData.BetSizeOption);
                //PositionData.Email = textInfo.ToTitleCase(PositionData.Email);
                //PositionData.MaxBetSize = textInfo.ToTitleCase(PositionData.MaxBetSize);
                //PositionData.Section = textInfo.ToTitleCase(PositionData.Section);
                //PositionData.SelectBrowser = textInfo.ToTitleCase(PositionData.SelectBrowser);
                //PositionData.SelectMode = textInfo.ToTitleCase(PositionData.SelectMode);
               // PositionData.SelectTask = textInfo.ToTitleCase(PositionData.SelectTask);
                //PositionData.StopLoss = textInfo.ToTitleCase(PositionData.StopLoss);
               // PositionData.TaskName = textInfo.ToTitleCase(PositionData.TaskName);
                //PositionData.TaskWebsite = textInfo.ToTitleCase(PositionData.TaskWebsite);
                //PositionData.WagerAmount = textInfo.ToTitleCase(PositionData.WagerAmount);
                //if ( PositionData.SelectedGames.Count > 0 )
                //    {

                //    foreach ( string game in PositionData.SelectedGames )
                //        {
                //        listgames.Add(textInfo.ToTitleCase(game));
                //        }

                //    }
                //PositionData.SelectedGames = listgames;
                //if ( PositionData.SelectedIdentities.Count > 0 )
                //    {

                //    foreach ( var Position in PositionData.SelectedIdentities )
                //        {
                //        listIdentites.Add(textInfo.ToTitleCase(Position));
                //        }

                //    }
                //PositionData.SelectedIdentities = listIdentites;
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
                    AttributesToGet = new List<string> { "PositionLabel", "PositionWebsite", "SelectSelection", "StartEndTime", "SelectTasks", "SelectCountries", "SelectedIdentities", "Note" },
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

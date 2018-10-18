using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Amazon.DynamoDBv2.DocumentModel;
using Amazon.DynamoDBv2.Model;
using IdentityManagementWebService.Connection;
using Newtonsoft.Json;

namespace IdentityManagementWebService.ModelClasses
    {
    public class AccountInfoDynamoDb
        {
        private static AccountInfoDynamoDb instance;
        public static AccountInfoDynamoDb Instance
            {
            get
                {
                if ( null == instance )
                    {
                    instance = new AccountInfoDynamoDb();
                    }
                return instance;
                }
            }
        private string _tableName = "AccountInfo";
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
        public Response UpdateDataInDynamoDb (AcountInformation account,string email, string existingpassword)
            {
            try
                {

                if ( null == Table )
                    {
                    return new Response(false, "Table not Found");
                    }
                account.AdminName = "admin";
                Document identityemail = Table.GetItem(account.AdminName);
                //if ( null == identityemail )
                //    {
                //    string json = JsonConvert.SerializeObject(account);
                //    var item = Document.FromJson(json);
                //    Document response = Table.PutItem(item);
                //    return new Response(true, null);
                //    }
                if ( null != identityemail )
                    {
                    string json = identityemail.ToJson();
                    AcountInformation existingaccount = JsonConvert.DeserializeObject<AcountInformation>(json);
                    if ( existingpassword == existingaccount.Password && account.Password != existingaccount.Password )
                        {
                        string jsonText = JsonConvert.SerializeObject(account);
                        Document item = Document.FromJson(jsonText);
                        Document response = Table.UpdateItem(item);
                        return new Response(true, null);
                        }
                    }
                return new Response(false, "Incorrect Email");
                }
            catch ( Exception exception )
                {
                Console.WriteLine(exception.Message);
                return new Response(false, exception.Message);
                }
            }
        }
    }
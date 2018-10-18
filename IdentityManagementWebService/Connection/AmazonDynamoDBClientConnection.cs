using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using Amazon;
using Amazon.DynamoDBv2;
using Amazon.Runtime;

namespace IdentityManagementWebService.Connection
    {
    public class AmazonDynamoDBClientConnection
        {

        private static AmazonDynamoDBClient client;
        public static AmazonDynamoDBClient Client
            {
            get
                {
                if ( null == client )
                    {
                    client = CreateClient();
                    }
                return client;
                }

            }
        private static AmazonDynamoDBClient CreateClient ()
            {
            // First, set up a DynamoDB client for DynamoDB Local
            AmazonDynamoDBConfig clientConfig = new AmazonDynamoDBConfig();
            // This client will access the US East 1 region.

            clientConfig.AuthenticationRegion = "us-east-1";// RegionEndpoint.USEast1.ToString().Trim();
            clientConfig.ServiceURL = "http://localhost:4059/";
            BasicAWSCredentials awsCredentials = new BasicAWSCredentials(ConfigurationManager.AppSettings["accesskey"], ConfigurationManager.AppSettings["secretkey"]);
            var t = awsCredentials.GetCredentials();
            clientConfig.RegionEndpoint = RegionEndpoint.USEast1;

            try
                {
                return new AmazonDynamoDBClient(awsCredentials, clientConfig);
                }
            catch ( Exception ex )
                {
                Console.WriteLine("\n Error: failed to create a DynamoDB client; " + ex.Message);
                return (null);
                }
            }
        
        }
    }
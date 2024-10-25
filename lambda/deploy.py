# The Lambda function use for updating the service with new task definition. 
# I kept this file here for backup purpose.

import json
import boto3
import os

def lambda_handler(event, context):

    # Fetch user parameters from the code pipeline
    user_parameters = json.loads(event["CodePipeline.job"]["data"]["actionConfiguration"]["configuration"]["UserParameters"])

    # set individual paramters from the all user_parameters. 
    cluster_name = user_parameters.get('CLUSTER_NAME')
    service_name = user_parameters.get('SERVICE_NAME')
    task_family = user_parameters.get('TASK_FAMILY')
    
    ecs_client = boto3.client('ecs')
    
    print(f"CLUSTER_NAME: {cluster_name}")
    print(f"SERVICE_NAME: {service_name}")
    print(f"TASK_FAMILY: {task_family}")

    try:

        response = ecs_client.list_task_definitions(
            familyPrefix=task_family,
            status='ACTIVE',
            sort='DESC',
            maxResults=2
        )

        # Fetch latest task definition from the list
        latest_task_definition = response['taskDefinitionArns'][0]
        
        print(f"Latest_task_definition: {latest_task_definition}")

        # Update the ECS service with the new task definition
        response = ecs_client.update_service(
            cluster=cluster_name,
            service=service_name,
            taskDefinition=latest_task_definition,
            forceNewDeployment=True
        )
        
         # Manually check if the service update was successful
        if response['ResponseMetadata']['HTTPStatusCode'] != 200:
            raise RuntimeError(f"Failed to update service: {service_name} in cluster: {cluster_name}")


        # Return a success message
        return {
            'statusCode': 200,
            'body': json.dumps(f"Service updated successfully: {response}")
        }
    
    except Exception as e:
        # Return an error message in case of failure
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error updating service: {str(e)}")
        }


############### k8s-deployment-rollout-status.sh ###############
#!/bin/bash

#k8s-deployment-rollout-status.sh

sleep 60s

rollback_status = 'kubectl -n default rollout status deploy ${deploymentName} --timeout 50s'

echo "Rollback status is ${rollback_status}"

if [[ $(kubectl -n default rollout status deploy ${deploymentName} --timeout 50s) != *"successfully rolled out"* ]]; 
then     
	echo "Deployment ${deploymentName} Rollout has Failed"
    kubectl -n default rollout undo deploy ${deploymentName}
    exit 1;
else
	echo "Deployment ${deploymentName} Rollout is Success"
fi
############### k8s-deployment-rollout-status.sh ###############

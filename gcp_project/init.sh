PROJECT_ID=$(gcloud config get-value project)

BUCKET=${PROJECT_ID}-cf-staging
REGION=us-central1

DATASET=data_ingest
SERVICE_NAME=ingest-market-data
SERVICE_ACCOUNT_NAME=svc-market-ingest
SERVICE_ACCOUNT_EMAIL=${SERVICE_ACCOUNT_NAME}@${PROJECT_ID}.iam.gserviceaccount.com

export TF_VAR_project_id=$PROJECT_ID
export TF_VAR_region=$REGION
export TF_VAR_bucket=$BUCKET
export TF_VAR_service_name=$SERVICE_NAME
export TF_VAR_dataset=$DATASET
export TF_VAR_service_account_name=$SERVICE_ACCOUNT_NAME
export TF_VAR_service_account_email=$SERVICE_ACCOUNT_EMAIL

export PROJECT_ID=$PROJECT_ID
export DATASET=$DATASET
export BUCKET=$BUCKET
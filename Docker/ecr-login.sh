## Not the best solution, but a solution that works, also user has ecr enabled only
export AWS_ACCESS_KEY_ID="AKIA36RLNVBTJVDLNLOG"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_DEFAULT_REGION="eu-west-1"
aws ecr get-login-password --region eu-west-1  | docker login  --username AWS  --password-stdin 821503567974.dkr.ecr.eu-west-1.amazonaws.com/cadvisor_repo

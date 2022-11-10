# make help: See list of commands

ACCOUNT := 063985724809.dkr.ecr.us-east-1.amazonaws.com
DEV_ACCOUNT := 354091474362.dkr.ecr.us-east-1.amazonaws.com
REPO := 10thplanet
TAG := latest

help:
	@echo "build:			Build the docker container"
	@echo "push:			Push docker container up to ECR"
	@echo "clean:			Blow away all the docker cruft"


build:
	$(info Make: Building docker image)
	@docker build . --tag $(ACCOUNT)/$(REPO):$(TAG) --no-cache
	@docker build . --tag ${DEV_ACCOUNT}/${REPO}:{TAG} --no-cache

push:
	# make sure you can authenticate to ECR and have the right AWS Profile set
	# for pk this is: export AWS_PROFILE=pulumidev
	@aws ecr get-login-password \
         --region us-east-1 | docker login \
         --username AWS \
         --password-stdin $(ACCOUNT)
	@docker push $(ACCOUNT)/$(REPO):$(TAG)
	
	@aws ecr get-login-password \
	 --region us-east-1 | docker login \
	 --username AWS \
	 --password-stdin ${DEV_ACCOUNT}
	@docker push ${DEV_ACCOUNT}/${REPO}:${TAG}


clean:
	@docker system prune --force


buildc:
	$(info Make: Building docker image - now with more Cache)
	@docker build . --tag $(ACCOUNT)/$(REPO):$(TAG) 
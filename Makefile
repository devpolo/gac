.PHONY: all type gac
.DEFAULT_GOAL = all

CURRENT_DIR=$(shell pwd)
GAC=node $(CURRENT_DIR)/dist/index.js
DESC?=update button style
SCOPE?=button
BODY?=this button was uncompatible with a certain context
BREAKING_CHANGE?=remove color props

help:
	@echo available commands:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

all: ## execute a fully gac command
	$(GAC) f $(DESC) -s $(SCOPE) -b $(BODY) -bc $(BREAKING_CHANGE)

type: ## gac with type
	$(GAC) f chore add ts support


gac: ## gac shortcut
	$(GAC) $(filter-out $@,$(MAKECMDGOALS))

%:
  @:
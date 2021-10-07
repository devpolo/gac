.PHONY: all alias package
.DEFAULT_GOAL = all

CURRENT_DIR=$(shell pwd)
GAC=node $(CURRENT_DIR)/dist/src/index.js
DESC?=update button style
SCOPE?=button
BODY?=this button was uncompatible with a certain context
BREAKING_CHANGE?=remove color props

GREEN_COLOR=\033[0;32m
NO_COLOR=\033[m

help:
	@echo available commands:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

all: ## execute a fully gac command
	@echo "$(GREEN_COLOR)command:$(NO_COLOR)"
	@echo gac f description -s scope -b body -bc breaking change
	@echo
	@echo "$(GREEN_COLOR)return:$(NO_COLOR)"
	@$(GAC) f $(DESC) -s $(SCOPE) -b $(BODY) -bc $(BREAKING_CHANGE)

alias: ## for dev purpose, print temporary gac alias
	@echo alias gac=\"$(GAC)\"

package: ## build a single executable
	pkg $(GAC) --targets node14-macos-x64 --output ./release/gac

.PHONY: all alias package archive release
.DEFAULT_GOAL = all

CURRENT_DIR=$(shell pwd)
DIST_DIR=dist/src/index.js
RELEASE=release/gac
GAC=node $(DIST_DIR)
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
	pkg $(DIST_DIR) --targets node14-macos-x64 --output $(RELEASE)

archive: ## archive executable
	tar -cvzf $(RELEASE)-macos-x64.tar.gz $(RELEASE)

release: ## package and archive executable
	make package
	make archive
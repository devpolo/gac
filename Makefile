.PHONY: gac %
.DEFAULT_GOAL = help

CURRENT_DIR=$(shell pwd)
GAC=node $(CURRENT_DIR)/dist/index.js

help:
	@echo available commands:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

gac: ## gac shortcut
	$(GAC) $(filter-out $@,$(MAKECMDGOALS))

%:
  @:
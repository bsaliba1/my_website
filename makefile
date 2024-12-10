##@ Help

.PHONY: help
help: ## Display all available make commands
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

.PHONY: start
start: ## Run webserver
	nginx -c nginx.conf -p $(shell pwd) -g "daemon off;"

.PHONY: np new-post
new-post: ## Create new HTML post file
	@scripts/new_post.zsh $(filter-out $@,$(MAKECMDGOALS))

np:
	@$(MAKE) new-post $(filter-out $@,$(MAKECMDGOALS))

# Suppress warnings
%:
	@:

# Notes
# -----
# $@ - the current target name
# MAKECMDGOALS - the list of targets
# @ - at the beginning of a line it surpresses the command output

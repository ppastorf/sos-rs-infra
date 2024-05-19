.PHONY = *

REPO_ROOT := $(shell git rev-parse --show-toplevel)

# single module
module_operations := init validate plan apply destroy show output providers refresh test
$(module_operations):
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt $@ --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

plan-destroy:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt plan --destroy --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

state-list:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt state list --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

clear-cache:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	rm -rf $(REPO_ROOT)/$$DIR/.terragrunt-cache

# run-all
plan-all:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt run-all plan --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

plan-destroy-all:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt run-all plan --destroy --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

apply-all:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt run-all apply --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

destroy-all:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	terragrunt run-all destroy --terragrunt-working-dir=$(REPO_ROOT)/$$DIR

clear-cache-all:
	@DIR="$(filter-out $@,$(MAKECMDGOALS))"; \
	find $(REPO_ROOT)/$$DIR/ -type d -name "*.terragrunt-cache" | xargs rm -rf


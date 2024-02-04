##@ Default
all:
	@echo "Build finished"

-include Makefile.defs

##@ Help
.PHONY: print_all_variables
print_all_variables: ## print all makefile variables
	$(foreach v,                                        \
	$(filter-out $(VARS_OLD) VARS_OLD,$(.VARIABLES)), \
	$(info $(v) = $($(v))))
	$(call print_line,=)

.PHONY: help
help: ##print help
	$(call print_help_from_makefile)
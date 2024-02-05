##@ Default
all:
	@echo "Build finished"

-include Makefile.defs

##@ Help
.PHONY: print_all_variables
print_all_variables: ## print all makefile variables
	$(foreach v, $(sort $(.VARIABLES)), \
		$(if $(filter file,$(origin $(v))), \
		$(info $(shell printf "%-20s" "$(v)")= $($(v)))) \
	)
	$(call print_line,=)
.PHONY: help
help: ##print help
	$(call print_help_from_makefile)
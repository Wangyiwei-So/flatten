TARGET = flatten

##@ Default
all: $(TARGET)
	@echo "Build finished"

-include Makefile.defs

$(TARGET):
	$(GO_BUILD) -o $@

##@ Help
.PHONY: print_all_variables
print_all_variables: FORCE ## print all makefile variables
	$(foreach v, $(sort $(.VARIABLES)), \
		$(if $(filter file,$(origin $(v))), \
		$(info $(shell printf "%-20s" "$(v)")= $($(v)))) \
	)
.PHONY: help
help: FORCE ##print help
	$(call print_help_from_makefile)

.PHONY: params
params: FORCE ##print params
	$(call print_params_from_makefile)

GIT_VERSION: FORCE
	@if [ "$(GIT_VERSION)" != "`cat 2>/dev/null GIT_VERSION`" ] ; then echo "$(GIT_VERSION)" >GIT_VERSION; fi
.PHONY: FORCE
FORCE: 
	@true
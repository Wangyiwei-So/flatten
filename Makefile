TARGET = flatten

##@ Default
all: $(TARGET)
	@echo "Build finished"
all: export CODE_VERSION_DIR:=/pkg/version.flattenVersion

debug: export NOSTRIP=1
debug: export NOOPT=1
debug: export RACE=1
debug: all

##@ Build, Install and Test
include Makefile.defs

$(TARGET):
	$(call ensure_go_flags)
	$(GO_BUILD) -o $@

test:
	$(GO_TEST) | $(GOTEST_FORMATTER)

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
SHELL := /bin/bash

MKDIR = mkdir -p -v
DOWN = aria2c -j8 -s8 --force-save=false
TAR = tar -cvf - ./* | pigz -p 8 -v -9
ZIP = zip -r -v -9
RM = rm -rf -v
BINCOLOR    = \033[34;1m
ENDCOLOR    = \033[0m
OUT = output-$(shell date +%Y-%m-%d)
TARGETS=兽耳 银发 精选图 竖屏 横屏
DEPS=/usr/bin/aria2c /usr/bin/tar /usr/bin/pigz /usr/bin/zip

.PHONY: all download pack-tgz-file pack-zip-file cancel-pack clean clean-all help

ifeq ("$(origin VERBOSE)", "command line")
  BUILD_VERBOSE = $(VERBOSE)
endif
ifndef BUILD_VERBOSE
  BUILD_VERBOSE = 0
endif

ifeq ($(BUILD_VERBOSE),1)
  Q =
else
  Q = @
endif

# Recipes
all: download pack-zip-file

download: $(DEPS)
	$(Q)cd build; \
	$(Q)$(RM) $$(printf '%s\r/ ' $(TARGETS)); \
	$(Q)for tgt in $(TARGETS); do \
		$(Q)$(DOWN) --input-file=../config/""$$tgt"" --dir=$$tgt/; \
	$(Q)done; \
	$(Q)find ./* -type f -name "*.aria2c" -exec $(RM) {} \;

pack-tgz-file: $(DEPS)
	$(Q)$(RM) -rf -v output
	$(Q)$(MKDIR) output
	$(Q)cd build; $(TAR) > ../output/$(OUT).tgz

pack-zip-file: $(DEPS)
 	$(Q)$(RM) -rf -v output
	$(Q)$(MKDIR) output
	$(Q)cd build; $(ZIP) ../output/$(OUT).zip ./*

cancel-pack:
	$(Q)$(RM) output

clean:
	$(Q)$(RM) build 

clean-all:
	$(Q)$(RM) build output

help:
 	@echo this depends package:
	@echo zip or tar and pigz
	@echo aria2
	@echo
	@echo try use 'make download' to build it

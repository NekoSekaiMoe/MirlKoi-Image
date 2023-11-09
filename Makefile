MKDIR = mkdir -p -v
DOWN = aria2c -j8 -s8 --force-save=false
TAR = tar -cvf - ./* | pigz -p 8 -v -9
ZIP = zip -r -v -9
RM = rm -rf -v
OUT = output-`(date +%Y-%m-%d)`

.PHONY: all
all: download pack-zip-file
.ONESHELL:
SHELL := /bin/bash
download:/usr/bin/aria2c 
	@mkdir build
	@cd build
	@$(MKDIR) 兽耳
	@$(MKDIR) 银发
	@$(MKDIR) 精选图
	@$(MKDIR) 竖屏
	@$(MKDIR) 横屏
	@$(RM) 兽耳\r/ 横屏\r/ 竖屏\r/ 精选图\r/ 银发\r/
	@$(DOWN) --input-file=../config/兽耳（2515）.txt --dir=兽耳/ 
	@$(RM) 兽耳\r/ 横屏\r/ 竖屏\r/ 精选图\r/ 银发\r/
	@$(DOWN) --input-file=../config/银发（2071）.txt --dir=银发/ 
	@$(DOWN) --input-file=../config/精选图（3957）.txt --dir=精选图/ 
	@$(DOWN) --input-file=../config/竖屏.txt --dir=竖屏/ 
	@$(DOWN) --input-file=../config/横屏.txt --dir=横屏/ 
	@find ./* -type f -name "*.aria2c" -exec $(RM) {} \;
	@cd ../
pack-tgz-file: /usr/bin/tar /usr/bin/pigz
	@if [ ! -f "output/output.tgz" ];then
	@$(RM) -rf -v output
	@$(MKDIR) output
	@cd build 
	@$(TAR) > ../output/$(OUT).tgz
	@else
	@$(MKDIR) output
	@cd build
	@$(TAR) > ../output/$(OUT).tgz
	@fi
pack-zip-file: /usr/bin/zip
	@if [ ! -f "output/output.zip" ];then
	@$(RM) output
	@$(MKDIR) output
	@cd build
	@$(ZIP) ../output/$(OUT).zip ./*
	@else
	@$(MKDIR) output
	@cd build
	@$(ZIP) ../output/$(OUT).zip ./*
	@fi
cancel-pack:output
	$(RM) output
clean:
	$(RM) build 
clean-all:
	$(RM) build output
help:
	@echo this depends package:
	@echo zip or tar and pigz
	@echo aria2
	@echo
	@echo try use 'make download' to build it

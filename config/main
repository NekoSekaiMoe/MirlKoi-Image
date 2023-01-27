.ONESHELL:
SHELL := /bin/bash
download:/usr/bin/aria2c 
	@mkdir build
	@cd build
	@mkdir -p -v 兽耳
	@mkdir -p -v 银发
	@mkdir -p -v 精选图
	@mkdir -p -v 竖屏
	@mkdir -p -v 横屏
	@rm -rf -v 兽耳\r/ 横屏\r/ 竖屏\r/ 精选图\r/ 银发\r/
	@aria2c --input-file=../config/兽耳（2515）.txt --dir=兽耳/ -j8 -s8 --force-save=false
	@rm -rf -v 兽耳\r/ 横屏\r/ 竖屏\r/ 精选图\r/ 银发\r/
	@aria2c --input-file=../config/银发（2071）.txt --dir=银发/ -j8 -s8 --force-save=false
	@aria2c --input-file=../config/精选图（3957）.txt --dir=精选图/ -j8 -s8 --force-save=false
	@aria2c --input-file=../config/竖屏.txt --dir=竖屏/ -j8 -s8 --force-save=false
	@aria2c --input-file=../config/横屏.txt --dir=横屏/ -j8 -s8 --force-save=false
	@find ./* -type f -name "*.aria2c" -exec rm -f -v {} \;
	@cd ../
pack-tgz-file:build /usr/bin/tar /usr/bin/pigz
	@if [ ! -f "output/output.tgz" ];then
	@rm -rf -v output
	@mkdir -p -v output
	@cd build 
	@tar -cvf - ./* | pigz -p 8 -v -9 > ../output/output-`(date +%Y-%m-%d)`.tgz
	@else
	@mkdir -p -v output
	@cd build
	@tar -cvf - ./* | pigz -p 8 -v -9 > ../output/output-`(date +%Y-%m-%d)`.tgz
	@fi
pack-zip-file:build /usr/bin/zip
	@if [ ! -f "output/output.zip" ];then
	@rm -rf -v output
	@mkdir -p -v output
	@cd build
	@zip -r -v -9 ../output/output-`(date +%Y-%m-%d)`.zip ./*
	@else
	@mkdir -p -v output
	@cd build
	@zip -r -v -9 ../output/output-`(date +%Y-%m-%d)`.zip ./*
	@fi
cancel-pack:output
	rm -rf -v output
clean:
	rm -rf -v build 
clean-all:
	rm -rf -v build output
help:
	@echo this depends package:
	@echo zip or tar and pigz
	@echo aria2
	@echo
	@echo try use 'make download' to build it

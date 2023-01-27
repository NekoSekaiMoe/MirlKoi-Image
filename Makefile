download:config/main
	make -f -w config/main download
pack-tgz-file:config/main
	make -f -w config/main pack-tgz-file
pack-zip-file:config/main
	make -f -w config/main pack-zip-file
cancel-pack:config/main
	make -f -w config/main cancel-pack
claen:config/main
	make -f -w config/main clean
clean-all:config/main
	make -f -w config/main clean-all
help:config/main
	make -f config/main help

# MirlKoi-Image
用于下载MirlKoi图库中的部分图片(大约35g)

## Usage
下载图片请输入 `make`命令，下载完的图片在build文件夹下
打包图片请输入`make pack-tgz-file`命令，默认打包成tgz格式
或者输入`make pack-zip-file`命令，打包成zip格式
压缩完成后的文件在`output`目录下
## Requirements
- aria2
- make
- zip(也可以用pigz和tar)

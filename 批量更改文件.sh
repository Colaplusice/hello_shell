
echo ''
read -p " 请输入修改前的文件后缀: " file_before
read -p " 请输入修改后的文件后缀: " file_after


for f in *.$file_before; do
	mv "$f" "${f/.${file_before}/.${file_after}}"
	echo "$f --->" "${f/.${file_before}/.${file_after}}"
done

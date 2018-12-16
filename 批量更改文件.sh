

read -p " 请输入要修改的根路径(默认为当前路径): " file_path
read -p " 请输入修改前的文件后缀: " file_before
read -p " 请输入修改后的文件后缀: " file_after

	
if [$file_path == ""] 
then
file_path= "."
fi


for f in *.$file_before; do
# {f/.txt/.png}  rplace .txt in f to png
	mv "$f" "${f/.${file_before}/.${file_after}}"
	echo "$f --->" "${f/.${file_before}/.${file_after}}"
done

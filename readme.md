# shell学习

## 常用命令

* env  查看所有的环境变量

* pgrep + name 查看进程id

## 查看文件

* cat /proc/pid/environ  查看进行的环境变量
* cat -s file 压缩文件的空行
* cat -n 显示行号
* cat myfile|cat -n >myfile

$? 表示最后一条命令的执行状态 检查命令是否正确执行
-eq 判断命令是否相等  如果不相等 输出 错误信息
[ $? -eq 0 ] && echo Created DB || echo DB already exist

* cat > 加信息加入         cat>> 追加写入

* “2> /dev/null” 代表忽略掉错误提示信息
* 查看所有环境变量  env
* alias 为命令创建别名
* 终端行数 和列数  tput cols  tput lines

* 打印特殊字符用单引号
* 命令 赋值 变量current=$(pwd)  cmd_output=`COMMANDS`(反标记)
* 调试脚本 bash -x script.sh   or sh -x script
* 使用set -x 打断点
* :(){ :|:& };:  fork 炸弹
* ls | cat -n > out.txt
* 字符串长度  echo ${#string}
* exit 0 代表成功 非0代表失败
* 使用${}在字符串引用变量的值

## less

对长文件起到分页的作用
head 打印头部，tail打印尾部



## 语法

:= 和=的区别

结论：使用"="时，当变量不存在（未申明）才对其赋值

而":="是变量不存在或值为空时才对其赋值 如果能从环境变量中加载或者已经声明，则不改变

```shell
DB_HOST=""
db_host=${DB_HOST:="mysql"}
echo $db_host
# mysql


DB_HOST="21"
db_host=${DB_HOST:="mysql"}
echo $db_host
# 21

```

##### 调用函数

```
fjl(){
echo 'fjl233'
}
fjl
```

判断上条命令是否执行成功

```
if [ $? -eq 0 ];

then
echo "$CMD executed successfully"
else
echo "$CMD terminated unsuccessfully"
fi
 terminated unsuccessfully
```

### EOF

```shell
<<EOF ＃start
asdasd
asdasdd
EOF  ＃end
```

mac 加载环境变量 顺序

/etc/profile   /etc/paths  	~/.bash_profile	 ~/.bash_login	 ~/.profile	 ~/.bashrc

#### if

 ```
if [ ! $dir_proto_path ] ; then
echo "输入的参数不正确"
error_message
exit 0
fi
```

case

```
shell
case 值 in
模式1)
    command1
    command2
    command3
    ;;
模式2）
    command1
    command2
    command3
    ;;
*)
    command1
    command2
    command3
    ;;
esac
```

## for

```
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
```
遍历搜索
for i in $(kubectl get pod $*)
    do
    echo $i
done

`array_name=(value1 ... valuen)`

### 数组

```
if [[ ! "$array" ]]; then
    array[0]="."
    echo "第一个元素为: ${array[0]}"
fi
for proto_path in ${array[@]}

```
 数组长度: ${#ArrayName[@]}

#### 关系运算符

- -eq 检查两个数是否相等,-ne 检查两个数是否不相等
- -gt 左边数是否大于右边
- -lt 左边数是否小于右边
- -ge 左边数是否大于等于 右边
- -le 检测左边的数是否小于等于右边的，如果是，则返回 true。

##### 布尔运算符

-o 或运算

-a 与运算

! 非运算

&&  and

|| or

## 字符串运算符

-z 字符串长度是否为0,为0返回true
-n检测字符串长度是否为0，不为0返回 true。
if [$a] 字符串是否为空
判断字符串是否为空 

``` 判断字符串为空
if [ ! -z "$pass_tc11" ]; then
   echo "hi, I am not empty"
fi
if [ "pass_tc11" != "" ]; then
if [ -n "$pass_tc11" ]; then


```


### shift字段

让参数 依次向左移动一个位置，让脚本能够以$1来访问到每个参数

### zsh和bash切换

chsh -s /bin/bash

## Demo

#### 运行shell 文件传参数

```shell
## add_param函数
 add_param(){
 echo $*;
 }
Action=$1
shift
case "$Action" in
## 传的参数为 gen_protos
  gen_protos )
  proto_path=$1
  gen_protos   ;;

# MY OWN SHELL SCRIPT
  test_shell|hello_shell)
hello_shell  ;;
## 如果要加参数 在后面添加$* 变量 将参数传递到 add_param方法
  add_param | hello_param )
  add_param $* ;;
  mycli)
  echo 'test right'
   $*;;
```

```shell
#!/bin/sh
	
#Filename: password.sh

echo -e "Enter password: "

# 在读取密码前禁止回显

stty -echo

read password

# 重新允许回显

stty echo

echo

echo Password read.
```

## 文件

### 文件校验

md5 filename

文件夹不存在则创建文件夹

```shell
if [ ! -d "/myfolder" ]; then
  mkdir /myfolder
fi
```

```shell
data=/
ls $data
data="/"
ls $data
```

### 找出文件中包含proto的文件

```shell
name=$1
if [ -e $name  ]
then echo "this is a file"
if echo $name | grep '.proto'
then echo 这个是proto文件
else
echo 文件不合法
fi
else
echo {$name:3}
fi
```

### sort 文件排序

sort file1.txt file2.txt > sorted.txt 排序后输入一组文件
sort -nrk 1 195_第十行.sh 根据第一列进行排序

sort -n 将字符串转数字 
sort -r 指定顺序为从大到小 
sort -k 2 指定第二个字段作为排序判断标准

### 找出删除重复的行


## linux 修改文件夹读写权限

查看文件的详细信息 ls- l xxx.xx

```shell
chmod -R 777 ~/.ssh   
777 最高位: 文件所有者的访问权限
第二位: 群组访问权限
最低位: 设置其他人的访问权限
R  读取 4
w 写入 2
x 执行 1
7代表   rwx  4+2+1
6 代表 4+2
```

## 参数

```shell
 $0是脚本名称。$ 1是第一个参数。 $n是第n个参数。
 $# 参数的个数   $? last_command successful   $@以列表形式返回参数
 $* 将所有参数视为一个个体 
 迭代遍历参数 $$脚本当前运行的id,
 $!  最后一个发生后台运行的程序的进程id
 $-shell 当前的使用选项
```

将参数简化为数组: array=($@)

### 类型判断

```shell
-x 是否具有可执行权限
-f 判断file是否存在
-n 判断一个变量是否有值
-a file exists.
-b file exists and is a block special file.  
-c file exists and is a character special file.  
-d file exists and is a directory.
-e file exists (just the same as -a).  
-f file exists and is a regular file.  
-g file exists and has its setgid(2) bit set. 
-G file exists and has the same group ID as this process.
-k file exists and has its sticky bit set. 
-L file exists and is a symbolic link.  
-n string length is not zero. 
-o Named option is set on. 
-O file exists and is owned by the user ID of this process.  
-p file exists and is a first in, first out (FIFO) special file or  named pipe.  
-r file exists and is readable by the current process.  
-s file exists and has a size greater than zero. 
-S file exists and is a socket. 
-t file descriptor number fildes is open and associated with a  terminal device.
-u file exists and has its setuid(2) bit set.  
-w file exists and is writable by the current process.  
-x file exists and is executable by the current process.  
-z string length is zero.  
```

输入: 标准输入:0  标准输出:1  标准错误:2

## 时间和日期

- 输出date 日期 :date +"%Y_%m_%d_%H%M%S"


### 报错处理

## 字符和文本

字符split: 

s='one_two_three_four_five'
A="$(cut -d'_' -f2 <<<"$s")" result: two
A="$(cut -d'_' -f2- <<<"$s")" :two_three_four_five

字符串分割为数组

```split in array
STR="Sarah;Lisa;Jack;Rahul;Johnson"  #String with names
IFS=';' read -ra NAMES <<< "$STR"    #Convert string to array

#Print all names from array
for i in "${NAMES[@]}"; do
    echo $i
done
```

判断两字符是否相等:
- 统计行数 wc -l file
- 统计单词数  wc -w file
- 统计字符数 wc -c file
- wc  会打印出  行数  单词   字符数
- wc file -L  最长一行的行数

head 读取文件的起始部分 
tail 读取末尾版本
head a.txt 前10行

### cut

cut -c2-5 range_fields.txt 打印第二个到第五个字符
cut -c -2 rang_field.txt  打印前2个字符
cut -b  以字节来计数
通过revert来得到最后一项
echo 'maps.google.com' | rev | cut -d'.' -f 1 | rev
echo $s |rev |cut -d '_' -f 1 |rev

### grep 正则匹配

grep -E “” 使用扩展的正则表达式
ls -l | grep '^a'  通过管道过 滤ls -l输出的内容，只显示以a开头的行。
$ grep 'test' d*  显示所有以d开头的文件中包含test的行。
grep pattern filename 在文件中匹配正则
grep pattern filename1 filename2 多个文件中匹配
—color=auto 着重标识匹配到的数据
-o 只输出匹配到的文本
-v 打印不匹配的所有行
-c 匹配到的文本行数
统计文本匹配的数量

### echo -e “1 2 3 4\nhello\n5 6” | egrep -o “[0-9]” | wc -l

-n 统计匹配到的字符串所在的行号
-b 出现的偏移即出现在这行的第几个位置
-l 匹配 pattern 所在的文件
-L 相反，列出不匹配的文件
递归搜索文件 

### $ grep “text” . -R -n

-i 忽略大小写
-e 指定多个匹配模式  echo this is a line of text | grep -o -e “this” -e “line”
-f 指定多个匹配模式，从文件中加载
—.-include 选定文件类型  grep “main()” . -r —include *.{c,cpp}
-.-exclude 排除文件  grep “main()” . -r —exclude “README”
grep main . -r -exclude-dir CVS  排除路径
-Z 使用0值字节作为文件名的终止符
-q 静默输出，如果匹配成功输出1否则输出0
—A 打印匹配结果之后的行  seq 10 -1 1 |grep 5 -A 3
-B 打印匹配结果之前的行  seq 10 -1 1 |grep 5 -B 3
-R 递归搜索
-n 
-P 

## 管道

docker ps |grep mq |awk '{print $1}' 将一的结果传递2 2的结果传到3

## seq

seq 10 打印1 - 10
seq 3 2 100 从 3 到 100 间隔2
seq -f "%02g/03/2016" 31  打印3月日期
seq -f "1/%02g/2016" 12  打印2016年每一天
三种不同的格式化方法
seq -f "%e" 1 0.5 3   1-3 间隔 0.5
seq -f "%e" 1 0.5 3

- 用作循环
for i in $(seq 10)
do
echo "hello world"
done
- 改变输出的间隔方式  seq -s , 10
- 所有的数长度一致，不够补0  seq -w 10000
- 逆序输出  seq 10 -1 1

## paste

paste file1.txt file2.txt -d ","  将三个文件的字符并起来

### 常用 命令

~= 判断子字符串的包含关系

 ```shell
 if [[ "$a3" =~ "$a1" ]]; then
   echo "$是a1是$a3的子串！"
   else
   echo "$不是a1不是$a3的子串！"
```

## leetcode

打印文件第10行

```shell
seq 10 | tail -n +10
sed -n '10p' $play_1
tail -n +10 $play_1  | head -n 1
```

统计单词数目

egrep 把文件转换为单词流，每行一个单词，统计单词出现的频率
然后管道awk。将单词写入dict 统计完成后，调用END{},打印各单词数量

```shell
egrep -o "\b[[:alpha:]]+\b" $filename | \
awk '{ count[$0]++ }
END{ printf("%-14s%s\n","Word","Count") ;
for(ind in count)
{ printf("%-14s%d\n",ind,count[ind]);
}
}
```

## tail head

打印除了前M行外的所有的行
tail -n  +m+1
打印前m行  head -n m
最后M行  tail -n m

管道+xargs删除所有镜像
docker ps -a |awk '{print $1}'|tail -n +2 |xargs docker rm 

## mysql shell

``` mysql
mysql -u$USER -p$PASS $DB_NAME < $SQL_DIR
# 导出数据
mysqldump -uroot -p abc > abc.sql
# 端口设置
mysqldump -uroot -pnewpass -h 127.0.0.1 -P 3305 hello_flask > abc.sql

```

睡两秒
sleep2
写入环境变量  export LOCAL_HOST='127.0.0.1' 

### 高阶shell

根据端口号打印出pid 
lsof -i:5000 | awk '{print $2}'
杀死某个端口的进程
kill   lsof -i:5000 | awk '{print $2}'  

### awk

1. 首先执行begin {command}中的语句
2. 然后从文件或者stdin中读取一行，如果能够匹配pattern，执行随后的commands语句
3. 读至输入流末尾，执行END {commands}语句
4. awk 'NR==M, NR==N' filename 打印从M行到N行间的文本
5. seq 100 | awk 'NR==4,NR==6' 打印4到6间的数据

awk的脚本结构如下
awk 'BEGIN{print "start"} pattern {command} END {print "end"}' file

awk '{print $1 $4}' a.txt    打印文件每行 1，4 项
awk 'BEGIN {i=0} {i++}END {print i}' filename  输出文件行数
awk -Fe  '{print $1 $2}' a.txt   用e来分割
echo "12|23|11" | awk '{split($0,a,"|"); print a[3],a[2],a[1]}' 分割匹配到的字符

kubectl get pods |grep fenneyes| awk '{print $1}'
匹配正则:

```shell
awk '$2 ~ // {print $2,$4}' a.txt
```

**~ 表示模式开始。// 中是模式。**

os X find 加name
find . -name "*-e" -exec rm '{}' +

## sed进行文本内容替换

- sed -i 会替换文本文件内容
- 默认只替换首次匹配到的内容， g为后缀则会替换所有匹配到的内容  2g 替换两次 3g 替换三次
- sed会将s之后的第一个字符串作为分隔符 所以可以指定分隔符 类似于: sed 's|text|replace|g'
  
sed 's/ [^.]mobile phones[^.]\.//g' sentence.txt 
正确的； sed -i ‘’ ’s/properties/propertysd/g’  a.txt  (mac 要加''?)
 s/substitution_ pattern/replacement_string/g 。
 

### sed+正则

删除空行: sed '/^$/d' file
替换数据
sed -i 's/\b[0-9]\{3\}\b/NUMBER/g' sed_data.txt
将每个字符用[]扩起来，&代表之前匹配到的字符串
echo this is an example | sed 's/\w\+/[&]/g' (linux上才有用)
echo seven EIGHT | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/' 逆序输出
sed管道  echo abc | sed 's/a/A/' | sed 's/c/C/'
sed

[^.]*代表任意文本

删除 -e 结尾的文件
find . -name "-e" -exec rm '{}' \;

## 替换所有文件的某个文本

find . -type f -name '*.csv' -exec sed -i '' s/91./92./ {} +

### 第二种，未实验

find . -name '*.txt' -print0 | xargs -0 sed -i "" "s/form/forms/g"

## sed

sed stream editor 流编辑器
替换abc为acddc mac上为双引号  g是全局替换的意思
cat myfile| sed "s/abc/acddc/g"
多个匹配模式
sed -e 's/This/That/; s/test/another test/' ./myfile
mac 安装gnu-sed
brew install --default-names gnu-sed 
只打印替换的行
sed -n  's/test/another test/p' myfile
sed 's/ [^.]mobile phones[^.]\.//g' sentence.txt 
正确的；
sed -i ‘’ ’s/properties/propertysd/g’  a.txt
原理

### s/substitution_ pattern/replacement_string/g 。

替换pipenv为pip
sed 's/pipenv/pip/g' cat .gitlab-ci.yml |grep pip   

## 正则

url正则
http://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,4}
ip正则

邮箱正则
[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}

## xargs 的使用

xargs默认将多行输出转换为一行输出
-n 来限制每次调用命令时的参数个数
cat example.txt |xargs
cat example.txt| xargs -n 3   
echo 'one two three' | xargs mkdir
xargs - build and execute command lines from standard input
xargs -0 rm  当以文件名作为命令行参数时，建议0作为文件名终结符。
多重管道
docker ps |grep mq |awk '{print $1}' | xargs docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'

``` xargs 分割字符串 (仅适用于linux)
$ echo "splitXsplit2Xsplit3Xsplit4" | xargs -d X
Split1 split2 split3 split4
```

### tr means translate

大写转换为小写
echo "HELLO WHO IS THIS" | tr 'A-Z' 'a-z'
将0-9 映射为 9-0
echo 12345 | tr '0-9' '9876543210'  result:87654
rot 13 加密
echo "tr came, tr saw, tr conquered." | tr 'a-zA-Z' 'n-za-mN-ZA-M'
将文件中的制表符转换为空格
tr '\t' ' ' < file.txt
-d delete 将输出的数字删除掉
echo "Hello 123 world 456" | tr -d '0-9'
echo hello 1 char 2 next 4 | tr -c '0-9' ' '  将 不在0-9中的字符替换为空格
-d -c 同时出现 只会保留在给出set的字符
echo hello 1 char 2 next 4 | tr -d -c '0-9 \n'

cat multi_blanks.txt | tr -s '\n'  删除多余的换行符
cat sum.txt | echo $[ $(tr '\n' '+' ) 0 ] 将\n替换为+ 并且将数字加起来

计算文件中数字之和:
去除字母，去除空格
cat test.txt | tr -d [a-z] | echo "total: $[$(tr ' ' '+')]"

tr的字符set
- alnum：字母和数字。
- alpha：字母。
- cntrl：控制（非打印）字符。
- digit：数字。
- graph：图形字符。
- lower：小写字母。
- print：可打印字符。
- punct：标点符号。
- space：空白字符。
- upper：大写字母。
- xdigit：十六进制字符


### 和用户交互

read -p " What folder should be backed up: " folder  读取存入folder变量


### chown 更改文件的用户或者组

chown root /file
   change the owner of /u to root
chown root:staff/u   change its group to staff

chown -hR root/u  change the owner of /u and subfile to root      更改/u 下的所有文件的归属权

## 捕获终端输出和错误信息

1. 终端输出
    ```
    a=$(find /Users/icecola/.ssh -name  *.pub -print -quit)
    echo $a
    ```
2. 错误信息 `a=$(asd 2>&1) echo $a`
3. 终端输出转换为数组: 
    ```
    a=$(find /Users/icecola/.ssh -name *.pub -print -quit)
    for each in "${a[@]}"; do
	echo $each
    done
    ```

  
## 骚操作

### 批量替换文件格式，后缀，重命名

将所有txt后缀结尾的文件，替换为png结尾
for f in *.txt;
    do mv "$f" "${f/.txt/.png}";
done
"${f/_*_/_}" is an application of bash parameter expansion: the (first) substring matching pattern _*_ is replaced with literal _, effectively cutting the middle token from the name.

### find查找操作文件

find . -iname "*dbg*" -exec rename _dbg.txt .txt '{}' \;
rename 需要安装  brew install rename

方法1:
全局替换
shopt -s globstar nullglob
rename -s fanjialiang2401 fjl2401 **/*

方法2:
find . -exec rename 's|fjl|fanjialiang|' {} +

The -exec argument makes find execute rename for every matching file found. '{}' will be replaced with the path name of the file. The last token, \; is there only to mark the end of the exec expression.

find . -type f -name "*.sh" -print0 | xargs -0 wc –l  查找目录下python文件总行数


## vscode插件

brew install shfmt
shift+option+f

## 视频和图像处理

将mp4的音频部分提取为mp3
ffmpeg -i FILE.mp4 -acodec libmp3lame OUTPUTFILE.mp3
shift+option+f


## commands

1. catch error message :error=$(kubectl get pods -l app=fennec 2>&1 1>/dev/null)
2. 地址是否存在
    ```
    if [ -f "$file" ]
    then
    echo "$file found."
    else
    echo "$file not found."
    fi
    ```
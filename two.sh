#!/usr/bin/env bash
gen_protos(){
dir_proto_path=$1
shift
if [ ! $dir_proto_path ] ; then
echo "输入的参数不正确"
error_message
exit 0
fi
if [ ! $@ ]; then
echo "没有子文件夹，以父文件夹为参数开始生成proto"
echo this is the param list $@
proto_path=$dir_proto_path
echo 生成的proto路径为: ${proto_path}
fi
for i in $@;
do
proto_path=$i
out="./protos/"
if [ ! $proto_path ]; then
    echo 参数为空
    continue
else
    echo 参数为 $proto_path
fi
done
}

error_message(){
echo 'Usage：/grpc.sh gen_protos | dirname  |package_name  |package_name'
}

Action=$1
shift
case "$Action" in
    gen_protos)
    gen_protos  $@;;
*)error_message
esac
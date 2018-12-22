#!/usr/bin/env bash
gen_protos(){
dir_proto_path=$1
shift

if [ ! $dir_proto_path ] ; then
    echo "输入的参数不正确"
    error_message
    exit 1
fi

out="./protos/"
array=($@)

if [[ ! "$array" ]]; then
    array[0]="."
    echo "第一个元素为: ${array[0]}"
fi

for proto_path in ${array[@]}
do
    proto_path=$dir_proto_path/$proto_path
    echo "this is proto path $proto_path"
    if  [[ ! -d $proto_path  ]] ||  [[ ! -e $proto_path ]] && [[ ! ${proto_path##*.} == 'proto' ]]
       then echo '文件不存在 或者文件不合法'
    exit 1
    else
    # 如果 非文件夹 或者 非proto文件 则抛出异常 或者文件不存在
        find ${proto_path}  -name "*.proto" -exec \
        python -m grpc_tools.protoc \
            --proto_path ${dir_proto_path} \
            --python_out ${out} \
            --grpc_python_out ${out} {} \;
#    echo 运行成功! 目录为: ${dir_proto_path}${out}
fi
done
}
error_message(){
echo 'Usage：/grpc.sh gen_protos  dirname  package_name  package_name'
}
Action=$1
shift
case "$Action" in
    gen_protos)
    gen_protos  $@;;
*) error_message
esac
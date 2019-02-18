#!/usr/bin/env bash
gen_protos(){
    dir_proto_path=$1
    shift
    
    if [ ! $dir_proto_path ] ; then
        echo "输入的参数不正确"
        exit 1
    fi
    
    out="./protos/"
    array=($@)
    if [[ ! "$array" ]]; then
        array[0]="."
    fi
    
    for proto_path in "${array[@]}"
    do
        proto_path=$dir_proto_path/$proto_path
        echo "this is proto path $proto_path"
        if  [[ ! -d $proto_path  ]] ||  [[ ! -e $proto_path ]] && [[ ! ${proto_path##*.} == 'proto' ]]
        then echo 'Usage：./manage.sh gen_protos PROTO_DIRS_OR_FILES  '
            exit 1
        else
            find ${proto_path}  -name "*.proto" -exec \
            python -m grpc_tools.protoc \
            --proto_path ${dir_proto_path} \
            --python_out ${out} \
            --grpc_python_out ${out} {} \;
        fi
    done
}

Action=$1

shift
case "$Action" in
    gen_protos )
        proto_path=$1
    gen_protos "$@";;
    
    
    * ) echo 'Usage：/manage.sh gen_protos PROTO_DIRS_OR_FILES  [proto_path] [args]';;
esac

#!/usr/bin/env bash
mycli_action(){
    mycli -h ${db_host} -u ${db_user} -p ${db_password} $*
}

hello_shell(){
 echo 'this is my first shell function'
 }
 add_param(){
 echo $*;
 }
Action=$1
shift
case "$Action" in
  gen_protos )
  proto_path=$1
  gen_protos   ;;

# MY OWN SHELL SCRIPT
  test_shell|hello_shell)
hello_shell  ;;

  add_param | hello_param )
  add_param $* ;;
  mycli)
  echo 'test right'
   $*;;
  * ) echo 'Usage：/play_1.sh test_shell|add_param |migrate|mycli|mysqldump|dump_ddl [proto_path] [args]';;
esac

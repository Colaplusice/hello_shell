#!/bin/bash
#!/bin/bash


services_name=("api"  "rpc" "web" "webadm")
for service in "${services_name[@]}"
 do 
 echo "${service}"
 echo '---' >> a.txt
 done

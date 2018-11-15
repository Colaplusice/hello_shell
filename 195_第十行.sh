#!/usr/bin/env bash



#sed 's/ [^.]pipenv[^.]\.//g' a.txt

#sed  -i '' 's/properties/propertysd/g'  a.txt



sed -i '' 's/  - pip install -U -r requirements.txt -i https:/\/mirrors.aliyun.com/pypi/simple
  - pip install -U -r local_requirements.txt -i https:/\/pypi.17bdc.com/simple
  - pip install -U -r test_requirements.txt -i https:/\/mirrors.aliyun.com/pypi/simple//sd' a.txt




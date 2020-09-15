#/bin/bash

echo _________________________________________________________________________________
echo
echo ENTER URL for VAULT SERVER e.g. https://127.0.0.1
read VAULT_URL
export VAULT_ADDR=$VAULT_URL
echo $VAULT_ADDR
echo
sleep 2

echo _________________________________________________________________________________
echo
echo ENTER TOKEN TO LOGIN WITH: e.g. s.Abcdefgh12345678
read TOKEN 
vault login $TOKEN
echo
sleep 2


echo _________________________________________________________________________________
echo
echo SERVER:
echo 
echo $VAULT_ADDR
echo
sleep 2

echo _________________________________________________________________________________
echo
echo vault status
echo
vault status
echo
sleep 2


echo _________________________________________________________________________________
echo
echo AUTH LIST
echo
vault auth list -detailed
echo
sleep 2



echo _________________________________________________________________________________
echo
echo vault auth self-lookup
echo
vault read auth/token/lookup-self
echo
sleep 2



echo _________________________________________________________________________________
echo
echo list users entity ids
vault list identity/entity/id/
echo
sleep 2



echo _________________________________________________________________________________
echo
echo LIST user names
echo
vault list identity/entity/id/ | grep -v Keys | grep -x '.\{5,99\}' > j1
while read p; do
  vault read identity/entity/id/$p | grep -i name | grep -vi namespace | grep -v alias
done <j1
sleep 3
rm j1




echo _________________________________________________________________________________
echo
echo avaiable paths
echo
vault secrets list
echo
sleep 2


echo _________________________________________________________________________________
echo
echo POLICY LIST
echo
vault policy list
echo
sleep 2

echo _________________________________________________________________________________
echo
echo POLICY READ
echo
vault policy read oidc
echo
sleep 2


echo _________________________________________________________________________________
echo
echo operator key status
echo
vault operator key-status
echo
sleep 2






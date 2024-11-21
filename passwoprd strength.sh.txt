read -p "please enter password:" pass
count=`echo ${#pass}`
if [[ $count -ne 8 ]];then
echo "Password length should be 8 charactore"
exit 1;
fi
echo $count | grep "[A-Z]" | grep "[a-z]" | grep "[0-9]" | grep "[@#$%^&*]"

if [[ $? -ne 0 ]];then

echo "Password Must contain upparcase ,lowecase,number and special charactor"
exit 2;

fi
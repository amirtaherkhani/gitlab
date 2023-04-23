if [ -z "$(cat .env | grep -o GITLAB_UID)" ]; then
    printf "\n#GLOBAL\n" >>.env
    printf "GITLAB_UID=$(id -u)" >>.env
fi
printf "\nName of Volumes : \n"
ls -l | egrep '^d'
echo
USER_UID=$(id -u)
OLD_USER_ID=$(cat .env | grep GITLAB_UID)

if [[ "$OSTYPE" =~ ^darwin ]]; then
    sed -i '' "/^GITLAB_UID=/s/=.*/=${USER_UID}/" .env
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
    sed -i  "/^GITLAB_UID=/s/=.*/=${USER_UID}/" .env
fi

printf "User identifier Group ID:\n"
cat .env | grep GITLAB_UID
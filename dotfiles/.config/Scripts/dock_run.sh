#! /bin/bash

read -p "Enter a name of image: " name_of_image
read -p "Enter a name of container: " name_of_container

case "$name_of_image" in
    mongo)
        docker run --rm -d -p 27017:27017 --name $name_of_container -e MONGODB_DATABASE=admin -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=qwerty $name_of_image
        ;;
    nginx)
        docker run --rm -d -p 8080:80 --name $name_of_container $name_of_image
        ;;
    *)
        echo "Not responde"
        exit 2
esac

exit 0

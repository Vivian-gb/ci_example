#!/bin/bash

PROJECT=$1
{
echo "Atualizando o projeto "$PROJECT
echo "Parando o container"
docker stop gato_thomas
echo "Gerando o war"
cd "C:\\Tools\\dockers\\project\\"$PROJECT
mvn clean install
echo "Copiando o war para a pasta de deploy"
cp "C:\\Tools\\dockers\\project\\"$PROJECT"\\target\\"$PROJECT".war" "C:\\Tools\\dockers\\run\\tomcat\\deploy"
echo "Subindo o container"
cd C:\\Tools\\dockers\\run\\tomcat
echo "Subindo o container"
docker start gato_thomas
echo "Atualizando a app"
curl "http://vivian:password@localhost:8080/manager/text/reload?path=/"$PROJECT
} || {
read -p "Press enter to continue"
}

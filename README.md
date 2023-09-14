## Prerequisites 
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed. 
### Frontend 
 
Make sure you have [Node.js](https://nodejs.org/pt-br/blog/release/v14.18.0) installed. 
## Installation 
 
Clone/git pull the repo into any local directory 
 
``` 
$ git clone https://github.com/Guspex/iris-python.git 
``` 
 
Open the terminal in this directory and call the command to build and run InterSystems IRIS in container: 
*Note: Users running containers on a Linux CLI, should use "docker compose" instead of "docker-compose"* 
*See [Install the Compose plugin](https://docs.docker.com/compose/install/linux/)* 
 
``` 
$ docker-compose up -d 
``` 

``` 
$ pip3 install matplotlib 
``` 
 
To open IRIS Terminal do: 
 
``` 
$ docker-compose exec iris iris session iris -U IRISAPP 
IRISAPP> 
``` 
 
To exit the terminal, do any of the following: 
 
``` 
Enter HALT or H (not case-sensitive) 
``` 
### FrontEnd installation
``` 
Navigate to the FrontEnd folder in the terminal and perform the following commands.
$ npm i
$ npm audit fix --force (If you have some problem) *(Sometimes you need to go through it twice)
$ npm start
```
 
## What does it do 
The sample repository contains a simplest example of ObjectScript classe: ObjectScript method whith Python that returns value and method that creates a persistent record.
 
1. Open IRIS terminal and run the ObjectScript Test() method to see if runs the script and returns values from IRIS: 
 
``` 
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>write ##class(dc.sample.ObjectScript).Test()
It works!
42
``` 
 
2. Class `dc.sample.PersistentClass` contains a method `CreateRecord` that creates an object with one property, `Test`, and returns its id. 
 
Open IRIS terminal and run: 
 
``` 
IRISAPP>write ##class(dc.sample.PersistentClass).CreateRecord(.id) 
1 
IRISAPP>write id 
1 
``` 

In your case the value of id could be different. And it will be different with every call of the method. 
 
You can check whether the record exists and try to right the property of the object by its id. 
 
``` 
IRISAPP>write ##class(dc.sample.PersistentClass).ReadProperty(id) 
Test string 
``` 
 
## What else is inside the repository 
 
### .github folder 
 
Contains two GitHub actions workflows: 
1. `github-registry.yml` 
    Once changes pushed to the repo, the action builds the docker image on Github side and pushes the image to Github registry that can be very convenient to further cloud deployement, e.g. kubernetes. 
2. `objectscript-qaulity.yml` 
    with every push to master or main branch the workflow launches the repo test on objectscript issues with Objectscript Quality tool, [see the examples](https://community.objectscriptquality.com/projects?sort=-analysis_date). This works if the repo is open-source only. 
 
Both workflows are repo agnostic: so they work with any repository where they exist. 
 
### .vscode folder 
Contains two files to setup vscode environment: 
 
#### .vscode/settings.json 
 
Settings file to let you immediately code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript)
 
#### .vscode/launch.json 
 
Config file if you want to debug with VSCode ObjectScript 
 
### src folder 
 
Contains source files. 
src/iris contains InterSystems IRIS Objectscript code 
 
### docker-compose.yml 
 
A docker engine helper file to manage images building and rule ports mapping an the host to container folders(volumes) mapping 
 
### Dockerfile 
 
The simplest dockerfile which starts IRIS and imports code from /src folder into it. 
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders. 
 
### iris.script 
 
Contains objectscript commands that are feeded to iris during the image building 
 
### module.xml 
 
IPM Module's description of the code in the repository. 
It describes what is loaded with the method, how it is being tested and what apps neeed to be created, what files need to be copied. 
 
[Read about all the files in this artilce](https://community.intersystems.com/post/dockerfile-and-friends-or-how-run-and-collaborate-objectscript-projects-intersystems-iris) 
 
## Troubleshooting 
 
If you have issues with docker image building here are some recipes that could help. 
 
1. You are out of free space in docker. You can expand the amount of space or clean up maually via docker desktop. Or you can call the following line to clean up: 
``` 
docker system prune -f 
``` 
# Presentation

We acquired our dataset from the reputable source http://labren.ccst.inpe.br/atlas_2017.html, a valuable resource for gathering data related to energy and environmental factors. This dataset formed the foundation for our geographical analysis, which aimed to shed light on the solar irradiation patterns across the southern Brazilian region, specifically focusing on the states of Paraná, Santa Catarina, and Rio Grande do Sul.

To carry out this study effectively, we initiated the process by dividing the dataset among the aforementioned Brazilian states. This division allowed us to isolate and concentrate our analysis on these specific regions. Furthermore, we combined the datasets from these states to construct a comprehensive representation of the entire southern Brazilian region.

Our data manipulation and analysis were executed using Python, a versatile programming language known for its data science capabilities. We harnessed the power of the Python Pandas library, utilizing its "buildSubset" function to extract the relevant information for our study. This function helped us filter and organize the data, ensuring that we had precise and isolated datasets for each of the targeted states.

One of the key aspects of our analysis was the application of the K-means clustering algorithm. This machine learning algorithm played a pivotal role in segmenting the mapped data into five distinct clusters, or center points. These clusters were instrumental in dividing the region into equivalent zones, each characterized by its solar irradiation characteristics. This segmentation allowed us to gain a deeper understanding of how solar irradiation varies across the southern Brazilian region.

In order to visualize our findings and present them in a comprehensible manner, we turned to the Matplotlib library. This powerful Python library enabled us to create visually appealing and informative graphics using the subsets of data generated by the Python "buildSubset" function. Through these visual representations, we aimed to convey the spatial distribution of solar irradiation in the southern Brazilian region clearly.

Lastly, our color-coded graphics featured a gradient that effectively conveyed the fluctuations in horizontal global irradiation indices throughout the year 2017. This color gradient provided a visual representation of areas where the highest and lowest solar irradiation levels were recorded. This information is vital for understanding the solar energy potential of different regions within southern Brazil and can be a valuable resource for energy planning and environmental analysis.

In summary, our study was a data-driven exploration of solar irradiation patterns in the southern Brazilian region. Leveraging advanced data analysis techniques, machine learning algorithms, and data visualization tools, we aimed to provide valuable insights into the solar energy landscape of this region, which can inform sustainable energy policies and environmental decisions.

### Observation

PS. If you are unable to run the volume in Docker to create the files via code, we have already made the files ready for viewing in Front so you can get an idea of ​​how the tool works.

### Participants

André Dienes Friedrich - https://github.com/Guspex

Henrique Matheus Savi - https://github.com/SaviHenrique

João Victor Prestes da Cruz - https://github.com/PrestesJoo149

Lucca Gian Kolenez - https://github.com/LuccaGianKolenezBPlus

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
$ docker-compose build
``` 

``` 
$ docker-compose up -d 
``` 
### IRIS Initialization
In this template are provided to initialize iris: merge and python.
it enables Callin service to make Embedded python work via ModifyService clause.
and it updates the password for the built-in user SuperUser to "SYS". The hash for this password is obtained via the following command:
```bash
docker run --rm -it containers.intersystems.com/intersystems/passwordhash:1.1 -algorithm SHA512 -workfactor 10000
```

## How to test it

### Working with IRIS from Embedded Python

### Run the python script in iris container:

```bash
# attach to the running IRIS container
docker-compose exec iris bash
# run the script
$ irispython ./python/irisapp.py
```

The script contains different samples of working with IRIS from python and goes through it.
it should return something like this:
```
Machine Learning and Pandas functions
Method call:
Map done!
Map done!
Map done!
Map done!
Binary done!
Binary done!
Binary done!
Binary done!
Graphics and Binary files created
Iris Version:
IRIS for UNIX (Ubuntu Server LTS for x86-64 Containers) 2023.2 (Build 227U) Mon Jul 31 2023 18:04:28 EDT
Creating new record in dc.python.PersistentClass
1
Printing one IRIS Object Dump:
+----------------- general information ---------------
|      oref value: 1
|      class name: dc.python.PersistentClass
|           %%OID: $lb("1","dc.python.PersistentClass")
| reference count: 1
+----------------- attribute values ------------------
|       %Concurrency = 1  <Set>
|               Test = "2023-09-17 16:21:34.580585"
+-----------------------------------------------------
1
Running SQL query Select * from dc_python.PersistentClass
[0]: ['1', '2023-09-17 16:21:34.580585']
Printing the whole global of the persistence storage for the class dc.python.PersistentClass:^dc.Package4C8F.PersistentC1A93D
key=['1']: ☻☺∟☺2023-09-17 16:21:34.580585
André Dienes Friedrich
Henrique Matheus Savi
João Victor Prestes de Cruz
Lucca Gian Kolenez
```

## Run the python script with NoObjectScriptLine
### run the script
```bash
$ irispython ./python/NoObjectScript.py
```

```bash
# to Exit
$ exit
```

## Run the python script in local machine
 - But for this are necessery install the requirements.txt localy and change the paths.
 - on terminal to install the requirements.txt, do 
 ```bash
 $ pip3 install -r requirements.txt
 ```
 - Change the path on lines 13, 54, 59, 61, to the local directory.
 - Then you can run the script, if you are using the VSCode have the Play button on screen or if you want could run directly in terminal.
 - To run the script in terminal navigate at the folder python and run the command 
 ```bash
 $ python NoObjectScript.py
 ```

### Working with Python libs from ObjectScript
Open IRIS terminal:

```objectscript
$ docker-compose exec iris iris session iris
USER>zn "IRISAPP"
```

The first test demonstrates the call to a standard python library working with dates datetime
```objectscript
IRISAPP>d ##class(dc.python.ObjectScript).Test()
It works! 42
```

The second test demonstrates the call to a standard python library working with dates datetime
To do this, make sure that the docker volume path was created and is correct in the project, they are referenced in lines 75, 81, 83 in the ObjectScript.cls file located in the src/dc/python folder

```objectscript
IRISAPP>d ##class(dc.python.ObjectScript).IrradiationAnalysis()
Map done!
Map done!
Map done!
Map done!
Binary done!
Binary done!
Binary done!
Binary done!
Graphics and Binary files created
```

```bash
# to Exit
$ IRISAPP>h
```

### FrontEnd installation
``` 
$ npm i

$ npm audit fix --force (If you have some problem) *(Sometimes you need to go through it twice)

$ npm start
```
 
## What does it do 
The sample repository contains a simplest example of ObjectScript classe: ObjectScript method whith Python that returns value and method that creates files pnd and txt, this files conteins a image and a base64, their are created by libries on python, pandas, base64, matplotlib and KMeans.

We created a FrontEnd where we present the graphics created by the Python libraries, to visually demonstrate what was generated, using the React framework, which also integrates with Iris through calls.
 
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

## package.json

The package.json file is a fundamental part of Node.js and JavaScript projects. It serves several important purposes, primarily related to project configuration and package management. Here are some key functions and information that a package.json file typically contains:

Project Configuration: It stores various metadata about your project, such as the project's name, version, description, author, license, and more. This information helps others understand your project and its dependencies.

Dependencies: One of the most crucial functions of package.json is to list the project's dependencies. Dependencies are external packages or libraries that your project relies on. They can be divided into two categories:

"dependencies": These are packages required for your project to work in production. When someone installs your project, these dependencies will also be installed automatically.

"devDependencies": These are packages needed only during development or for building the project. They are not necessary for the project to run in production. Examples include testing libraries, build tools, and linters.

Scripts: package.json allows you to define custom scripts that can be executed using the npm (Node Package Manager) or yarn commands. Common scripts include starting the application, running tests, building assets, and more.
 
## Troubleshooting 
 
If you have issues with docker image building here are some recipes that could help. 
 
1. You are out of free space in docker. You can expand the amount of space or clean up maually via docker desktop. Or you can call the following line to clean up: 
``` 
docker system prune -f 
``` 

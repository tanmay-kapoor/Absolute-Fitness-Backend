# Getting Started with Absolute Fitness Server

## Download [node](https://nodejs.org/en/download/) in your local machine

## Available Scripts

Follow the given steps in this order to start the server of the project

In the terminal, 

```
cd backend   :   to enter the backend code folder (skip if you are already in the backend folder)
```

```
npm i        :  to install all dependencies
```

Create a file named  `.env` in the backend folder (the place where `server.js` file is present) with the following variables

```
DB_HOST      :   database host name. "localhost" for local database
```


```
DB_USER      :   user you want to create connection with (eg: root)
```


```
DATABASE     :   name of the databse (absolute_fitness for this project)
```


```
PASSWORD     :   password of the specified MySQL user
```

```
PORT         :  5001
```

The `.env` file's format should look like this 

![image](util/sample_env.png)


After doing all this,

```
npm start    :   to start the server
```
# RCAS [![Build Status](https://travis-ci.org/Brain-Dynamics/RCAS.svg?branch=master)](https://travis-ci.org/Brain-Dynamics/RCAS)[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Brain-Dynamics/rcas/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
A R package for getting tickets from a Central Authentication Service (CAS Server)

This package allows authentication against a CAS Server and retrieve a ticket for a service. For that, you only have to do a call to a single method with the URL of the CAS server with the correct path, the user's credentials and the login URL of the service that you want to access.

## Requirements

To use this package you only need the following dependencies.

* R (>= 3.0.0)
* httr (>= 0.6.1)

You also need to have enable the REST Api of the CAS server to access the service. In the middle of this [link](http://jasig.github.io/cas/4.0.x/protocol/REST-Protocol.html) you can find cas server configuration to enable it.

## Compiling the project

You don't need a special process to compile, just the usual R way to compile projects.


## How to use the RCAS project.

To use the package you need the following parameters.

* **cas.url:** This is the url of the CAS server endpoint ticket generator. You need to include the path to the REST API service.
* **username:** The username of the user that is going to authenticate.
* **password:** The password of the user.
* **service.url:** The login url of the service that the user wants to access throught the CAS Server.
* **ignore.certificate (OPTIONAL):** This is a flag to ignore or not certificate verification, its default value is set to FALSE. If you want to ignore the certificate you need to add this flag with the value of TRUE.

The method returns a list object with the next properties:

* **result:** TRUE if the authentication process was successful, false otherwise.
* **ticket:** The ticket as a string to access the service. This property is returned if the authentication was successful.
* **error:** An error message if there was a problem with the authentication. This property is returned on error.

Below, you can see an example of use.

~~~R
> rcas.ticket("https://localhost:8181/url-not-correct", "userName", "password",
			"https://localhost:8181/service/login" )
$error
[1] "client error: (404) Not Found"

$result
[1] FALSE

> cas.ticket("https://localhost:8181/cas/v1/tickets", "userName", "password",
			"https://localhost:8181/service/login",
			ignore.certificate = TRUE )
$ticket
[1] "ST-3-IcRo7jPdodZ1Dj3uMhzh-localhost"

$result
[1] TRUE
~~~

## How to install
For now, you can install it directly from GitHub using the devtool package following the next instructions.

~~~R
> install.packages("devtools")
> devtools::install_github("Brain-Dynamics/RCAS")
~~~


### Development by Brain Dynamics 
[![Brain Dynamics](http://www.brain-dynamics.es/images/bdync.png)](http://www.brain-dynamics.es)

\name{rcas.ticket}
\alias{rcas.ticket}
\title{rcas.ticket}
\description{
Prints 'Hello, world!'.
}
\usage{
rcas.ticket(cas.url, username, password, service.url )
rcas.ticket(cas.url, username, password, service.url, ignore.certificate = TRUE )
}
\arguments{
  \item{cas.url}{url of the cas server.}
  \item{username}{for login in the cas server.}
  \item{password}{password for login in the cas server.}
  \item{service.url}{url for the final service to login.}
  \item{ignore.certificate}{TRUE for ignore the certification validation.}
}
\value{
  The method returns a list with the next properties:
  \item{result}{TRUE if the request was successful, FALSE otherwise.}
  \item{ticket}{The ticket for access the service. If result is TRUE, this property is returned.}
  \item{error}{An error message. If result is FALSE, this property is returned.}
}

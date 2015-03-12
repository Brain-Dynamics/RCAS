
rcas.ticket <- function(cas.url, username, password, service.url, ignore.certificate = FALSE ) {
  require("httr")

  # Setup certificate behavior
  config = if(ignore.certificate) list(ssl.verifypeer = 0L) else list()

  # First, we are going to get the token for the cas server access
  tryCatch(
  {
    # Do the request for the cas access ticket
    res <- POST(url = cas.url,
                config = config,
                encode = "form",
                body = list(username = username, password = password))

    # Check for the result, stop if there's an error
    stop_for_status(res)
    # Extract the ticket
    body <- content(res,"text")
    ticket <- regmatches(body,regexec(".*action=\".*/(.*?)\".*", body))[[1]][2]

    # Do the request for the service ticket
    res <- POST(url = paste0(cas.url,"/",ticket),
                config = config,
                encode = "form",
                body = list(service = service.url))

    stop_for_status(res)

    # Return the answer
    list(ticket = content(res,"text"), result = TRUE)
  } , error = function(e) list(error = e$message, result = FALSE) )

}

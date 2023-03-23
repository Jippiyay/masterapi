#' Saves object to database
#'
#' This function saves to the database behind the masters project api
#'
#' @param obj Object to save
#' @return NULL
#' @export store
store <- function(obj) {
    tcres = tryCatch({
        apiurl <- paste0(Sys.getenv("APIURL"), "/shiny-data")
        print(apiurl)
        res <- httr::POST(apiurl, body = obj, encode = "json", verbose())
        print(res)
        if(res$status_code == 200){
          shiny::showNotification(duration = 5, "Prognose wurde gespeichert")
        }
        else{
          shiny::showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nVersuche es bitte erneut.", type = "error")
        }
      }, warning = function(w) {
        shiny::showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nVersuche es bitte erneut.", type = "warning")
      }, error = function(e) {
        print(e)
        shiny::showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nWende dich bitte an Johanna.", type = "error")
    })
}

#' Tracks events object to database
#'
#' This function saves to the database behind the masters project api
#'
#' @param event Object to save
#' @return NULL
#' @export track
track <- function(event) {
  tcres = tryCatch({
        apiurl <- paste0(Sys.getenv("APIURL"), "/event")
        print(apiurl)
        res <- POST(apiurl, body = event, encode = "json", verbose())
        print(res)
        if(res$status_code == 200){
          # showNotification(duration = 5, "Prognose wurde gespeichert")
        }
        else{
          shiny::showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nVersuche es bitte erneut.", type = "error")
        }
      }, warning = function(w) {
        shiny::showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nVersuche es bitte erneut.", type = "warning")
      }, error = function(e) {
        print(e)
        shiny::showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nWende dich bitte an Johanna.", type = "error")
    })
}

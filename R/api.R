#' Saves object to database
#'
#' This function saves to the database behind the masters project api
#'
#' @param obj Object to save
#' @return NULL
#' @export store
store <- function(obj) {
    tcres = tryCatch({
        apiurl <- Sys.getenv("APIURL")
        print(apiurl)
        res <- httr::POST(apiurl + "/shiny-data", body = obj, encode = "json", verbose())
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
        apiurl <- Sys.getenv("APIURL")
        print(apiurl)
        res <- POST(apiurl + "/event", body = obj, encode = "json", verbose())
        print(res)
        if(res$status_code == 200){
          # showNotification(duration = 5, "Prognose wurde gespeichert")
        }
        else{
          # showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nVersuche es bitte erneut.", type = "error")
        }
      }, warning = function(w) {
        # showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nVersuche es bitte erneut.", type = "warning")
      }, error = function(e) {
        # showNotification(duration = 5,"Prognose konnte nicht gespeichert werden.\nWende dich bitte an Johanna.", type = "error")
  })
}

# Functie die Almere parkeren data uit cache haalt of hierin opslaat, indien gewenst
lees_data <- function(bestand, cache = FALSE, rds = NULL) {
  if (cache) {
    # Wens is uit cache te laden en op te slaan
    if (!is.null(rds) & file.exists(rds)) {
      # RDS bestaat, laad deze in en geef terug
      return(readRDS(rds))
    }
    if (is.null(rds) & !is.null(bestand)) {
      # Waarschijnlijk is rds als bestand opgenomen, lees deze in en geef terug
      return(readRDS(bestand))
    }
  }
  # Lees normaal in
  data <- read.csv(bestand)
  
  # Sla op als cache gewenst is
  if (cache) {
    if (is.null(rds)) {
      saveRDS(data, paste(bestand, ".rds"))
    } else {
      saveRDS(data, rds)
    }
  }
  # Geef data terug
  return(data)
}
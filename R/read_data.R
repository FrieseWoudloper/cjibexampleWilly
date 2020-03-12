# Functie die data uit cache haalt of hierin opslaat, indien gewenst.
# Indien er geen cache bestaat, wordt een .csv ingelezen.
lees_data <- function(bestand, cache = FALSE, rds) {
  if (cache) {
    # Wens is uit cache te laden en op te slaan
    if (!missing(rds) & file.exists(rds)) {
      # RDS bestaat, laad deze in en geef terug
      return(readRDS(rds))
    }
    if (missing(rds) & !missing(bestand)) {
      # Waarschijnlijk is rds als bestand opgenomen, lees deze in en geef terug
      return(readRDS(bestand))
    }
  }
  # Lees normaal in
  data <- read.csv(bestand)
  
  # Sla op als cache gewenst is
  if (cache) {
    if (missing(rds)) {
      saveRDS(data, paste(bestand, ".rds"))
    } else {
      saveRDS(data, rds)
    }
  }
  # Geef data terug
  return(data)
}
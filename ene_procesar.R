library(arrow)

# cargar un archivo
dato <- arrow::read_delim_arrow("datos/originales/ene-2024-01-def.csv",
                        parse_options = csv_parse_options(delimiter = ";")
                        # read_options = csv_read_options(encoding = "latin1")
)

dato |> glimpse()

# lista de todos los archivos
archivos <- dir("datos/originales", full.names = T)

# cargar todos los archivos
datos <- map(archivos, read_delim_arrow, parse_options = csv_parse_options(delimiter = ";"))

# unir
datos_2 <- datos |> list_rbind()

# guardar
write_parquet(datos_2, "datos/procesados/ene_2024.parquet")

library(dplyr)
library(ggplot2)
library(plotrix)


archivo = "C:/Users/Administrator/Documents/Facultad/Seminario_24/TP/dataset_santiago.txt"
data = read.csv(archivo, header = TRUE, sep = ";")
cantidad = length(data$ID_1)

invocaciones_por_interfaz = data %>%
  group_by(ID_1) %>%
  summarise(invocaciones = n())

invocaciones_por_interfaz$invocaciones <- ((invocaciones_por_interfaz$invocaciones/cantidad) * 100)

#sin librería
etiquetas <- paste0(invocaciones_por_interfaz$ID_1, " = ", invocaciones_por_interfaz$invocaciones, "%")
pie(invocaciones_por_interfaz$invocaciones, labels = etiquetas, col = topo.colors(cantidad), cex = 0.3)

#con plotrix
lab <- paste0(invocaciones_por_interfaz$ID_1, " = ", round(invocaciones_por_interfaz$invocaciones/sum(invocaciones_por_interfaz$invocaciones) * 100, 2), "%")
pie3D(invocaciones_por_interfaz$invocaciones,
      labels = lab,
      labelcex =0.6,
      explode = 0.05,
      radius = 0.9,
      theta = 1,
      shade = 0.5,
      main = "Invocaciones por interfaz")


#con GGPLOT2
gplot(invocaciones_por_interfaz, aes(x = "", y = invocaciones, fill = ID_1)) +
  geom_bar(stat = "identity", width = 1) +
  geom_text(aes(label = paste0(round(invocaciones, 1), "%")), position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  labs(fill = ID_1, x = NULL, y = NULL, title = "Invocaciones por interfaz") +
  theme_void() +
  theme_gray() + 
  theme(plot.title = element_text(hjust = 0.5))
  
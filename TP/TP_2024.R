library(ggplot2)
library(dplyr)

data = read.csv("C:\\Users\\Administrator\\Documents\\Facultad\\Seminario_24\\TP\\snic-provincias.csv", header = TRUE, stringsAsFactors = FALSE, sep = ";")

homicides_by_province = data %>%
  filter(anio == 2022) %>%
  group_by(provincia_nombre) %>%
  summarise(cantidad_hechos = sum(cantidad_hechos))

plot <- ggplot(homicides_by_province, aes(x=provincia_nombre, y=cantidad_hechos, fill = provincia_nombre)) +
  geom_col(linewidth=1) +
  geom_text(aes(label=cantidad_hechos), vjust=-0.5, size=1) +
  theme(axis.text.x = element_text(angle = 90, size = 1)) +
  theme(axis.text.y = element_text(scale(100000), size = 1)) +
  scale_y_continuous(breaks = seq(0, 600000, by = 50000))

plot


plot2 <- ggplot(homicides_by_province, aes(x=provincia_nombre, y=cantidad_hechos, fill=provincia_nombre)) +
  geom_col(linewidth=1) +
  geom_text(aes(label=cantidad_hechos), vjust=-0.5, size=1) +
  theme(axis.text.x = element_text(angle = 90, size = 1)) +
  theme(axis.text.y = element_text(scale(100000), size = 1)) +
  scale_y_continuous(breaks = seq(0, 600000, by = 50000)) +
  labs(color = "provincia_nombre") +
  labs.

plot2

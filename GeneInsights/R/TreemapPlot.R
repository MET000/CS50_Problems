treemap_plot <- function(data, x, y){

  data <- as.data.frame(data)
  data$new <- paste0(x, " (", y, " - ", round(y/sum(y) * 100, digits = 2), "%", ")")
  ggplot(data,aes(area=y,fill=str_to_title(new),label='')) +
    treemapify::geom_treemap(layout="squarified") +
    labs(fill = "Variant Type") +
    scale_fill_viridis(discrete = TRUE, option = "H") +
    theme(legend.title = element_text(face = "bold"))

}

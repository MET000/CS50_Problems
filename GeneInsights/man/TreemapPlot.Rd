\name{treemap_plot}
\alias{treemap_plot}
\title{Create a Treemap Visualization for Data Representation}
\description{
  This function generates a treemap plot using the `ggplot2` and `treemapify` packages. It visualizes data by area proportions, fills, and labels, offering an intuitive way to represent categorical data.
}
\usage{
treemap_plot(data, x, y)
}
\arguments{
  \item{data}{
    A data frame containing the variables to be used in the treemap.
  }
  \item{x}{
    A character column in the data frame representing the categories to label in the plot.
  }
  \item{y}{
    A numeric column in the data frame representing the area sizes for the treemap rectangles.
  }
}
\details{
  The function calculates relative proportions of the `y` variable (in percentage terms) for each category in `x`, and appends this information to create labels. The treemap is then plotted using `treemapify::geom_treemap()` with a squarified layout. Labels are formatted to display category names and percentages.

  The plot uses a discrete color scale (`viridis` package) and includes a styled legend for improved readability.
}
\value{
  A ggplot2 object representing the treemap visualization.
}
\examples{
# Example usage:
library(ggplot2)
library(treemapify)
library(viridis)

# Example data
example_data <- data.frame(
  category = c("A", "B", "C"),
  value = c(40, 30, 20)
)

# Generate a treemap plot
treemap_plot(example_data, x = example_data$category, y = example_data$value)
}
\seealso{
  \code{\link[treemapify]{geom_treemap}}, \code{\link[ggplot2]{ggplot}}, \code{\link[viridis]{scale_fill_viridis}}
}

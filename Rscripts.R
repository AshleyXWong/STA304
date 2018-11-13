library(ggplot2)
library(readr)
library(stringr)
library(igraph)
library(dplyr)
library(magrittr)
library(tidyr)
library(ggplot2)

make_graphs <- function(path_name) {
  
  class_data <- read.csv(path_name, skip = 2)
  
  cols <- c("program", 'year', 'study', 'attendance', 'goals_attendance', 'note_frequency', 'notetaking_method', 'which_effects', 'rewrite notes')
  colnames(class_data) <- cols
  png("year-program.png", width=720, height=480)
  ggplot(class_data, aes(x=year, fill=program)) + 
    geom_histogram(stat = "count") +
    labs(title="Program by Year")
  dev.off()
  
  png("study-year.png", width=720, height=480)
  ggplot(class_data, aes(x=study, fill=year)) + 
    geom_histogram(stat = "count") +
    labs(title="Study-Year")
  dev.off()
  
  png("piebyyear.png", width=720, height=480)
  class_data %>%
    ggplot(aes(x=1, fill=year)) +
    geom_bar(width=1) +
    coord_polar(theta = 'y') + 
    theme_void() +
    ggtitle('Pie by Year')
  dev.off()
  
  png("piebyprogram", width=720, height=480)
  class_data %>%
    ggplot(aes(x=1, fill=program)) +
    geom_bar(width=1) +
    coord_polar(theta = 'y') + 
    theme_void() +
    ggtitle('Pie by Program')
  dev.off()
}
make_graphs("Data Collection - Sheet1 (1).csv")
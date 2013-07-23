library(ggplot2)

data <- read.table("price_data_control.csv", header=F, sep=",")

ggplot(data=data) + scale_color_grey(name="Average price") +
  geom_line(aes(x=V1,y=V2,color="chickens")) +
  geom_line(aes(x=V1,y=V3,color="ducks")) +
  scale_y_continuous("price") +
  scale_x_continuous("time")

# dev.off()
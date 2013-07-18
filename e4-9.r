library(ggplot2)

data <- read.table("price_demand.csv", header=F, sep=",")

ggplot(data=data) + scale_color_grey(name="Legend") +
  geom_line(aes(x=V1,y=V2,color="price")) +
  geom_line(aes(x=V1,y=log2(V3)-3,color="demand")) +
  scale_y_continuous("amount") +
  scale_x_continuous("time")

# dev.off()
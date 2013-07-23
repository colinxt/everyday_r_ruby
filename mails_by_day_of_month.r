library(ggplot2)

inbox_data <- read.table("inbox_data_enron.csv", header=TRUE, sep=",", fill=TRUE)
sent_data <- read.table("sent_data_enron.csv", header=TRUE, sep=",", fill=TRUE)

# transform string to date type
dates <- as.Date(inbox_data$date, "%Y-%m-%dT%H:%M:%S")
elements <- format(dates, '%d')
inbox_count <- data.frame(table(elements))$Freq

dates <- as.Date(sent_data$date, "%Y-%m-%dT%H:%M:%S")
elements <- format(dates, '%d')
sent_count <- data.frame(table(elements))$Freq

days_of_month <- c("01","02","03","04","05","06","07","08","09","10",
                   "11","12","13","14","15","16","17","18","19","20",
                   "21","22","23","24","25","26","27","28","29","30","31")
df <- data.frame(days=factor(days_of_month, level=days_of_month),
                 inbox=inbox_count,sent=sent_count)

ggplot(data=df) + scale_shape_manual(name="Mailbox", values=c(2,3)) +
  geom_point(aes(x=days,y=inbox, shape='inbox')) +
  geom_smooth(aes(x=days,y=inbox, group=1)) +
  geom_point(aes(x=days,y=sent, shape='sent')) +
  geom_smooth(aes(x=days,y=sent, group=2)) +
  scale_y_continuous('number of emails') +
  scale_x_discrete('day of month')


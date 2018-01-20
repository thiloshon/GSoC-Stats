Students <- c(410 , 630 , 905 , 1126, 1000, 1026, 1115, 1212, 1192, 1307, 1051, 1206, 1318)
k <- 2005:2017

df <- data.frame(Students, k)

df$Students <- as.factor(Students)


ggplot(df, aes(x = k, y = Students, fill = Students)) +
    geom_bar(stat = "identity") +
    labs(x = "Year", y = "Number of Accepted Students", title = "Number of Accepted Students Each Year") 
+
    scale_fill_discrete(name = "Organizations")


ggplot(df, aes(x = k, y = h, fill = h)) +
    geom_bar(stat = "identity") +
    labs(x = "Year", y = "Number of Accepted Students", title = "Number of Accepted Students Each Year") 
+
    scale_fill_discrete(guide = F) 

+
    theme_hc()+ scale_colour_hc()


Organizations <- c(42 ,102 , 135 , 175 , 150 , 150 , 175 , 180 , 177, 190 , 137 , 178 , 198)

cf <- data.frame(Organizations,k)

cf$j <- as.factor(j)

ggplot(cf, aes(x = k, y = Organizations, fill = Organizations)) +
    geom_bar(stat = "identity") +
    labs(x = "Year", y = "Number of Organizations", title = "Number of Organizations Each Year")

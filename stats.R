library(ggplot2)
library(scales)

categoryMatrix <-
    sort(table(organizationTable$Category), decreasing = T)
categoryMatrix <- as.data.frame(categoryMatrix)


technoList <-
    unlist(strsplit(organizationTable$Technologies, " , "))
technoList <- trimws(technoList)
technoMatrix <- sort(table(technoList), decreasing = T)
technoMatrix <- as.data.frame(technoMatrix)


topicList <- unlist(strsplit(organizationTable$Topics, " , "))
topicList <- trimws(topicList)
topicMatrix <- sort(table(topicList), decreasing = T)

topicMatrix <- as.data.frame(topicMatrix)

organizationTable[order(as.numeric(organizationTable$CompletedProjects),
                        decreasing = T), c(1, 6)]

# levels(categoryMatrix$Var1) <- gsub("and", "and \n", levels(categoryMatrix$Var1))


# Categories

ggplot(categoryMatrix, aes(x = Var1, y = Freq, fill = Var1)) +
    geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 40, hjust = 1)) +
    labs(x = "", y = "Number of Organizations", title = "Number of Organizations in each fields") +
    scale_fill_discrete(name = "Organizations") +
    theme(axis.text.x = element_blank())



ggplot(categoryMatrix,
       aes(x = "", y = Freq, fill = Var1)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0) +
    geom_text(aes(label = percent((Freq / 201))),
              size = 4,
              position = position_stack(vjust = 0.5)) +
    theme(
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank()
    ) +
    labs(x = "",
         y = "",
         title = "Percentage of the Organizations in each fields") +
    scale_fill_discrete(name = "Organizations")


# Technologies

ggplot(technoMatrix[1:25, ], aes(x = technoList, y = Freq, fill = technoList)) +
    geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 40, hjust = 1)) +
    labs(x = "", y = "Number of Organizations", title = "Technologies used by organizations") +
    scale_fill_discrete(guide = FALSE)


# Topics

ggplot(topicMatrix[1:25, ], aes(x = topicList, y = Freq, fill = topicList)) +
    geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 40, hjust = 1)) +
    labs(x = "", y = "Number of Organizations", title = "Topics covered by organizations") +
    scale_fill_discrete(guide = FALSE)


# successful projects

temp <- organizationTable[order(as.numeric(organizationTable$CompletedProjects), decreasing = T), c(1,6)]


#temp$CompletedProjects <- factor(temp$CompletedProjects, levels = sort(unique(temp$CompletedProjects)))
temp$OrganizationName <- factor(temp$OrganizationName, levels = temp$OrganizationName)

ggplot(temp[1:16,], aes(x = OrganizationName, y = CompletedProjects, fill = OrganizationName)) +
    geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
    labs(x = "", y = "Number of Successful projects", title = "Successful projects by organizations") +
    scale_fill_discrete(guide = F) 


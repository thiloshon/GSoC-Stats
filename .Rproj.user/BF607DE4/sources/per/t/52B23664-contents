library(XML)
library(xml2)
library(rvest)


doc <- htmlParse("https://summerofcode.withgoogle.com/archive/2017/organizations", encoding="UTF-8", isURL = T)


doc.html = htmlTreeParse('https://summerofcode.withgoogle.com/archive/2017/organizations',
                         useInternal = TRUE)


doc <- read_html("https://summerofcode.withgoogle.com/archive/2017/organizations")

datain <- htmlTreeParse(doc, useInternalNodes = TRUE)

xml_name(doc)


id_or_class_xp <- "//div[@class='organization-card__container']//text()"
xpathSApply( datain,id_or_class_xp,xmlValue)

xpathApply(doc,id_or_class_xp,xmlValue)

baz <- xml_find_all(doc, ".//baz")

xmlApply(datain, xmlName)








technologies
organizations
description
links
logos

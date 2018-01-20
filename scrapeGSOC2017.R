library(rvest)

# Page to Scrape
doc <-
    read_html("https://summerofcode.withgoogle.com/archive/2017/organizations")

# organization scraping

organizations <- doc %>%
    html_nodes(".organization-card__name") %>%
    html_text()

description <- doc %>%
    html_nodes(".organization-card__tagline") %>%
    html_text()

links <- doc %>%
    html_nodes(".organization-card__link") %>%
    html_attr('href')

links <-
    paste("https://summerofcode.withgoogle.com", links,  sep = "")

logos <- doc %>%
    html_nodes("org-logo") %>%
    html_attr('data')

logos <- gsub("'//", "", gsub("',", "", sapply(strsplit(logos, " "), '[[', 3)))


#  Scraping individual elements

technologies <- unlist(lapply(links, function(x) {
    page <- read_html(x)
    
    technologies <- page %>%
        html_nodes(".organization__tag--technology") %>%
        html_text()
    technologies <- paste(technologies, collapse  = " , ")
    print(technologies)
    return(technologies)
}))

category <- unlist(lapply(links, function(x) {
    page <- read_html(x)
    
    technologies <- page %>%
        html_nodes(".organization__tag--category a") %>%
        html_text()
    technologies <- paste(technologies, collapse  = " , ")
    print(technologies)
    return(technologies)
}))

topics <- unlist(lapply(links, function(x) {
    page <- read_html(x)
    
    technologies <- page %>%
        html_nodes(".organization__tag--topic") %>%
        html_text()
    technologies <- paste(technologies, collapse  = " , ")
    print(technologies)
    return(technologies)
}))

organizationWebsiteURL <- unlist(lapply(links, function(x) {
    page <- read_html(x)
    
    technologies <- page %>%
        html_nodes(".page-organizations__org-url a") %>%
        html_attr('href')
    technologies <- paste(technologies, collapse  = " , ")
    print(technologies)
    return(technologies)
}))


numberOfSuccessfulProjects <- unlist(lapply(links, function(x) {
    page <- read_html(x)
    
    technologies <- page %>%
        html_nodes(".archive-project-card__student-name") %>%
        html_attr('href')
    technologies <- length(technologies)
    print(technologies)
    return(technologies)
}))

# Creating Dataset

organizationTable <-
    data.frame(
        "OrganizationName" = organizations,
        "Description" = description,
        "Category" = category,
        "Technologies" = technologies,
        "Topics" = topics,
        "CompletedProjects" = numberOfSuccessfulProjects,
        "OrganizationWebsite" = organizationWebsiteURL,
        "OrganizationURL" = links,
        "Logo" = logos
    )

organizationTable[] <- lapply(organizationTable, as.character)


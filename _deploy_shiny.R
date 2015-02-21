library(shinyapps)
dir.app <- paste0(Sys.getenv('PathGitHubRepos'),'/devdataprod')
print(dir.app)

shinyapps::deployApp(dir.app)

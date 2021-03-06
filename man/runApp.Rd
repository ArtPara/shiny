\name{runApp}
\alias{runApp}
\title{Run Shiny Application}
\usage{
  runApp(appDir = getwd(), port = 8100L,
    launch.browser = getOption("shiny.launch.browser", interactive()),
    workerId = "")
}
\arguments{
  \item{appDir}{The directory of the application. Should
  contain \code{server.R}, plus, either \code{ui.R} or a
  \code{www} directory that contains the file
  \code{index.html}. Defaults to the working directory.}

  \item{port}{The TCP port that the application should
  listen on. Defaults to port 8100.}

  \item{launch.browser}{If true, the system's default web
  browser will be launched automatically after the app is
  started. Defaults to true in interactive sessions only.}

  \item{workerId}{Can generally be ignored. Exists to help
  some editions of Shiny Server Pro route requests to the
  correct process.}
}
\description{
  Runs a Shiny application. This function normally does not
  return; interrupt R to stop the application (usually by
  pressing Ctrl+C or Esc).
}
\examples{
\dontrun{
# Start app in the current working directory
runApp()

# Start app in a subdirectory called myapp
runApp("myapp")


# Apps can be run without a server.r and ui.r file
runApp(list(
  ui = bootstrapPage(
    numericInput('n', 'Number of obs', 100),
    plotOutput('plot')
  ),
  server = function(input, output) {
    output$plot <- renderPlot({ hist(runif(input$n)) })
  }
))
}
}


\name{rclipButton}
\alias{rclipButton}
\alias{rclipLink}
\title{Action button or action link to send information to clipboard}
\description{Creates an action button or link that will send user-defined text to the OS clipboard.}
\usage{
rclipButton(inputId, label, clipText, modal = FALSE, tooltip, placement, options, ...)
rclipLink(inputId, label, clipText, modal = FALSE, ...)
}
\arguments{
  \item{inputId}{The \code{input} slot that will be used to access the value.}
  \item{label}{The contents of the button or link--usually a text label, but
  you could also use any other HTML, like an image.}
  \item{clipText}{A single scalar character variable to be sent to the clipboard.}
  \item{modal}{A logical flag indicating whether the button will be shown in a
    modal window (TRUE) or not (NOT).}
  \item{tooltip}{A strip to display in a tooltip (using the \code{bslib} package)}
  \item{placement}{The placement of the tooltip relative to the button}
  \item{options}{List of options for the tooltip}
  \item{...}{Additional arguments (e.g. \code{icon} or \code{width}) passed down 
  to \code{\link[shiny]{actionButton}} or \code{\link[shiny]{actionLink}}. }
}
\references{
https://clipboardjs.com/
}
\seealso{
  \code{\link{rclipboardSetup}}, \code{\link[bslib]{tooltip}}
}
\author{
  Sebastien Bihorel
}
\examples{
## Not run
\dontrun{
library(rclipboard)
library(shiny)

# The UI
ui <- bootstrapPage(
  
  rclipboardSetup(),
  
  # Add a text input
  textInput("copytext", "Copy this:", "Zlika!"),

  # UI ouputs for the copy-to-clipboard buttons
  uiOutput("clip"),
  
  # A text input for testing the clipboard content.
  textInput("paste", "Paste here:")
  
)

# The server
server <- function(input, output) {

  # Add clipboard buttons
  output$clip <- renderUI({
    rclipButton(
      inputId = "clipbtn", 
      label = "rclipButton Copy", 
      clipText = input$copytext, 
      icon = icon("clipboard"),
      tooltip = "Click me to copy the content of the text field to the clipboard!",
      options = list(delay = list(show = 800, hide = 100), trigger = "hover")
    )
  })
  
}

shinyApp(ui = ui, server = server)
}
}

# rclipboard: clipboard.js for R/Shiny Applications

### Introduction
[clipboard.js](https://clipboardjs.com/) is a super light javascript framework,
which provides copy-to-clipboard functionality using HTML5. The simple `rclipboard`
R package is simple and leverages `clipboard.js` functionality to provide a
reactive copy-to-clipboard UI button component, called `rclipButton`, for
[Shiny](http://shiny.rstudio.com/) R applications.

### Example

This example only works when deployed on a Shiny server. If this app is run from
RStudio, the UI displays correctly but the rclipButton UI button is not functional.
A workaround is to also include an observeEvent associated to the rclipButton and
use the clipr function from the clipr package (this function only works when the app
is run locally, eg from RStudio, and not when deployed on a server).


```R
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
    rclipButton("clipbtn", "rclipButton Copy", input$copytext, icon("clipboard"))
  })
  
}

shinyApp(ui = ui, server = server)

```

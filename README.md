# rclipboard: clipboard.js for R/Shiny Applications

### Introduction
[clipboard.js](https://clipboardjs.com/) is a super light javascript framework,
which provides copy-to-clipboard functionality using HTML5. The simple `rclipboard`
R package is simple and leverages `clipboard.js` functionality to provide a
reactive copy-to-clipboard UI button component, called `rclipButton`, for
[Shiny](https://shiny.rstudio.com/) R applications.

### Example

This example works when deployed on a Shiny server or when it is run from
RStudio. However, because of limitations in the web engine of RStudio versions
prior to 1.2, the rclipButton does not work natively when the application is run
locally. A workaround must be implemented in the form of an observeEvent associated
to the rclipButton and using the clipr function from the clipr package.

This workaround is not required if you run your applications in RStudio versions 
\>= 1.2.


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
  
  # Workaround for execution within RStudio version < 1.2
  if (interactive()){
    observeEvent(input$clipbtn, clipr::write_clip(input$copytext))
  }
  
}

shinyApp(ui = ui, server = server)

```

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/rclipboard)](https://CRAN.R-project.org/package=rclipboard)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

# rclipboard: clipboard.js for R/Shiny applications

[clipboard.js](https://clipboardjs.com/) is a super light javascript framework,
which provides copy-to-clipboard functionality using HTML5. The simple `rclipboard`
R package is simple and leverages `clipboard.js` functionality to provide a
reactive copy-to-clipboard UI button component, called `rclipButton`, and a
reactive copy-to-clipboard UI link component, called `rclipLink`, for
[Shiny](https://shiny.posit.co/) R applications.

While `rclipButton` and `rclipLink` will work in applications that use native 
`shiny` UI constructors, the code below illustrates a marginally more complex
example in which a tooltip is displayed when hovering on top of the button thanks
to the use of UI constructors from the `bslib` package.

```R
library(shiny)
library(bslib)
library(rclipboard)

# The UI
ui <- bslib::page_fluid(
  
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
      tooltip = "Click me... I dare you!",
      placement = "top",
      options = list(delay = list(show = 800, hide = 100), trigger = "hover")
    )
  })
  
}

shinyApp(ui = ui, server = server)
```

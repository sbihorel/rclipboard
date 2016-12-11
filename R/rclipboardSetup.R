rclipboardSetup <- function()
{
  tagList(
    singleton(
      tags$head(
        tags$script(
          src = sprintf('%s/clipboard.min.js', 
            system.file('lib', package = "rclipboard")
          )
        )
      )
    )
  )
}

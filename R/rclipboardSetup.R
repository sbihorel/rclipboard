rclipboardSetup <- function()
{
  tagList(
    singleton(
      tags$head(
        tags$script(src = 'rclipboard/clipboard.min.js')
      )
    )
  )
}


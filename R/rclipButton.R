rclipButton <- function(inputId, label, clipText, icon = NULL, width = NULL, modal = FALSE)
{
  tagList(
    actionButton(inputId = inputId,
                 label = label,
                 icon = icon,
                 width = width,
                 `data-clipboard-text` = clipText),
    if (modal){
      tags$script(
        sprintf(
          'new ClipboardJS(".btn", { container: document.getElementById("%s") } ); ',
          inputId
        )
      )
    } else {
      tags$script(
        sprintf(
          'new ClipboardJS(".btn", document.getElementById("%s") );',
          inputId
        )
      )
    }
  )
}
rclipButton <- function(inputId, label, clipText, icon = NULL, width = NULL)
{
  tagList(
    actionButton(inputId = inputId,
                 label = label,
                 icon = icon,
                 width = NULL,
                 `data-clipboard-text` = clipText),
    tags$script(
      sprintf(
        'var client_%s = new ClipboardJS( document.getElementById("%s") );',
        gsub('-', '', inputId),
        inputId
      )
    )
  )
}

rclip <- function(FUN, inputId, label, clipText, ..., modal = FALSE)
{
  if (modal){
    code <- 'new ClipboardJS(".btn", { container: document.getElementById("%s") } ); '
  } else {
    code <- 'new ClipboardJS(".btn", document.getElementById("%s") );'
  }

  tagList(
    FUN(inputId = inputId,
        label = label,
        ...,
        `data-clipboard-text` = clipText),
    tags$script(sprintf(code, inputId))
  )
}

rclipButton <- function(inputId, label, clipText, ..., modal = FALSE)
{
  rclip(actionButton, inputId, label, clipText, ..., modal=modal)
}

rclipLink <- function(inputId, label, clipText, ..., modal = FALSE)
{
  rclip(actionLink, inputId, label, clipText, ..., modal=modal)
}

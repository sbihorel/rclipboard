rclip_fun <- function(FUN = actionButton, inputId, label, clipText, modal = FALSE, ...)
{
  tagList(
    FUN(
      inputId = inputId,
      label = label,
      ...,
      `data-clipboard-text` = clipText
    ),
    tags$script(
      sprintf(
        ifelse(
          modal,
          'new ClipboardJS(".btn", { container: document.getElementById("%s") } ); ',
          'new ClipboardJS(".btn", document.getElementById("%s") );'
        ),
        inputId
      )
    )
  )
}

rclipButton <- function(inputId, label, clipText, modal = FALSE, ...)
{
  rclip_fun(actionButton, inputId, label, clipText, modal = modal, ...)
}

rclipLink <- function(inputId, label, clipText, modal = FALSE, ...)
{
  rclip_fun(actionLink, inputId, label, clipText, modal = modal, ...)
}

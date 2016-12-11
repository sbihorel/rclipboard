rclipButton <- function(inputId, label, clipText, icon = NULL, width = NULL)
{
  tagList(
    rclipboardSetup(),
    # actionButton(inputId = inputId,
    #   label = label,
    #   icon = icon,
    #   width = NULL,
    #   `data-clipboard-text` = clipText),
    tagAppendAttributes(tags$button('Copy to clipboard'),
      `id` = inputId,
      `class` = 'btn',
      `data-clipboard-text` = clipText),
    tags$script(sprintf('var client = new Clipboard( document.getElementById("%s") );', inputId))
  )
}

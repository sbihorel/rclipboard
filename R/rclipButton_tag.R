rclipButton_tag <- function(inputId, label, clipText, icon = NULL, width = NULL)
{
  tagList(
    tagAppendAttributes(
      tags$button(label),
      `id` = inputId,
      `class` = 'btn',
      `data-clipboard-text` = clipText),
    tags$script(sprintf('var client_%s = new Clipboard( document.getElementById("%s") );', inputId, inputId))
  )
}

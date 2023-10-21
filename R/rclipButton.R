rclip_fun <- function(
    FUN = actionButton, 
    inputId, 
    label,
    clipText, 
    tooltip,
    placement,
    options,
    modal = FALSE, 
    ...
) {

  if ( !missing(tooltip) && length(tooltip) > 0 ){
    shiny::validate( 
      shiny::need( is.character(tooltip), message = 'tooltip must be a character string' )
    )
    if ( !missing(placement) && length(placement) > 0){
      shiny::validate( 
        shiny::need( is.character(placement), message = 'placement must be a character string' )
      )
    } else {
      placement <- 'auto'
    }
    if ( !missing(options) && length(options) > 0){
      shiny::validate( 
        shiny::need( is.list(options), message = 'options must be a list')
      )
    } else {
      options <- list()
    }
    btn <- bslib::tooltip(
      FUN(
        inputId = inputId,
        label = label,
        ...,
        `data-clipboard-text` = clipText
      ),
      tooltip[1],
      placement = placement[1],
      options = options
    )
  } else {
    btn <- FUN(
      inputId = inputId,
      label = label,
      ...,
      `data-clipboard-text` = clipText
    )
  }
  tagList(
    btn,
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

rclipButton <- function(
    inputId, 
    label, 
    clipText, 
    modal = FALSE,
    tooltip,
    placement,
    options,
    ...
  ){
  rclip_fun(actionButton, inputId, label, clipText, modal = modal, 
            tooltip = tooltip, placement = placement, options = options,...)
}

rclipLink <- function(inputId, label, clipText, modal = FALSE, ...)
{
  rclip_fun(actionLink, inputId, label, clipText, modal = modal, ...)
}

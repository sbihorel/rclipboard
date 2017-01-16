\name{rclipboardSetup}
\alias{rclipboardSetup}
\title{Include clipboard.js}
\description{
This will include the clipboard.js in the head tag.
}
\usage{
  rclipboardSetup()
}
\details{
Inclusion of clipboard.js will do so only once, since the code is wrapped inside
a \code{\link[shiny]{singleton}} call. 

rclipboardSetup() must be called in the ui function of the Shiny app before a 
\code{\link{rclipButton}} is created (typically in the server function)
}
\value{
A \code{shiny::tagList}
}
\references{
https://clipboardjs.com/
}
\seealso{
  \code{\link{rclipButton}}
}
\author{
  Sebastien Bihorel
}
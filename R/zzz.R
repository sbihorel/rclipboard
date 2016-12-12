.onLoad <- function(libname, pkgname)
{
  shiny::addResourcePath('rclipboard', system.file('lib', package = .packageName))
}

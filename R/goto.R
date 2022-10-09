#' goto
#'
#' call `goto(label)` and it'll move you to `(label)`
#'
#' @param label label of the goto
#'
#' @return called for side effects
#' @export
#' @examples
#' foo <- function() {
#'   print("a")
#'   goto("my label")
#'   print("b")
#'   ("my label")
#'   print("c")
#' }
#' foo()
goto <- function(label) {
  execution_env <- parent.frame()
  fun <- sys.function(-1)
  original_parent <- environment(fun)
  mask_env <- new.env(parent = original_parent)
  parent.env(execution_env) <- mask_env
  vars <- all.names(body(fun))
  vars <- setNames(replicate(length(vars), function(...) invisible()), vars)
  list2env(vars, mask_env)
  mask_env$`(` <- function(lab) {
    if (length(substitute(lab)) != 1 || lab != label) return(invisible())
    parent.env(execution_env) <- original_parent
    invisible()
  }
}




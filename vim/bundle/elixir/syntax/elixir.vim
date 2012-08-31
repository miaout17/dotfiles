if exists("b:current_syntax")
  finish
endif

" should refactor the keywords into different categories
" syn keyword elixirDefine module object def end
syn keyword elixirDefine Erlang _ end do module object def true false case match if elsif else unless then and andalso or orelse not for in inlist inbin

syn region elixirString start="\"" end="\""
syn match elixirComment "%.*"

hi def link elixirDefine Define
hi def link elixirComment Comment
hi def link elixirString String

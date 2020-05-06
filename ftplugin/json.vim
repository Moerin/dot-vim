setlocal foldmethod=syntax
setlocal nofoldenable

" format JSON {{{
command! FormatJSON %!python -m json.tool


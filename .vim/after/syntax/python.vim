syn include @pythonRst syntax/rst.vim 
" WORKS
" syn region pythonDocstring  start=+^\s*'''+ end=+'''+ contains=@pythonRst
syn region pythonDocstring start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend fold excludenl contains=@pythonRst

" Experiments

" syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=@pythonRst
" syn region pythonDocstring matchgroup=pythonString start=+[uU]\=\z('''\|"""\)+ end="\z1" contains=@pythonRst keepend fold containedin=pythonString


" Scala {{{3
let g:tagbar_type_scala = {}
let g:tagbar_type_scala.ctagstype = 'scala'
let g:tagbar_type_scala.kinds     = [
  \ 'p:packages:1',
  \ 'V:values:1',
  \ 'v:variables:1',
  \ 'T:types:0',
  \ 't:traits:0',
  \ 'o:objects:0',
  \ 'a:aclasses:0',
  \ 'c:classes:0',
  \ 'r:cclasses:0',
  \ 'm:methods:0'
\ ]
let g:tagbar_type_scala.sro        = '.'
let g:tagbar_type_scala.kind2scope = {
  \ 'T' : 'type',
  \ 't' : 'trait',
  \ 'o' : 'object',
  \ 'a' : 'abstract class',
  \ 'c' : 'class',
  \ 'r' : 'case class'
\ }
let g:tagbar_type_scala.scope2kind = {
  \ 'type'           : 'T',
  \ 'trait'          : 't',
  \ 'object'         : 'o',
  \ 'abstract class' : 'a',
  \ 'class'          : 'c',
  \ 'case class'     : 'r'
\ }
"let s:known_types.scala = type_scala

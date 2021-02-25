" Vim syntax file
" Language:     HTML
" Author:       Rinz
" Create Time:  2020 Dec 20

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'html'
elseif exists('b:current_syntax') && b:current_syntax == 'html'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
" ========================================================================= "
if main_syntax == "html"
syn match   htmlError       "[<>&]"
endif
syn cluster htmlTagContent  contains=htmlTagName,htmlGlobalAttr
syn cluster htmlTagContent  add=htmlString,htmlOperator,htmlGlobalAttr
syn cluster htmlTagContent  add=htmlStyle,htmlCssStr,htmlEvent,htmlJsStr,htmlScriptStr
syn region  htmlTag         matchgroup=htmlParen start="<" end="/\=>" contains=@htmlTagContent
syn region  htmlEndTag      start="</" end=">" keepend contains=@htmlTagName

syn match   htmlTagName     contained "\%(\<\)\@<=\%(html\|body\|h[1-6]\|p\|br\|hr\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(abbr\|address\|b\|bdi\|bdo\|blockquote\|cite\|code\|del\|dfn\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(em\|i\|ins\|kbd\|mark\|meter\|pre\|progerss\|q\|rp\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(rt\|ruby\|s\|samp\|small\|strong\|sub\|sup\|time\|u\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(var\|wbr\|form\|input\|textarea\|button\|select\|optgroup\|option\|label\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(fieldset\|legend\|datalist\|keygen\|output\|iframe\|img\|map\|area\|canvas\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(figcaption\|figure\|audio\|source\|track\|video\|a\|link\|main\|nav\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(ul\|ol\|li\|dl\|dt\|dd\|menu\|command\|table\|caption\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(th\|tr\|td\|thead\|tbody\|tfoot\|col\|colgroup\|div\|span\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(header\|footer\|section\|article\|aside\|details\|dialog\|summary\|head\|meta\)\%(\>\)\@="
syn match   htmlTagName     contained "\%(\<\)\@<=\%(base\|embed\|object\|param\|font\|strike\|center\|big\)\%(\>\)\@="

syn match   htmlGlobalAttr  contained "\%(\<\)\@<=\%(accesskey\|class\|contenteditable\|contextmenu\|data-[\w-]\+\)\%(=\)\@="
syn match   htmlGlobalAttr  contained "\%(\<\)\@<=\%(dir\|draggable\|dropzone\|hidden\|id\)\%(=\)\@="
syn match   htmlGlobalAttr  contained "\%(\<\)\@<=\%(lang\|spellcheck\|tabindex\|title\|translate\)\%(=\)\@="

syn match   htmlOperator    "\%(\w\)\@<==\%([\'\"\w]\)\@=" contained
syn region  htmlString      start=/"/ end=/"/ contained
syn region  htmlString      start=/'/ end=/'/ contained

syn region  htmlComment     start="<!--" end="-->" contains=@Spell
syn match   htmlFlieType    "<!DOCTYPE\s\+\w\+\s*>"
syn match   htmlBasicTag    "</\=\%(html\|head\|body\)>"
syn match   htmlScriptTag   "</\=\%(script\|noscript\|style\)>"
syn match   htmlSimpleTag   "<\%(title\|h[1-6]\|p\|br\|hr\|th\|tr\|td\)\%(\s*/\)\=>"
syn match   htmlSimpleTag   "<\%(b\|del\|em\|i\|s\|small\|strong\|sub\|sup\|u\)\%(\s*/\)\=>"
syn match   htmlSimpleTag   "<\%(ol\|ul\|dl\|li\|dd\|dt\)\%(\s*/\)\=>"

syn region  htmlTitle       matchgroup=htmlSimpleTag start="<title>" end="</title>"me=e-8
syn region  htmlHead1       matchgroup=htmlSimpleTag start="<h1>" end="</h1>"me=e-5
syn region  htmlHead2       matchgroup=htmlSimpleTag start="<h2>" end="</h2>"me=e-5
syn region  htmlHead3       matchgroup=htmlSimpleTag start="<h3>" end="</h3>"me=e-5
syn region  htmlHead4       matchgroup=htmlSimpleTag start="<h4>" end="</h4>"me=e-5
syn region  htmlHead5       matchgroup=htmlSimpleTag start="<h5>" end="</h5>"me=e-5
syn region  htmlHead6       matchgroup=htmlSimpleTag start="<h6>" end="</h6>"me=e-5

syn include @CSS $VIMHOME/syntax/css.vim
syn match   htmlStyle       contained nextgroup=htmlCssStr /\%(\s\|^\)\@<=style=\%(['"]\)\@=/
syn region  htmlCssStr      matchgroup=htmlScriptStr start=/\%(style=\)\@<="/ end=/"/ contained contains=@CSS
syn region  htmlCssStr      matchgroup=htmlScriptStr start=/\%(style=\)\@<='/ end=/'/ contained contains=@CSS
syn region  htmlCSS         matchgroup=htmlScriptTag start="<style[^>]*>" keepend end="</style>"me=s-1 contains=@CSS

syn include @JavaScript $VIMHOME/syntax/javascript.vim
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(onatferprint\|onbeforeprint\|onbeforeonload\|onblur\|onerror\|onfocus\|onhashchange\|onload\|onmessage\|onoffline\)=\%(['"]\)\@=/
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(ononline\|onpageshow\|onpopstate\|onredo\|onresize\|onstorage\|onundo\|onnuload\|onchange\|oncontextmenu\)=\%(['"]\)\@=/
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(onfocus\|onformchange\|onforminput\|oninput\|oninvalid\|onreset\|onselect\|onsubmit\|onkeydown\|onkeypress\)=\%(['"]\)\@=/
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(onkeyup\|onclick\|ondrag\|ondragenter\|ondragleave\|ondragover\|ondragstart\|ondrop\|ononmousedown\|ononmousemove\)=\%(['"]\)\@=/
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(onmouseout\|onmouseover\|onmouseup\|onmousewheel\|onscroll\|onabort\|oncanplay\|oncanplaythrough\|ondurationchange\|onemptied\)=\%(['"]\)\@=/
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(onended\|onloadeddata\|onloadedmetadata\|onloadstart\|onpause\|onplay\|onplaying\|onprogress\|onratechange\|onreadystatechange\)=\%(['"]\)\@=/
syn match   htmlEvent       contained nextgroup=htmlJsStr /\%(\s\)\@<=\%(onseeked\|onseeking\|onstalled\|onsuspend\|ontimeupdata\|onvolumechange\|onwaiting\|onshow\|ontoggle\)=\%(['"]\)\@=/
syn region  htmlJsStr       matchgroup=htmlScriptStr start=/\%(\son\w\+=\)\@<="/ end=/"/ contained contains=@JavaScript
syn region  htmlJsStr       matchgroup=htmlScriptStr start=/\%(\son\w\+=\)\@<='/ end=/'/ contained contains=@JavaScript
syn region  htmlJavaScript  matchgroup=htmlScriptTag start="<script[^>]*>" keepend end="</script>"me=s-1 contains=@JavaScript


hi def link htmlScriptStr   Tag
hi def link htmlStyle       Variable
" ========================================================================= "
hi def link htmlError       Error
hi def link htmlNumber      Number
hi def link htmlTagName     Keyword
hi def link htmlGlobalAttr  Type
hi def link htmlOperator    Operator
hi def link htmlString      String
hi def link htmlEvent       Variable
hi def link htmlTag         Tag
hi def link htmlEndTag      SpecialTag
hi def link htmlParen       Tag
hi def link htmlSimpleTag   Tag
hi def link htmlComment     Comment
hi def link htmlFlieType    Comment
hi def link htmlBasicTag    Statement
hi def link htmlScriptTag   Attribute

hi def link htmlTitle       Title
hi def link htmlHead1       RedBold
hi def link htmlHead2       PurpleBold
hi def link htmlHead3       BlueBold
hi def link htmlHead4       SpecialBold
hi def link htmlHead5       Special
hi def link htmlHead6       SpecialItalic

let b:current_syntax = "html"
if main_syntax == 'html'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

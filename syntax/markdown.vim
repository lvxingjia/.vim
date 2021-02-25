" Vim syntax file
" Language:     Markdown
" Author:       Rinz
" Create Time:  2020 Dec 03

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'markdown'
elseif exists('b:current_syntax') && b:current_syntax == 'markdown'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
" source $VIMHOME/syntax/html.vim
syn include @Tex $VIMHOME/syntax/tex.vim
syn region  mkdTex  matchgroup=mkdMath start="\$\$" keepend end="\$\$" contains=@Tex
syn include @Mer $VIMHOME/syntax/mermaid.vim
syn region  mkdMer  matchgroup=mkdLanguage start="^```mermaid" keepend end="^```" contains=@Mer
syn include @UML $VIMHOME/syntax/UML.vim
syn region  mkdUML  matchgroup=mkdLanguage start="^```sequence" keepend end="^```" contains=@UML

" ========================================================================= "

syn match   mkdDelimiter    "^#\+"
syn match   mkdDelimiter    "\[\^\=\%(.\+\]\)\@="
syn match   mkdDelimiter    "\%(\[\^\=.\+\)\@<=\]"
syn match   mkdDelimiter    "\%(]\s*\)\@<=(\%(.*)\)\@="
syn match   mkdDelimiter    "\%(]\s*(.*\)\@<=)"
syn match   mkdHeadline     "^===\+$"
syn match   mkdDivisionline "^---\+$"
syn match   mkdHead1        "\%(^#\)\@<=.*$"
syn match   mkdHead2        "\%(^##\)\@<=.*$"
syn match   mkdHead3        "\%(^###\)\@<=.*$"
syn match   mkdHead4        "\%(^####\)\@<=.*$"
syn match   mkdHead5        "\%(^#####\)\@<=.*$"
syn match   mkdHead6        "\%(^######\)\@<=.*$"
syn match   mkdItalic       "\%(\*\)\@<!\*[^\*]*\*\%(\*\)\@!"
syn match   mkdItalic       "\%(_\)\@<!_[^_]*_\%(_\)\@!"
syn match   mkdBold         "\%(\*\)\@<!\*\*[^\*]*\*\*\%(\*\)\@!"
syn match   mkdBold         "\%(_\)\@<!__[^_]*__\%(_\)\@!"
syn match   mkdBoldItalic   "\%(\*\)\@<!\*\*\*[^\*]*\*\*\*\%(\*\)\@!"
syn match   mkdBoldItalic   "\%(_\)\@<!___[^_]*___\%(_\)\@!"
syn match   mkdUnderline    "<u>.*</u>"
syn match   mkdDeleteline   "\~\~.*\~\~"
syn match   mkdDeleteline   "<del>.*</del>"
syn match   mkdShadow       "`[^`]\+`"
syn match   mkdKeyboard     "<kbd>.*</kbd>"
syn match   mkdList         "\%(^\%(\s*>\)*\)\@<=\s*\%(+\|-\|\*\|\d\+\s*\.\)\s\%(\s*$\)\@!"
syn match   mkdListFirst    "\%(^\%(+\|-\|\*\|\d\+\s*\.\)\s\+\)\@<=.\+$"
syn match   mkdListSecond   "\%(^\%(\s\s\s\s\|\s\s\|\t\)\%(+\|-\|\*\|\d\+\s*\.\)\s\+\)\@<=.\+$"
syn match   mkdListThird    "\%(^\%(\s\s\s\s\s\s\s\s\|\t\t\)\%(+\|-\|\*\|\d\+\s*\.\)\s\+\)\@<=.\+$"
syn match   mkdBlock        "^\s*>\%(\s*>\)*"
syn match   mkdSeparatorbar "^\s*\*\s*\*\s*\*\s*\%(\*\s*\)*$"
syn match   mkdSeparatorbar "^\s*-\s*-\s*-\s*\%(-\s*\)*$"
syn match   mkdSeparatorbar "^\s*_\s*_\s*_\s*\%(_\s*\)*$"
syn match   mkdFootnote     "\%(\[\^\)\@<=.\+\%(\]\)\@="
syn match   mkdFootnotetext "\%(\[\^.\+\]\s*:\)\@<=.*$"
syn match   mkdLink         "\%(!\)\@<!\[\]"
syn match   mkdLinkname     "\%(\!\)\@<!\%(\[\)\@<=.\+\%(\]\)\@="
syn match   mkdAddress      "\%(]\s*(\)\@<=[^\s\"]\+\%(\%(\s\+\".*\"\)\=)\)\@="
syn match   mkdImage        "!\%(\s*\[\)\@="
syn match   mkdImage        "!\[\]"
syn match   mkdImagetitle   "\%(]\s*([^\s\"]\+\s\+\)\@<=\".*\"\%()\)\@="
syn match   mkdCheckBox     "\%(^\s*-\s\+\)\@<=\[\%(\s\|x\)\]"
syn match   mkdTOC          "\[TOC\]"
syn match   mkdTable        "|"
syn match   mkdTable        "\%(|\s*\)\@<=\%(:\)\=----*\%(:\)\=\%(\s*|\)\@="
syn match   mkdNewline      "\%(^.\+\)\@<=\s\s$"

" ========================================================================= "
syn include @SCHEME $VIMHOME/syntax/scheme.vim
syn region  mkdSCHEME  matchgroup=mkdLanguage start="^```scheme" keepend end="^```" contains=@SCHEME
syn include @C $VIMHOME/syntax/c.vim
syn region  mkdC  matchgroup=mkdLanguage start="^```c" keepend end="^```" contains=@C
syn include @MAKE $VIMHOME/syntax/make.vim
syn region  mkdMAKE  matchgroup=mkdLanguage start="^```make" keepend end="^```" contains=@MAKE
syn include @HTML $VIMHOME/syntax/html.vim
syn region  mkdHTML  matchgroup=mkdLanguage start="^```html" keepend end="^```" contains=@HTML
syn include @CSS $VIMHOME/syntax/css.vim
syn region  mkdCSS  matchgroup=mkdLanguage start="^```css" keepend end="^```" contains=@CSS
syn include @JS $VIMHOME/syntax/javascript.vim
syn region  mkdJS  matchgroup=mkdLanguage start="^```javascript" keepend end="^```" contains=@JS
" ========================================================================= "
hi def link mkdDelimiter    NormalIgnore
hi def link mkdHeadline     Red
hi def link mkdDivisionline NormalIgnore
hi def link mkdHead1        RedBold
hi def link mkdHead2        PurpleBold
hi def link mkdHead3        BlueBold
hi def link mkdHead4        SpecialBold
hi def link mkdHead5        Special
hi def link mkdHead6        SpecialItalic
hi def link mkdItalic       NormalItalic
hi def link mkdBold         NormalBold
hi def link mkdBoldItalic   NormalBoldItalic
hi def link mkdUnderline    NormalUnderline
hi def link mkdDeleteline   NormalIgnore
hi def link mkdShadow       NormalNote
hi def link mkdKeyboard     NormalKeyboard
hi def link mkdList         PurpleBold
hi def link mkdListFirst    Tag
hi def link mkdListSecond   Special
hi def link mkdListThird    SpecialItalic
hi def link mkdBlock        OrangeBold
hi def link mkdSeparatorbar NormalIgnore
hi def link mkdFootnote     NormalNote
hi def link mkdFootnotetext NormalItalic
hi def link mkdLink         Blue
hi def link mkdLinkname     Blue
hi def link mkdAddress      BlueItaUnder
hi def link mkdCheckBox     NormalIgnore
hi def link mkdTOC          BlueBold
hi def link mkdImage        Magenta
hi def link mkdImagetitle   Magenta
hi def link mkdTable        NormalIgnore
hi def link mkdLanguage     Special
hi def link mkdLanguageName SpecialKey
hi def link mkdMath         Attribute

" ========================================================================= "
let b:current_syntax = 'markdown'
if main_syntax == 'markdown'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

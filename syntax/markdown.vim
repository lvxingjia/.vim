" Vim syntax file
" Language:     Markdown
" Maintainer:   Rinz <voidrinz@foxmail.com>
" Filenames:    *.markdown
" Last Change:  2020 Dec 03

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

" ========================================================================= "

syn match   mkdDelimiter    "^#\+"
syn match   mkdDelimiter    "\[\^\=\%(.\+\]\)\@="
syn match   mkdDelimiter    "\%(\[\^\=.\+\)\@<=\]"
syn match   mkdDelimiter    "\%(]\s*\)\@<=(\%(.*)\)\@="
syn match   mkdDelimiter    "\%(]\s*(.*\)\@<=)"
syn match   mkdHeadline     "^=\+$"
syn match   mkdHead1        "\%(^#\)\@<=.*$"
syn match   mkdHead2        "\%(^##\)\@<=.*$"
syn match   mkdHead3        "\%(^###\)\@<=.*$"
syn match   mkdHead4        "\%(^####\)\@<=.*$"
syn match   mkdHead5        "\%(^#####\)\@<=.*$"
syn match   mkdHead6        "\%(^######\)\@<=.*$"
syn match   mkdItalic       "\%(\*\)\@<!\*[^\*]*\*\%(\*\)\@!"
syn match   mkdBold         "\%(\*\)\@<!\*\*.*\*\*\%(\*\)\@!"
syn match   mkdBoldItalic   "\%(\*\)\@<!\*\*\*.*\*\*\*\%(\*\)\@!"
syn match   mkdUnderline    "<u>.*</u>"
syn match   mkdUnderline    "_.*[^_]\+.*_"
syn match   mkdDeleteline   "\~\~.*\~\~"
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
syn match   mkdLinkname     "\%(\!\)\@<!\%(\[\)\@<=.\+\%(\]\)\@="
syn match   mkdAddress      "\%(]\s*(\)\@<=[^\s\"]\+\%(\%(\s\+\".*\"\)\=)\)\@="
syn match   mkdImage        "!\%(\s*\[\)\@="
syn match   mkdImagetitle   "\%(]\s*([^\s\"]\+\s\+\)\@<=\".*\"\%()\)\@="
syn match   mkdTable        "|"
syn match   mkdTable        "\%(|\s*\)\@<=\%(:\)\=----*\%(:\)\=\%(\s*|\)\@="
syn match   mkdNewline      "\%(^.\+\)\@<=\s\s$"

" ========================================================================= "
syn include @C $VIMHOME/syntax/c.vim
syn region  mkdC  matchgroup=mkdLanguage start="^```c" keepend end="^```" contains=@C
" ========================================================================= "
" syn include @Clang $VIMHOME/syntax/c.vim
" syn region  mkdC  start="^```c" keepend end="^```"me=s-1 contains=Clang
" ========================================================================= "
hi def link mkdDelimiter    NormalIgnore
hi def link mkdHeadline     Comment
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
hi def link mkdList         PurpleBold
hi def link mkdListFirst    Tag
hi def link mkdListSecond   Special
hi def link mkdListThird    SpecialItalic
hi def link mkdBlock        OrangeBold
hi def link mkdSeparatorbar NormalIgnore
hi def link mkdFootnote     NormalNote
hi def link mkdFootnotetext NormalItalic
hi def link mkdLinkname     NormalBold
hi def link mkdAddress      BlueUnderlined
hi def link mkdImage        Constant
hi def link mkdImagetitle   Constant
hi def link mkdTable        NormalIgnore
hi def link mkdLanguage Special
hi def link mkdLanguageName SpecialKey

" ========================================================================= "
let b:current_syntax = 'markdown'
if main_syntax == 'markdown'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

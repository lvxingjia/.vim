" Vim syntax file
" Language:     Text
" Maintainer:   Rinz <voidrinz@foxmail.com>
" Filenames:    *.txt
" Last Change:  2020 Dec 03

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'text'
elseif exists('b:current_syntax') && b:current_syntax == 'text'
  finish
endif
" source $VIMHOME/syntax/html.vim

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn match   textNumber      /\%(-\)\=\d\+\%(\.\%(\d\)\+\)\=/
syn match   textQuantifier  /\%(\d\)\@<=\%(个\|种\|类\|人\|万人\|次\|人次\|万次\)/
syn match   textQuantifier  /\%(\d\)\@<=\%(天\|小时\|分\|分钟\|秒\|秒钟\)/
syn match   textQuantifier  /\%(\d\)\@<=\%(件\|起\|只\|头\|条\|尾\|栋\|幢\|间\|层\|辆\|张\|栏\|家\)/
syn match   textQuantifier  /\%(\d\)\@<=\%(元\|万元\|亿元\|美元\|万美元\|亿美元\)/
syn match   textPercent     /%/
syn match   textPercent     /[一二三四五六七八九十]分之[一二三四五六七八九十]/
syn match   textPercent     /[一二三四五六七八九十半1-9]成/
syn match   textSerial      /\%(第\|其\)[一二三四五六七八九十1-9]，/
syn match   textSerial      /[一二三四五六七八九十]是/
syn match   textSerial      /首先\|其次\|再次\|最后/
syn match   textStatement   /\%(，\|。\)\@<=\%(但是\|然而\|而且\|并且\|且\|其实\|实际上\|事实上\|同时\)\%(，\)\=/
syn match   textStatement   /\%(，\|。\)\@<=\%(因此\|所以\|然后\|总之\|综上\|综上所述\)\%(，\)\=/
syn match   textStatement   /\%(，\|。\)\@<=而\%(且\)\@!/
syn match   textStatement   /\%(，\|。\)\@<=但\%(是\)\@!/
syn match   textString      /\'[^']*\'/
syn match   textEmphasize   /“[^“”]*”/
syn match   textBookname    /《[^《》]*》/
syn match   textYearnumber  /〔\d\+〕\%(\d\+号\)\=/
syn match   textSpecialname /「[^「」]\+」/
syn match   textDate        /“十[一二三四五六七八九十]五”/
syn match   textDate        /\d\+\%(年\|月\|日\)/

syn match   textName        /^\S\+\%(：\|:\)\%(\s*$\|“\)\@=/
syn match   textQuestion    /\%(^\s*\|。\)\@<=[^。“”《》]*？/
syn match   textExclamation /\%(^\s*\|。\)\@<=[^。“”《》]*！/

syn match   textTitle1      /\%1l.*/
syn match   textTitle2      /^\s*[一二三四五六七八九十]\+、.*$/
syn match   textTitle3      /^\s*（[一二三四五六七八九十]\+）.*$/
syn match   textTitle4      /^\s*\d\+\..*$/
syn match   textTitle5      /^\s*（\d\+）[^。:]*/
syn match   textTitle5      /^\s*(\d\+)[^。:]*/
syn match   textTitle6      /^\s*[①②③④⑤⑥⑦⑧⑨⑩][^。:]*/

hi def link textTitle1      RedBold
hi def link textTitle2      BlueBold
hi def link textTitle3      Tag
hi def link textTitle4      SpecialBold
hi def link textTitle5      Special
hi def link textTitle6      SpecialItalic
hi def link textNumber      Number
hi def link textQuantifier  Number
hi def link textPercent     Number
hi def link textSerial      Constant
hi def link textStatement   Statement
hi def link textDate        Function
hi def link textString      String
hi def link textEmphasize   SpecialBold
hi def link textBookname    PurpleBold
hi def link textYearnumber  Special
hi def link textSpecialname GreenBold
hi def link textName        Constant
hi def link textQuestion    Comment
hi def link textExclamation Statement

" ========================================================================= "
syn match   textVimcmd       "\%(vim\|vi\|ex\)\s*:.*$" contained
syn match   textComment       "#.*$" contains=textVimcmd
hi def link textVimcmd      SpecialComment
hi def link textComment     Comment
" ========================================================================= "
let b:current_syntax = 'text'
if main_syntax == 'text'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

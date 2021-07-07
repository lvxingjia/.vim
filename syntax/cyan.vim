" Vim syntax file
" Language:     Cyan
" Author:       Rinz
" Create Time:  2021 Jul 4

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'cyan'
elseif exists('b:current_syntax') && b:current_syntax == 'cyan'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
source $VIMHOME/syntax/c.vim

" ========================================================================= "
syn keyword cyanType        var vector scalar
syn keyword cyanClass       String Hash
hi def link cyanType        Type
hi def link cyanClass       Class

let b:current_syntax = 'cyan'
if main_syntax == 'cyan'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
finish

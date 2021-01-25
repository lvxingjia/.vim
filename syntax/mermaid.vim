" Vim syntax file
" Language:     Mermaid
" Maintainer:   Rinz <voidrinz@foxmail.com>
" Filenames:    *.mer
" Last Change:  2021 Jan 21

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'mermaid'
elseif exists('b:current_syntax') && b:current_syntax == 'mermaid'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
" ========================================================================= "
syn keyword merStatement    graph subgraph sequenceDiagram
syn keyword merRepeat       loop end alt else opt
syn keyword merType         TB BT RL LR
syn match   merId           "\<\w\+\%(\[\|(\|>\|{\)\@="
syn match   merLine         "\%(>\|-\|--\w\+--\|==\|==\w\+==\|-\.-\|-.\w\+.-\|-x\)"
" ========================================================================= "

hi def link merStatement    Statement
hi def link merRepeat       Repeat
hi def link merType         Contant
hi def link merId           Tag
hi def link merLine         Special
" ========================================================================= "
let b:current_syntax = 'mermaid'
if main_syntax == 'mermaid'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" Vim syntax file
" Language:     UML
" Maintainer:   Rinz <voidrinz@foxmail.com>
" Filenames:    *.uml
" Last Change:  2021 Jan 21

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'UML'
elseif exists('b:current_syntax') && b:current_syntax == 'UML'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
source $VIMHOME/syntax/mermaid.vim
" ========================================================================= "
" syn keyword merStatement    graph subgraph sequenceDiagram
" ========================================================================= "
" hi def link merStatement    Statement
" ========================================================================= "
let b:current_syntax = 'UML'
if main_syntax == 'UML'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

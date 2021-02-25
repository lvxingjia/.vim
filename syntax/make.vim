" Vim syntax file
" Language:     Makefile
" Author:       Rinz
" Create Time:  2021 Feb 19

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'make'
elseif exists('b:current_syntax') && b:current_syntax == 'make'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" ========================================================================= "
syn match   makeIdentifier  "\w\+"
syn match   makeTarget      "^[^:=]*:"
syn match   makeSpecTarget  "\.\%(SUFFIXES\|PHONY\|DEFAULT\|PRECIOUS\|IGNORE\|SILENT\|EXPORT_ALL_VARIABLES\|KEEP_STATE\|LIBPATTERNS\|NOTPARALLEL\|DELETE_ON_ERROR\|INTERMEDIATE\|POSIX\|SECONDARY\):"
syn match   makeCommand     "\%(^\t\+\|;\s*\)\@<=\%(-\)\=\w\+\%(\s\+-\w\+\)\=\%(\s\)\@="

syn match   makeFunction    "\$(.\+)"
syn match   makeVariable    "\%(^\%(\s*override\|export\|unexport\|[^:=]\+:\)\=\s*\)\@<=\w\+\%(\s*\%(=\|:=\)\)\@="
syn match   makeVariable    "\$(\w\+)"
syn match   makeFunction    "\$(\w\+\s\+a)"
syn match   makeOperator    ":\|=\|+=\|-="

syn match   makeEnvVars     "\<\%(MAKEFILES\|VPATH\)\>"
syn match   makeArgVars     "\<\%(ARFLAGS\|CFLAGS\|CXXFLAGS\)\>"
syn match   makeAutoVars    "\$\%(@\|%\|<\|?\|\^\|+\|\*\)"
syn match   makeInclude     "^\s*include\>"
syn match   makeIncluded    "\%(^\s*include\s\)\@<=.*$"
syn match   makeVpath       "^\s*vpath\>"
syn match   makePattern     "\%(^\s*vpath\s\+\)\@<=%\%(\.\w\+\)"
syn match   makeExport      "^\s*\%(export\|unexport\)\>"
syn match   makeOverride    "^\s*\%(override\)\>"


syn keyword makeDefine      define endef
syn keyword makeConditional ifeq ifneq ifdef ifndef else endif

syn match   makeComment     "\%(\\\)\@<!#.*$"
" ========================================================================= "
hi def link makeComment     Comment
hi def link makeLabel       Label
hi def link makeTarget      Label
hi def link makeCommand     Function
hi def link makeVariable    Tag
hi def link makeFunction    Function
hi def link makeOperator    Operator
hi def link makeSpecTarget  Statement
hi def link makeInclude     Include
hi def link makeIncluded    String
hi def link makePreCondit   Statement
hi def link makeVpath       Statement
hi def link makePattern     String
hi def link makeExport      Statement
hi def link makeOverride    Statement


" ========================================================================= "
let b:current_syntax = 'make'
if main_syntax == 'make'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

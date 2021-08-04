" Vim syntax file
" Language:     C
" Author:       Rinz
" Create Time:  2021 Mar 30

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'C'
elseif exists('b:current_syntax') && b:current_syntax == 'C'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
source $VIMHOME/syntax/ansic.vim
syn keyword cStorageClass   _Thread_local
syn keyword cSpecifier      restrict inline __attribute__
syn keyword cSpecifier      _Alignas _Atomic _Noreturn
syn keyword cOperator       _Alignof _Generic _Static_assert
syn keyword cBoolean        true false
syn keyword cMacro          __GNUC__ __STDC__ __func__
syn keyword cLibType        _Bool _Complex complex _Imaginary imaginary
hi def link cBoolean        Boolean

" ========================================================================= "
syn match   cIdentifier     "\u[0-9A-Za-z]\+_\l\w*\>"
syn match   cStructure      "\<\u[0-9A-Za-z]\+_\u\w\+\>"
syn match   cConstant       "\<\u[0-9A-Za-z]\+_\u[0-9A-Z_]\+\>"
syn match   cAdtType        "\<\u[0-9A-Za-z]\+_\u\>\|\**\<\%(\l\=_\)\=\u\>"
syn match   cAdtType        "\<\%(\u[0-9A-Za-z]\+_\)\=\w\+_[Tt]\>"
syn match   cMacro          "^__\w\+\>"
syn match   cMacro          "\<\u\u_\w\+\>"
syn keyword cSelfPtr        me ref this self
syn match   cSelfPtr        "\%(\<vptr->\w\+(\)\@<=\w\+"
syn keyword cVTable         vptr vtbl
syn match   cVTable         "\%(\.\|->\)vptr->"
hi def link cIdentifier     Identifier
hi def link cAdtType        Special
hi def link cSelfPtr        SelfRef
hi def link cVTable         Special

let b:current_syntax = 'C'
if main_syntax == 'C'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
finish

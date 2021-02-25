" Vim syntax file
" Language:     C++
" Author:       Rinz
" Create Time:  2020 Sep 9

if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'cpp'
elseif exists('b:current_syntax') && b:current_syntax == 'cpp'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim
source $VIMHOME/syntax/c.vim
let s:ft = matchstr(&ft, '^\([^.]\)\+')

" ========================================================================= "
syn keyword cppStatement    new delete this friend using
syn keyword cppAccess       public protected private
syn keyword cppModifier     inline virtual explicit export
syn keyword cppType         bool wchar_t
syn keyword cppExceptions   throw try catch
syn keyword cppOperator     operator typeid
syn keyword cppOperator     and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match   cppCast         "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match   cppCast         "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass mutable
syn keyword cppStructure    class typename template namespace
syn keyword cppBoolean      true false
syn keyword cppConstant     __cplusplus

" C++ 11 extensions
syn keyword cppModifier     override final
syn keyword cppType         nullptr_t auto
syn keyword cppExceptions   noexcept
syn keyword cppStorageClass constexpr decltype thread_local
syn keyword cppConstant     nullptr
syn keyword cppConstant     ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
syn keyword cppConstant     ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
syn keyword cppConstant     ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
syn keyword cppConstant     ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
syn keyword cppConstant     ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
syn keyword cppConstant     ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
syn region  cppRawString    matchgroup=cppDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell

" C++ 14 extensions
syn case  ignore
syn match cppNumbe          display "\<0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
syn match cppNumber         display "\<[1-9]\('\=\d\+\)*\(u\=l\{0,2}\|ll\=u\)\>" contains=cFloat
syn match cppNumber         display "\<0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
syn case  match

" C++ 14 extensions
syn keyword cppCoroutines   co_wait co_return co_yield co_await
syn keyword cppImport       import module
syn keyword cppConcepts     concept
syn match   cppOperator     "<=>"
" GNU C++
syn match cppMinMax         "[<>]?"

" ========================================================================= "
" iostream
syn match   cppNamespaceOpr "::"
syn match   cppSTD          "\%(\<\)\@<=\%(std::\)\=\%(cout\|cin\|cerr\|clog\|endl\)"
hi def link cppSTD          Builtin

" ========================================================================= "
hi def link csSpecialType   SpecialItalic
hi def link cppAccess       cppStatement
hi def link cppCast         cppStatement
hi def link cppExceptions   Exception
hi def link cppOperator     Operator
hi def link cppStatement    Statement
hi def link cppModifier     Type
hi def link cppType         Type
hi def link cppStorageClass StorageClass
hi def link cppStructure    Structure
hi def link cppBoolean      Boolean
hi def link cppConstant     Constant
hi def link cppDelimiter    Delimiter
hi def link cppRawString    String
hi def link cppNumber       Number

" ========================================================================= "
let b:current_syntax = 'cpp'
if main_syntax == 'cpp'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

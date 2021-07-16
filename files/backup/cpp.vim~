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
source $VIMHOME/syntax/ansic.vim

" ========================================================================= "
syn keyword cppType         auto bool wchar_t char16_t char32_t
syn keyword cppStatement    co_await co_yield co_return
syn keyword cppOperator     new delete typeid and or not
syn keyword cppOperator     bitand bitor xor compl and_eq or_eq xor_eq not_eq
syn match   cppNormalOper   "\S\@<=&&\|&&\S\@="
syn match   cppSelfRef      "\*\=\<this\>"
syn keyword cppInclude      import using
syn match   cppUsing        "\%(\<using.*\)\@<=;"
syn keyword cppSpecifier    constexpr constinit consteval __attribute__
syn keyword cppSpecifier    inline virtual decltype thread_local
syn keyword cppSpecifier    friend explicit override final noexcept
syn match   cppSpecifier    "\%(\<virtual.*\)\@<==\s*0\%(;\)\@="
syn match   cppSpecifier    "=\s*\%(default\|delete\)\>"
syn keyword cppStorageClass mutable export
syn keyword cppException    throw try catch
syn match   cppAccess       "\<\%(public\|protected\|private\)\s*:"
syn keyword cppConstant     __cplusplus
syn keyword cppBoolean      true false
syn keyword cppClass        class
syn match   cppClass        "\<\u\w*\>"
syn match   cppOverloadOper "\<operator\>[^(]*(\@="
syn match   cppOverloadOper "\<operator\>\s*()\s*(\@="
syn keyword cppTemplate     template
syn keyword cppTypename     typename
syn match   cppTypename     "\%(\<template\s*\)\@<=<"
syn match   cppTypename     "\%(\<template.*\)\@<=>"
syn match   cppTmplName     "\<\u\d\=\>"
syn keyword cppConcept      concept
syn keyword cppRequires     requires
syn keyword cppNamespace    namespace module

syn match   cppNumber       "\<\d\+\%(sz\|zu\)\>"
syn region  cppString       start=+"+ end=+"s\=+
syn region  cppString       start=+\%(u8\|u\|U\|L\)"+ end=+"s\=+
syn region  cppRawString    start=+R"+ end=+"s\=+
syn region  cppCharacter    start=+\%(u\|U\|L\)'+ end=+'+

syn keyword cppCasting      const_cast static_cast dynamic_cast reinterpret_cast
syn keyword cppAssert       static_assert
" ========================================================================= "
syn match   cppSTDnamespace "\<std::\|\<std\>"
syn match   cppIOstream     "\<\%(std::\)\=\%(cout\|cin\|cerr\|clog\|endl\)\>"

syn match   cppSTLcontainer "\<\%(std::\)\=\%(vector\|deque\|list\|forward_list\|array\|string\)\>"
syn match   cppSTLcontainer "\<\%(std::\)\=\%(map\|set\|multimap\|multiset\)\>"
syn match   cppSTLcontainer "\<\%(std::\)\=\%(unordered_map\|unordered_set\|unordered_multimap\|unordered_multiset\)\>"
syn match   cppSTLadaptor   "\<\%(std::\)\=\%(stack\|queue\|priority_queue\)\>"
syn match   cppSTLspecial   "\<\%(std::\)\=\%(pair\|tuple\|bitset\|initializer_list\)\>"

syn match   cppSTLalgorithm "\<\%(std::\)\=\%(sort\)("me=e-1

syn keyword cppSTLtype      size_type
syn keyword cppSTLiterator  iterator const_iterator
syn keyword cppLibClass     ostream regex
syn keyword cppSmartPtr     auto_ptr shared_ptr unique_ptr weak_ptr
syn match   cppSmartPtr     "\<\%(std::\)\=\%(make_shared\|make_weak_ptr\|make_unique\)\>"
syn match   cppConstant     "\<\%(std::\)\=nullptr\>"
syn match   cppPtrType      "\<\%(std::\)\=nullptr_t\>"

" ========================================================================= "
hi def link cppType         Type
hi def link cppStatement    Statement
hi def link cppOperator     Operator
hi def link cppNormalOper   Normal
hi def link cppSelfRef      SelfRef
hi def link cppInclude      Include
hi def link cppUsing        Typedef
hi def link cppSpecifier    Specifier
hi def link cppStorageClass StorageClass
hi def link cppException    Goto
hi def link cppAccess       Modifier
hi def link cppConstant     Constant
hi def link cppClass        Class
hi def link cppOverloadOper RegExpr
hi def link cppTemplate     Process
hi def link cppTypename     Parameter
hi def link cppTmplName     Special
hi def link cppConcept      RegExpr
hi def link cppRequires     SelfRef
hi def link cppNamespace    Method
hi def link cppNumber       Number
hi def link cppCharacter    Character
hi def link cppString       String
hi def link cppRawString    String
hi def link cppCasting      Special
hi def link cppAssert       Macro

hi def link cppSTDnamespace Function
hi def link cppIOstream     Function
hi def link cppSTLcontainer Type
hi def link cppSTLadaptor   Unique
hi def link cppSTLspecial   Parameter

hi def link cppSTLiterator  Variable
hi def link cppSTLalgorithm Function
hi def link cppLibClass     Class
hi def link cppLibType      Type
hi def link cppPtrType      Type
hi def link cppSmartPtr     SelfRef

" ========================================================================= "
let b:current_syntax = 'cpp'
if main_syntax == 'cpp'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" Vim syntax file
" Language:     All
" Author:       Rinz
" Create Time:  2021 Jul 2


syn match   cMethod         "\%(\.\|->\)vptr->"
syn match   CommentTitle    "@\%(file\|version\|license\|date\)\>" contained
syn match   CommentTitle    "@\%(author\|email\|note\)\>" contained
syn match   CommentTitle    "@\%(brief\|param\|return\)\>" contained
syn match   CommentTitle    "@\%(file\|brief\|author\|email\)" contained
syn match   CommentTitle    "@\%(file\|brief\|author\|email\)" contained
syn match   Annotation      "\%(\.\|->\)vptr->"

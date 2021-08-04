" Vim color file
" Name:         WinTer
" Author:       Rinz
" Create Time:  2021 Feb 2
" Specially For Windows Terminal

hi clear
if exists("syntax_on")
    syntax reset
endif
let b:did_syntax = 1
let g:colors_name="winter"
let s:style = &background

let s:palette = {}


let s:palette.foreg    = {'dark': "15" , 'light': "0"  }
let s:palette.backg    = {'dark': "0"  , 'light': "15" }
let s:palette.black    = {'dark': "0"  , 'light': "0"  }
let s:palette.white    = {'dark': "15" , 'light': "15" }
let s:palette.blue     = {'dark': "11" , 'light': "9"  }
let s:palette.green    = {'dark': "2"  , 'light': "2"  }
let s:palette.cyan     = {'dark': "3"  , 'light': "3"  }
let s:palette.red      = {'dark': "12" , 'light': "12" }
let s:palette.purple   = {'dark': "5"  , 'light': "5"  }
let s:palette.brown    = {'dark': "6"  , 'light': "6"  }
let s:palette.lgrey    = {'dark': "7"  , 'light': "7"  }
let s:palette.dgrey    = {'dark': "8"  , 'light': "8"  }
let s:palette.special  = {'dark': "11" , 'light': "1"  }
let s:palette.crimson  = {'dark': "4"  , 'light': "4"  }
let s:palette.magenta  = {'dark': "13" , 'light': "13" }
let s:palette.lime     = {'dark': "10" , 'light': "10" }
let s:palette.yellow   = {'dark': "14" , 'light': "4"  }
let s:palette.status   = {'dark': "15" , 'light': "0"  }
let s:palette.cursor   = {'dark': "1"  , 'light': "7"  }

let s:n      = "none"
let s:b      = ",bold"
let s:i      = ",italic"
let s:u      = ",underline"
let s:r      = ",reverse"
let s:c      = ",undercurl"
let s:s      = ",standout"

func! s:build_prim(hi_elem, field)
    " Given a:hi_elem = bg, a:field = comment
    let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_comment
    let l:assign = "cterm" . a:hi_elem . "=" .s:palette[a:field][s:style] " ctermbg=...
    exe "let " . l:vname . " = ' " . l:assign . "'"
endfunc

let s:bg_none = ' ctermbg=NONE'
let s:fg_none = ' ctermfg=NONE'
for [key,val] in items(s:palette)
    call s:build_prim('bg', key)
    call s:build_prim('fg', key)
endfor

exe "let s:fmt_n = ' cterm=none".        " term=none".        "'"
exe "let s:fmt_b = ' cterm=NONE".s:b.    " term=NONE".s:b.    "'"
exe "let s:fmt_i = ' cterm=NONE".s:i.    " term=NONE".s:i.    "'"
exe "let s:fmt_u = ' cterm=NONE".s:u.    " term=NONE".s:u.    "'"
exe "let s:fmt_r = ' cterm=NONE".s:r.    " term=NONE".s:r.    "'"
exe "let s:fmt_c = ' cterm=NONE".s:c.    " term=NONE".s:c.    "'"
exe "let s:fmt_s = ' cterm=NONE".s:s.    " term=NONE".s:s.    "'"
exe "let s:fmt_bu= ' cterm=NONE".s:b.s:u." term=NONE".s:b.s:u."'"
exe "let s:fmt_bi= ' cterm=NONE".s:b.s:i." term=NONE".s:b.s:i."'"
exe "let s:fmt_br= ' cterm=NONE".s:b.s:r." term=NONE".s:b.s:r."'"
exe "let s:fmt_iu= ' cterm=NONE".s:i.s:u." term=NONE".s:i.s:u."'"

exe "hi! Normal"            .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! NonText"           .s:fg_backg      .s:bg_backg      .s:fmt_n
exe "hi! Whitespace"        .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! CursorLine"        .s:fg_none       .s:bg_cursor     .s:fmt_n
exe "hi! CursorColumn"      .s:fg_none       .s:bg_cursor     .s:fmt_n
exe "hi! Directory"         .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! StatusLine"        .s:fg_status     .s:bg_backg      .s:fmt_br
exe "hi! StatusLineNC"      .s:fg_foreg      .s:bg_backg      .s:fmt_b
exe "hi! StatusLineTerm"    .s:fg_foreg      .s:bg_backg      .s:fmt_br
exe "hi! StatusLineTermNC"  .s:fg_dgrey      .s:bg_backg      .s:fmt_r
exe "hi! TabLine"           .s:fg_status     .s:bg_backg      .s:fmt_b
exe "hi! TabLineSel"        .s:fg_status     .s:bg_backg      .s:fmt_br
exe "hi! TabLineFill"       .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! LineNr"            .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! CursorLineNr"      .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! Folded"            .s:fg_foreg      .s:bg_backg      .s:fmt_b
exe "hi! FoldColumn"        .s:fg_cyan       .s:bg_lgrey      .s:fmt_n
exe "hi! SignColumn"        .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! ColorColumn"       .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! VertSplit"         .s:fg_lgrey      .s:bg_backg      .s:fmt_n
exe "hi! ErrorMsg"          .s:fg_red        .s:bg_backg      .s:fmt_n
exe "hi! WarningMsg"        .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! ModeMsg"           .s:fg_status     .s:bg_backg      .s:fmt_b
exe "hi! MoreMsg"           .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! MatchParen"        .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! Search"            .s:fg_brown      .s:bg_lgrey      .s:fmt_n
exe "hi! IncSearch"         .s:fg_foreg      .s:bg_backg      .s:fmt_r
exe "hi! Question"          .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Pmenu"             .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! PmenuSel"          .s:fg_magenta    .s:bg_lgrey      .s:fmt_b
exe "hi! PmenuSbar"         .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! Visual"            .s:fg_green      .s:bg_lgrey      .s:fmt_n

" Group1
exe "hi! Comment"           .s:fg_red        .s:bg_none       .s:fmt_n
exe "hi! Annotation"        .s:fg_green      .s:bg_none       .s:fmt_i
exe "hi! Note"              .s:fg_red        .s:bg_none       .s:fmt_i
exe "hi! Mark"              .s:fg_none       .s:bg_status     .s:fmt_n
exe "hi! Others"            .s:fg_red        .s:bg_none       .s:fmt_b
" Group2
exe "hi! Constant"          .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! Character"         .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! Boolean"           .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! String"            .s:fg_green      .s:bg_backg      .s:fmt_n
exe "hi! Number"            .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Float"             .s:fg_blue       .s:bg_backg      .s:fmt_n
" Group3
exe "hi! Identifier"        .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! Symbol"            .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! Function"          .s:fg_purple     .s:bg_backg      .s:fmt_n
exe "hi! Process"           .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! Method"            .s:fg_lime       .s:bg_backg      .s:fmt_bi
exe "hi! Variable"          .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! Argument"          .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! Parameter"         .s:fg_magenta    .s:bg_backg      .s:fmt_i
exe "hi! SelfRef"           .s:fg_magenta    .s:bg_backg      .s:fmt_i
exe "hi! Attribute"         .s:fg_cyan       .s:bg_backg      .s:fmt_bi
exe "hi! PrvtAttr"          .s:fg_green      .s:bg_backg      .s:fmt_n
" Group4
exe "hi! Statement"         .s:fg_yellow     .s:bg_backg      .s:fmt_n
exe "hi! Conditional"       .s:fg_yellow     .s:bg_backg      .s:fmt_i
exe "hi! Repeat"            .s:fg_yellow     .s:bg_backg      .s:fmt_i
exe "hi! Return"            .s:fg_yellow     .s:bg_backg      .s:fmt_n
exe "hi! Label"             .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! Operator"          .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Branch"            .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Goto"              .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! Keyword"           .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Exception"         .s:fg_red        .s:bg_backg      .s:fmt_n
" Group5
exe "hi! PreProc"           .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! Include"           .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Define"            .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Macro"             .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! PreCondit"         .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Module"            .s:fg_green      .s:bg_backg      .s:fmt_n
" Group6
exe "hi! Type"              .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Declare"           .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Structure"         .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! Struct"            .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! Class"             .s:fg_red        .s:bg_backg      .s:fmt_n
exe "hi! Typedef"           .s:fg_purple     .s:bg_backg      .s:fmt_n
exe "hi! Using"             .s:fg_yellow     .s:bg_backg      .s:fmt_n
exe "hi! StorageClass"      .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Specifier"         .s:fg_purple     .s:bg_backg      .s:fmt_n
exe "hi! Modifier"          .s:fg_brown      .s:bg_backg      .s:fmt_n
" Group7
exe "hi! Special"           .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! UserType"          .s:fg_cyan       .s:bg_backg      .s:fmt_i
exe "hi! Escape"            .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! VimCmd"            .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! Unique"            .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! Tag"               .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Delimiter"         .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! Notation"          .s:fg_special    .s:bg_none       .s:fmt_n
exe "hi! Debug"             .s:fg_white      .s:bg_cyan       .s:fmt_n
" OtherGroup
exe "hi! Underlined"        .s:fg_cyan       .s:bg_backg      .s:fmt_u
exe "hi! Ignore"            .s:fg_lgrey      .s:bg_backg      .s:fmt_n
exe "hi! Error"             .s:fg_red        .s:bg_backg      .s:fmt_b
exe "hi! Todo"              .s:fg_white      .s:bg_status     .s:fmt_n
exe "hi! Continued"         .s:fg_backg      .s:bg_foreg      .s:fmt_n
" Format
exe "hi! NormalBold"        .s:fg_foreg      .s:bg_backg      .s:fmt_b
exe "hi! NormalItalic"      .s:fg_foreg      .s:bg_backg      .s:fmt_i
exe "hi! NormalBoldItalic"  .s:fg_foreg      .s:bg_backg      .s:fmt_bi
exe "hi! NormalUnderlined"  .s:fg_foreg      .s:bg_backg      .s:fmt_u
exe "hi! NormalIgnore"      .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! NormalNote"        .s:fg_foreg      .s:bg_lgrey      .s:fmt_n
exe "hi! NormalKeyboard"    .s:fg_foreg      .s:bg_white      .s:fmt_n
exe "hi! Blue"              .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! BlueBold"          .s:fg_blue       .s:bg_backg      .s:fmt_b
exe "hi! BlueItalic"        .s:fg_blue       .s:bg_backg      .s:fmt_i
exe "hi! BlueBoldItalic"    .s:fg_blue       .s:bg_backg      .s:fmt_bi
exe "hi! BlueUnderlined"    .s:fg_blue       .s:bg_backg      .s:fmt_u
exe "hi! BlueItaUnder"      .s:fg_blue       .s:bg_backg      .s:fmt_iu
exe "hi! Green"             .s:fg_green      .s:bg_backg      .s:fmt_n
exe "hi! GreenBold"         .s:fg_green      .s:bg_backg      .s:fmt_b
exe "hi! GreenItalic"       .s:fg_green      .s:bg_backg      .s:fmt_i
exe "hi! GreenBoldItalic"   .s:fg_green      .s:bg_backg      .s:fmt_bi
exe "hi! GreenUnderlined"   .s:fg_green      .s:bg_backg      .s:fmt_u
exe "hi! Red"               .s:fg_red        .s:bg_backg      .s:fmt_n
exe "hi! RedBold"           .s:fg_red        .s:bg_backg      .s:fmt_b
exe "hi! RedItalic"         .s:fg_red        .s:bg_backg      .s:fmt_i
exe "hi! RedBoldItalic"     .s:fg_red        .s:bg_backg      .s:fmt_bi
exe "hi! RedUnderlined"     .s:fg_red        .s:bg_backg      .s:fmt_u
exe "hi! Yellow"            .s:fg_yellow     .s:bg_backg      .s:fmt_n
exe "hi! YellowBold"        .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! YellowItalic"      .s:fg_yellow     .s:bg_backg      .s:fmt_i
exe "hi! YellowBoldItalic"  .s:fg_yellow     .s:bg_backg      .s:fmt_bi
exe "hi! YellowUnderlined"  .s:fg_yellow     .s:bg_backg      .s:fmt_u
exe "hi! Cyan"              .s:fg_cyan       .s:bg_backg      .s:fmt_n
exe "hi! CyanBold"          .s:fg_cyan       .s:bg_backg      .s:fmt_b
exe "hi! CyanItalic"        .s:fg_cyan       .s:bg_backg      .s:fmt_i
exe "hi! CyanBoldItalic"    .s:fg_cyan       .s:bg_backg      .s:fmt_bi
exe "hi! CyanUnderlined"    .s:fg_cyan       .s:bg_backg      .s:fmt_u
exe "hi! Purple"            .s:fg_purple     .s:bg_backg      .s:fmt_n
exe "hi! PurpleBold"        .s:fg_purple     .s:bg_backg      .s:fmt_b
exe "hi! PurpleItalic"      .s:fg_purple     .s:bg_backg      .s:fmt_i
exe "hi! PurpleBoldItalic"  .s:fg_purple     .s:bg_backg      .s:fmt_bi
exe "hi! PurpleUnderlined"  .s:fg_purple     .s:bg_backg      .s:fmt_u
exe "hi! Magenta"           .s:fg_magenta    .s:bg_backg      .s:fmt_n
exe "hi! MagentaBold"       .s:fg_magenta    .s:bg_backg      .s:fmt_b
exe "hi! MagentaItalic"     .s:fg_magenta    .s:bg_backg      .s:fmt_i
exe "hi! MagentaBoldItalic" .s:fg_magenta    .s:bg_backg      .s:fmt_bi
exe "hi! MagentaUnderlined" .s:fg_magenta    .s:bg_backg      .s:fmt_u
" Title
exe "hi! Title"             .s:fg_status     .s:bg_backg      .s:fmt_b
hi link Head1 RedBold
hi link Head2 GreenBold
hi link Head3 BlueBold
hi link Head4 CyanBold
hi link Head5 Cyan
hi link Head5 CyanItalic

exe "hi! MatchColor1"       .s:fg_brown      .s:bg_backg      .s:fmt_r
exe "hi! MatchColor2"       .s:fg_magenta    .s:bg_backg      .s:fmt_r
exe "hi! MatchColor3"       .s:fg_cyan       .s:bg_backg      .s:fmt_r

exe "hi! CocErrorSign"      .s:fg_red        .s:bg_backg      .s:fmt_n
exe "hi! CocWraningSign"    .s:fg_brown      .s:bg_backg      .s:fmt_n
exe "hi! CocHintSign"       .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! CocInfoSign"       .s:fg_magenta    .s:bg_backg      .s:fmt_n

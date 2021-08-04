" Vim color file
" Name:         Night
" Author:       Rinz
" Create Time:  2021 Feb 2
" For GVim

hi clear
if exists("syntax_on")
    syntax reset
endif
let b:did_syntax = 1
let g:colors_name="night"
let s:style = &background

let s:palette = {'gui': {}, 'cterm': {}}

let s:palette.gui.foreg      = {'dark': "#eef8ee", 'light': "#130c01"}
let s:palette.gui.backg      = {'dark': "#161c22", 'light': "#efefea"}
let s:palette.gui.selec      = {'dark': "#ac5e74", 'light': "#ed987b"}
let s:palette.gui.white      = {'dark': "#b8f1ed", 'light': "#d7ffff"}
let s:palette.gui.lgrey      = {'dark': "#5f2e29", 'light': "#e7dbca"}
let s:palette.gui.dgrey      = {'dark': "#ed987b", 'light': "#f1ccb8"}
let s:palette.gui.red        = {'dark': "#ef5767", 'light': "#ef5767"}
let s:palette.gui.green      = {'dark': "#9691f8", 'light': "#3ec776"}
let s:palette.gui.blue       = {'dark': "#0087ff", 'light': "#2928e1"}
let s:palette.gui.yellow     = {'dark': "#ac5e74", 'light': "#f9b747"}
let s:palette.gui.orange     = {'dark': "#f887ef", 'light': "#ff8444"}
let s:palette.gui.purple     = {'dark': "#af6cff", 'light': "#a626a4"}
let s:palette.gui.magenta    = {'dark': "#90fb8e", 'light': "#ae716e"}
let s:palette.gui.pink       = {'dark': "#ef4cbf", 'light': "#ff79c6"}
let s:palette.gui.cyan       = {'dark': "#44geff", 'light': "#0087ff"}
let s:palette.gui.teal       = {'dark': "#ffd700", 'light': "#1c8756"}
let s:palette.gui.crimson    = {'dark': "#f53f4d", 'light': "#e75f5f"}
let s:palette.gui.violet     = {'dark': "#cf6520", 'light': "#8484e8"}
let s:palette.gui.unique     = {'dark': "#fe997b", 'light': "#b168b1"}

let s:palette.cterm.foreg    = {'dark': "087", 'light': "233"}
let s:palette.cterm.backg    = {'dark': "018", 'light': "231"}
let s:palette.cterm.selec    = {'dark': "055", 'light': "195"}
let s:palette.cterm.white    = {'dark': "015", 'light': "195"}
let s:palette.cterm.lgrey    = {'dark': "235", 'light': "251"}
let s:palette.cterm.dgrey    = {'dark': "241", 'light': "246"}
let s:palette.cterm.red      = {'dark': "196", 'light': "196"}
let s:palette.cterm.green    = {'dark': "040", 'light': "034"}
let s:palette.cterm.blue     = {'dark': "105", 'light': "057"}
let s:palette.cterm.yellow   = {'dark': "111", 'light': "081"}
let s:palette.cterm.orange   = {'dark': "202", 'light': "202"}
let s:palette.cterm.purple   = {'dark': "128", 'light': "127"}
let s:palette.cterm.magenta  = {'dark': "199", 'light': "201"}
let s:palette.cterm.pink     = {'dark': "213", 'light': "206"}
let s:palette.cterm.cyan     = {'dark': "081", 'light': "033"}
let s:palette.cterm.teal     = {'dark': "031", 'light': "030"}
let s:palette.cterm.crimson  = {'dark': "161", 'light': "167"}
let s:palette.cterm.violet   = {'dark': "069", 'light': "141"}
let s:palette.cterm.unique   = {'dark': "166", 'light': "136"}

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
    let l:gui_assign = "gui". a:hi_elem . "=" . s:palette.gui[a:field][s:style] " guibg=...
    let l:cterm_assign = "cterm" . a:hi_elem . "=" .s:palette.cterm[a:field][s:style] " ctermbg=...
    exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
endfunc

let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key,val] in items(s:palette.gui)
    call s:build_prim('bg', key)
    call s:build_prim('fg', key)
endfor

exe "let s:fmt_n = ' gui=none".         " cterm=none".        " term=none".        "'"
exe "let s:fmt_b = ' gui=NONE".s:b.     " cterm=NONE".s:b.    " term=NONE".s:b.    "'"
exe "let s:fmt_i = ' gui=NONE".s:i.     " cterm=NONE".s:i.    " term=NONE".s:i.    "'"
exe "let s:fmt_u = ' gui=NONE".s:u.     " cterm=NONE".s:u.    " term=NONE".s:u.    "'"
exe "let s:fmt_r = ' gui=NONE".s:r.     " cterm=NONE".s:r.    " term=NONE".s:r.    "'"
exe "let s:fmt_c = ' gui=NONE".s:c.     " cterm=NONE".s:c.    " term=NONE".s:c.    "'"
exe "let s:fmt_s = ' gui=NONE".s:s.     " cterm=NONE".s:s.    " term=NONE".s:s.    "'"
exe "let s:fmt_bu= ' gui=NONE".s:b.s:u. " cterm=NONE".s:b.s:u." term=NONE".s:b.s:u."'"
exe "let s:fmt_bi= ' gui=NONE".s:b.s:i. " cterm=NONE".s:b.s:i." term=NONE".s:b.s:i."'"
exe "let s:fmt_br= ' gui=NONE".s:b.s:r. " cterm=NONE".s:b.s:r." term=NONE".s:b.s:r."'"
exe "let s:fmt_iu= ' gui=NONE".s:i.s:u. " cterm=NONE".s:i.s:u." term=NONE".s:i.s:u."'"

exe "hi! Normal"            .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! NonText"           .s:fg_backg      .s:bg_backg      .s:fmt_n
exe "hi! Whitespace"        .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! CursorLine"        .s:fg_none       .s:bg_backg      .s:fmt_u
exe "hi! CursorColumn"      .s:fg_none       .s:bg_white      .s:fmt_n
exe "hi! Directory"         .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! StatusLine"        .s:fg_yellow     .s:bg_backg      .s:fmt_br
exe "hi! StatusLineNC"      .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! StatusLineTerm"    .s:fg_foreg      .s:bg_backg      .s:fmt_b
exe "hi! StatusLineTermNC"  .s:fg_dgrey      .s:bg_backg      .s:fmt_b
exe "hi! TabLine"           .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! TabLineSel"        .s:fg_yellow     .s:bg_backg      .s:fmt_br
exe "hi! TabLineFill"       .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! LineNr"            .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! CursorLineNr"      .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! Folded"            .s:fg_backg      .s:bg_selec      .s:fmt_b
exe "hi! FoldColumn"        .s:fg_cyan       .s:bg_lgrey      .s:fmt_n
exe "hi! SignColumn"        .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! ColorColumn"       .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! VertSplit"         .s:fg_lgrey      .s:bg_backg      .s:fmt_n
exe "hi! ErrorMsg"          .s:fg_red        .s:bg_backg      .s:fmt_n
exe "hi! WarningMsg"        .s:fg_orange     .s:bg_backg      .s:fmt_n
exe "hi! ModeMsg"           .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! MoreMsg"           .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! MatchParen"        .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! Search"            .s:fg_backg      .s:bg_selec      .s:fmt_n
exe "hi! IncSearch"         .s:fg_none       .s:bg_none       .s:fmt_r
exe "hi! Question"          .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Pmenu"             .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! PmenuSel"          .s:fg_backg      .s:bg_selec      .s:fmt_b
exe "hi! PmenuSbar"         .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! Visual"            .s:fg_foreg      .s:bg_selec      .s:fmt_n

" Basic
exe "hi! Symbol"            .s:fg_foreg      .s:bg_none       .s:fmt_n
exe "hi! Identifier"        .s:fg_foreg      .s:bg_none       .s:fmt_n
exe "hi! Keyword"           .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Special"           .s:fg_violet     .s:bg_none       .s:fmt_n
exe "hi! Unique"            .s:fg_unique     .s:bg_none       .s:fmt_n
exe "hi! Tag"               .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Others"            .s:fg_cyan       .s:bg_none       .s:fmt_i
" Comment
exe "hi! Comment"           .s:fg_green      .s:bg_none       .s:fmt_i
exe "hi! Annotation"        .s:fg_green      .s:bg_none       .s:fmt_n
exe "hi! VimCmd"            .s:fg_dgrey      .s:bg_none       .s:fmt_n
exe "hi! Note"              .s:fg_red        .s:bg_none       .s:fmt_i
exe "hi! Mark"              .s:fg_none       .s:bg_crimson    .s:fmt_n
" Constant
exe "hi! Constant"          .s:fg_magenta    .s:bg_lgrey      .s:fmt_n
exe "hi! Number"            .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Float"             .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Character"         .s:fg_unique     .s:bg_none       .s:fmt_n
exe "hi! Escape"            .s:fg_unique     .s:bg_none       .s:fmt_n
exe "hi! String"            .s:fg_violet     .s:bg_none       .s:fmt_n
exe "hi! Boolean"           .s:fg_pink       .s:bg_none       .s:fmt_n
" Type
exe "hi! Type"              .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! UserType"          .s:fg_violet     .s:bg_none       .s:fmt_i
exe "hi! Specifier"         .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! Modifier"          .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! StorageClass"      .s:fg_blue       .s:bg_none       .s:fmt_bi
exe "hi! Typedef"           .s:fg_purple     .s:bg_none       .s:fmt_bi
exe "hi! Using"             .s:fg_orange     .s:bg_none       .s:fmt_bi
" Statement
exe "hi! Statement"         .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Conditional"       .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! Repeat"            .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! Return"            .s:fg_pink       .s:bg_none       .s:fmt_bi
exe "hi! Label"             .s:fg_pink       .s:bg_none       .s:fmt_i
exe "hi! Operator"          .s:fg_teal       .s:bg_none       .s:fmt_n
exe "hi! Branch"            .s:fg_crimson    .s:bg_none       .s:fmt_n
exe "hi! Goto"              .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! Delimiter"         .s:fg_violet     .s:bg_none       .s:fmt_n
" Function
exe "hi! Function"          .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! Process"           .s:fg_cyan       .s:bg_none       .s:fmt_b
exe "hi! Method"            .s:fg_green      .s:bg_none       .s:fmt_bi
exe "hi! Variable"          .s:fg_crimson    .s:bg_none       .s:fmt_n
exe "hi! Argument"          .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Parameter"         .s:fg_magenta    .s:bg_none       .s:fmt_i
" Structure
exe "hi! Structure"         .s:fg_teal       .s:bg_none       .s:fmt_b
exe "hi! Struct"            .s:fg_teal       .s:bg_none       .s:fmt_n
exe "hi! Class"             .s:fg_crimson    .s:bg_none       .s:fmt_b
exe "hi! SelfRef"           .s:fg_teal       .s:bg_none       .s:fmt_i
exe "hi! Attribute"         .s:fg_crimson    .s:bg_none       .s:fmt_bi
" PreProc
exe "hi! PreProc"           .s:fg_magenta    .s:bg_none       .s:fmt_b
exe "hi! Macro"             .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Include"           .s:fg_orange     .s:bg_none       .s:fmt_b
exe "hi! Define"            .s:fg_orange     .s:bg_none       .s:fmt_b
exe "hi! PreCondit"         .s:fg_orange     .s:bg_none       .s:fmt_bi
exe "hi! Module"            .s:fg_green      .s:bg_none       .s:fmt_n
" Error
exe "hi! Error"             .s:fg_red        .s:bg_none       .s:fmt_b
exe "hi! Exception"         .s:fg_red        .s:bg_none       .s:fmt_bi
exe "hi! Debug"             .s:fg_white      .s:bg_violet     .s:fmt_n
exe "hi! Todo"              .s:fg_white      .s:bg_yellow     .s:fmt_n
exe "hi! Ignore"            .s:fg_lgrey      .s:bg_none       .s:fmt_n
exe "hi! Continued"         .s:fg_white      .s:bg_unique     .s:fmt_b
" Format
exe "hi! Underlined"        .s:fg_violet     .s:bg_none       .s:fmt_u
exe "hi! NormalBold"        .s:fg_foreg      .s:bg_none       .s:fmt_b
exe "hi! NormalItalic"      .s:fg_foreg      .s:bg_none       .s:fmt_i
exe "hi! NormalBoldItalic"  .s:fg_foreg      .s:bg_none       .s:fmt_bi
exe "hi! NormalUnderlined"  .s:fg_foreg      .s:bg_none       .s:fmt_u
exe "hi! NormalIgnore"      .s:fg_dgrey      .s:bg_none       .s:fmt_n
exe "hi! NormalNote"        .s:fg_foreg      .s:bg_lgrey      .s:fmt_n
exe "hi! NormalKeyboard"    .s:fg_foreg      .s:bg_white      .s:fmt_n
exe "hi! Blue"              .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! BlueBold"          .s:fg_blue       .s:bg_none       .s:fmt_b
exe "hi! BlueItalic"        .s:fg_blue       .s:bg_none       .s:fmt_i
exe "hi! BlueBoldItalic"    .s:fg_blue       .s:bg_none       .s:fmt_bi
exe "hi! BlueUnderlined"    .s:fg_blue       .s:bg_none       .s:fmt_u
exe "hi! BlueItaUnder"      .s:fg_blue       .s:bg_none       .s:fmt_iu
exe "hi! Green"             .s:fg_green      .s:bg_none       .s:fmt_n
exe "hi! GreenBold"         .s:fg_green      .s:bg_none       .s:fmt_b
exe "hi! GreenItalic"       .s:fg_green      .s:bg_none       .s:fmt_i
exe "hi! GreenBoldItalic"   .s:fg_green      .s:bg_none       .s:fmt_bi
exe "hi! GreenUnderlined"   .s:fg_green      .s:bg_none       .s:fmt_u
exe "hi! Red"               .s:fg_red        .s:bg_none       .s:fmt_n
exe "hi! RedBold"           .s:fg_red        .s:bg_none       .s:fmt_b
exe "hi! RedItalic"         .s:fg_red        .s:bg_none       .s:fmt_i
exe "hi! RedBoldItalic"     .s:fg_red        .s:bg_none       .s:fmt_bi
exe "hi! RedUnderlined"     .s:fg_red        .s:bg_none       .s:fmt_u
exe "hi! Orange"            .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! OrangeBold"        .s:fg_orange     .s:bg_none       .s:fmt_b
exe "hi! OrangeItalic"      .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! OrangeBoldItalic"  .s:fg_orange     .s:bg_none       .s:fmt_bi
exe "hi! OrangeUnderlined"  .s:fg_orange     .s:bg_none       .s:fmt_u
exe "hi! Yellow"            .s:fg_yellow     .s:bg_none       .s:fmt_n
exe "hi! YellowBold"        .s:fg_yellow     .s:bg_none       .s:fmt_b
exe "hi! YellowItalic"      .s:fg_yellow     .s:bg_none       .s:fmt_i
exe "hi! YellowBoldItalic"  .s:fg_yellow     .s:bg_none       .s:fmt_bi
exe "hi! YellowUnderlined"  .s:fg_yellow     .s:bg_none       .s:fmt_u
exe "hi! Cyan"              .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! CyanBold"          .s:fg_cyan       .s:bg_none       .s:fmt_b
exe "hi! CyanItalic"        .s:fg_cyan       .s:bg_none       .s:fmt_i
exe "hi! CyanBoldItalic"    .s:fg_cyan       .s:bg_none       .s:fmt_bi
exe "hi! CyanUnderlined"    .s:fg_cyan       .s:bg_none       .s:fmt_u
exe "hi! Crimson"           .s:fg_crimson    .s:bg_none       .s:fmt_n
exe "hi! CrimsonBold"       .s:fg_crimson    .s:bg_none       .s:fmt_b
exe "hi! CrimsonItalic"     .s:fg_crimson    .s:bg_none       .s:fmt_i
exe "hi! CrimsonBoldItalic" .s:fg_crimson    .s:bg_none       .s:fmt_bi
exe "hi! CrimsonUnderlined" .s:fg_crimson    .s:bg_none       .s:fmt_u
exe "hi! Purple"            .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! PurpleBold"        .s:fg_purple     .s:bg_none       .s:fmt_b
exe "hi! PurpleItalic"      .s:fg_purple     .s:bg_none       .s:fmt_i
exe "hi! PurpleBoldItalic"  .s:fg_purple     .s:bg_none       .s:fmt_bi
exe "hi! PurpleUnderlined"  .s:fg_purple     .s:bg_none       .s:fmt_u
exe "hi! Magenta"           .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! MagentaBold"       .s:fg_magenta    .s:bg_none       .s:fmt_b
exe "hi! MagentaItalic"     .s:fg_magenta    .s:bg_none       .s:fmt_i
exe "hi! MagentaBoldItalic" .s:fg_magenta    .s:bg_none       .s:fmt_bi
exe "hi! MagentaUnderlined" .s:fg_magenta    .s:bg_none       .s:fmt_u
exe "hi! Pink"              .s:fg_pink       .s:bg_none       .s:fmt_n
exe "hi! PinkBold"          .s:fg_pink       .s:bg_none       .s:fmt_b
exe "hi! PinkItalic"        .s:fg_pink       .s:bg_none       .s:fmt_i
exe "hi! PinkBoldItalic"    .s:fg_pink       .s:bg_none       .s:fmt_bi
exe "hi! PinkUnderlined"    .s:fg_pink       .s:bg_none       .s:fmt_u
exe "hi! SpecialBold"       .s:fg_violet     .s:bg_none       .s:fmt_b
exe "hi! SpecialItalic"     .s:fg_violet     .s:bg_none       .s:fmt_i
exe "hi! SpecialBoldItalic" .s:fg_violet     .s:bg_none       .s:fmt_bi
exe "hi! SpecialUnderlined" .s:fg_violet     .s:bg_none       .s:fmt_u
exe "hi! UniqueBold"        .s:fg_unique     .s:bg_none       .s:fmt_b
exe "hi! UniqueItalic"      .s:fg_unique     .s:bg_none       .s:fmt_i
exe "hi! UniqueBoldItalic"  .s:fg_unique     .s:bg_none       .s:fmt_bi
exe "hi! UniqueUnderlined"  .s:fg_unique     .s:bg_none       .s:fmt_u
" Title
exe "hi! Title"             .s:fg_yellow     .s:bg_none       .s:fmt_b
hi link     Head1           RedBold
hi link     Head2           PurpleBold
hi link     Head3           BlueBold
hi link     Head4           SpecialBold
hi link     Head5           Special
hi link     Head5           SpecialItalic


exe "hi! MatchColor1"       .s:fg_orange     .s:bg_backg      .s:fmt_r
exe "hi! MatchColor2"       .s:fg_magenta    .s:bg_backg      .s:fmt_r
exe "hi! MatchColor3"       .s:fg_violet     .s:bg_backg      .s:fmt_r

exe "hi! CocErrorSign"      .s:fg_red        .s:bg_backg      .s:fmt_n
exe "hi! CocWraningSign"    .s:fg_orange     .s:bg_backg      .s:fmt_n
exe "hi! CocHintSign"       .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! CocInfoSign"       .s:fg_magenta    .s:bg_backg      .s:fmt_n

finish

hi clear
if exists("syntax_on")
    syntax reset
endif
let b:did_syntax = 1
let g:colors_name="rinz"
let s:style = &background

let s:palette = {'gui': {}, 'cterm': {}}

let s:palette.gui.foreg      = {'dark': "#232c31", 'light': "#000000"}
let s:palette.gui.backg      = {'dark': "#faf9de", 'light': "#ffffff"}
let s:palette.gui.selec      = {'dark': "#7cfc00", 'light': "#afafff"}
let s:palette.gui.white      = {'dark': "#ffffff", 'light': "#f8f8ff"}
let s:palette.gui.lgrey      = {'dark': "#d3d3d3", 'light': "#d3d3d3"}
let s:palette.gui.dgrey      = {'dark': "#a9a9a9", 'light': "#a9a9a9"}
let s:palette.gui.tred       = {'dark': "#ef0000", 'light': "#ef0000"}
let s:palette.gui.tgreen     = {'dark': "#00ff00", 'light': "#00ff00"}
let s:palette.gui.tblue      = {'dark': "#0000ef", 'light': "#0000ef"}
let s:palette.gui.tyellow    = {'dark': "#ffff67", 'light': "#ffff5f"}
let s:palette.gui.red        = {'dark': "#ff1493", 'light': "#dd0000"}
let s:palette.gui.green      = {'dark': "#3cb37a", 'light': "#00aa00"}
let s:palette.gui.blue       = {'dark': "#8a2be2", 'light': "#0000ff"}
let s:palette.gui.yellow     = {'dark': "#32cd32", 'light': "#875fff"}
let s:palette.gui.orange     = {'dark': "#ff7700", 'light': "#ff7700"}
let s:palette.gui.purple     = {'dark': "#7441d2", 'light': "#900090"}
let s:palette.gui.magenta    = {'dark': "#ff00ff", 'light': "#ff00ff"}
let s:palette.gui.pink       = {'dark': "#ff5fff", 'light': "#ff87ff"}
let s:palette.gui.cyan       = {'dark': "#d75f5f", 'light': "#00d7ff"}
let s:palette.gui.violet     = {'dark': "#af87ff", 'light': "#5f87ff"}
let s:palette.gui.special    = {'dark': "#6464c8", 'light': "#6464c8"}
let s:palette.gui.unique     = {'dark': "#d7515f", 'light': "#d75f00"}

let s:palette.cterm.foreg    = {'dark': "233", 'light': "000"}
let s:palette.cterm.backg    = {'dark': "007", 'light':"NONE"}
let s:palette.cterm.selec    = {'dark': "119", 'light': "147"}
let s:palette.cterm.white    = {'dark': "255", 'light': "015"}
let s:palette.cterm.lgrey    = {'dark': "251", 'light': "235"}
let s:palette.cterm.dgrey    = {'dark': "246", 'light': "241"}
let s:palette.cterm.tred     = {'dark': "196", 'light': "196"}
let s:palette.cterm.tgreen   = {'dark': "046", 'light': "046"}
let s:palette.cterm.tblue    = {'dark': "012", 'light': "012"}
let s:palette.cterm.tyellow  = {'dark': "227", 'light': "226"}
let s:palette.cterm.red      = {'dark': "160", 'light': "196"}
let s:palette.cterm.green    = {'dark': "028", 'light': "040"}
let s:palette.cterm.blue     = {'dark': "057", 'light': "020"}
let s:palette.cterm.yellow   = {'dark': "040", 'light': "099"}
let s:palette.cterm.orange   = {'dark': "208", 'light': "202"}
let s:palette.cterm.purple   = {'dark': "092", 'light': "128"}
let s:palette.cterm.magenta  = {'dark': "201", 'light': "199"}
let s:palette.cterm.pink     = {'dark': "207", 'light': "213"}
let s:palette.cterm.cyan     = {'dark': "167", 'light': "033"}
let s:palette.cterm.violet   = {'dark': "141", 'light': "069"}
let s:palette.cterm.special  = {'dark': "141", 'light': "069"}
let s:palette.cterm.unique   = {'dark': "167", 'light': "166"}

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
exe "hi! CursorLine"        .s:fg_none       .s:bg_none       .s:fmt_u
exe "hi! CursorColumn"      .s:fg_none       .s:bg_white      .s:fmt_n
exe "hi! Directory"         .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! StatusLine"        .s:fg_yellow     .s:bg_white      .s:fmt_br
exe "hi! StatusLineNC"      .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! StatusLineTerm"    .s:fg_foreg      .s:bg_backg      .s:fmt_b
exe "hi! StatusLineTermNC"  .s:fg_dgrey      .s:bg_backg      .s:fmt_b
exe "hi! TabLine"           .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! TabLineSel"        .s:fg_yellow     .s:bg_white      .s:fmt_br
exe "hi! TabLineFill"       .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! LineNr"            .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! CursorLineNr"      .s:fg_dgrey      .s:bg_backg      .s:fmt_n
exe "hi! Folded"            .s:fg_white      .s:bg_selec      .s:fmt_b
exe "hi! FoldColumn"        .s:fg_cyan       .s:bg_lgrey      .s:fmt_n
exe "hi! SignColumn"        .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! ColorColumn"       .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! VertSplit"         .s:fg_lgrey      .s:bg_backg      .s:fmt_n
exe "hi! ErrorMsg"          .s:fg_tred       .s:bg_backg      .s:fmt_n
exe "hi! WarningMsg"        .s:fg_orange     .s:bg_backg      .s:fmt_n
exe "hi! ModeMsg"           .s:fg_yellow     .s:bg_backg      .s:fmt_b
exe "hi! MoreMsg"           .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! MatchParen"        .s:fg_foreg      .s:bg_backg      .s:fmt_n
exe "hi! Search"            .s:fg_foreg      .s:bg_selec      .s:fmt_n
exe "hi! IncSearch"         .s:fg_none       .s:bg_none       .s:fmt_r
exe "hi! Question"          .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! Pmenu"             .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! PmenuSel"          .s:fg_none       .s:bg_selec      .s:fmt_b
exe "hi! PmenuSbar"         .s:fg_none       .s:bg_backg      .s:fmt_n
exe "hi! Visual"            .s:fg_foreg      .s:bg_selec      .s:fmt_n

" Group1
exe "hi! Comment"           .s:fg_red        .s:bg_none       .s:fmt_n
exe "hi! Others"            .s:fg_red        .s:bg_none       .s:fmt_b
" Group2
exe "hi! Constant"          .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Charracter"        .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Boolean"           .s:fg_pink       .s:bg_none       .s:fmt_n
exe "hi! String"            .s:fg_green      .s:bg_none       .s:fmt_n
exe "hi! Number"            .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Float"             .s:fg_blue       .s:bg_none       .s:fmt_n
" Group3
exe "hi! Identifier"        .s:fg_foreg      .s:bg_none       .s:fmt_n
exe "hi! Function"          .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! Symbol"            .s:fg_foreg      .s:bg_none       .s:fmt_n
exe "hi! Variable"          .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! Argument"          .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Parameter"         .s:fg_magenta    .s:bg_none       .s:fmt_i
exe "hi! SelfRef"           .s:fg_magenta    .s:bg_none       .s:fmt_i
exe "hi! Attribute"         .s:fg_cyan       .s:bg_none       .s:fmt_bi
exe "hi! Methond"           .s:fg_green      .s:bg_none       .s:fmt_b
" Group4
exe "hi! Statement"         .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Conditional"       .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! Repeat"            .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! Label"             .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Operator"          .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Keyword"           .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Exception"         .s:fg_tred       .s:bg_none       .s:fmt_n
exe "hi! Unique"            .s:fg_unique     .s:bg_none       .s:fmt_n
" Group5
exe "hi! PreProc"           .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! Include"           .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Define"            .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Macro"             .s:fg_magenta    .s:bg_none       .s:fmt_n
exe "hi! PreCondit"         .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! Module"            .s:fg_green      .s:bg_none       .s:fmt_n
" Group6
exe "hi! Type"              .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! StorageClass"      .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Structure"         .s:fg_special    .s:bg_none       .s:fmt_n
exe "hi! Typedef"           .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! Declare"           .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Specifier"         .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! Class"             .s:fg_red        .s:bg_none       .s:fmt_n
exe "hi! Modifier"          .s:fg_orange     .s:bg_none       .s:fmt_n
" Group7
exe "hi! Special"           .s:fg_special    .s:bg_none       .s:fmt_n
exe "hi! SpecialKey"        .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! SpecialTag"        .s:fg_special    .s:bg_none       .s:fmt_n
exe "hi! SpecialType"       .s:fg_special    .s:bg_none       .s:fmt_i
exe "hi! SpecialChar"       .s:fg_special    .s:bg_none       .s:fmt_n
exe "hi! SpecialString"     .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! SpecialComment"    .s:fg_dgrey      .s:bg_none       .s:fmt_n
exe "hi! Tag"               .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! Delimiter"         .s:fg_special    .s:bg_none       .s:fmt_n
exe "hi! Debug"             .s:fg_white      .s:bg_special    .s:fmt_n
" OtherGroup
exe "hi! Underlined"        .s:fg_special    .s:bg_none       .s:fmt_u
exe "hi! Ignore"            .s:fg_lgrey      .s:bg_none       .s:fmt_n
exe "hi! Error"             .s:fg_tred       .s:bg_none       .s:fmt_b
exe "hi! Todo"              .s:fg_white      .s:bg_yellow     .s:fmt_n
" Format
exe "hi! NormalBold"        .s:fg_foreg      .s:bg_none       .s:fmt_b
exe "hi! NormalItalic"      .s:fg_foreg      .s:bg_none       .s:fmt_i
exe "hi! NormalBoldItalic"  .s:fg_foreg      .s:bg_none       .s:fmt_bi
exe "hi! NormalUnderlined"  .s:fg_foreg      .s:bg_none       .s:fmt_u
exe "hi! NormalIgnore"      .s:fg_dgrey      .s:bg_none       .s:fmt_n
exe "hi! NormalNote"        .s:fg_foreg      .s:bg_lgrey      .s:fmt_n
exe "hi! Blue"              .s:fg_blue       .s:bg_none       .s:fmt_n
exe "hi! BlueBold"          .s:fg_blue       .s:bg_none       .s:fmt_b
exe "hi! BlueItalic"        .s:fg_blue       .s:bg_none       .s:fmt_i
exe "hi! BlueUnderlined"    .s:fg_blue       .s:bg_none       .s:fmt_i
exe "hi! Green"             .s:fg_green      .s:bg_none       .s:fmt_n
exe "hi! GreenBold"         .s:fg_green      .s:bg_none       .s:fmt_b
exe "hi! GreenItalic"       .s:fg_green      .s:bg_none       .s:fmt_i
exe "hi! GreenUnderlined"   .s:fg_green      .s:bg_none       .s:fmt_u
exe "hi! Red"               .s:fg_red        .s:bg_none       .s:fmt_n
exe "hi! RedBold"           .s:fg_red        .s:bg_none       .s:fmt_b
exe "hi! RedItalic"         .s:fg_red        .s:bg_none       .s:fmt_i
exe "hi! RedUnderlined"     .s:fg_red        .s:bg_none       .s:fmt_u
exe "hi! Orange"            .s:fg_orange     .s:bg_none       .s:fmt_n
exe "hi! OrangeBold"        .s:fg_orange     .s:bg_none       .s:fmt_b
exe "hi! OrangeItalic"      .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! OrangeUnderlined"  .s:fg_orange     .s:bg_none       .s:fmt_u
exe "hi! Yellow"            .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! YellowBold"        .s:fg_purple     .s:bg_none       .s:fmt_b
exe "hi! YellowItalic"      .s:fg_purple     .s:bg_none       .s:fmt_i
exe "hi! YellowUnderlined"  .s:fg_purple     .s:bg_none       .s:fmt_u
exe "hi! Cyan"              .s:fg_cyan       .s:bg_none       .s:fmt_n
exe "hi! CyanBold"          .s:fg_cyan       .s:bg_none       .s:fmt_b
exe "hi! CyanItalic"        .s:fg_orange     .s:bg_none       .s:fmt_i
exe "hi! CyanUnderlined"    .s:fg_orange     .s:bg_none       .s:fmt_u
exe "hi! Purple"            .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! PurpleBold"        .s:fg_purple     .s:bg_none       .s:fmt_b
exe "hi! PurpleItalic"      .s:fg_purple     .s:bg_none       .s:fmt_i
exe "hi! PurpleUnderlined"  .s:fg_purple     .s:bg_none       .s:fmt_u
exe "hi! Magenta"           .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! MagentaBold"       .s:fg_purple     .s:bg_none       .s:fmt_b
exe "hi! MagentaItalic"     .s:fg_purple     .s:bg_none       .s:fmt_i
exe "hi! MagentaUnderlined" .s:fg_purple     .s:bg_none       .s:fmt_u
exe "hi! Pink"              .s:fg_purple     .s:bg_none       .s:fmt_n
exe "hi! PinkBold"          .s:fg_purple     .s:bg_none       .s:fmt_b
exe "hi! PinkItalic"        .s:fg_purple     .s:bg_none       .s:fmt_i
exe "hi! PinkUnderlined"    .s:fg_purple     .s:bg_none       .s:fmt_u
exe "hi! SpecialBold"       .s:fg_special    .s:bg_none       .s:fmt_b
exe "hi! SpecialItalic"     .s:fg_special    .s:bg_none       .s:fmt_i
" Title
exe "hi! Title"             .s:fg_yellow     .s:bg_none       .s:fmt_b
hi link Head1 RedBold
hi link Head2 PurpleBold
hi link Head3 BlueBold
hi link Head4 SpecialBold
hi link Head5 Special
hi link Head5 SpecialItalic

exe "hi! MatchColor1"       .s:fg_orange     .s:bg_backg      .s:fmt_r
exe "hi! MatchColor2"       .s:fg_magenta    .s:bg_backg      .s:fmt_r
exe "hi! MatchColor3"       .s:fg_special    .s:bg_backg      .s:fmt_r

exe "hi! CocErrorSign"      .s:fg_tred       .s:bg_backg      .s:fmt_n
exe "hi! CocWraningSign"    .s:fg_orange     .s:bg_backg      .s:fmt_n
exe "hi! CocHintSign"       .s:fg_blue       .s:bg_backg      .s:fmt_n
exe "hi! CocInfoSign"       .s:fg_magenta    .s:bg_backg      .s:fmt_n

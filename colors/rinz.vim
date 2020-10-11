hi clear
if exists("syntax_on")
    syntax reset
endif
let b:did_syntax = 1
let g:colors_name="rinz"
let s:style = &background

let s:palette = {'gui': {}, 'cterm': {}}

let s:palette.gui.foreg   = {'dark': "#232c31", 'light': "#000000"}
let s:palette.gui.backg   = {'dark': "#faf9de", 'light': "#e4e4e4"}
let s:palette.gui.selec   = {'dark': "#7cfc00", 'light': "#b0c4de"}
let s:palette.gui.red     = {'dark': "#ff1493", 'light': "#af0000"}
let s:palette.gui.green   = {'dark': "#3cb37a", 'light': "#005f00"}
let s:palette.gui.blue    = {'dark': "#8a2be2", 'light': "#0000af"}
let s:palette.gui.purple  = {'dark': "#7441d2", 'light': "#5f00d7"}
let s:palette.gui.yellow  = {'dark': "#32cd32", 'light': "#6a5acd"}
let s:palette.gui.orange  = {'dark': "#ff7700", 'light': "#d78700"}
let s:palette.gui.magenta = {'dark': "#ff00ff", 'light': "#d7007f"}
let s:palette.gui.special = {'dark': "#6464c8", 'light': "#6464c8"}
let s:palette.gui.lgrey   = {'dark': "#d3d3d3", 'light': "#d3d3d3"}
let s:palette.gui.dgrey   = {'dark': "#a9a9a9", 'light': "#a9a9a9"}
let s:palette.gui.white   = {'dark': "#ffffff", 'light': "#f8f8ff"}
let s:palette.gui.tblue   = {'dark': "#0000ef", 'light': "#0000ef"}
let s:palette.gui.tred    = {'dark': "#ef0000", 'light': "#ef0000"}
let s:palette.gui.cyan    = {'dark': "#d75f5f", 'light': "#00ffaf"}

let s:palette.cterm.foreg   = {'dark': "233", 'light': "250"}
let s:palette.cterm.backg   = {'dark': "007", 'light':"NONE"}
let s:palette.cterm.selec   = {'dark': "119", 'light': "055"}
let s:palette.cterm.red     = {'dark': "160", 'light': "124"}
let s:palette.cterm.green   = {'dark': "028", 'light': "070"}
let s:palette.cterm.blue    = {'dark': "057", 'light': "020"}
let s:palette.cterm.purple  = {'dark': "092", 'light': "091"}
let s:palette.cterm.yellow  = {'dark': "040", 'light': "099"}
let s:palette.cterm.orange  = {'dark': "208", 'light': "130"}
let s:palette.cterm.magenta = {'dark': "201", 'light': "199"}
let s:palette.cterm.special = {'dark': "069", 'light': "069"}
let s:palette.cterm.lgrey   = {'dark': "251", 'light': "235"}
let s:palette.cterm.dgrey   = {'dark': "246", 'light': "241"}
let s:palette.cterm.white   = {'dark': "255", 'light': "015"}
let s:palette.cterm.tblue   = {'dark': "012", 'light': "012"}
let s:palette.cterm.tred    = {'dark': "196", 'light': "196"}
let s:palette.cterm.cyan    = {'dark': "167", 'light': "049"}

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
    let l:gui_assign = "gui".a:hi_elem."=".s:palette.gui[a:field][s:style] " guibg=...
    let l:cterm_assign = "cterm".a:hi_elem."=".s:palette.cterm[a:field][s:style] " ctermbg=...
    exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
endfunc

let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key,val] in items(s:palette.gui)
    call s:build_prim('bg', key)
    call s:build_prim('fg', key)
endfor

exe "let s:fmt_n = ' gui=none".          " cterm=none".          " term=none".        "'"
exe "let s:fmt_b = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b.    "'"
exe "let s:fmt_i = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i.    "'"
exe "let s:fmt_u = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u.    "'"
exe "let s:fmt_r = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r.    "'"
exe "let s:fmt_c = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c.    "'"
exe "let s:fmt_s = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s.    "'"
exe "let s:fmt_bu = ' gui=NONE".s:b.s:u. " cterm=NONE".s:b.s:u.  " term=NONE".s:b.s:u."'"
exe "let s:fmt_br = ' gui=NONE".s:b.s:r. " cterm=NONE".s:b.s:r.  " term=NONE".s:b.s:r."'"

exe "hi! Normal"         .s:fg_foreg        .s:bg_backg        .s:fmt_n
exe "hi! NonText"        .s:fg_backg        .s:bg_backg        .s:fmt_n
exe "hi! Whitespace"     .s:fg_dgrey        .s:bg_backg        .s:fmt_n
exe "hi! CursorLine"     .s:fg_none         .s:bg_backg        .s:fmt_u         ." guisp=#4169e1"
exe "hi! CursorColumn"   .s:fg_none         .s:bg_backg        .s:fmt_n
exe "hi! Directory"      .s:fg_blue         .s:bg_backg        .s:fmt_n
exe "hi! StatusLine"     .s:fg_yellow       .s:bg_white        .s:fmt_br
exe "hi! StatusLineNC"   .s:fg_yellow       .s:bg_backg        .s:fmt_b
exe "hi! StatusLineTerm" .s:fg_foreg        .s:bg_backg        .s:fmt_b
exe "hi! StatusLineTermNC".s:fg_dgrey       .s:bg_backg        .s:fmt_b
exe "hi! TabLine"        .s:fg_yellow       .s:bg_backg        .s:fmt_b
exe "hi! TabLineSel"     .s:fg_yellow       .s:bg_white        .s:fmt_br
exe "hi! TabLineFill"    .s:fg_none         .s:bg_backg        .s:fmt_n
exe "hi! LineNr"         .s:fg_dgrey        .s:bg_backg        .s:fmt_n
exe "hi! CursorLineNr"   .s:fg_dgrey        .s:bg_backg        .s:fmt_n
exe "hi! Folded"         .s:fg_white        .s:bg_selec        .s:fmt_b
exe "hi! FoldColumn"     .s:fg_cyan         .s:bg_lgrey        .s:fmt_n
exe "hi! SignColumn"     .s:fg_cyan         .s:bg_lgrey        .s:fmt_n
exe "hi! ColorColumn"    .s:fg_cyan         .s:bg_lgrey        .s:fmt_n
exe "hi! Ignore"         .s:fg_lgrey        .s:bg_backg        .s:fmt_n
exe "hi! Todo"           .s:fg_white        .s:bg_yellow       .s:fmt_n
exe "hi! Debug"          .s:fg_white        .s:bg_yellow       .s:fmt_n
exe "hi! Title"          .s:fg_yellow       .s:bg_backg        .s:fmt_b

exe "hi! VertSplit"      .s:fg_lgrey        .s:bg_backg        .s:fmt_n
exe "hi! Error"          .s:fg_tred         .s:bg_backg        .s:fmt_b
exe "hi! ErrorMsg"       .s:fg_tred         .s:bg_backg        .s:fmt_n
exe "hi! WarningMsg"     .s:fg_orange       .s:bg_backg        .s:fmt_n
exe "hi! ModeMsg"        .s:fg_yellow       .s:bg_backg        .s:fmt_b
exe "hi! MoreMsg"        .s:fg_blue         .s:bg_backg        .s:fmt_n
exe "hi! MatchParen"     .s:fg_foreg        .s:bg_backg        .s:fmt_n
exe "hi! Search"         .s:fg_foreg        .s:bg_selec        .s:fmt_n
exe "hi! IncSearch"      .s:fg_none         .s:bg_none         .s:fmt_r
exe "hi! Question"       .s:fg_blue         .s:bg_backg        .s:fmt_n
exe "hi! Pmenu"          .s:fg_none         .s:bg_backg        .s:fmt_n
exe "hi! PmenuSel"       .s:fg_none         .s:bg_selec        .s:fmt_b
exe "hi! PmenuSbar"      .s:fg_none         .s:bg_backg        .s:fmt_n
exe "hi! Visual"         .s:fg_foreg        .s:bg_selec        .s:fmt_n

exe "hi! Comment"        .s:fg_red          .s:bg_backg        .s:fmt_n
exe "hi! CommentBold"    .s:fg_red          .s:bg_backg        .s:fmt_b
exe "hi! CommentUnline"  .s:fg_red          .s:bg_backg        .s:fmt_u
exe "hi! String"         .s:fg_green        .s:bg_backg        .s:fmt_n
exe "hi! StringBold"     .s:fg_green        .s:bg_backg        .s:fmt_b
exe "hi! Number"         .s:fg_blue         .s:bg_backg        .s:fmt_n
exe "hi! Type"           .s:fg_blue         .s:bg_backg        .s:fmt_n
exe "hi! TypeBold"       .s:fg_blue         .s:bg_backg        .s:fmt_b
exe "hi! Function"       .s:fg_blue         .s:bg_backg        .s:fmt_n
exe "hi! Class"          .s:fg_red          .s:bg_backg        .s:fmt_n
exe "hi! Variable"       .s:fg_cyan         .s:bg_backg        .s:fmt_n
exe "hi! Builtin"        .s:fg_purple       .s:bg_backg        .s:fmt_n
exe "hi! BuiltinBold"    .s:fg_purple       .s:bg_backg        .s:fmt_b
exe "hi! Statement"      .s:fg_orange       .s:bg_backg        .s:fmt_n
exe "hi! StatementBold"  .s:fg_orange       .s:bg_backg        .s:fmt_b
exe "hi! StatementItalic".s:fg_orange       .s:bg_backg        .s:fmt_i
exe "hi! StatementCyan"  .s:fg_cyan         .s:bg_backg        .s:fmt_n
exe "hi! Repeat"         .s:fg_orange       .s:bg_backg        .s:fmt_n
exe "hi! Operator"       .s:fg_orange       .s:bg_backg        .s:fmt_n
exe "hi! Include"        .s:fg_orange       .s:bg_backg        .s:fmt_n
exe "hi! Special"        .s:fg_special      .s:bg_backg        .s:fmt_n
exe "hi! SpecialBold"    .s:fg_special      .s:bg_backg        .s:fmt_b
exe "hi! SpecialItalic"  .s:fg_special      .s:bg_backg        .s:fmt_i
exe "hi! Identifier"     .s:fg_special      .s:bg_backg        .s:fmt_n
exe "hi! Delimiter"      .s:fg_special      .s:bg_backg        .s:fmt_n
exe "hi! Underlined"     .s:fg_special      .s:bg_backg        .s:fmt_u
exe "hi! Constant"       .s:fg_magenta      .s:bg_backg        .s:fmt_n
exe "hi! FuncArgs"       .s:fg_magenta      .s:bg_backg        .s:fmt_i
exe "hi! Exception"      .s:fg_tred         .s:bg_backg        .s:fmt_n
exe "hi! PreProc"        .s:fg_magenta      .s:bg_backg        .s:fmt_n

exe "hi! MatchColor1"    .s:fg_orange        .s:bg_backg        .s:fmt_r
exe "hi! MatchColor2"    .s:fg_magenta      .s:bg_backg        .s:fmt_r
exe "hi! MatchColor3"    .s:fg_special      .s:bg_backg        .s:fmt_r



hi link pyrexType Number
hi link pyrexStatement Number
hi link pyrexInclude Statement


hi link cType Number
hi link cppType Number
hi link cStructure Number
hi link c0ctalZero Number
hi link cStorageClass Number
hi link cSpecial Number
hi link cppStructure Number
hi link cppModifier Number
hi link cBuiltin Builtin
hi link cppBuiltin Builtin
hi link cppBoolean Builtin
hi link cppAccess Statement
hi link cInclude Statement
hi link cppStatement Statement
hi link cIncluded String


hi link javaType Number
hi link javaStorageClass  Number
hi link javaType Number
hi link javaOperator Number
hi link javaBuiltin Builtin
hi link javaTypedef Builtin
hi link javaBoolean Constant
hi link javaScopeDecl Statement
hi link javaStatement Statement


hi link goType Number
hi link goSignedInts Number
hi link goUnsignedInts Number
hi link goFloats Number
hi link goComplexes Number
hi link goDeclType Number
hi link goDeclaration Number
hi link goConstants Constant

hi link vimGroup Number
hi link vimVar Number
hi link vimHiGuiFgBg String
hi link vimHiCtermFgBg String
hi link vimHiGui String
hi link vimHiTerm String
hi link vimHiCTerm String
hi link vimSynType String
hi link vimOption Builtin
hi link vimAutoEvent Comment

hi link cssDefinition Statement
hi link yamlBlockMappingKey Statement
hi link htmlEndTag Number
hi link htmlArg Builtin

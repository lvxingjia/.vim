## SyntaxGroup
0. Basic
        - Keyword
        - Identifier
        - Symbol
    - Special
    - Unique
    - Tag
    - Others
# hi link     Identifier      Normal
# hi link     Symbol          Normal
# hi link     Keyword         Normal
1. Comment
    - VimCmd(SpecialComment)
    - DocComment
    - Note
    - Mark
    - // Notation
2. Constant
    - Number
    - Character
        - Escape(SpecialChar)
    - String
        - RegExpr(SpecialString)
    - Boolean
# hi link     Float           Number
3. Type
    - UsrType(SpecialType)
    - Specifier (const)
    - Modifier (public)
# hi link     StorageClass    Tag
# hi link     Typedef         Specifier
4. Statement
    - Conditional
    - Repeat
    - Label
    - Operator
    - Branch
    - Delimiter -> Special
5. Function
    - Process
    - Methond
    - Variable
    - Argument (n)
    - Parameter (i)
6. Structure
    - Class
    - SelfRef
    - Attribute
    - // PrvtAttr
7. PreProc ->Macro
    - Macro
# hi link     PreProc         Macro
# hi link     Include         Statement
# hi link     Define          Statement
# hi link     PreCondit       Statement
# hi link     Module          Statement
8. Error
    - Exception
    - Debug
    - Todo
    - Continued
    - Ignore
00. Format
    - Bold
    - Italic
    - BoldItalic
    - Underlined






```vim
syn match   xSymbol         "."
syn match   xIdentifier     "\<\w\+\>"
```
[>_<]vim: setlocal nowarp

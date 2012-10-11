"This is my TEX file
"Created by Michele Esposito
"micheleresposito@gmail.com

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
"let g:autoclose = 1
"let g:Tex_SmartKeyQuote = 1

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'preview'
"---------------------------------------------------------------------------
" MAPPING
"---------------------------------------------------------------------------
imap <D-i> <Plug>Tex_InsertItemOnThisLine
imap <D-h> \hline
imap <D-u> \underline{}<Left><++>
imap <D-e> \emph{
"---------------------------------
"autoclose brackets
"Actually you can get a similar
"behavior with snippets : just type (,
"and then press the tab key. In case
"you prefer snippets, comment the
"following 3 lines
imap ,i \item 
imap `[ \forall
imap `] \exists
imap `. \rightarrow
imap `< \leq
imap `> \geq
imap `N \mathbb{N}
imap `R \mathbb{R}
"---------------------------------------------------------------------------
" AUTOCORRECTION
"---------------------------------------------------------------------------
imap hte the
imap teh the
imap dont don't
imap thta that
imap taht that
imap thta that
imap analize analyze
imap nubmer number 
imap becuase because
imap funciton function

"---------------------------------------------------------------------------
" Expantions
let g:Tex_Com_sum="\\sum_{<++>}^{<++>}<++>"
let g:Tex_Com_int="\\int_{<++>}^{<++>}<++>"
let g:Tex_Com_bf="\{\bf <++>}<++>"
let g:Tex_Com_und="\\underline{<++>}<++>"
let g:Tex_Com_emp="\\emph{<++>}<++>"
let g:Tex_Com_var="\\text{Var}(<++>)"

imap <buffer> [[ \begin{
imap <buffer> ]] <plug>LatexCloseLastEnv
nmap <buffer> <f5> <plug>LatexChangeEnv
vmap <buffer> <f7> <plug>LatexWrapSelection
vmap <buffer> <s-f7> <plug>LatexWrapSelectionEnv
imap <silent> <C-b>  {\bf 

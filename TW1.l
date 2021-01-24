%{
#include"y.tab.h"
%}
%%
"#include" {
return INC;}
"#define" {
return DEF;}
"main()" {
return MAIN;}
"int" {
return INT;}
"float" {
return FLOAT;}
"double" {
return DOUBLE;}
"char" {
return CHAR;}
"if" {
return IF;}
"else" {
return ELSE;}
"while" {
return WHILE;}
"for" {
return FOR;}
"do" {
return DO;}
"=="|"!="|"<="|">=" {
return RELOP;}
[\n] {
return NL;}
" " {
return SP;}
[0-9]+ {
return NUM;}
[a-zA-Z][a-zA-Z0-9_]* {
return ID;}
. {
return yytext[0];}
%%

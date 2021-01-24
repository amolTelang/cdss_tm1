%{
#include<stdio.h>
#include<stdlib.h>
%}
%token INC NL DEF SP ID NUM MAIN INT FLOAT DOUBLE CHAR IF ELSE WHILE FOR DO
RELOP
%%
prog:inc def main'{' NL decl if_else while forL do_while'}' {printf("valid c program\n");
exit(0);
}
;
inc:INC'<'ID'.'ID'>'NL inc
|INC'"'ID'.'ID'"'NL inc
|
;
def:DEF SP ID SP NUM NL def
|
;
main:MAIN NL
;
decl:INT SP var';'NL decl
|FLOAT SP var';'NL decl
|DOUBLE SP var';'NL decl
|CHAR SP cvar';'NL decl
|
;
var:ID','var
|ID'='NUM','var
|ID'['NUM']'','var
|ID'['NUM']''=''{'arg'}'','var
|ID'['NUM']''['NUM']'','var
|ID'['NUM']''['NUM']''=''{'arg'}'','var
|ID
|ID'='NUM
|ID'['NUM']'
|ID'['NUM']''=''{'arg'}'
|ID'['NUM']''['NUM']'
|ID'['NUM']''['NUM']''=''{'arg'}'
;
arg:NUM','arg
|NUM
;
cvar:ID','cvar
|ID'='ID','cvar
|ID'['NUM']'','cvar
|ID'['NUM']''=''{'carg'}'','cvar
|ID'['NUM']''['NUM']'','cvar
|ID'['NUM']''['NUM']''=''{'carg'}'','cvar
|ID
|ID'='ID
|ID'['NUM']'
|ID'['NUM']''=''{'carg'}'
|ID'['NUM']''['NUM']'
|ID'['NUM']''['NUM']''=''{'carg'}'
;
carg:'"'ID'"'','carg
|'"'ID'"'
;
if_else:IF'('cond')'NL stmt else if_else
|IF'('cond')'NL if_else
|stmt if_else
|
;
else:ELSE NL stmt
;
while:WHILE'('cond')'NL stmt while
|WHILE'('cond')'NL while
|
;
forL:FOR'('ID'='NUM';'cond';'equ')' NL stmt forL
|FOR'('ID'='NUM';'cond';'equ')' NL forL
|
;
do_while:DO NL stmt WHILE'('cond')'';'NL
;
cond:x RELOP x
;
x:ID
|NUM
;
equ:ID'+''+'
|ID'-''-'
|'+''+'ID
|'-''-'ID
|
;
stmt:ID';' NL
;
%%
int yywrap(){}
int yyerror(char *msg)
{
printf("Invalid\n");
exit(0);
}
void main()
{
printf("enter the program\n");
yyparse();
}

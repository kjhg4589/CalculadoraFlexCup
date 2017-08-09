/*--------------------------AREA 1 - Codigo Usuario -------------------------------*/
//Paquetes e Importaciones
package analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

%%
/*--------------------------AREA 2 - Opciones y Declaraciones ---------------------*/
%{
    //------------Codigo de usuario en java
    public static LinkedList<TError> tablaError = new LinkedList<TError>();
%}
//--------------Directivas
%public
%class aLexico
%cupsym sym
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//---------------Expreciones Reguladores
numero = [0-9]+

//---------------Estados
// JFLEX maneja el estado yyinitial por default


%%
/*--------------------------AREA 3 - Reglas Lexica --------------------------------*/
//simbolos

<YYINITIAL> "+"             {return new Symbol(sym.suma, yycolumn, yyline, yytext());}
<YYINITIAL> "-"             {return new Symbol(sym.menos, yycolumn, yyline, yytext());}
<YYINITIAL> "*"             {return new Symbol(sym.por, yycolumn, yyline, yytext());}
<YYINITIAL> "/"             {return new Symbol(sym.div, yycolumn, yyline, yytext());}
<YYINITIAL> "("             {return new Symbol(sym.para, yycolumn, yyline, yytext());}
<YYINITIAL> ")"             {return new Symbol(sym.parc, yycolumn, yyline, yytext());}

//simbolos er
<YYINITIAL> {numero}        {return new Symbol(sym.num, yycolumn, yyline, yytext());}

//espacios
[ \t\r\n\f]                 {/* se ignora */}

//errorer lexico
.                           {System.out.println("Error Lexico: "+yytext()+" linea "+yyline+ " columna "+yycolumn);
                            TError tError = new TError(yytext(), "Error Lexico", "Caracter No Definido", yyline, yycolumn);
                            tablaError.add(tError);}

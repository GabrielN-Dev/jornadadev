REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

   LOCAL cNome
   LOCAL cExI

   hb_cdpSelect( "PT850" )

   QOut( "==================================================" )
   QOut( "      DIFERENÄA ENTRE OS OPERADORES = E ==         " )
   QOut( "==================================================" )
   QOut()

   QOut( "Neste programa vamos entender a diferenáa entre os" )
   QOut( "operadores '=' e '==' de uma forma pr†tica." )
   QOut()

   ACCEPT "Digite seu nome: " TO cNome

   QOut()
   QOut( "Ol†, " + cNome + "!" )
   QOut()

   QOut( "O operador '=' aceita que a segunda string seja apenas" )
   QOut( "o comeáo da primeira string." )
   QOut()

   ACCEPT "Digite parte da palavra 'totovs' (ex.: to): " TO cExI

   IF "totovs" = cExI
      QOut()
      QOut( "ParabÇns! A comparaá∆o usando '=' retornou verdadeiro." )
      Igual()
   ELSE
      QOut()
      QOut( "Vocà digitou algo diferente do in°cio da palavra." )
      QOut( "Pressione qualquer tecla para sair..." )
      Inkey(0)
   ENDIF

RETURN NIL


FUNCTION Igual()

   LOCAL cExII

   QOut()
   QOut( "----------------------------------------------" )
   QOut( "Agora vamos testar o operador '=='." )
   QOut()
   QOut( "Esse operador exige que as duas strings sejam" )
   QOut( "exatamente iguais." )
   QOut()

   ACCEPT "Digite novamente 'to': " TO cExII

   QOut()
   QOut( "Resultado das comparaá‰es:" )
   QOut()

   QOut( '"totovs" =  "' + cExII + '"  -> ' + hb_ValToExp( "totovs" = cExII ) )
   QOut( '"totovs" == "' + cExII + '" -> ' + hb_ValToExp( "totovs" == cExII ) )

   QOut()

   IF "totovs" == cExII

      QOut( "As duas palavras s∆o exatamente iguais." )

   ELSE

      QOut( "Perceba a diferenáa:" )
      QOut( "Com '=' o resultado foi .T., pois '" + cExII + "'" )
      QOut( "Ç o in°cio da palavra 'totovs'." )
      QOut()
      QOut( "Com '==' o resultado foi .F., porque as duas" )
      QOut( "strings n∆o s∆o exatamente iguais." )

   ENDIF

   QOut()
   QOut( "Exemplo pr†tico:" )
   QOut( "Imagine uma pesquisa de produtos." )
   QOut( "Se o usu†rio digitar 'per', o sistema pode encontrar" )
   QOut( "'perfume'. Nesse caso, usar '=' faz sentido." )
   QOut()
   QOut( "J† em uma senha de login, Ç obrigat¢rio que o texto" )
   QOut( "seja exatamente igual. Por isso utiliza-se '=='." )

   QOut()
   QOut( "Explicaá∆o encerrada." )
   QOut( "Pressione qualquer tecla para fechar o programa..." )

   Inkey(0)

RETURN NIL
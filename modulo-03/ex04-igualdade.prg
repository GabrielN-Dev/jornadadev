REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

   LOCAL cNome
   LOCAL cExI

   hb_cdpSelect( "PT850" )

   QOut( "==================================================" )
   QOut( "      DIFERENÇA ENTRE OS OPERADORES = E ==         " )
   QOut( "==================================================" )
   QOut()

   QOut( "Neste programa vamos entender a diferença entre os" )
   QOut( "operadores '=' e '==' de uma forma prática." )
   QOut()

   ACCEPT "Digite seu nome: " TO cNome

   QOut()
   QOut( "Olá, " + cNome + "!" )
   QOut()

   QOut( "O operador '=' aceita que a segunda string seja apenas" )
   QOut( "o começo da primeira string." )
   QOut()

   ACCEPT "Digite parte da palavra 'totovs' (ex.: to): " TO cExI

   IF "totovs" = cExI
      QOut()
      QOut( "Parabéns! A comparação usando '=' retornou verdadeiro." )
      Igual()
   ELSE
      QOut()
      QOut( "Você digitou algo diferente do início da palavra." )
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
   QOut( "Resultado das comparações:" )
   QOut()

   QOut( '"totovs" =  "' + cExII + '"  -> ' + hb_ValToExp( "totovs" = cExII ) )
   QOut( '"totovs" == "' + cExII + '" -> ' + hb_ValToExp( "totovs" == cExII ) )

   QOut()

   IF "totovs" == cExII

      QOut( "As duas palavras são exatamente iguais." )

   ELSE

      QOut( "Perceba a diferença:" )
      QOut( "Com '=' o resultado foi .T., pois '" + cExII + "'" )
      QOut( "é o início da palavra 'totovs'." )
      QOut()
      QOut( "Com '==' o resultado foi .F., porque as duas" )
      QOut( "strings não são exatamente iguais." )

   ENDIF

   QOut()
   QOut( "Exemplo prático:" )
   QOut( "Imagine uma pesquisa de produtos." )
   QOut( "Se o usuário digitar 'per', o sistema pode encontrar" )
   QOut( "'perfume'. Nesse caso, usar '=' faz sentido." )
   QOut()
   QOut( "Já em uma senha de login, é obrigatório que o texto" )
   QOut( "seja exatamente igual. Por isso utiliza-se '=='." )

   QOut()
   QOut( "Explicação encerrada." )
   QOut( "Pressione qualquer tecla para fechar o programa..." )

   Inkey(0)

RETURN NIL
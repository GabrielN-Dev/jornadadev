REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
  // 1. Criamos a Hash vazia usando o símbolo { => }
   LOCAL hAgenda := { => }
   LOCAL cRepst
    LOCAL cRepst2

   hb_cdpSelect("PT850")



   // 2. Adicionamos os dados vinculando a Chave ao Valor
   hAgenda[ "Gabriel" ] := "99999-1111"
   hAgenda[ "Alana"   ] := "98888-2222"
   hAgenda[ "Carlos"  ] := "97777-3333"
  ACCEPT "Deseja parar?(S/N)" TO cRepst
  ACCEPT "Deseja parar?(S/N)" TO cRepst2

   hAgenda[ cRepst ] := cRepst2

   // 3. Buscamos o dado direto pelo nome (Chave)
   QOut( "O telefone do Gabriel é: " + hAgenda[ "Gabriel" ] )
   QOut( "O telefone da Alana é: "   + hAgenda[ "Alana"   ] )
      QOut( "O telefone do(a) " + cRepst + " é: "   + hAgenda[  cRepst ] )

   QOut( hb_ValToExp( hAgenda ) ) 

   Inkey(0)
RETURN NIL
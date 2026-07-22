REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
   LOCAL nVida := 7
   LOCAL nR
   LOCA nRUser

   hb_cdpSelect("PT850")
  
   nR := Int( HB_Random( 1, 100 ) ) // Gerar um número aleatório interio

   do while nVida > 0  .AND. nRUser <> nR // verifico se o usuário possui vida ou se ele acertou
      ACCEPT "Digite um número de 1 a 100: " TO nRUser
      nRUser := Val(nRUser)
      if  nRUser > nR
         QOut("Tente um número menor")
         nVida--
         QOut("quantidade de vida: " + AllTrim(str(nVida)))
      ELSEIF nRUser < nR
         QOut("Tente um número maior")
         nVida--
         QOut("quantidade de vida: " + AllTrim(str(nVida)))
      ELSE
         QOut("PARABÉNS VOCÊ ACERTOU!")
         QOut("Pressione Enter para sair...")
         inkey(0)     
         EXIT
      endif
   enddo
   IF nVida == 0  .AND. nRUser <> nR
      QOut("Você ficou sem vidas!")
      QOut("A respota correta era: "+  AllTrim(str(nR)))
      QOut("Pressione Enter para sair...")
      inkey(0)     

   ENDIF
   

RETURN NIL
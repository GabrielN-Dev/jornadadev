REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
   LOCAL aMatriz := {;
    {10,7,9}, ;
    {8,5,10};
   }
   LOCAL nMedia
   hb_cdpSelect("PT850")
   nMedia := (aMatriz[1, 1] + aMatriz[1, 2] + aMatriz[1, 3]) / 3
   Qout("A média do aluno 1 é: ")
   QQout(AllTrim(str(nMedia,10,2)))
   

   // Código aqui

RETURN NIL
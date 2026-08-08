User Function VldFornec()
  Local lExiste := .T.

  If !Empty(M->ZZ1_FORNEC)
      lExiste := ExistCpo("SA2",M->ZZ1_FORNEC+M->ZZ1_LOJAFO,1)      

      If !lExiste
         MsgAlert("Fornecedor n„o cadastrado!", "AtenÁ„o")
          M->ZZ1_FORNEC := Space(TamSx3("ZZ1_FORNEC"))     //Limpe o campo ZZ1_FORNEC, preenchendo com espaÁos em branco do tamanho exato do campo.
      EndIf
  EndIf

Return lExiste



User Function VldTolera()
  Local lValido := .T.

  // S√≥ valida se o campo foi preenchido
  If !Empty(M->ZZ1_TOLERA)
      If M->ZZ1_TOLERA < 0 .Or. M->ZZ1_TOLERA > 100
          lValido := .F.
          MsgAlert("Toler√¢ncia deve estar entre 0 e 100!", "Aten√ß√£o")
          M->ZZ1_TOLERA := 0.00  // Volta para um valor padr√£o
      EndIf
  EndIf

Return lValido 

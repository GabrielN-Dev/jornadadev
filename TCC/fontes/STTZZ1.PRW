#include "protheus.ch"

USER FUNCTION STTZZ1()
PRIVATE cCadastro := "Fornecimento"
dbSelectArea("ZZ1")
dbSetOrder(1)
AxCadastro("ZZ1", "Fornecimento")                                             
RETURN NIL                                                     

                                                    
User Function NomeFor()
Return Posicione(;
    "SA2",;
    1,;
    xFilial("SA2") + ZZ1->ZZ1_FORNEC + ZZ1->ZZ1_LOJAFO,;
    "A2_NOME";
)            


/*
User Function VldFornec()
  Local lExiste := .T.

  If !Empty(M->ZZ1_FORNEC)
      lExiste := ExistCpo("SA2", xFilial("SA2") + M->ZZ1_FORNEC + M->ZZ1_LOJA, 1)

      If !lExiste
          Help( , 1, "FORNEC")
          M->ZZ1_FORNEC := Space(TamSx3("ZZ1_FORNEC"))
      EndIf
  EndIf

Return lExiste                                

User Function VldTolera()
  Local lValido := .T.

  // Só valida se o campo foi preenchido
  If !Empty(M->ZZ1_TOLERA)
      If M->ZZ1_TOLERA < 0 .Or. M->ZZ1_TOLERA > 100
          lValido := .F.
          MsgAlert("Tolerância deve estar entre 0 e 100!", "Atenção")
          M->ZZ1_TOLERA := 0.00  // Volta para um valor padrão
      EndIf
  EndIf

Return lValido                       
 
User Function NomeFor()
Return Posicione(;
    "SA2",;
    1,;
    xFilial("SA2") + ZZ1->ZZ1_FORNEC + ZZ1->ZZ1_LOJAFO,;
    "A2_NOME";
)            

/*

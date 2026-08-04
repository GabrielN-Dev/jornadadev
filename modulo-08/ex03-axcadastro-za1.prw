#include "protheus.ch"

USER FUNCTION STTIP001()
PRIVATE cCadastro := "Pets" // // Obs: Variável redundante; código testado e funcional sem a sua utilização.
dbSelectArea("ZA1")
dbSetOrder(1)
AxCadastro("ZA1", "Pets")// Alteração realizada em aula

RETURN NIL
# 📝 Exercício 1 — AxCadastro × mBrowse

### a. Quando você usaria AxCadastro e quando usaria mBrowse? Dê um exemplo de cada.

---

#### 🛠️ AxCadastro: O "Jeito Rápido" (CRUD Automático)
O **AxCadastro** deve ser utilizado quando a prioridade é a velocidade de desenvolvimento e a padronização nativa do ERP. Ele gera automaticamente uma interface completa de manutenção de dados (Incluir, Alterar, Visualizar e Excluir) a partir de uma única linha de código, extraindo todas as regras diretamente do Dicionário de Dados (SX3). 

* **Uso Ideal:** É excelente para o desenvolvimento de protótipos rápidos, rotinas de testes internos ou cadastros simples que não exigem validações visuais complexas.
* **Exemplo Prático:** A primeira versão de teste da tabela customizada de Pets (`ZA1`). Chamando a função `AxCadastro("ZA1", "Cadastro de Pets")`, o Protheus desenha a tela inteira sozinho para que o usuário insira o "Rex" ou altere uma raça, sem precisar programar interface.

---

#### 📊 mBrowse: O "Jeito Profissional" (Controle Fino e Customização)
O **mBrowse** (e suas evoluções em POO, como a classe `FWmBrowse`) deve ser utilizado quando o foco principal é construir uma tela de consulta robusta e de alta performance para produção. Ele oferece controle total ao desenvolvedor sobre a interface gráfica do usuário.

* **Uso Ideal:** É indicado para rotinas reais de produção que exigem regras de negócio complexas na listagem, como filtros avançados de busca, colunas escolhidas a dedo ou botões com ações personalizadas além do CRUD básico.
* **Exemplo Prático:** Um Painel de Monitoramento de Pedidos de Venda ou de Atendimentos aos Pets. Com o `mBrowse`, podemos programar filtros na tela por período e adicionar legendas coloridas por status (por exemplo: verde para "Atendido", amarelo para "Pendente" e vermelho para "Cancelado"), além de embutir um botão customizado do tipo "Imprimir Cupom".

---

#### ⚖️ Resumo Comparativo
* Use **AxCadastro** se você precisa de agilidade: pouquíssimas linhas de código e uma tela de cadastro padrão pronta.
* Use **mBrowse** se você precisa de controle: uma interface de listagem rica, customizável, com legendas por cores e botões sob medida para a operação da empresa.


**b. Cite três coisas que o mBrowse faz e o AxCadastro não faz.**

1. **Legendas Coloridas por Regra de Negócio (`aColors`):** Permite criar marcadores visuais coloridos (ex: bolinhas verdes, amarelas ou vermelhas) na lateral de cada registro para indicar o status daquele dado com base em condições lógicas.
2. **Filtros Dinâmicos e Pré-definidos na Tela (`cFiltro`):** Oferece controle total para definir filtros fixos de código (exibir apenas registros do mês atual) ou habilitar réguas de filtragem dinâmicas para o usuário diretamente na listagem.
3. **Colunas Customizadas Fora do Padrão (`aColunas`):** Permite ao desenvolvedor escolher exatamente quais colunas vão aparecer, em qual ordem e com quais títulos na tela, sem ficar preso ou dependente exclusivamente do layout que está definido no Dicionário de Dados (SX3).


**c. Na configuração de legendas (`aColors`), por que a regra `".T."` deve ficar por último?**

Porque o Protheus avalia o array de condições de forma **sequencial (de cima para baixo)** e a primeira regra que for avaliada como verdadeira (`.T.`) define a cor da linha e encerra a checagem para aquele registro. Como a expressão `".T."` significa "sempre verdadeiro" (um coringa), ela funciona exatamente como a cláusula `ELSE` de um `IF`. 

* **Se ficar no topo:** Todas as linhas do sistema entrarão nela imediatamente. As regras específicas que vêm abaixo serão totalmente ignoradas e o sistema nunca avaliará as outras condições.
* **Ficando por último:** Ela atua perfeitamente como a "cor padrão" do sistema, aplicando-se apenas aos registros que não se encaixaram em nenhuma das regras anteriores.

**Exemplo Prático (Código Correto):**
```advpl
aCores := { { "ZA1->ZA1_RACA == 'PITBULL'", "BR_VERMELHO" },; // 1º: Avalia regra específica
            { ".T.",                        "BR_VERDE"    } } // 2º: Padrão para todos os outros
```
*(No exemplo acima, se o pet for um Pitbull, ele fica com a legenda vermelha. Se for qualquer outra raça, a primeira regra falha e ele cai na regra `".T."`, recebendo a cor verde padrão).*


**d. Qual a diferença entre um campo Virtual (`X3_RELACAO`) e um gatilho (`SX7`) para preencher o nome do cliente?**

A diferença fundamental para este cenário está na **persistência (gravação) dos dados** no banco e na **atualização da informação**:

* **Campo Virtual com `X3_RELACAO` (Exibição Dinâmica):**
  A fórmula inserida no `X3_RELACAO` (geralmente uma função `Posicione()`) roda "em tempo de execução" toda vez que a tela ou relatório é exibido. 
  * **Vantagem:** O dado está sempre 100% atualizado. Se o nome do cliente for alterado no cadastro principal (`SA1`), a tela que usa o campo virtual mostrará o novo nome instantaneamente.
  * **Desvantagem:** Não grava nada no banco de dados (não ocupa espaço físico). Por não existir na tabela física, esse dado não pode ser indexado e dificulta a criação de relatórios via queries SQL diretas.

* **Gatilho no `SX7` (Disparo e Gravação Física):**
  O gatilho é disparado por uma ação do usuário (geralmente ao digitar o código do cliente e sair do campo). Ele busca a informação e preenche automaticamente um campo de contexto **Real** (`Contexto = 1`).
  * **Vantagem:** O dado é gravado fisicamente na tabela. Como ele existe no banco de dados, você pode utilizá-lo para criar índices de ordenação, filtros rápidos e relatórios complexos.
  * **Desvantagem:** Ele tira uma "foto" do momento da gravação. Se o nome do cliente for alterado na tabela `SA1` posteriormente, o valor gravado anteriormente ficará desatualizado, a menos que o usuário reabra a rotina e force o disparo do gatilho novamente.

---

### ⚖️ Regra Prática de Decisão:
* Use **Campo Virtual (`X3_RELACAO`)** se o nome do cliente servir **apenas para visualização** em tela.
* Use **Gatilho (`SX7`)** se o nome do cliente precisar ser **salvo permanentemente**, exportado para outros sistemas ou usado como chave de busca/índice.

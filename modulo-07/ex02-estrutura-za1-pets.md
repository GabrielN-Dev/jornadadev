### Exercício 2 — Estrutura da Tabela ZA1 (Pets)

**a. Lista Completa dos Campos (Dicionário de Dados - SX3)**

| Nome do Campo | Tipo | Tamanho | Descrição |
| :--- | :--- | :--- | :--- |
| **ZA1_FILIAL** | Caracter | 2 | Código da filial corrente (chave do sistema) |
| **ZA1_NOME** | Caracter | 20 | Nome de identificação do pet |
| **ZA1_RACA** | Caracter | 20 | Raça ou variedade do pet |
| **ZA1_NASC** | Data | 8 | Data de nascimento do pet |

**Detalhamento de cada campo:**

* **ZA1_FILIAL:** Campo estritamente obrigatório em tabelas Protheus. Garante a integridade do padrão multiempresa/multifilial do ERP, isolando os dados de cada filial.
* **ZA1_NOME:** Campo do tipo texto para armazenar o nome do animal. Configurado como obrigatório no dicionário.
* **ZA1_RACA:** Campo do tipo texto para classificar a raça do pet. Pode ser vinculado a uma consulta padrão (F3) no futuro.
* **ZA1_NASC:** Campo do tipo data padrão do Protheus (formato AAAAMMDD internamente no banco, ocupando 8 posições).



**b. Qual índice seria mais adequado para essa tabela e por quê?**

**Índice sugerido:** `ZA1_FILIAL + ZA1_NOME`

**Justificativa:**
A combinação `ZA1_FILIAL + ZA1_NOME` é a mais adequada para a tabela ZA1 com base na arquitetura do Protheus e na usabilidade do sistema:

* **Obrigatoriedade da Filial:** Toda tabela e chave de índice no Protheus deve obrigatoriamente iniciar pelo campo de filial (`ZA1_FILIAL`) para garantir o isolamento e a integridade dos dados no padrão multiempresa.
* **Natureza da Consulta:** O nome do pet (`ZA1_NOME`) é o principal dado de identificação. Como a busca mais comum do usuário será localizar o animal pelo nome, ordenar a tabela por esse campo otimiza drasticamente a performance das consultas.
* **Prevenção de Duplicidade:** Além de acelerar a busca, o índice atua no banco de dados para evitar duplicidade, impedindo que existam dois registros com a mesma chave idêntica.

**Analogia Prática:**
Pense no índice como uma lista telefônica antiga. Se a lista estivesse totalmente desordenada, o banco de dados precisaria ler registro por registro (página por página) até encontrar o pet procurado, o que tornaria o sistema lento. 

Com o índice configurado, o Protheus faz exatamente isto:
* **Primeiro:** Separa os registros por filial (como se dividisse a lista telefônica por bairros).
* **Segundo:** Organiza os pets de cada filial em ordem alfabética pelo nome, permitindo achar o registro rapidamente sem precisar folhear todas as páginas.



**c. Explique por que o prefixo da tabela é Z (o que esse prefixo significa em termos de convenção do Protheus).**

O prefixo **Z** é a convenção oficial do Protheus para identificar tabelas customizadas criadas pelo cliente ou parceiro de negócio. 

Isso significa que:
* **Proteção em Atualizações:** O ERP Protheus vem de fábrica com prefixos reservados para seus módulos padrão (como `SA1` para Clientes ou `SB1` para Produtos). Ao usar a letra **Z**, a TOTVS garante que atualizações automáticas do sistema jamais irão sobrescrever ou apagar as tabelas criadas pelo desenvolvedor.
* **Identificação Rápida:** Qualquer analista ou desenvolvedor consegue identificar imediatamente que a tabela não pertence ao padrão do ERP, mas sim a uma regra de negócio ou módulo específico criado sob medida para aquela empresa (como foi o caso prático da tabela de Pets `ZA1`).



**d. Explique por que os campos começam com ZA1_ (ex: ZA1_NOME, ZA1_RACA) e não apenas com o nome do campo solto.**

Os campos não usam nomes soltos porque a arquitetura do Protheus exige o cumprimento de uma regra obrigatória de nomenclatura: **Nome do Campo = Prefixo da Tabela + Underscore (_) + Nome do Campo**. 

Esta convenção é fundamental por conta dos seguintes motivos:

| Motivo | Explicação |
| :--- | :--- |
| **Identificação Imediata** | Permite que o Protheus e o desenvolvedor saibam instantaneamente a qual tabela o campo pertence apenas ao ler o código. |
| **Padronização com o ERP** | Garante que as tabelas customizadas (como a `ZA1`) sigam a mesma lógica estrutural das tabelas nativas de fábrica (como a `SA1`, que usa `A1_`). |
| **Prevenção de Conflitos** | Diferentes tabelas possuem campos com finalidades iguais (ex: `NOME`). O prefixo impede que essas informações colidam ou se misturem no banco de dados. |
| **Múltiplas Tabelas (AdvPL)** | Como os programas AdvPL frequentemente manipulam várias tabelas ao mesmo tempo, o prefixo garante que o sistema saiba exatamente de onde extrair ou gravar o dado via alias (ex: `ZA1->ZA1_NOME`). |
| **Integração com o SX3** | O Protheus usa esse nome composto para mapear e aplicar as validações e propriedades estruturais do campo diretamente no Dicionário de Dados. |

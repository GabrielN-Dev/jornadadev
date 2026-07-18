# 📝 Exercício 1 — Isto é um algoritmo válido?

Para cada situação abaixo, indique se é um algoritmo válido. Se não for, explique por quê (lembre dos três requisitos: **finito**, **ordenado** e **sem ambiguidade**).

---

### 🔹 Questão A
> “Some dois números.”

* **Resposta:** `[ ] Sim  [x] Não`
* **Justificativa:** 
  O comando não é válido pois apresenta ambiguidade e falta de ordem. Não está especificado quais são os números, de onde a aplicação deve lê-los, nem onde o resultado será armazenado. Faltam os passos lógicos que antecedem a soma.

---

### 🔹 Questão B
> “Leia um número. Se for positivo, mostre ‘positivo’. Senão, mostre ‘negativo’.”

* **Resposta:** `[x] Sim  [ ] Não`
* **Justificativa:** 
  É um algoritmo válido. Ele possui uma sequência lógica clara (ordenado), não deixa dúvidas sobre quais ações o sistema deve tomar (sem ambiguidade) e a execução é encerrada logo após exibir o resultado (finito).

---

### 🔹 Questão C
> “Fique repetindo até acabar.”

* **Resposta:** `[ ] Sim  [x] Não`
* **Justificativa:** 
  Não é válido, pois não possui uma condição de parada clara, o que pode gerar um loop infinito (não atende ao requisito de ser finito). Além disso, não especifica o que deve ser repetido, tornando a instrução altamente ambígua.

---

### 🔹 Questão D
> “Pegue um ingrediente qualquer e cozinhe.”

* **Resposta:** `[ ] Sim  [x] Não`
* **Justificativa:** 
  Não é válido devido à extrema ambiguidade. Um algoritmo exige instruções precisas e exatas. Termos amplos como "qualquer" e "cozinhe" não definem os passos, as variáveis ou os métodos de processamento necessários para executar a tarefa sem erros.

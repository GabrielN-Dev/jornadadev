# 🛒 Refinamento Sucessivo — Sistema de Caixa de Supermercado

---

## 📌 Nível 1 — Visão Geral

O sistema executa o fluxo principal de atendimento em quatro etapas fundamentais:

* **Registrar** os itens da compra.
* **Calcular** o subtotal da compra.
* **Verificar** o cartão fidelidade para aplicar o desconto.
* **Exibir** o valor final da compra.

---

## 🔍 Nível 2 — Detalhamento

### 🧾 Passo 1 — Registrar os itens da compra

* **1.1** Inicializar uma lista para armazenar os itens.
* **1.2** Repetir enquanto houver itens a registrar:
  * **1.2.1** Ler o código ou nome do produto.
  * **1.2.2** Ler a quantidade.
  * **1.2.3** Obter o preço unitário do produto.
  * **1.2.4** Armazenar o produto, a quantidade e o preço na lista.
* **1.3** Perguntar se existe outro item para registrar:
  * **Se sim:** repetir o passo 1.2.
  * **Se não:** prosseguir para o cálculo do subtotal.

---

### 🧮 Passo 2 — Calcular o subtotal

* **2.1** Inicializar a variável `subtotal ← 0`.
* **2.2** Percorrer todos os itens registrados. Para cada item:
  * **2.2.1** Calcular o valor do item: 
    $$\text{valorItem} = \text{quantidade} \times \text{preçoUnitário}$$
  * **2.2.2** Somar o valor do item ao subtotal:
    $$\text{subtotal} = \text{subtotal} + \text{valorItem}$$
* **2.3** Exibir o subtotal da compra.

---

### 💳 Passo 3 — Verificar e aplicar desconto

* **3.1** Perguntar se o cliente possui cartão fidelidade.
* **3.2 Se possuir cartão:**
  * **3.3.1** Calcular:
    $$\text{desconto} = \text{subtotal} \times 0,05$$
* **3.3 Caso contrário:**
  * **3.3.1** Definir:
    $$\text{desconto} = 0$$
* **3.4** Calcular o valor final:
  $$\text{total} = \text{subtotal} - \text{desconto}$$

---

### 💵 Passo 4 — Exibir o total da compra

* **4.1** Exibir o subtotal.
* **4.2** Exibir o desconto aplicado.
* **4.3** Exibir o total a pagar.
* **4.4** Finalizar a compra e emitir o comprovante.

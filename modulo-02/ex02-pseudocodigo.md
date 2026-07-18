# 💻 Exercício 2 — Pseudocódigo

Escreva em pseudocódigo um algoritmo para cada item abaixo utilizando as palavras-chave `Leia`, `Escreva`, `Se ... Senão` e o operador `←` para atribuição.

---

### 📐 a. Calcular a área de um retângulo (base × altura)

Neste algoritmo, fazemos a leitura dos valores da **base** e da **altura**, realizamos a multiplicação de ambos e armazenamos o resultado na variável correspondente.

```text
Início
    Leia base
    Leia altura
    
    area ← base * altura
    
    Escreva "A área do retângulo é: ", area
Fim
```

---

### 🔢 b. Verificar se um número é par ou ímpar

Para descobrir se um número é par, verificamos se o resto da divisão dele por 2 é igual a zero (representado aqui pelo operador `mod`).

```text
Início
    Leia numero
    
    Se (numero mod 2 = 0) Então
        Escreva "O número é par"
    Senão
        Escreva "O número é ímpar"
    Fim Se
Fim
```

---

### 🏆 c. Encontrar o maior entre três números

Lemos três números diferentes e assumimos inicialmente que o primeiro deles é o maior. Depois, usamos estruturas `Se` consecutivas para comparar e atualizar esse valor caso os outros números sejam maiores.

```text
Início
    Leia n1
    Leia n2
    Leia n3
    
    // Assumimos que o primeiro número é o maior inicialmente
    maior ← n1
    
    Se (n2 > maior) Então
        maior ← n2
    Fim Se
    
    Se (n3 > maior) Então
        maior ← n3
    Fim Se
    
    Escreva "O maior número é: ", maior
Fim
```

💡 **Outro jeito de fazer:** Dá para resolver a questão **"c"** testando tudo de uma vez só usando vários `Se ... Senão` um dentro do outro. Fica assim:

```text
Início
    Leia n1
    Leia n2
    Leia n3
    
    Se (n1 >= n2) e (n1 >= n3) Então
        maior ← n1
    Senão 
        Se (n2 >= n1) e (n2 >= n3) Então
            maior ← n2
        Senão
            maior ← n3
        Fim Se
    Fim Se
    
    Escreva "O maior número é: ", maior
Fim
```
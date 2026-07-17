graph TD
    A([Início]) --> B[Leia valor da compra]
    B --> C{Valor > 100?}
    C -- Sim --> D[Desconto = Valor × 0.10]
    D --> E[Valor Final = Valor - Desconto]
    C -- Não --> F[Valor Final = Valor]
    E --> G[Escreva Valor Final]
    F --> G
    G --> H([Fim])
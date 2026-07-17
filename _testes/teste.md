```mermaid
graph TD
    A([Início]) --> B[Leia numero]
    B --> C{numero mod 2 = 0?}
    C -- Sim --> D[Escreva 'É par']
    C -- Não --> E[Escreva 'É ímpar']
    D --> F([Fim])
    E --> F
```

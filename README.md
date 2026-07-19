# 🚀 Jornada DEV — TOTVS Paulista

> Conteúdo prático, exercícios e projetos desenvolvidos ao longo do curso, organizados de forma estruturada por módulos.

---

### 👤 Aluno
* **Nome:** Gabriel Nogueira
* **Status:** Em aprendizado ativo 💻

---

## ⚙️ Notas de Configuração do Git

### 📌 `.gitignore`
```gitignore
# Ignorar todos os executáveis compilados
*.exe
```
* **Por que usei:** Evita que arquivos binários compilados (`.exe`) sejam enviados ao GitHub. Eles ocupam espaço desnecessário e mudam a cada compilação, o que poluía o histórico do Git.

### 📌 `.gitattributes`
```gitattributes
*.prg text working-tree-encoding=cp850 encoding=utf-8
```
* **Por que usei:** Configuração essencial para projetos em **Harbour** e **AdvPL**. Garante que os arquivos de código-fonte (`.prg`) mantenham a codificação correta (`CP850` no ambiente de desenvolvimento e `UTF-8` no repositório), impedindo que acentos e caracteres especiais fiquem quebrados no GitHub.

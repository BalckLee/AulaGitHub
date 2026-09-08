# Manual Técnico: Git e GitHub para Iniciantes

## Introdução

Este manual ensina, passo a passo, como usar Git e GitHub para versionar e compartilhar projetos de software. Ao final, você será capaz de criar um repositório, registrar alterações, colaborar com outras pessoas e clonar projetos existentes.

---

## 1. Git x GitHub: qual é a diferença?

Muita gente confunde os dois, mas eles têm papéis bem diferentes:

| Característica | Git | GitHub |
|---|---|---|
| **O que é** | Um programa (sistema de controle de versão) | Um site/plataforma que hospeda repositórios Git |
| **Onde roda** | Localmente, na sua máquina | Na nuvem |
| **Para que serve** | Guardar o histórico de mudanças do código | Compartilhar e colaborar em projetos com outras pessoas |

**Resumindo:** o Git é a ferramenta que registra o histórico do seu código; o GitHub é o lugar na internet onde você guarda e compartilha esse histórico com outras pessoas.

---

## 2. Criando e configurando um repositório Git local

**Passo 1 — Criar a pasta do projeto**

Crie uma pasta no computador e entre nela pelo terminal:

```bash
mkdir MeuProjeto
cd MeuProjeto
```

**Passo 2 — Inicializar o repositório**

Este comando transforma a pasta comum em um repositório monitorado pelo Git:

```bash
git init
```

Você verá uma mensagem confirmando que um repositório Git vazio foi criado.

**Passo 3 — Verificar o status dos arquivos**

Antes de qualquer ação, é sempre bom conferir o que está acontecendo na pasta:

```bash
git status
```

Esse comando mostra quais arquivos são novos, quais foram modificados e quais já estão prontos para serem salvos (commit).

---

## 3. Registrando alterações: add, commit e push

Esse é o fluxo principal do dia a dia com Git. Pense nele como três etapas de uma "gaveta":

1. **`add`** → você separa o que quer guardar (staging area)
2. **`commit`** → você tira uma "foto" dessa versão, com uma etiqueta explicando o que mudou
3. **`push`** → você envia essa foto para o GitHub, na nuvem

**Passo 1 — Adicionar arquivos (`git add`)**

```bash
git add .
```

O ponto (`.`) indica "todos os arquivos da pasta atual". Também é possível adicionar um arquivo específico: `git add index.html`.

**Passo 2 — Registrar a versão (`git commit`)**

```bash
git commit -m "Primeira versão do projeto"
```

A mensagem entre aspas é **obrigatória** e deve descrever, de forma curta e clara, o que foi feito naquela alteração.

**Passo 3 — Enviar para o GitHub (`git push`)**

Antes de enviar, é preciso conectar o repositório local a um repositório criado no GitHub:

```bash
git remote add origin https://github.com/usuario/nome-do-repositorio.git
git push -u origin main
```

- `git remote add origin [url]` cria a ligação entre o projeto local e o repositório na nuvem.
- `git push -u origin main` envia os commits para o GitHub. O `-u` guarda essa conexão, então nas próximas vezes basta usar `git push`.

---

## 4. Publicando um projeto no GitHub (passo a passo completo)

1. Crie uma conta no [github.com](https://github.com) (se ainda não tiver).
2. Clique em **New repository**, dê um nome ao projeto e crie-o (pode deixar vazio, sem README).
3. Copie a URL do repositório (formato `https://github.com/usuario/nome-do-repositorio.git`).
4. No terminal, dentro da pasta do seu projeto já com `git init` feito:
   ```bash
   git add .
   git commit -m "Primeira versão do projeto"
   git remote add origin https://github.com/usuario/nome-do-repositorio.git
   git push -u origin main
   ```
5. Atualize a página do repositório no GitHub — seus arquivos estarão lá.

---

## 5. Atualizando um projeto local com `git pull`

Quando outra pessoa (ou você mesmo, em outra máquina) envia alterações para o GitHub, seu projeto local fica desatualizado. Para trazer essas alterações:

```bash
git pull
```

Esse comando é, na prática, a combinação de duas ações:
- **fetch**: busca as alterações novas no GitHub
- **merge**: junta essas alterações com o seu código local

**Dica:** sempre dê um `git pull` antes de começar a trabalhar em um projeto compartilhado, para evitar conflitos.

---

## 6. Clonando um repositório existente com `git clone`

Diferente de outros sistemas, o Git baixa o repositório **inteiro**: todos os arquivos, todas as branches (ramificações) e todo o histórico de commits.

```bash
git clone https://github.com/usuario/nome-do-repositorio.git
```

Isso cria uma cópia completa do projeto em uma nova pasta no seu computador.

### Formas de autenticação

| Protocolo | Características |
|---|---|
| **HTTPS** | Mais simples de usar, mas pode pedir um Token de Acesso Pessoal para enviar alterações |
| **SSH** | Exige uma chave criptográfica configurada na máquina, mas depois autentica de forma automática e segura |

### Variações úteis do comando

| Comando | O que faz |
|---|---|
| `git clone [url]` | Clona o repositório completo em uma nova pasta |
| `git clone [url] [pasta]` | Clona o repositório em uma pasta com nome escolhido |
| `git clone --branch [nome] [url]` | Clona e já aponta para uma branch ou tag específica |
| `git clone --depth 1 [url]` | Shallow clone: baixa só o commit mais recente (economiza tempo/espaço) |
| `git clone --mirror [url]` | Cria uma cópia espelhada exata, usada em backups e migrações |
| `git clone --single-branch [url]` | Clona apenas o histórico de uma branch específica |
| `git clone --sparse [url]` | Baixa só os arquivos da raiz, útil em repositórios gigantes |

---

## 7. Glossário

- **Branch (Ramificação):** uma linha separada de desenvolvimento, usada para criar funcionalidades novas sem mexer no código principal.
- **.gitignore:** arquivo que lista o que o Git deve ignorar (arquivos temporários, senhas, etc.).
- **Origin:** nome padrão dado à conexão remota principal de um repositório.
- **Pull:** atualiza o projeto local com as alterações do GitHub.
- **Push:** envia os commits locais para o repositório remoto.
- **README:** arquivo de documentação inicial do projeto, normalmente em Markdown.
- **Repository (Repositório):** o "contêiner" onde o projeto e seu histórico de versões ficam guardados.

---

## Resumo do fluxo completo

```bash
# 1. Criar e entrar na pasta
mkdir MeuProjeto && cd MeuProjeto

# 2. Iniciar o repositório
git init

# 3. Ver o status
git status

# 4. Adicionar arquivos
git add .

# 5. Registrar a versão
git commit -m "Primeira versão do projeto"

# 6. Conectar ao GitHub
git remote add origin https://github.com/usuario/nome-do-repositorio.git

# 7. Publicar
git push -u origin main

# 8. Atualizar (quando houver mudanças remotas)
git pull

# 9. Clonar um projeto existente
git clone https://github.com/usuario/nome-do-repositorio.git
```

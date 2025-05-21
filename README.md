## 🍽️ Recipe Recommendation System (SQL)

Projeto de portfólio com foco em análise de dados e consultas SQL interativas, baseado em receitas e avaliações de usuários da plataforma [Food.com](https://www.kaggle.com/datasets/irkaal/foodcom-recipes-and-reviews).

### 📊 Objetivo

Este projeto transforma um conjunto de dados reais sobre receitas e avaliações em um **banco de dados SQLite**, onde você pode fazer perguntas como:

- Quais são as receitas mais avaliadas?
- Quais têm as melhores notas?
- Quais ingredientes são mais usados?

Tudo isso com consultas SQL simples e bem explicadas, ideais para aprendizado e portfólio.

### 🧱 Estrutura do Projeto

```
Recipe-Recommendation/
├── database.db                ← Banco SQLite gerado com os dados
├── import_to_sqlite.py        ← Script para importar os dados CSV
├── queries.sql                ← Consultas SQL interativas e comentadas
├── README.md                  ← Este arquivo
└── archives/
    ├── recipes.csv            ← Dados das receitas
    └── reviews.csv            ← Dados das avaliações
```

### ⚙️ Como Rodar Localmente

#### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/Recipe-Recommendation.git
cd Recipe-Recommendation
```

#### 2. Crie um ambiente virtual (opcional, mas recomendado)

```bash
python -m venv venv
source venv/bin/activate  # ou venv\Scripts\activate no Windows
```

#### 3. Instale as dependências

```bash
pip install pandas
```

#### 4. Execute o script para gerar o banco

```bash
python import_to_sqlite.py
```

#### 5. Abra no VS Code com a extensão SQLite

- Instale a extensão **SQLite** (Alexcvzz)
- Use o botão "Open Database" e selecione `database.db`
- Clique em "New Query" para interagir com as tabelas

### 🔍 Consultas SQL Interativas

#### 📌 Exemplo 1: Receitas mais avaliadas

```sql
SELECT 
    r.name AS receita,
    COUNT(v.review) AS total_avaliacoes,
    ROUND(AVG(v.rating), 2) AS media_nota
FROM recipes r
JOIN reviews v ON r.id = v.recipe_id
GROUP BY r.id, r.name
ORDER BY total_avaliacoes DESC
LIMIT 10;
```

#### 📌 Exemplo 2: Receitas com melhor média (min. 20 avaliações)

```sql
SELECT 
    r.name AS receita,
    COUNT(v.review) AS total_avaliacoes,
    ROUND(AVG(v.rating), 2) AS media_nota
FROM recipes r
JOIN reviews v ON r.id = v.recipe_id
GROUP BY r.id, r.name
HAVING COUNT(v.review) >= 20
ORDER BY media_nota DESC
LIMIT 10;
```

#### 📌 Exemplo 3: Ingredientes mais usados

```sql
SELECT 
    ingredient,
    COUNT(*) AS vezes_usado
FROM (
    SELECT TRIM(value) AS ingredient
    FROM recipes, json_each(recipes.ingredients)
)
GROUP BY ingredient
ORDER BY vezes_usado DESC
LIMIT 10;
```

### 🧠 Como pensar em SQL de forma humana?

SQL é uma linguagem para **fazer perguntas ao banco de dados**. Por exemplo:

> “Quais são as receitas mais avaliadas?”
>
> → O banco responde: Nome da receita + total de avaliações + média da nota.

Este projeto foca em **consultas claras e comentadas**, para que você entenda a lógica por trás da linguagem.

### 📌 Possíveis Extensões

- Criar um app interativo com [Streamlit](https://streamlit.io)
- Adicionar filtros por tempo de preparo, ingredientes, tipo de prato
- Visualizar os dados com gráficos (matplotlib/seaborn)

### 📚 Fonte dos Dados

[Kaggle – Food.com Recipes and Reviews Dataset](https://www.kaggle.com/datasets/irkaal/foodcom-recipes-and-reviews)

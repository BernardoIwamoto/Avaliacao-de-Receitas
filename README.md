##  Recipe Evaluation System (SQL)

Projeto com foco em análise de dados e consultas SQL interativas, baseado em receitas e avaliações de usuários da plataforma [Food.com](https://www.kaggle.com/datasets/irkaal/foodcom-recipes-and-reviews).

###  Objetivo

Este projeto transforma um conjunto de dados reais sobre receitas e avaliações em um **banco de dados SQLite**, onde você pode fazer perguntas como:

- Quais são as receitas mais avaliadas?
- Quais têm as melhores notas?
- Quais ingredientes são mais usados?

###  Como Rodar Localmente

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
python Importar_Dados.py
```

#### 5. Aguarde gerar o database.db
```bash
É normal demorar um pouquinho para gerar o database. Afinal, estamos lidando com uma grande quantidade de dados.

#### 6. Use o comando "Run Query" no arquivo Queries.
```bash
 Você obterá as tabelas resultantes das consultas que fizemos.
```

###  Consultas SQL Interativas

####  Exemplo 1: Receitas mais avaliadas

```sql
SELECT 
    r.name AS receita,
    COUNT(v.review) AS total_avaliacoes,
    ROUND(AVG(v.rating), 2) AS media_nota
FROM 
    recipes r
JOIN 
    reviews v ON r.RecipeId = v.RecipeId
GROUP BY 
    r.RecipeId, r.name
ORDER BY 
    total_avaliacoes DESC
LIMIT 10;
```

###  Fonte dos Dados

[Kaggle – Food.com Recipes and Reviews Dataset](https://www.kaggle.com/datasets/irkaal/foodcom-recipes-and-reviews)

import pandas as pd
import ast
import re
import json
import sqlite3

df = pd.read_csv("archive/recipes.csv")

## Função de limpeza de dados obtidade via inteligência artificial

# Função genérica para limpar campos do tipo c("...", "...")
def parse_r_style_list(s):
    if pd.isna(s):
        return []
    
    try:
        result = ast.literal_eval(s)
        if isinstance(result, list):
            return result
    except:
        pass

    # Trata strings no estilo R: c("...", "...")
    s = re.sub(r'^c\(|\)$', '', s)
    return re.findall(r'"(.*?)"', s)

cols_to_clean = [
    "RecipeIngredientParts",
    "RecipeIngredientQuantities",
    "RecipeInstructions",
    "Keywords",
    "Images"
]

# Aplicar a limpeza e converter para JSON
for col in cols_to_clean:
    df[col] = df[col].apply(parse_r_style_list)
    df[col] = df[col].apply(json.dumps)
    
reviews = pd.read_csv("archive/reviews.csv")

conn = sqlite3.connect("database.db")

df.to_sql("recipes", conn, if_exists="replace", index=False)
reviews.to_sql("reviews", conn, if_exists="replace", index=False)

conn.close()


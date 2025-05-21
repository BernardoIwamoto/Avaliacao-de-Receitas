import pandas as pd
import sqlite3

recipes_path = "archive/recipes.csv"
reviews_path = "archive/reviews.csv"

conn = sqlite3.connect("database.db")

recipes = pd.read_csv(recipes_path)
reviews = pd.read_csv(reviews_path)

recipes.to_sql("recipes", conn, if_exists="replace", index=False)
reviews.to_sql("reviews", conn, if_exists="replace", index=False)

conn.close()

print("Banco criado com sucesso!")

import re
import json

df = pd.read_csv("archive/recipes.csv")

def convert_r_vector_to_json(r_string):
    cleaned = re.sub(r'^c\(|\)$', '', r_string)
    parts = re.findall(r'"(.*?)"', cleaned)
    return json.dumps(parts)

df["RecipeIngredientParts"] = df["RecipeIngredientParts"].apply(convert_r_vector_to_json)

df.to_csv("archive/recipes_clean.csv", index=False)

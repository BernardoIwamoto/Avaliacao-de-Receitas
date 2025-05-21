-- SQLite
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

SELECT 
    ingredient,
    COUNT(*) AS vezes_usado
FROM 
    (SELECT TRIM(value) AS ingredient
     FROM recipes, json_each(recipes.RecipeIngredientParts))
GROUP BY 
    ingredient
ORDER BY 
    vezes_usado DESC
LIMIT 10;

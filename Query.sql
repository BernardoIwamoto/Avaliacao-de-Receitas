-- SQLite

-- Top 10 receitas mais bem avaliadas 
SELECT 
    Name,
    ROUND(AVG(rating), 2) AS media_nota,
    COUNT(review) AS total_reviews
FROM 
    recipes r
JOIN 
    reviews v ON r.RecipeId = v.RecipeId
GROUP BY 
    r.RecipeId
HAVING 
    total_reviews >= 10
ORDER BY 
    media_nota DESC
LIMIT 10;

-- Receitas mais recém adicionadas
SELECT Name, DatePublished
FROM recipes
ORDER BY DatePublished DESC
LIMIT 10;

-- Buscar por ingrediente -> Tomate
SELECT Name, RecipeIngredientParts
FROM recipes
WHERE RecipeIngredientParts LIKE '%"tomato"%';

-- Rankeia os autores por número de receitas
SELECT AuthorName, COUNT(*) AS total_receitas
FROM recipes
GROUP BY AuthorId
ORDER BY total_receitas DESC
LIMIT 10;

-- Top receitas com menos calorias
SELECT Name, Calories, AggregatedRating
FROM recipes
WHERE Calories IS NOT NULL AND AggregatedRating >= 4
ORDER BY Calories ASC
LIMIT 10;

-- Receitas mais rápidas
SELECT Name, TotalTime
FROM recipes
WHERE TotalTime IS NOT NULL
ORDER BY TotalTime ASC
LIMIT 10;

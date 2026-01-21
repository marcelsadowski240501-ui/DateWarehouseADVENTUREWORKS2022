SELECT 
    p.ProductKey,
    p.EnglishProductName AS ProductName,
    p.Color,
    p.Size,
    p.ListPrice,
    -- Handling potential nulls for a cleaner UI
    COALESCE(s.EnglishProductSubcategoryName, 'Uncategorized') AS Subcategory,
    COALESCE(c.EnglishProductCategoryName, 'Uncategorized') AS Category,
    -- Adding a simple flag for the report
    CASE 
        WHEN p.ListPrice > 1000 THEN 'Premium' 
        ELSE 'Standard' 
    END AS PriceSegment
FROM DimProduct AS p
LEFT JOIN DimProductSubcategory AS s 
    ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
LEFT JOIN DimProductCategory AS c 
    ON s.ProductCategoryKey = c.ProductCategoryKey
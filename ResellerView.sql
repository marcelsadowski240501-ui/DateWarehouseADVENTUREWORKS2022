CREATE VIEW dReseller AS
SELECT 
    ResellerKey,
    ResellerName,
    BusinessType,
    NumberEmployees,
    AnnualSales,
    ProductLine -- Useful for seeing which resellers specialize in specific products
FROM dbo.DimReseller;
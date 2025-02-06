-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Companies That Laid Off 100 percent of their employees  
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


-- Total laid off by company
SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`),MAX(`date`)
FROM layoffs_staging2;

-- Total Laid off by country 
SELECT country, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY country 
ORDER BY 2 DESC;


SELECT YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- Total laid off by Month 
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
;

WITH Rolling_Total as 
(SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`,total_off,
SUM(total_off) OVER (ORDER BY `MONTH`) as rolling_total
FROM Rolling_Total;


SELECT company, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


-- Total Laid off by each company in a year  
SELECT company,YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 ASC;

-- Ranks the top 5 compaines that with the most layoffs for each year 
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank as
(
SELECT *, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE ranking <= 5
;

-- Lets Look at Funds Raised 

-- Give 3 companies that had the most funds raised in each year 

SELECT company, YEAR(`date`), funds_raised_millions
FROM layoffs_staging2;

SELECT company,
YEAR(`date`), 
SUM(funds_raised_millions) as funds_rasied
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 desc
;

WITH fund_year as 
(
SELECT company,
YEAR(`date`) as years, 
SUM(funds_raised_millions) as funds_rasied
FROM layoffs_staging2
GROUP BY company,years
), Company_Year_Fund as
(
SELECT *, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY funds_rasied DESC ) as ranking
FROM fund_year
WHERE years IS NOT NULL
)
SELECT *,ROW_NUMBER() OVER() as row_num
FROM Company_Year_Fund
WHERE ranking <= 3
;


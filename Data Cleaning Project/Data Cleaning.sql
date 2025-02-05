-- Data Cleaning 

SELECT *
FROM layoffs;

-- first thing we want to do is create a staging table. This is the one we will work in and clean the data. We want a table with the raw data in case something happens
CREATE TABLE world_layoffs.layoffs_staging 
LIKE world_layoffs.layoffs;


-- now when we are data cleaning we usually follow a few steps
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways

-- 1. remove dups

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT * ,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging
;

WITH duplicate_cte AS
( 
SELECT * ,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging
)
SELECT *
FROM  duplicate_cte
WHERE row_num > 1;


-- Insert dup for example 
INSERT INTO layoffs_staging (company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)
VALUES ('Oyster', 'Charlotte', 'HR', NULL, NULL, '1/11/2023', 'Series C', 'United States', '224');


SELECT *
FROM layoffs_staging
WHERE company = 'Oyster';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num 
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;

-- Standerdizing data 


-- Removess empty spaces
SELECT company, TRIM(company)
FROM layoffs_staging2;

-- updates table
UPDATE layoffs_staging2
SET company = TRIM(company);


-- check for uniformity (ex. Crypto and Crytpo Currency- typos)
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%'
;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
WHERE country LIKE 'United States%';

UPDATE  layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- change date from text
SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- ONLY SLATER STAGEING TABLES
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


-- Null and Blank Values
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND  percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT DISTINCT industry
FROM layoffs_staging2
;

SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Bally%';

-- set blanks to nulls 
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT t1.industry,t2.industry
FROM  layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NUll OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1  
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NUll 
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2

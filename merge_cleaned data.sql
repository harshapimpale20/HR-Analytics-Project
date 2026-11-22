use hr;

show tables;

select count(*) from hr_1;
select count(*) from hr_2;

describe hr_1;
describe hr_2;

-- Check duplicate employee IDs
SELECT EmployeeNumber, COUNT(*)
FROM hr_1
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

SELECT `Employee ID`, COUNT(*)
FROM hr_2
GROUP BY `Employee ID`
HAVING COUNT(*) > 1;

-- Check NULL employee IDs
SELECT COUNT(*)
FROM hr_1
WHERE EmployeeNumber IS NULL;

SELECT COUNT(*)
FROM hr_2
WHERE `Employee ID` IS NULL;

-- merged Table --
SELECT
    h1.*,
    h2.`MonthlyIncome`,
    h2.`MonthlyRate`,
    h2.`NumCompaniesWorked`,
    h2.`OverTime`,
    h2.`PercentSalaryHike`,
    h2.`PerformanceRating`,
    h2.`RelationshipSatisfaction`,
    h2.`StockOptionLevel`,
    h2.`TotalWorkingYears`,
    h2.`TrainingTimesLastYear`,
    h2.`WorkLifeBalance`,
    h2.`YearsAtCompany`,
    h2.`YearsInCurrentRole`,
    h2.`YearsSinceLastPromotion`,
    h2.`YearsWithCurrManager`
FROM hr_1 h1
INNER JOIN hr_2 h2
ON h1.EmployeeNumber = h2.`Employee ID`;


-- merged Table Permnetaly --
CREATE TABLE hr_merged AS
SELECT
    h1.*,
    h2.`MonthlyIncome`,
    h2.`MonthlyRate`,
    h2.`NumCompaniesWorked`,
    h2.`OverTime`,
    h2.`PercentSalaryHike`,
    h2.`PerformanceRating`,
    h2.`RelationshipSatisfaction`,
    h2.`StockOptionLevel`,
    h2.`TotalWorkingYears`,
    h2.`TrainingTimesLastYear`,
    h2.`WorkLifeBalance`,
    h2.`YearsAtCompany`,
    h2.`YearsInCurrentRole`,
    h2.`YearsSinceLastPromotion`,
    h2.`YearsWithCurrManager`
FROM hr_1 h1
INNER JOIN hr_2 h2
ON h1.EmployeeNumber = h2.`Employee ID`;

SELECT COUNT(*) FROM hr_merged;

DESCRIBE hr_merged;

-- Total Employee -- 
SELECT COUNT(*) AS Total_Employees
FROM hr_merged;

-- dept wise employees --
select department, count(*) as total_employee
from hr_merged
group by department;

-- Check attrition distribution --
SELECT Attrition, COUNT(*) AS Employee_Count
FROM hr_merged
GROUP BY Attrition;

-- Check gender distribution --
SELECT Gender, COUNT(*) AS Employee_Count
FROM hr_merged
GROUP BY Gender;

-- avg monthly income of employees -- 
SELECT  AVG(MonthlyIncome) AS Average_Monthly_Income
FROM hr_merged;

select * from hr_merged;



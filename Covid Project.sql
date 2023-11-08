
/*
	Data Exploration on Covid Cases and Deaths in Africa
	
	Data Source: https://ourworldindata.org/covid-deaths
	*/

Select *
From PortfolioProject..CovidDeaths
Where continent is not null
Order by 3,4

--Narrowing down to useful data

Select location, date, population, total_cases, new_cases, total_deaths
From PortfolioProject..CovidDeaths
Where continent like '%africa%'
Order by 1,2

--Death percentage by the total cases in Africa

Select location, date, population, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent like '%africa%'
Order by 1,2

--Death percentage by the total cases in Nigera

Select location, date, population, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where location like '%nigeria%'
Order by 1,2

--Percentage of population infected with covid in Africa

Select location, date, population, total_cases, (total_cases/population)*100 as InfectedPopulation
From PortfolioProject..CovidDeaths
Where location like '%africa%'
Order by 1,2 desc

--Percentage of population infected with covid in Nigeria

Select location, date, population, total_cases, (total_cases/population)*100 as InfectedPopulation
From PortfolioProject..CovidDeaths
Where location like '%nigeria%'
Order by 2 desc

--Countries with highest infection rate as regards population in Africa

Select location, population, MAX(total_cases) as InfectionCount, MAX((total_cases/population))*100 as InfectedPopulation
From PortfolioProject..CovidDeaths
Where continent like '%africa%'
Group by location, population
Order by InfectedPopulation desc

--Countries with highest death count in Africa

Select Location, MAX(Total_deaths) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent like '%africa%'
Group by Location
order by TotalDeathCount desc

--A quick view at countries with highest death count globally

Select Location, MAX(Total_deaths) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc

--Continents with highest death count

Select continent, MAX(Total_deaths) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc

--Covid Vaccinations

Select *
From PortfolioProject..CovidVaccinations
Where continent is not null
Order by 3,4

Select location, date, total_tests, total_vaccinations
From PortfolioProject..CovidVaccinations
Where continent like '%africa%'
Order by 1,2
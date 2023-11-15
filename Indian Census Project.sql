-- number of raws into our database
select count(*)
from dataset1;

-- data set for jharkhand and bihar
select *
from dataset1
where state in ('jharkhand' , 'bihar');

-- population of India 
select sum(Population) as total_population
from dataset2;

-- average growth of India
select avg(Growth) as Avgs_Growth
from dataset1;

-- avarage growth by state with desc order 
select State,
avg (Growth) as avg_growth
from dataset1
group by State
order by avg_growth desc;

-- avg sex ration with 0 decimal place
select round(avg(Sex_Ratio),0) as avg_sex_ration
from dataset1;

-- avg literacy with greater than 90
select State,
	round(avg (Literacy),0) as avg_literacy
from dataset1
group by State
having round(avg (Literacy),0)>90
order by avg_literacy desc;

-- top 5 countries that showing the highest growth ration
-- use limit to find a specific amount of number 
select State,
avg (Growth) as avg_growth
from dataset1
group by State
order by avg_growth desc
limit 5;

-- top 5 countries that showing the lowesr sex ration
select State,
round(avg (Sex_Ratio),0) as avg_sex_ration
from dataset1
group by State
order by avg_sex_ration asc
limit 5;

-- find the top and bottom 5 states for literacy rate 

drop table if exists topstates;
CREATE TEMPORARY TABLE topstates (
    State VARCHAR(255),
    avg_literacy FLOAT
);
insert into topstates (State, avg_literacy)
select State,
round(avg(Literacy),0) as avg_literacy
from dataset1
group by State
order by avg_literacy desc
limit 5;
select * from topstates;

drop table if exists bottomstates;
CREATE TEMPORARY TABLE bottomstates (
    State VARCHAR(255),
    avg_literacy FLOAT
);
insert into bottomstates (State, avg_literacy)
select State,
round(avg(Literacy),0) as avg_literacy
from dataset1
group by State
order by avg_literacy asc
limit 5;
select * from bottomstates;

-- union opertor to combine 

(select * from topstates
order by avg_literacy desc 
limit 5
)
union 
(select * from bottomstates
order by avg_literacy asc
limit 5
);


-- state staring with letter b or d
select distinct state
from dataset1
where State like 'B%'
or State like 'D%';

-- starts with letter m and end with a
select distinct state
from dataset1
where State like 'M%'
and State like '%A'

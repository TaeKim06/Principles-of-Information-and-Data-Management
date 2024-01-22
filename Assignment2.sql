/* Question 1 */
Select drinker, numLikedBeers from 
(select drinker, count(*) numLikedBeers from Likes L group by drinker)t1 
group by drinker having numLikedBeers = (SELECT MAX(numLikedBeers) FROM 
(Select t1.drinker, numLikedBeers from 
(select drinker, count(*) numLikedBeers from Likes L group by drinker)t2)t3);

/* Question 2 */
Select Distinct S.bar from Sells S JOIN Frequents F ON F.bar <> S.bar Where (S.beer = "Budweiser" and S.price = 
(select Max(S1.price) from Sells S1 where S1.beer = "Budweiser")) and F.drinker <> "Gunjan";

/* Question 3 */
Select distinct L.Drinker from Likes L where L.beer in (Select S.beer from Sells S where S.bar in (
JOIN Sells S on S.beer = L.beer;

/* Question 4 */
Select Distinct F.drinker from Frequents F Join (Select bar, count(*) numDrinkers from Frequents group by bar 
Having numDrinkers = (select Max(numDrinkers) from (Select drinker, count(*) numDrinkers from Frequents group by drinker)t1))t2 ON F.bar = t2.bar;

Select bar, count(*) numDrinkers from Frequents group by bar 
Having numDrinkers = (select Max(numDrinkers) from (Select drinker, count(*) numDrinkers from Frequents group by drinker)t1);

Select bar, count(*) numDrinkers from Frequents group by bar ;

/* Question 5 */
Select precinct from Penna 

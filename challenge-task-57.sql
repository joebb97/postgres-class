--- How can you retrieve all the information from the cd.facilities table?
select * from cd.facilities;

--- You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
select name,membercost from cd.facilities;

--- How can you produce a list of facilities that charge a fee to members?
select * from cd.facilities where membercost > 0;

--- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
select * from cd.facilities where membercost > 0 and (.02 * monthlymaintenance) > membercost;

--- How can you produce a list of all facilities with the word 'Tennis' in their name?
select * from cd.facilities where name ilike '%tennis%';

--- How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
select * from cd.facilities where facid in (1,5);

--- How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
select memid,surname,firstname,joindate from cd.members where joindate >= timestamp '2012-09-01';
---or
select memid,surname,firstname,joindate from cd.members where joindate >= '2012-09-01';

--- How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
select distinct(surname) from cd.members
order by surname
limit 10;

--- You'd like to get the signup date of your last member. How can you retrieve this information?
select joindate from cd.members order by joindate desc limit 1;
--- or
select max(joindate) from cd.members;

--- Produce a count of the number of facilities that have a cost to guests of 10 or more.
select count(*) from cd.facilities where guestcost >= 10;

--- Produce a list of the total number of slots booked per facility in the month of September 2012.
 select facid,sum(slots) from cd.bookings
where extract(month from starttime) = 9 and extract(year from starttime) = 2012
group by facid
order by sum(slots);
--- or
SELECT facid, sum(slots) AS "Total Slots" FROM cd.bookings WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' GROUP BY facid ORDER BY SUM(slots);

--- Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
select facid, total_slots from (select facid, sum(slots) as total_slots from cd.bookings group by facid) as sub where total_slots > 1000 order by facid;
--- or
select facid, sum(slots) as total_slots from cd.bookings group by facid having sum(slots) > 1000 order by facid;

--- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
select starttime,name from cd.bookings
inner join cd.facilities on cd.bookings.facid = cd.facilities.facid
where date(starttime) = date('2012-09-21') and name ilike '%tennis court%'
order by starttime;
--- or
SELECT cd.bookings.starttime AS start, cd.facilities.name 
AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;

--- How can you produce a list of the start times for bookings by members named 'David Farrell'?
select starttime as start, format('%s %s', firstname, surname) from cd.bookings
inner join cd.members
on cd.bookings.memid = cd.members.memid
where firstname = 'David' and surname = 'Farrell';

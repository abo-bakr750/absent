select *
  from Absent a
    left join compensation c
	  on a.ID = c.ID
	left join Reasons r
	  on c.ID = r.Number

--- find the healthiest employees ----

select *
  from Absent a
    where Social_drinker = 0 and  Social_smoker = 0 and Body_mass_index < 25
	 and Absenteeism_time_in_hours <(select AVG(Absenteeism_time_in_hours )from Absent )

--- compansation for non smoker ---

select COUNT (*) as non_smoker
 from Absent 
   where Social_smoker = 0

select a.ID , r.Reason
  from Absent a
    left join compensation c
	  on a.ID = c.ID
	left join Reasons r
	  on c.ID = r.Number

select a.ID , r.Reason, Month_of_absence,Body_mass_index ,
 CASE WHEN MONTH_OF_absence in (12,1,2) Then ' winter'
      WHEN MONTH_OF_absence in (3,4,5) Then  'spring'
	  WHEN MONTH_OF_absence in (6,7,8) Then 'summer'
	  WHEN MONTH_OF_absence in (9,10,11) Then 'fail'
	  ELSE 'unkown' END as  season_names
   from Absent a
    left join compensation c
	  on a.ID = c.ID
	left join Reasons r
	  on c.ID = r.Number
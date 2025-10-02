/*KQL STATEMENTS FABRIC: EVENHOUSE AND EVENTSTREAM*/ 


--SELECTING COLUMNS
Weather
| project State, EpisodeId, STartTime, EndTime, EpisodeNarrative, EventNarravtive

--ADDING A COLUMN
Weather
| project State, EpisodeId, STartTime, EndTime, EpisodeNarrative, EventNarravtive
| extend Duration = EndTime-STartDate


--ORDERING
Weather
| project State, EpisodeId, STartTime, EndTime, EpisodeNarrative, EventNarravtive
| extend Duration = EndTime-STartDate
| order by State 

Weather
| project State, EpisodeId, STartTime, EndTime, EpisodeNarrative, EventNarravtive
| extend Duration = EndTime-STartDate
| order by State asc NULL last
| project-away EventNarrative


Weather
| project State, EpisodeId, STartTime, EndTime, EpisodeNarrative, EventNarravtive
| extend Duration = EndTime-STartDate
| extend EpisodeNarrative = 'hi'
| project-rename Narrative = EpisodeNarrative
| order by State asc NULL last
| project-away EventNarrative

--LIMIT NUMBER OF ROWS
Weather
| take 10

Weather
| limit 10

Weather
| sample 10 --not first ten rows

Weather
| distinct State

Weather
| sample-distinct 10 of State --not particular order

--Using order by
Weather
| distinct State
| order by State desc
| limit 10

--Same as order by:
Weather
| distinct State
| top 10 by State asc --DEFAULT IS DESC

Weather
| distinct State
| top 10 by State asc nulls last--DEFAULT IS DESC

--KQL STRING LITERALS

Weather

print 'hello';
print "hello";
print 'She said "Hello"';
print "She said 'Hello'";

print @"A backslash is this symbo: \. It is used as a special character."

print ```She said
A backslash is \\
Hello. ```



--KQL FIKTERING
Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType == "heavy rain" --case-sensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType =~ "heavy rain" --case-insensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType != "heavy rain" --case-sensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType !~ "heavy rain" --case-insensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType =~ "heavy rain" --case-insensitive


Weather
| project Narrative=EpisodeNarrative, EventType
| where not( EventType == "Heavy Rain") --case-sensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType == "Heavy Rain" or EventType == "Blizzard" --case-sensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where State == "TEXAS" and ( EventType == "Heavy Rain" or EventType == "Blizzard") --case-sensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where  EventType in ("Heavy Rain","Blizzard") --case-sensitive

Weather
| project Narrative=EpisodeNarrative, EventType
| where EventType =~ "Heavy Rain" or EventType =~"Blizzard" --case-insensitive


Weather
| project Narrative=EpisodeNarrative, EventType
| where not (EventType =~ "Heavy Rain" or EventType =~"Blizzard") --case-insensitive


Weather
| project Narrative=EpisodeNarrative, EventType
| where  EventType in~ ("Heavy Rain","blizzard") --case-insensitive


--KQL MORE FILTERING
Weather
| project EpisodeNarrative
| where EpisodeNarrative has "country" -- case insensitive

Weather
| project EpisodeNarrative
| where EpisodeNarrative contains "country" -- case insensitive

Weather
| project EpisodeNarrative
| where EpisodeNarrative has "cou" -- case insensitive

Weather
| project EpisodeNarrative
| where EpisodeNarrative contains "cou" -- case insensitive


Weather
| project EpisodeNarrative
| where EpisodeNarrative hasprefix "cou" -- case insensitive
| where not(EpisodeNarrative has prefix "count")
| where EpisodeNarrative !hasprefix "couple"

--KQL AGGREGATIONS

Weather
| summarize by State

Weather
| summarize Calc=count() by State

Weather
| summarize Calc=count() by State, Eventtype

Weather
| summarize Calc=countif(Eventtype=="Flood") by State, Eventtype

Weather
| summarize Calc=countif(Eventtype!="Flood") by State, Eventtype


Weather
| where State in~("Texas", "Kansas", "Alaska")
| summarize Calc=countif(Eventtype!="Flood") by State, Eventtype

Weather
| summarize Calc=countif(Eventtype!="Flood") by State, Eventtype
| where State in~("Texas", "Kansas", "Alaska")


Weather
| where State in~("Texas", "Kansas", "Alaska")
| summarize Calc=countif(Eventtype!="Flood") by State, Eventtype
| where Calc >= 100



Weather
| summarize Calc=sum(InjuriesDirect) by State

Weather
| summarize Calc=sumif(InjuriesDirect, EventType =="Flood") by State

Weather
| summarize Calc=avg(InjuriesDirect) by State


Weather
| summarize Calc=max(InjuriesDirect) by State

Weather
| summarize Calc=min(InjuriesDirect) by State

Weather
| summarize Calc=maxif(InjuriesDirect, EventType =="Flood") by State

Weather
| summarize Calc=dcount(EventType) by State

--KQL EMPTY STRINGS, CONCATENATING AND TRIMMING STRINGS

Weather
| project State, EpisodeNarrative, EventType, BeginLocation
|limit 28
| where BeginLocation == " "

Weather
| project State, EpisodeNarrative, EventType, BeginLocation
|limit 20
| where isempty(BeginLocation)

Weather
| project State, EpisodeNarrative, EventType, BeginLocation
| extend Calc= strcat(EventType, ": ", EpisodeNarrative)
| limit 20


Weather
| project State, EpisodeNarrative, EventType, BeginLocation
| extend Calc= strcat_delim( ": ", State, EventType, EpisodeNarrative)
| limit 20


Weather --Numbers and strings
| project State, EpisodeNarrative, EventType, BeginLocation
| extend Calc= strcat_delim( ": ", EventId, State, EventType, EpisodeNarrative)
| limit 20


Weather 
| project State, EpisodeNarrative, EventType, BeginLocation
| extend EventType= touppder(EventType)
| extend Calc= strcat_delim( ": ", EventId, State, EventType, EpisodeNarrative)
| limit 20

Weather 
| project State, EpisodeNarrative, EventType, BeginLocation
| extend EventType= touppder(EventType)
| extend Calc= strcat_delim( ": ", BeginLocation, State, EndLocation)
| limit 20

Weather 
| project State, EpisodeNarrative, EventType, BeginLocation
| extend EventType= touppder(EventType)
| extend Calc= trim(" ", strcat_delim( ": ", BeginLocation, State, EndLocation))
| limit 20



--Manipulating strings

Weather 
| distinct EventType
| extend FindSpace=indexof(EventType, " ") --FInds spacings by index
--INDEX IN KQL= 0,1,2,3....

Weather 
| distinct EventType
| extend FindSpace=indexof(EventType, " "), BeforeSpace = substring(EventType, 0, 12)


Weather 
| distinct EventType
| extend FindSpace=indexof(strcat(EventType, " "), " "), BeforeSpace = substring(EventType, 0, 4)

Weather 
| distinct EventType
| extend FindSpace=indexof(strcat(EventType, " "), " "),
| extend BeforeSpace = substring(EventType, 0, FindSpace)


Weather 
| distinct EventType
| extend FindSpace=indexof(strcat(EventType, " "), " "),
| extend BeforeSpace = substring(EventType, 0, FindSpace)
| extend AfterSpace = substring(EventType, FindSpace+1, 999)


Weather 
| distinct EventType
| extend FindSpace=indexof(strcat(EventType, " "), " "),
| extend BeforeSpace = substring(EventType, 0, FindSpace), NumberOfCharacters =strlen(EventType)-FindSpace-1
| extend AfterSpace = substring(EventType, FindSpace+1, NumberOfCharacters)


Weather 
| distinct EventType
| extend EventType = replace_string(EventType, "High", "Big")
| extend FindSpace=indexof(strcat(EventType, " "), " "),
| extend BeforeSpace = substring(EventType, 0, FindSpace), NumberOfCharacters =strlen(EventType)-FindSpace-1
| extend AfterSpace = substring(EventType, FindSpace+1, NumberOfCharacters)


--KQL Number Data Types

Weather
|project EpisodeId, EventId
|extend Calc= EpisodeId-EventId /5
|limit 20

print 1/2 --0
print 1/2.0 --0.5

--int, long
--real, decimal

Weather
|project EpisodeId, EventId
|extend Calc= EpisodeId-EventId /int(5)
|limit 20


Weather
|project EpisodeId, EventId
|extend Calc= EpisodeId-EventId /real(5)
|limit 20

--KQL Other Math Functions
Weather
|project EpisodeId, EventId
|extend Calc= round(EpisodeId-EventId /5.0)
|limit 20

Weather
|project EpisodeId, EventId
|extend Calc= ceiling(EpisodeId-EventId /5.0)
|limit 20

Weather
|project EpisodeId, EventId
|extend Calc= ceiling(EpisodeId-EventId /5.0)
|extend Calc2= abs(Calc)
|limit 20

--Sign returns 1=Positive, 0=0, -1=Negative
Weather
|project EpisodeId, EventId
|extend Calc= ceiling(EpisodeId-EventId /5.0)
|extend Calc2= abs(Calc)
|extend Calc3= sign(Calc)
|limit 20


Weather
|project EpisodeId, EventId
|extend Calc= ceiling(EpisodeId-EventId /5.0)
|extend Calc2= abs(Calc)
|extend Calc3= sign(Calc)
|extend Calc4= EpisodeId / (EventId/10)
|extend Calc4= EpisodeId % (EventId/10)
|limit 20


--Datetime and Timespan Data Types

Weather
| distinct StartTime, EndTime
| extend Duration = EndTime-StartTime

print datetime(2030-02-03)
print todatetime('2030-02-03')--as a string
print make_datetime(2030,2,3,1,23,45.6)--year,month,day,hour,minute,second

Weather
| distinct StartTime, EndTime
| extend Duration = EndTime-StartTime, RevisedEndTime=EndTime +1d --d h m s ms

print timespan(1d)
print timespan(3)
print timespan(48 seconds)
print timespan(1.23:45:17.8) -3h
print timespan(1.23:45:17.8) *3



Weather
| distinct StartTime
| where StartTime>= datetime(2007-03-26) and StartTime <= datetime(2007-04-15)

Weather
| distinct StartTime
| where StartTime>= datetime(2007-03-26)..datetime(2007-04-15)

Weather
| distinct StartDate = startofday(StartTime)
| extend Calc = startofweek(StartDate)
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)

Weather
| distinct StartDate = startofday(StartTime)
| extend Calc = datetime_part("week of year", StartDate)
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)



Weather
| distinct StartDate = startofday(StartTime)
| extend Calc = datetime_add("day", 2, StartDate)
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)

Weather
| distinct StartTime, EndTime
| extend Calc =  EndTime - StartTime 
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)


Weather
| distinct StartTime, EndTime
| extend Calc =  EndTime - StartTime , date_diff('day', EndTime, StartTime)
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)

Weather
| distinct StartTime, EndTime
| extend Calc =  datetime_utc_to_local(StartTime,  'US/Eastern')
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)

Weather
| distinct StartTime, EndTime
| extend Calc =  datetime_local_to_utc(StartTime,  'US/Eastern')
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)

print timezones = datetime_list_timezones()
| mc-expand timezones


Weather
| distinct StartTime, EndTime
| extend Calc =format_datetime(StartTime,  'd, MM, yyyy'),
		 Calc2=format_timespan(EndTime-StartTime, 'dd.hh:mm:ss')
| where StartDate>= datetime(2007-03-26)..datetime(2007-04-15)

--Merging data

Weather
| distinct State, EventType
| union kind= inner
(Weather
| disctinct State, EventNarrative)

Weather
| distinct State, EventType
| union kind= outer --DEFAULT
(Weather
| disctinct State, EventNarrative)


Weather
| distinct State, EventType
| union kind= outerwith source= TableSource --adds additional table to show with source table it comes from
(Weather
| disctinct State, EventNarrative


--Can union multiple tables
union Wea*

--Show which column each row comes from
union with source = AdditionalColumn Wea*


--Joining Data
Weather
| join
Region
On State
---
Weather
| join
Region
on ($left.State ==$right.State)
---

Weather
| join
(Region | extend State = toupper(State))
on ($left.State ==$right.State)

--
Weather
| join
(Region | extend State = toupper(State))
On State
--
Weather
| join kind = innerunique
(Region | extend State = toupper(State))
on ($left.State ==$right.State)

--
Weather
| join kind = inner
(Region | extend State = toupper(State))
on ($left.State ==$right.State)


--Identify and resolve duplicate data, missing data or null values

Weather
| join kind = fullouter
(Region | extend State = toupper(State))
on ($left.State ==$right.State)
| where State == ""


Weather
| join kind = fullouter
(Region | extend State = toupper(State))
on ($left.State ==$right.State)
| where State == ""
| distinct State

--Lokking for empty string or isnull
Weather
| join kind = fullouter
(Region | extend State = toupper(State))
on ($left.State ==$right.State)
| where State == "" or isnull(State)


Weather
| join kind = fullouter
(Region | extend State = toupper(State))
on ($left.State ==$right.State)
| where coalesce(State, "") == ""

--Conditional iif/iff and ase functions

Weather 
| summarize NumberOfEvents = count() by State
| extend TexasOrFlorida = iif(State == "TEXAS" or State == "FLORIDA", "TEXAS/FLORIDA", "Other")

Weather 
| summarize NumberOfEvents = count() by State
| extend TexasOrFlorida = iif(State in ("TEXAS", "FLORIDA"), "TEXAS/FLORIDA", "Other")


Weather 
| summarize NumberOfEvents = count() by State
| extend TexasOrFlorida = case(State in ("TEXAS", "FLORIDA"), "TEXAS/FLORIDA", "Other")





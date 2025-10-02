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




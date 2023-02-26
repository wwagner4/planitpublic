/*
First stop time of each trip for route_id 11-WLB-j23-1
+-----------------------+------------+----------+------------+--------+----------------+---------+-------------------------+---------------+-------------+---------------------+-----------------------+-------------+-------------+------------+--------------+-------------+-----------+-------------+-------------------+---------+
|trip_id                |route_id    |service_id|direction_id|block_id|shape_id        |trip_type|trip_headsign            |trip_short_name|bikes_allowed|wheelchair_accessible|trip_id                |stop_id      |stop_sequence|arrival_time|departure_time|stop_headsign|pickup_type|drop_off_type|shape_dist_traveled|timepoint|
+-----------------------+------------+----------+------------+--------+----------------+---------+-------------------------+---------------+-------------+---------------------+-----------------------+-------------+-------------+------------+--------------+-------------+-----------+-------------+-------------------+---------+
|1.T0.11-WLB-j23-1.1.R  |11-WLB-j23-1|T0#62     |1           |null    |11-WLB-j23-1.1.R|null     |Baden Josefsplatz        |null           |0            |0                    |1.T0.11-WLB-j23-1.1.R  |at:49:975:0:7|1            |19:55:00    |19:55:00      |null         |0          |0            |0.0000000000       |0        |
|1.T2.11-WLB-j23-1.1.R  |11-WLB-j23-1|T2#84     |1           |null    |11-WLB-j23-1.1.R|null     |Baden Josefsplatz        |null           |0            |0                    |1.T2.11-WLB-j23-1.1.R  |at:49:975:0:7|1            |19:55:00    |19:55:00      |null         |0          |0            |0.0000000000       |0        |
|1.T3.11-WLB-j23-1.1.R  |11-WLB-j23-1|T3#81     |1           |null    |11-WLB-j23-1.1.R|null     |Baden Josefsplatz        |null           |0            |0                    |1.T3.11-WLB-j23-1.1.R  |at:49:975:0:7|1            |19:55:00    |19:55:00      |null         |0          |0            |0.0000000000       |0        |
|10.T0.11-WLB-j23-1.1.R |11-WLB-j23-1|T0#62     |1           |null    |11-WLB-j23-1.1.R|null     |Baden Josefsplatz        |null           |0            |0                    |10.T0.11-WLB-j23-1.1.R |at:49:975:0:7|1            |22:10:00    |22:10:00      |null         |0          |0            |0.0000000000       |0        |
|10.T2.11-WLB-j23-1.1.R |11-WLB-j23-1|T2#84     |1           |null    |11-WLB-j23-1.1.R|null     |Baden Josefsplatz        |null           |0            |0                    |10.T2.11-WLB-j23-1.1.R |at:49:975:0:7|1            |22:10:00    |22:10:00      |null         |0          |0            |0.0000000000       |0        |
|10.T3.11-WLB-j23-1.1.R |11-WLB-j23-1|T3#81     |1           |null    |11-WLB-j23-1.1.R|null     |Baden Josefsplatz        |null           |0            |0                    |10.T3.11-WLB-j23-1.1.R |at:49:975:0:7|1            |22:10:00    |22:10:00      |null         |0          |0            |0.0000000000       |0        |
|100.T0.11-WLB-j23-1.4.R|11-WLB-j23-1|T0+35#3   |1           |null    |11-WLB-j23-1.4.R|null     |Wien Inzersdorf Lokalbahn|null           |0            |0                    |100.T0.11-WLB-j23-1.4.R|at:49:103:0:1|1            |24:16:00    |24:16:00      |null         |0          |0            |0.0000000000       |0        |
|100.T2.11-WLB-j23-1.4.R|11-WLB-j23-1|T2#84     |1           |null    |11-WLB-j23-1.4.R|null     |Wien Inzersdorf Lokalbahn|null           |0            |0                    |100.T2.11-WLB-j23-1.4.R|at:49:103:0:1|1            |24:16:00    |24:16:00      |null         |0          |0            |0.0000000000       |0        |
|101.T0.11-WLB-j23-1.4.R|11-WLB-j23-1|T0#62     |1           |null    |11-WLB-j23-1.4.R|null     |Wien Inzersdorf Lokalbahn|null           |0            |0                    |101.T0.11-WLB-j23-1.4.R|at:49:103:0:1|1            |24:31:00    |24:31:00      |null         |0          |0            |0.0000000000       |0        |
|101.T2.11-WLB-j23-1.4.R|11-WLB-j23-1|T2#84     |1           |null    |11-WLB-j23-1.4.R|null     |Wien Inzersdorf Lokalbahn|null           |0            |0                    |101.T2.11-WLB-j23-1.4.R|at:49:103:0:1|1            |24:31:00    |24:31:00      |null         |0          |0            |0.0000000000       |0        |
+-----------------------+------------+----------+------------+--------+----------------+---------+-------------------------+---------------+-------------+---------------------+-----------------------+-------------+-------------+------------+--------------+-------------+-----------+-------------+-------------------+---------+
15-R56-B-j23-20
11-WLB-j23-1
 */
select r.route_id, r.route_long_name, s.stop_id, s.stop_name, st.arrival_time
from trips t
         join stop_times st on t.trip_id = st.trip_id and st.stop_sequence = 1
         join routes r on t.route_id = r.route_id
         join stops s on st.stop_id = s.stop_id
where t.route_id = '15-R56-B-j23-20'
order by arrival_time
    limit 40
;


/*
+----------------+------------+------------+-----------------+-------------------+
|shape_id        |shape_pt_lat|shape_pt_lon|shape_pt_sequence|shape_dist_traveled|
+----------------+------------+------------+-----------------+-------------------+
|11-WLB-j23-1.1.R|48.202001613|16.370642529|1                |0.0000000000       |
|11-WLB-j23-1.1.R|48.202061186|16.370372315|2                |21.0900000000      |
|11-WLB-j23-1.1.R|48.202074119|16.370254816|3                |29.9200000000      |
|11-WLB-j23-1.1.R|48.202078430|16.370124560|4                |39.5800000000      |
|11-WLB-j23-1.1.R|48.202088129|16.370019367|5                |47.4600000000      |
|11-WLB-j23-1.1.R|48.202129322|16.369796765|6                |64.5800000000      |
|11-WLB-j23-1.1.R|48.202132076|16.369721037|7                |70.2000000000      |
|11-WLB-j23-1.1.R|48.202120820|16.369664533|8                |74.5700000000      |
|11-WLB-j23-1.1.R|48.202100104|16.369606771|9                |79.4300000000      |
|11-WLB-j23-1.1.R|48.202033705|16.369519096|10               |89.2600000000      |
+----------------+------------+------------+-----------------+-------------------+
 */
select *
from shapes
;

/*
 empty
 */
select *
from route_stops
;


/*
+---------------+-----------------------------+------------+------------+
|stop_id        |stop_name                    |stop_lat    |stop_lon    |
+---------------+-----------------------------+------------+------------+
|at:41:10005:0:1|Sieggraben Gemeindeamt       |47.650111500|16.379279022|
|at:41:10005:0:2|Sieggraben Gemeindeamt       |47.650099397|16.379404786|
|at:41:10018:0:1|Antau Kleine Zeile           |47.774540298|16.475264010|
|at:41:10018:0:2|Antau Kleine Zeile           |47.774449741|16.475335875|
|at:41:10019:0:1|Stöttera Lagerhaus           |47.770036408|16.464475243|
|at:41:10019:0:2|Stöttera Lagerhaus           |47.769849240|16.464349479|
|at:41:10020:0:1|Zemendorf Volksschule        |47.765411364|16.454485977|
|at:41:10020:0:2|Zemendorf Volksschule        |47.765363058|16.454539876|
|at:41:10021:0:1|Zemendorf Wr. Neustädter Str.|47.762525031|16.451332891|
|at:41:10021:0:2|Zemendorf Wr. Neustädter Str.|47.762301605|16.451791031|
+---------------+-----------------------------+------------+------------+
*/
select stop_id, stop_name, stop_lat, stop_lon
from stops
         limit 10
;

/*
empty
 */
select *
from blocks
         limit 10
;

/*
+------------------------+------------+----------+------------+--------+-----------------+---------+-------------------------+---------------+-------------+---------------------+
|trip_id                 |route_id    |service_id|direction_id|block_id|shape_id         |trip_type|trip_headsign            |trip_short_name|bikes_allowed|wheelchair_accessible|
+------------------------+------------+----------+------------+--------+-----------------+---------+-------------------------+---------------+-------------+---------------------+
|1.T0.11-WLB-j23-1.1.R   |11-WLB-j23-1|T0#62     |1           |null    |11-WLB-j23-1.1.R |null     |Baden Josefsplatz        |null           |0            |0                    |
|10.T0.11-WLB-j23-1.1.R  |11-WLB-j23-1|T0#62     |1           |null    |11-WLB-j23-1.1.R |null     |Baden Josefsplatz        |null           |0            |0                    |
|100.T0.11-WLB-j23-1.4.R |11-WLB-j23-1|T0+35#3   |1           |null    |11-WLB-j23-1.4.R |null     |Wien Inzersdorf Lokalbahn|null           |0            |0                    |
|101.T0.11-WLB-j23-1.4.R |11-WLB-j23-1|T0#62     |1           |null    |11-WLB-j23-1.4.R |null     |Wien Inzersdorf Lokalbahn|null           |0            |0                    |
|102.T0.11-WLB-j23-1.11.H|11-WLB-j23-1|T0#62     |0           |null    |11-WLB-j23-1.11.H|null     |Wien Aßmayergasse        |null           |0            |0                    |
|103.T0.11-WLB-j23-1.11.H|11-WLB-j23-1|T0#62     |0           |null    |11-WLB-j23-1.11.H|null     |Wien Aßmayergasse        |null           |0            |0                    |
|104.T0.11-WLB-j23-1.11.H|11-WLB-j23-1|T0#62     |0           |null    |11-WLB-j23-1.11.H|null     |Wien Aßmayergasse        |null           |0            |0                    |
|105.T0.11-WLB-j23-1.11.H|11-WLB-j23-1|T0#62     |0           |null    |11-WLB-j23-1.11.H|null     |Wien Aßmayergasse        |null           |0            |0                    |
|106.T0.11-WLB-j23-1.11.H|11-WLB-j23-1|T0#62     |0           |null    |11-WLB-j23-1.11.H|null     |Wien Aßmayergasse        |null           |0            |0                    |
|107.T0.11-WLB-j23-1.12.H|11-WLB-j23-1|T0#62     |0           |null    |11-WLB-j23-1.12.H|null     |Wien Oper/Karlsplatz U   |null           |0            |0                    |
+------------------------+------------+----------+------------+--------+-----------------+---------+-------------------------+---------------+-------------+---------------------+
*/
select *
from trips
where trip_id like '%T0%'
    limit 10
;

/*
+----------+------+-------+---------+--------+------+--------+------+----------+----------+------------+
|service_id|monday|tuesday|wednesday|thursday|friday|saturday|sunday|start_date|end_date  |service_name|
+----------+------+-------+---------+--------+------+--------+------+----------+----------+------------+
|T0        |1     |1      |1        |1       |1     |0       |0     |2022-12-11|2023-12-09|null        |
|T0#1      |1     |1      |1        |1       |1     |0       |0     |2022-12-11|2023-12-09|null        |
|T0#10     |1     |1      |1        |1       |1     |0       |0     |2022-12-11|2023-02-12|null        |
|T0#11     |1     |1      |1        |1       |1     |0       |0     |2023-02-13|2023-12-09|null        |
|T0#12     |1     |1      |1        |1       |1     |0       |0     |2022-12-11|2023-12-09|null        |
+----------+------+-------+---------+--------+------+--------+------+----------+----------+------------+
*/
select *
from calendar
         limit 5
;


/*
+----------+----------+--------------+
|service_id|date      |exception_type|
+----------+----------+--------------+
|T0#1      |2022-12-26|2             |
|T0#1      |2023-01-06|2             |
|T0#1      |2023-01-23|2             |
|T0#1      |2023-01-24|2             |
|T0#1      |2023-01-25|2             |
+----------+----------+--------------+
 */
select *
from calendar_dates
where service_id = 'T0#1'
    limit 5
;

/*
+---------------+---------+----------------+----------------------------------------------------------------+----------+----------+---------+-----------+----------------+----------------+-------------------+
|route_id       |agency_id|route_short_name|route_long_name                                                 |route_desc|route_type|route_url|route_color|route_text_color|route_sort_order|min_headway_minutes|
+---------------+---------+----------------+----------------------------------------------------------------+----------+----------+---------+-----------+----------------+----------------+-------------------+
|11-WLB-j23-1   |03       |BB              |Baden - Traiskirchen - Guntramsdorf - Wiener Neudorf - Wien Oper|null      |0         |null     |null       |null            |null            |null               |
|11-WLB-j23-2   |03       |BB              |Baden - Traiskirchen - Guntramsdorf - Wiener Neudorf - Wien Oper|null      |0         |null     |null       |null            |null            |null               |
|11-WLB-j23-3   |03       |BB              |Baden - Traiskirchen - Guntramsdorf - Wiener Neudorf - Wien Oper|null      |0         |null     |null       |null            |null            |null               |
|11-WLB-j23-4   |03       |BB              |Baden - Traiskirchen - Guntramsdorf - Wiener Neudorf - Wien Oper|null      |0         |null     |null       |null            |null            |null               |
|15-R56-B-j23-20|81       |R56             |Laubenbachmühle - Mariazell 27.2. 12.3.2023                     |null      |2         |null     |null       |null            |null            |null               |
+---------------+---------+----------------+----------------------------------------------------------------+----------+----------+---------+-----------+----------------+----------------+-------------------+
 */
select *
from routes
where routes.route_short_name like '%T0%'
    limit 5
;

select rt.route_type_name, count(*) as cnt
from routes
         left outer join route_type rt on routes.route_type = rt.route_type
group by rt.route_type_name
order by cnt desc
;

/*
+----------+----------------------------+------------------------------------------------------------------------------+
|route_type|route_type_name             |route_type_desc                                                               |
+----------+----------------------------+------------------------------------------------------------------------------+
|0         |Tram, Streetcar, Light rail |Any light rail or street level system within a metropolitan area              |
|1         |Subway, Metro               |Any underground rail system within a metropolitan area                        |
|2         |Rail                        |Used for intercity or long-distance travel                                    |
|3         |Bus                         |Used for short- and long-distance bus routes                                  |
|4         |Ferry                       |Used for short- and long-distance boat service                                |
|5         |Cable car                   |Used for street-level cable cars where the cable runs beneath the car         |
|6         |Gondola, Suspended cable car|Typically used for aerial cable cars where the car is suspended from the cable|
|7         |Funicular                   |Any rail system designed for steep inclines                                   |
+----------+----------------------------+------------------------------------------------------------------------------+
*/
select route_type, route_type_name, route_type_desc
from route_type
;


select *
from routes
where agency_id = '38'
;

/*
+--------------------------+--+---------+-----+
|agency_name               |id|agency_id|count|
+--------------------------+--+---------+-----+
|Wiener Linien             |4 |04       |437  |
|Österreichische Postbus AG|5 |12       |338  |
|Dr. Richard NÖ            |6 |26       |133  |
|N Bus_n                   |10|89       |77   |
|Blaguss                   |24|14       |40   |
|Retter                    |12|61       |32   |
|Südburg                   |28|53       |30   |
|Dr. Richard               |11|16       |25   |
|Verkehrsbetriebe Gschwindl|14|38       |24   |
|NÖVOG1                    |1 |81       |15   |
|Wr Neustädter Stadtw      |22|20       |14   |
+--------------------------+--+---------+-----+
*/
select a.agency_name, a.id, a.agency_id, count(*)
from routes
         join agency a on a.agency_id = routes.agency_id
group by a.agency_name, a.id, a.agency_id
order by count(*) desc
;

select *
from frequencies
;

select *
from calendar_dates
;

select valid, a.sunday, count(*) as cnt
from (select ('2023-02-26' between start_date and end_date) as valid,
             calendar.*
      from calendar) as a
group by valid, a.sunday
order by valid, sunday
;

select count(*)
from calendar
where '2023-02-26' between start_date and end_date
;

select *
from calendar
order by start_date, end_date desc, service_id
;

select *
from agency
;

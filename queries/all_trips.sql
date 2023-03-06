/*
Has arrival at one day before a certain time
e.g. 2023-03-08 (Wednesday) before 8:00
Can be used to plan the start of a tour.
*/
select count(*)
from (select x.agency_id,
             x.agency_name,
             route_id,
             route_long_name,
             service_id,
             stop_id,
             stop_name,
             stop_lat,
             stop_lon,
             min(arrival_time) as earliest_arrival_time,
             valid,
             case
                 when day = 1 and monday = 1 then true
                 when day = 2 and tuesday = 1 then true
                 when day = 3 and wednesday = 1 then true
                 when day = 4 and thursday = 1 then true
                 when day = 5 and friday = 1 then true
                 when day = 6 and saturday = 1 then true
                 when day = 0 and sunday = 1 then true
                 else false
                 end
                               as valid_day,
             start_date,
             end_date
      from (select r.agency_id,
                   a.agency_name,
                   r.route_id,
                   r.route_long_name,
                   t.service_id,
                   s.stop_id,
                   s.stop_name,
                   s.stop_lat,
                   s.stop_lon,
                   st.arrival_time,
                   ('2023-03-08' between c.start_date and c.end_date)    as valid,
                   extract(dow from to_date('2023-03-08', 'YYYY-MM-DD')) as day,
                   c.sunday,
                   c.monday,
                   c.tuesday,
                   c.wednesday,
                   c.thursday,
                   c.friday,
                   c.saturday,
                   c.start_date,
                   c.end_date
            from trips t
                     join stop_times st on t.trip_id = st.trip_id
                     join routes r on t.route_id = r.route_id
                     join stops s on st.stop_id = s.stop_id
                     join calendar c on t.service_id = c.service_id
                     join agency a on r.agency_id = a.agency_id
            where r.agency_id not in ('04', '20', '52', '96', '82', '06')
            order by departure_time) as x
      where valid = true
      group by x.agency_id, x.agency_name, route_id, route_long_name, service_id,
               stop_id, stop_name, stop_lat, stop_lon, valid,
               day, monday, tuesday, wednesday, thursday, friday, saturday, sunday,
               start_date, end_date) as y
where valid_day = true
and earliest_arrival_time < '10:00:00'
;

/*
Has departure at one day after a certain time
e.g. 2023-03-08 (Wednesday) after 18:00
Can be used to plan the start of a tour.
*/
select count(*)
from (select x.agency_id,
             x.agency_name,
             route_id,
             route_long_name,
             service_id,
             stop_id,
             stop_name,
             stop_lat,
             stop_lon,
             max(departure_time) as latest_departure_time,
             valid,
             case
                 when day = 1 and monday = 1 then true
                 when day = 2 and tuesday = 1 then true
                 when day = 3 and wednesday = 1 then true
                 when day = 4 and thursday = 1 then true
                 when day = 5 and friday = 1 then true
                 when day = 6 and saturday = 1 then true
                 when day = 0 and sunday = 1 then true
                 else false
                 end
                               as valid_day,
             start_date,
             end_date
      from (select r.agency_id,
                   a.agency_name,
                   r.route_id,
                   r.route_long_name,
                   t.service_id,
                   s.stop_id,
                   s.stop_name,
                   s.stop_lat,
                   s.stop_lon,
                   st.departure_time,
                   ('2023-03-08' between c.start_date and c.end_date)    as valid,
                   extract(dow from to_date('2023-03-08', 'YYYY-MM-DD')) as day,
                   c.sunday,
                   c.monday,
                   c.tuesday,
                   c.wednesday,
                   c.thursday,
                   c.friday,
                   c.saturday,
                   c.start_date,
                   c.end_date
            from trips t
                     join stop_times st on t.trip_id = st.trip_id
                     join routes r on t.route_id = r.route_id
                     join stops s on st.stop_id = s.stop_id
                     join calendar c on t.service_id = c.service_id
                     join agency a on r.agency_id = a.agency_id
            where r.agency_id not in ('04', '20', '52', '96', '82', '06')
            order by departure_time) as x
      where valid = true
      group by x.agency_id, x.agency_name, route_id, route_long_name, service_id,
               stop_id, stop_name, stop_lat, stop_lon, valid,
               day, monday, tuesday, wednesday, thursday, friday, saturday, sunday,
               start_date, end_date) as y
where valid_day = true
  and latest_departure_time > '18:00:00'
;


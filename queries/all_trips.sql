/*
 Eearliest arrival at one day for most stops
 count 8740
 */
select x.agency_id,
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
       sunday,
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
             ('2023-03-05' between c.start_date and c.end_date) as valid,
             c.sunday,
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
where x.valid = true
  and x.sunday = 1
group by x.agency_id, x.agency_name, route_id, route_long_name, service_id,
         stop_id, stop_name, stop_lat, stop_lon, valid, sunday,
         start_date, end_date
;

/*
 Latest depart at one day for most stops
 count 8740
 */
select x.agency_id,
       x.agency_name,
       route_id,
       route_long_name,
       service_id,
       stop_id,
       stop_name,
       max(departure_time) as latest_departure_time,
       valid,
       sunday,
       start_date,
       end_date
from (select r.agency_id,
             a.agency_name,
             r.route_id,
             r.route_long_name,
             t.service_id,
             s.stop_id,
             s.stop_name,
             st.departure_time,
             ('2023-03-05' between c.start_date and c.end_date) as valid,
             c.sunday,
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
where x.valid = true
  and x.sunday = 1
group by x.agency_id, x.agency_name, route_id, route_long_name, service_id, stop_id, stop_name, valid, sunday,
         start_date, end_date
;
/*
Around losheim
'at:43:16259:0:1',
'at:43:16258:0:1',
'at:43:16258:0:2'
 */

/*
 All trips for one stop at a date and weekday
 */
select *
from (select r.agency_id,
             r.route_id,
             r.route_long_name,
             t.trip_id,
             t.service_id,
             s.stop_id,
             s.stop_name,
             st.stop_sequence,
             st.departure_time,
             st.arrival_time,
             ('2023-03-05' between c.start_date and c.end_date) as valid,
             c.sunday,
             c.start_date,
             c.end_date
      from trips t
               join stop_times st on t.trip_id = st.trip_id
               join routes r on t.route_id = r.route_id
               join stops s on st.stop_id = s.stop_id
               join calendar c on t.service_id = c.service_id
      where s.stop_id = 'at:43:16259:0:1'
      order by departure_time) as x
where x.valid = true
  and x.sunday = 1
order by arrival_time
;

docker run -v /home/wwagner4/prj/fahrplan/data:/data \
--network host gtfsdb --database_url  postgresql://docker:docker@localhost:5432/gtfsdb \
/data/20230224-0154_gtfs_vor_2023.zip

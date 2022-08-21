```
<copy> 
SELECT
    SDO_UTIL.TO_GEOJSON(GEOMETRY)
FROM
    TORNADO_PATHS
WHERE
    LOSS > 10000000;
</copy>
```

![Image alt text](images/return-geojson-01.png)

```
<copy> 
SELECT
    JSON_ARRAYAGG(
        SDO_UTIL.TO_GEOJSON(GEOMETRY) 
        FORMAT JSON RETURNING CLOB )
FROM
    TORNADO_PATHS
WHERE
    LOSS > 10000000;
</copy>
```

![Image alt text](images/return-geojson-02.png)


```
<copy> 
SELECT
    '{"type": "Feature", "properties": {'
    || '"key":"'|| KEY
    ||'","yr":"'|| YR
    ||'","loss":"'|| LOSS
    ||'"}, "geometry":'|| SDO_UTIL.TO_GEOJSON(GEOMETRY)
    ||'}' AS features
FROM
    TORNADO_PATHS
WHERE
    LOSS > 10000000;
</copy>
```

![Image alt text](images/return-geojson-03.png)

```
<copy> 
SELECT
    JSON_ARRAYAGG( 
        '{"type": "Feature", "properties": {'
        || '"key":"'|| KEY
        ||'","yr":"'|| YR
        ||'","loss":"'|| LOSS
        ||'"}, "geometry":'|| SDO_UTIL.TO_GEOJSON(GEOMETRY)
        ||'}' 
        FORMAT JSON RETURNING CLOB)   
FROM
    TORNADO_PATHS
WHERE
    LOSS > 10000000;
</copy>
```

![Image alt text](images/return-geojson-04.png)

```
<copy> 
SELECT
    '{"type": "FeatureCollection", "features":'
    || JSON_ARRAYAGG( 
        '{"type": "Feature", "properties": {'
        || '"key":"'|| KEY
        ||'","yr":"'|| YR
        ||'","loss":"'|| LOSS
        ||'"}, "geometry":'|| SDO_UTIL.TO_GEOJSON(GEOMETRY)
        ||'}' 
        FORMAT JSON RETURNING CLOB) 
    ||'}'
    AS GEOJSON
FROM
    TORNADO_PATHS
WHERE
    LOSS > 10000000;
</copy>
```

![Image alt text](images/return-geojson-05.png)

![Image alt text](images/return-geojson-06.png)

![Image alt text](images/return-geojson-07.png)

```
<copy> 
SELECT
   '{"type": "FeatureCollection", "features":'
   || JSON_ARRAYAGG( 
       '{"type": "Feature", "properties": {'
       || '"key":"'|| KEY
       ||'","yr":"'|| YR
       ||'","loss":"'|| LOSS
       ||'"}, "geometry":'|| SDO_UTIL.TO_GEOJSON(
                              SDO_GEOM.SDO_BUFFER(GEOMETRY, 5, 1, 'unit=MILE'))
       ||'}' 
       FORMAT JSON RETURNING CLOB)   
   ||'}'
   AS GEOJSON
FROM
    TORNADO_PATHS
WHERE
    LOSS > 10000000;
</copy>
```

![Image alt text](images/return-geojson-08.png)

![Image alt text](images/return-geojson-09.png)
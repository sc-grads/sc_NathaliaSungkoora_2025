/* SPATIAL AGGREGATE QUERIES*/

--POINT

BEGIN TRAN

CREATE TABLE tblGeom (
    GXY GEOMETRY, -- GEOMETRY data type
    Description VARCHAR(30),
    IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1) -- auto-increment ID
)

-- INSERT geometry data: 2 points, 1 via Point(), and 1 multipoint
INSERT INTO tblGeom
VALUES 
    (GEOMETRY::STGeomFromText('POINT (3 4)', 0), 'First point'),
    (GEOMETRY::STGeomFromText('POINT (3 5)', 0), 'Second point'),
    (GEOMETRY::Point(4, 6, 0), 'Third Point'),
    (GEOMETRY::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))', 0), 'Three Points')--COLLECTION OF POINTS

SELECT * FROM tblGeom 
ROLLBACK TRAN 

------------------------------------------------------------------------------------------------------------------------------------------
--POINT queries
BEGIN TRAN 

CREATE TABLE tblGeom (
    GXY GEOMETRY, -- spatial data column
    Description VARCHAR(20),
    IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1) -- auto-increment ID
)

INSERT INTO tblGeom
VALUES 
    (GEOMETRY::STGeomFromText('POINT (3 4)', 0), 'First point'),
    (GEOMETRY::STGeomFromText('POINT (3 5)', 0), 'Second point'),
    (GEOMETRY::Point(4, 6, 0), 'Third Point'),
    (GEOMETRY::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))', 0), 'Three Points')

SELECT * FROM tblGeom -- show all rows

SELECT 
    IDtblGeom, 
    GXY.STGeometryType() AS MyType, -- type of geometry (POINT, MULTIPOINT)
    GXY.STStartPoint().ToString() AS StartingPoint, -- start point (for lines)
    GXY.STEndPoint().ToString() AS EndingPoint, -- end point (for lines)
    GXY.STPointN(1).ToString() AS FirstPoint, -- first point
    GXY.STPointN(2).ToString() AS SecondPoint, -- second point (if exists)
    GXY.STPointN(1).STX AS FirstPointX, -- first point X coordinate
    GXY.STPointN(1).STY AS FirstPointY, -- first point Y coordinate
    GXY.STNumPoints() AS NumberPoints -- number of points in geometry
FROM tblGeom

DECLARE @g GEOMETRY
DECLARE @h GEOMETRY

SELECT @g = GXY FROM tblGeom WHERE IDtblGeom = 1 -- get first geometry
SELECT @h = GXY FROM tblGeom WHERE IDtblGeom = 3 -- get third geometry

SELECT @g.STDistance(@h) AS MyDistance -- distance between two points

ROLLBACK TRAN 


------------------------------------------------------------------------------------------------------------------------------------------
--LINES, POLYGONS AND CIRCLES

BEGIN TRAN 

CREATE TABLE tblGeom (
    GXY GEOMETRY, -- spatial data column
    Description VARCHAR(20),
    IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1) -- auto-increment ID starting at 5
)

INSERT INTO tblGeom
VALUES 
    (GEOMETRY::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),            -- simple line
    (GEOMETRY::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second line'), -- complex line
    (GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'), -- multi lines
    (GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'), -- polygon shape
    (GEOMETRY::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle') -- circle shape

SELECT * FROM tblGeom 


SELECT 
    IDtblGeom, 
    GXY.STGeometryType() AS MyType,            -- geometry type
    GXY.STStartPoint().ToString() AS StartingPoint,  -- start point (if line)
    GXY.STEndPoint().ToString() AS EndingPoint,      -- end point (if line)
    GXY.STPointN(1).ToString() AS FirstPoint,        -- first point
    GXY.STPointN(2).ToString() AS SecondPoint,       -- second point
    GXY.STPointN(1).STX AS FirstPointX,              -- first point X coord
    GXY.STPointN(1).STY AS FirstPointY,              -- first point Y coord
    GXY.STBoundary().ToString() AS Boundary,         -- polygon or shape boundary
    GXY.STLength() AS MyLength,                        -- length (for lines)
    GXY.STNumPoints() AS NumberPoints                  -- total points
FROM tblGeom


DECLARE @g GEOMETRY
SELECT @g = GXY FROM tblGeom WHERE IDtblGeom = 5 -- assign geometry with ID=5 (circle)

SELECT 
    IDtblGeom, 
    GXY.STIntersection(@g).ToString() AS Intersection, -- intersection with circle
    GXY.STDistance(@g) AS DistanceFromFirstLine        -- distance from circle
FROM tblGeom


SELECT 
    GXY.STUnion(@g),  -- union (combined geometry) with circle
    Description
FROM tblGeom
WHERE IDtblGeom = 8 -- ID 8 row only


ROLLBACK TRAN 

------------------------------------------------------------------------------------------------------------------------------------------
--GEOGRAPHY

BEGIN TRAN 
-- Create a TABLE with a GEOGRAPHY column and a PRIMARY key
CREATE TABLE tblGeog (
    GXY GEOGRAPHY,
    Description VARCHAR(30),
    IDtblGeog INT CONSTRAINT PK_tblGeog PRIMARY KEY IDENTITY(1,1)
)

-- Insert 2 POINTs and one LINESTRING into  TABLE
INSERT INTO tblGeog
VALUES		--Coordinates from google maps INVERTED (ensures right lat/long) 
(GEOGRAPHY::STGeomFromText('POINT (-73.993492 40.750525)', 4326), 'Madison Square Gardens, NY'),
(GEOGRAPHY::STGeomFromText('POINT (-0.177452 51.500905)', 4326), 'Royal Albert Hall, London'),
(GEOGRAPHY::STGeomFromText('LINESTRING (-73.993492 40.750525, -0.177452 51.500905)', 4326), 'Connection')

SELECT * FROM tblGeog


DECLARE @g AS GEOGRAPHY
SELECT @g = GXY FROM tblGeog WHERE IDtblGeog = 1

-- Analyze GEOMETRY TYPES and PROPERTIES for each row
SELECT 
    IDtblGeog,
    GXY.STGeometryType() AS MyType,             -- Type: Point/ LineString
    GXY.STStartPoint().ToString() AS StartingPoint,  -- Start point
    GXY.STEndPoint().ToString() AS EndingPoint,      -- End point
    GXY.STPointN(1).ToString() AS FirstPoint,        -- First point
    GXY.STPointN(2).ToString() AS SecondPoint,       -- Second point
    GXY.STLength() AS MyLength,                      -- Length of shape
    GXY.STIntersection(@g).ToString() AS Intersection,  -- Overlap with @g
    GXY.STNumPoints() AS NumberPoints,               -- Total points
    GXY.STDistance(@g) AS DistanceFromFirstLine      -- Distance from @g
FROM tblGeog

-- Compare DISTANCE between 2 points
DECLARE @h AS GEOGRAPHY
SELECT @g = GXY FROM tblGeog WHERE IDtblGeog = 1
SELECT @h = GXY FROM tblGeog WHERE IDtblGeog = 2
SELECT @g.STDistance(@h) AS MyDistance  -- Distance between point 1 and 2

-- Combine 2 shapes (UNION)
SELECT GXY.STUnion(@g)
FROM tblGeog
WHERE IDtblGeog = 2 


ROLLBACK TRAN

-- Show all spatial reference systems
SELECT * FROM sys.spatial_reference_systems

------------------------------------------------------------------------------------------------------------------------------------------
--SPATIAL AGGREGATES
--USing previous geometry query and expanding

BEGIN TRAN 

CREATE TABLE tblGeom (
    GXY GEOMETRY,
    Description VARCHAR(20),
    IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1)
)

-- Insert lines, polygons, and a circle( Adding another shape-second polygon)
INSERT INTO tblGeom
VALUES 
(GEOMETRY::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),
(GEOMETRY::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second line'),
(GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
(GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
(GEOMETRY::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2))', 0), 'Second Polygon'),
(GEOMETRY::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')

SELECT * FROM tblGeom

-- Use FILTER to find shapes that intersect with a given polygon
SELECT * 
FROM tblGeom --Or can use PARSE
WHERE GXY.Filter(geometry::STGeomFromText('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))', 0)) = 1
UNION ALL
SELECT geometry::STGeomFromText('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))', 0), 'Filter', 0

-- Combine all shapes using UNION aggregate
DECLARE @i AS GEOMETRY
SELECT @i = GEOMETRY::UnionAggregate(GXY) 
FROM tblGeom

SELECT @i AS CombinedShapes

-- Combine all shapes into a single collection
DECLARE @j AS GEOMETRY
SELECT @j = GEOMETRY::CollectionAggregate(GXY) 
FROM tblGeom

SELECT @j  -- Show combined collection

-- Show combined shape again
SELECT @i AS CombinedShapes

-- Get smallest bounding box for all shapes
SELECT GEOMETRY::EnvelopeAggregate(GXY) AS Envelope FROM tblGeom

-- Get smallest convex shape that contains all shapes
SELECT GEOMETRY::ConvexHullAggregate(GXY) AS Envelope FROM tblGeom

--cOMBINE both shapes: 
SELECT @i AS CombinedShapes  -- Show combined shape from earlier UNION
 UNION ALL
SELECT GEOMETRY::EnvelopeAggregate(GXY) AS Envelope FROM tblGeom -- Get smallest bounding box around all shapes
 UNION ALL
SELECT GEOMETRY::ConvexHullAggregate(GXY) AS Envelope FROM tblGeom -- Get smallest convex shape containing all shapes


ROLLBACK TRAN 



-- Copyright 2017 Province of British Columbia
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
-- http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- 
-- See the License for the specific language governing permissions and limitations under the License.

INSERT INTO $out_table (designation, designation_id, designation_name, map_tile, geom)

SELECT
   designation,
   designation_id,
   designation_name,
   map_tile,
   ST_MakeValid(geom) as geom
 FROM $in_table
 WHERE map_tile LIKE %s -- AND GeometryType(geom) = 'MULTIPOLYGON'
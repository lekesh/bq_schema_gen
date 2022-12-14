SELECT
 TO_JSON_STRING(
    ARRAY_AGG(STRUCT( 
      IF(is_nullable = 'YES', 'NULLABLE', 'REQUIRED') AS mode,
      column_name AS name,
      data_type AS type)
    ORDER BY ordinal_position), TRUE) AS schema
FROM
  <dataset-name>.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name = '<table-name>';

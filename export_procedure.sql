CREATE OR REPLACE PROCEDURE export_sales_to_s3()
RETURNS STRING
LANGUAGE SQL
AS
$$
DECLARE
  filename STRING;
BEGIN
  LET filename = 'abc' || TO_VARCHAR(CURRENT_DATE, 'DDMMYYYY') || '.csv';

  COPY INTO 's3://my-bucket/sales/' || :filename
  FROM sales
  STORAGE_INTEGRATION = my_s3_integration
  FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = '|' HEADER = TRUE);

  RETURN 'Exported to: ' || filename;
END;
$$;

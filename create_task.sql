CREATE OR REPLACE TASK daily_export_task
  WAREHOUSE = my_wh
  SCHEDULE = 'USING CRON 0 5 * * * UTC'
AS
  CALL export_sales_to_s3();

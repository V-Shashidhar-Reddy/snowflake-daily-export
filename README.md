# Snowflake Daily Export to S3

This project automates exporting data from Snowflake to AWS S3 daily, with date-based filenames.

## Components

1. **Stored Procedure** (`export_sales_to_s3`)  
   Exports `sales` table to a dated CSV in S3.

2. **Task** (`daily_export_task`)  
   Triggers the procedure daily using a cron schedule.

3. **File Format**  
   CSV with pipe (`|`) delimiter and header.

## Setup Steps

1. Run `export_procedure.sql` in Snowflake.
2. Run `create_task.sql` to define the task.
3. Run `start_task.sql` to enable the task.

Ensure your Snowflake account has:
- S3 integration setup (`my_s3_integration`)
- Warehouse access (`my_wh`)


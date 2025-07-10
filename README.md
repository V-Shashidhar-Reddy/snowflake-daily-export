# 🚀 Snowflake Daily Export to S3

This project automates **daily export of Snowflake table data to AWS S3**, generating **CSV files with date-based filenames** like `abc10072025.csv`, `abc11072025.csv`, etc.

---

## 📦 Project Components

1. **Stored Procedure** – `export_sales_to_s3`  
   - Exports `sales` table data into a dated CSV in S3.  
   - Example filename: `abc10072025.csv`

2. **Task** – `daily_export_task`  
   - Triggers the above procedure daily using a CRON schedule.

3. **File Format**  
   - CSV with `|` (pipe) delimiter.  
   - Header row is included.

---

## ⚙️ Prerequisites

Ensure you have:
- ❄️ **Snowflake Warehouse** (e.g., `my_wh`)
- 🪣 **AWS S3 Storage Integration** (e.g., `my_s3_integration`)
- 📁 **Target S3 Bucket** (e.g., `s3://my-bucket/sales/`)

---

## 🛠️ Setup Instructions

### 1. Create the File Format  
(Optional if using inline format)
```sql
CREATE OR REPLACE FILE FORMAT pipe_csv_format
TYPE = 'CSV'
FIELD_DELIMITER = '|'
HEADER = TRUE;

### 2. Create the Stored Procedure
Run export_procedure.sql
It generates dynamic filenames and exports data to S3.

### 3. Create the Task
Run create_task.sql
Schedules the daily export (e.g., every day at 2 AM).

### 4. Start the Task
Run start_task.sql to enable the task.

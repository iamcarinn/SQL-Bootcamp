CREATE OR REPLACE VIEW v_generated_dates AS
SELECT CAST(series AS DATE) AS generated_date
FROM generate_series('2022-01-01' :: date, '2022-01-31', '1 day') AS series
ORDER BY 1;
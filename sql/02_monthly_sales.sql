SELECT
  DATE_TRUNC(DATE(created_at), MONTH) AS sales_month,
  COUNT(DISTINCT order_id) AS order_count,
  COUNT(*) AS item_count,
  ROUND(SUM(sale_price), 2) AS sales
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete'
  AND created_at >= TIMESTAMP('2025-09-01')
  AND created_at < TIMESTAMP('2026-09-01')
GROUP BY sales_month
ORDER BY sales_month ASC;

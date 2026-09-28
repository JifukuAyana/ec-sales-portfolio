SELECT
  p.category,
  COUNT(*) AS item_count,
  ROUND(SUM(oi.sale_price), 2) AS sales,
  ROUND(SUM(p.cost), 2) AS product_cost,
  ROUND(SUM(oi.sale_price - p.cost), 2) AS gross_profit,
  ROUND(
    SAFE_DIVIDE(
      SUM(oi.sale_price - p.cost),
      SUM(oi.sale_price)
    ) * 100,
    2
  ) AS gross_margin_pct,
  COUNTIF(p.cost IS NULL) AS missing_cost_count
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status = 'Complete'
  AND oi.created_at >= TIMESTAMP('2025-09-01')
  AND oi.created_at < TIMESTAMP('2026-09-01')
GROUP BY p.category
ORDER BY gross_profit DESC;
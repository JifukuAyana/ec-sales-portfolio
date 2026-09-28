SELECT
  oi.id AS order_item_id,
  oi.order_id,
  oi.user_id,
  oi.product_id,
  oi.created_at,
  oi.status,
  oi.sale_price,
  p.category,
  p.cost AS product_cost
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.created_at >= TIMESTAMP('2025-09-01')
  AND oi.created_at < TIMESTAMP('2026-09-01')
ORDER BY oi.created_at, oi.id;
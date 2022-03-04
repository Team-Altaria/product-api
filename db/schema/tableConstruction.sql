\c products;
INSERT INTO product_features(product_id, feature_id)
SELECT products.id, features.feature_id
FROM products
  CROSS JOIN  features
-- \c products;
-- COPY products(id, name, slogan, description, category, default_price) FROM '/mnt/c/Users/irvin/Desktop/data/product.csv' DELIMITER ',' CSV HEADER;
-- COPY features(feature_id, product_id, feature, value) FROM '/mnt/c/Users/irvin/Desktop/data/features.csv' DELIMITER ',' CSV HEADER;
-- COPY styles(style_id, productId, name, sale_price, original_price, default_style) FROM '/mnt/c/Users/irvin/Desktop/data/styles.csv' DELIMITER ',' CSV HEADER;
-- COPY photos(photo_id, styleId, url, thumbnail_url) FROM '/mnt/c/Users/irvin/Desktop/data/photos.csv' DELIMITER ',' CSV HEADER;
-- COPY skus(sku_id, styleId, size, quantity) FROM '/mnt/c/Users/irvin/Desktop/data/skus.csv' DELIMITER ',' CSV HEADER;
-- COPY related(related_id, current_product_id, related_product_id) FROM '/mnt/c/Users/irvin/Desktop/data/related.csv' DELIMITER ',' CSV HEADER;



-- \c products;
-- -- \set localpath `pwd`'/data/product.csv'
-- \copy products(id, name, slogan, description, category, default_price) FROM '/mnt/c/Users/irvin/Desktop/data/product.csv' DELIMITER ',' CSV HEADER;
-- -- \set localpath `pwd`'/data/features.csv'
-- \copy features(feature_id, product_id, feature, value) FROM '/mnt/c/Users/irvin/Desktop/data/features.csv' DELIMITER ',' CSV HEADER;
-- -- \set localpath `pwd`'/data/styles.csv'
-- \copy styles(style_id, productId, name, sale_price, original_price, default_style) FROM '/mnt/c/Users/irvin/Desktop/data/styles.csv' DELIMITER ',' CSV HEADER;
-- -- \set localpath `pwd`'/data/photos.csv'
-- \copy photos(photo_id, styleId, url, thumbnail_url) FROM '/mnt/c/Users/irvin/Desktop/data/photos.csv' DELIMITER ',' CSV HEADER;
-- -- \set localpath `pwd`'/data/skus.csv'
-- \copy skus(sku_id, styleId, size, quantity) FROM '/mnt/c/Users/irvin/Desktop/data/skus.csv' DELIMITER ',' CSV HEADER;
-- -- \set localpath `pwd`'/data/related.csv'
-- \copy related(related_id, current_product_id, related_product_id) FROM '/mnt/c/Users/irvin/Desktop/data/related.csv' DELIMITER ',' CSV HEADER;


-- \set localpath `pwd`'/data/product.csv'
\copy products(id, name, slogan, description, category, default_price) FROM '/home/ubuntu/product-api/data/product.csv' DELIMITER ',' CSV HEADER;
-- \set localpath `pwd`'/data/features.csv'
\copy features(feature_id, product_id, feature, value) FROM '/home/ubuntu/product-api/data/features.csv' DELIMITER ',' CSV HEADER;
-- \set localpath `pwd`'/data/styles.csv'
\copy styles(style_id, productId, name, sale_price, original_price, default_style) FROM '/home/ubuntu/product-api/data/styles.csv' DELIMITER ',' CSV HEADER;
-- \set localpath `pwd`'/data/photos.csv'
\copy photos(photo_id, styleId, url, thumbnail_url) FROM '/home/ubuntu/product-api/data/photos.csv' DELIMITER ',' CSV HEADER;
-- \set localpath `pwd`'/data/skus.csv'
\copy skus(sku_id, styleId, size, quantity) FROM '/home/ubuntu/product-api/data/skus.csv' DELIMITER ',' CSV HEADER;
-- \set localpath `pwd`'/data/related.csv'
\copy related(related_id, current_product_id, related_product_id) FROM '/home/ubuntu/product-api/data/related.csv' DELIMITER ',' CSV HEADER;
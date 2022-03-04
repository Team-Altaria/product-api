DROP DATABASE IF EXISTS products;
CREATE DATABASE products;
\c products;
DROP TABLE IF EXISTS products;
CREATE TABLE products(
  id INTEGER NOT NULL,
  campus VARCHAR(8) DEFAULT 'hr-lax',
  name VARCHAR(55) NOT NULL,
  slogan VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  category VARCHAR(255) NOT NULL,
  default_price VARCHAR(30) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT products_pk PRIMARY KEY(id)
) WITH ( OIDS = FALSE);


DROP TABLE IF EXISTS features;
CREATE TABLE features(
  feature_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  feature VARCHAR(55) NOT NULL,
  value VARCHAR(55) NOT NULL,
  CONSTRAINT features_pk PRIMARY KEY(feature_id)
) WITH ( OIDS = FALSE);

CREATE INDEX idx_product_id
ON features(product_id);

DROP TABLE IF EXISTS styles;
CREATE TABLE styles(
  style_id INTEGER NOT NULL,
  productId INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  sale_price  VARCHAR(255) NOT NULL,
  original_price VARCHAR(255) NOT NULL,
  default_style BOOLEAN NOT NULL,
  CONSTRAINT styles_pk PRIMARY KEY(style_id)
) WITH ( OIDS = FALSE);
CREATE INDEX idx_productId
ON styles(productId);

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
  photo_id INTEGER NOT NULL,
  styleId INTEGER NOT NULL,
  url TEXT NOT NULL,
  thumbnail_url TEXT NOT NULL,
  CONSTRAINT photos_pk PRIMARY KEY (photo_id)
) WITH (
  OIDS=FALSE
);
CREATE INDEX idx_photos_styleId
ON photos(styleId);


DROP TABLE IF EXISTS skus;
CREATE TABLE skus (
  sku_id INTEGER NOT NULL,
  styleId INTEGER NOT NULL,
  size VARCHAR(255) NOT NULL,
  quantity INTEGER NOT NULL,
  CONSTRAINT skus_pk PRIMARY KEY (sku_id)
) WITH (
  OIDS=FALSE
);
CREATE INDEX idx_skus_styleId
ON skus(styleId);

DROP TABLE IF EXISTS related;
CREATE TABLE related (
  related_id INTEGER NOT NULL,
  current_product_id INTEGER NOT NULL  DEFAULT NULL,
  related_product_id INTEGER NOT NULL DEFAULT NULL,
  CONSTRAINT related_pk PRIMARY KEY (related_id)
) WITH (
  OIDS=FALSE
);
CREATE INDEX idx_related_cproductId
ON related(current_product_id);
CREATE INDEX idx_related_rproductId
ON related(related_product_id);

DROP TABLE IF EXISTS product_features;
CREATE TABLE product_features (
  product_features_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL REFERENCES products(id) ,
  feature_id INTEGER NOT NULL REFERENCES features(feature_id)
) WITH (
  OIDS=FALSE
);

ALTER TABLE styles
  ADD CONSTRAINT fk_styles_productId FOREIGN KEY (productId) REFERENCES products (id);

ALTER TABLE photos
  ADD CONSTRAINT fk_photos_styleId FOREIGN KEY (styleId) REFERENCES styles(style_id);

ALTER TABLE skus
  ADD CONSTRAINT fk_skus_styleId FOREIGN KEY (styleId) REFERENCES styles(style_id);

ALTER TABLE related
  ADD CONSTRAINT fk_related_cProductId FOREIGN KEY (current_product_id) REFERENCES products(id);

-- ALTER TABLE related
--   ADD CONSTRAINT fk_related_rProductId FOREIGN KEY (related_product_id) REFERENCES products(id);

ALTER TABLE product_features
  ADD CONSTRAINT fk_product_features_pId FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE product_features
  ADD CONSTRAINT fk_product_features_fId FOREIGN KEY (feature_id) REFERENCES features(feature_id);


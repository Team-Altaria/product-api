module.exports= {
  query : `select p.id,
  CASE
  WHEN max(s.productId) IS NOT NULL THEN
  json_agg(json_build_object('style_id',s.style_id, 'name', s.name, 'original_price', s.original_price,
  'sale_price', s.sale_price, 'default?', s.default_style, 'photos', photos, 'skus', skus
  ))
  ELSE
    '[]'::json
  END
  as results

  from products p left join styles s
  on p.id = s.productId
   left join (
  select x.style_id as style_id, json_agg(json_build_object('url',f.url, 'thumbnail_url', f.thumbnail_url))photos
  from styles x join photos f
  on x.style_id = f.styleId
  where x.productId=$1
  group by x.style_id
  ) f on  s.style_id= f.style_id
  left join (
    select y.style_id as style_id, json_object_agg(sk.sku_id, json_build_object('quantity',sk.quantity, 'size', sk.size)) skus
    from styles y join skus sk
    on y.style_id = sk.styleId
    where y.productId=$1
    group by y.style_id
    ) g on  s.style_id= g.style_id
  where p.id=$1
  group by p.id`,

  queryTest:
  `explain analyze select p.id,
  CASE
  WHEN max(s.productId) IS NOT NULL THEN
  json_agg(json_build_object('style_id',s.style_id, 'name', s.name, 'original_price', s.original_price,
  'sale_price', s.sale_price, 'default?', s.default_style, 'photos', photos, 'skus', skus
  ))
  ELSE
    '[]'::json
  END
  as results
  from products p left join styles s
  on p.id = s.productId
   left join (
  select x.style_id as style_id, json_agg(json_build_object('url',f.url, 'thumbnail_url', f.thumbnail_url))photos
  from styles x join photos f
  on x.style_id = f.styleId
  where x.productId=$1
  group by x.style_id
  ) f on  s.style_id= f.style_id
  left join (
    select y.style_id as style_id, json_object_agg(sk.sku_id, json_build_object('quantity',sk.quantity, 'size', sk.size)) skus
    from styles y join skus sk
    on y.style_id = sk.styleId
    where y.productId=$1
    group by y.style_id
    ) g on  s.style_id= g.style_id
  where p.id=$1
  group by p.id`,

  query2: `
   select p.id,
   CASE
  WHEN max(s.productId) IS NOT NULL THEN
    json_agg(json_build_object('style_id',s.style_id, 'name', s.name, 'original_price', s.original_price,
   'sale_price', s.sale_price, 'default?', s.default_style,
   'photos',
   (SELECT json_agg(json_build_object('thumbnail_url', thumbnail_url, 'url', url)) FROM photos WHERE styleId=s.style_id),
   'skus',
   (select json_object_agg(sku_id, json_build_object('quantity',quantity, 'size', size)) FROM skus WHERE styleId=s.style_id )
   ))
   ELSE
   '[]'::json
  END
    as results
   from products p left join styles s
   on p.id = s.productId
   where p.id=$1
   group by p.id
  `,
  query2Test: `
  explain analyze select p.id,
  CASE
 WHEN max(s.productId) IS NOT NULL THEN
   json_agg(json_build_object('style_id',s.style_id, 'name', s.name, 'original_price', s.original_price,
  'sale_price', s.sale_price, 'default?', s.default_style,
  'photos',
  (SELECT json_agg(json_build_object('thumbnail_url', thumbnail_url, 'url', url)) FROM photos WHERE styleId=s.style_id),
  'skus',
  (select json_object_agg(sku_id, json_build_object('quantity',quantity, 'size', size)) FROM skus WHERE styleId=s.style_id )
  ))
  ELSE
  '[]'::json
 END
   as results
  from products p left join styles s
  on p.id = s.productId
  where p.id=$1
  group by p.id
 `
}
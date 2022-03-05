module.exports = {
  query: `
  select
    p.*,
  CASE
  WHEN max(f.product_id) IS NOT NULL THEN
  json_agg(json_build_object('feature', feature,'value', value ))

  ELSE
    '[]'::json
  END
  as features

    from products p
       left join features f on p.id = f.product_id
    where p.id=$1
    group by p.id

  `,
  queryTest:`explain analyze select  p.*,
  CASE
  WHEN max(f.product_id) IS NOT NULL THEN
  json_agg(json_build_object('feature', feature,'value', value ))
  ELSE
    '[]'::json
  END
  as features
    from products p
       left join features f on p.id = f.product_id
    where p.id=$1
    group by p.id`,
  query2: `select row_to_json(p) results
  from (
    select *, (
      select
        coalesce(json_agg(json_build_object('feature', feature, 'value', value)), '[]'::json)
        from features
        where product_id=$1
    ) as features
    from products where id=$1
  ) p
  `,
  query2Test: `explain analyze select row_to_json(p)
  from (
    select id, name, slogan, description, category, default_price, (
      select
        coalesce(json_agg(json_build_object('feature', feature, 'value', value)), '[]'::json)
        from features
        where product_id=10
    ) as features
    from products where id=10
  ) p`,


}
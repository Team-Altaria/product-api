module.exports={
  query: `
  select
  json_agg(r.related_product_id) results
  from products p left join related r
  on p.id = r.current_product_id
  where p.id=$1
  group by p.id
 `,
 queryTest:
 `
 explain analyze
 select
 json_agg(r.related_product_id) results
 from products p left join related r
 on p.id = r.current_product_id
 where p.id=$1
 group by p.id
`

}
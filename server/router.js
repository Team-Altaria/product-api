const express = require('express');
const router = express.Router();
const db = require('../db/index.js')
const pq = require('./product_queries.js')
const sq = require('./style_queries.js')
const rq = require('./related_queries.js')

router.get('/products/:product_id',(req,res) => {
  let id = req.params.product_id;
  db.query(pq.query,[id],(err, response)=>{
    if(err){
      res.send('This product does not exist');
    } if(!response.rowCount){
      res.status(404).send('This product does not exist.')
    }
    else {

      res.send(response.rows[0])
    }
  })

});
router.get('/products/:product_id/styles',(req,res) => {
    let id = req.params.product_id;
    db.query(sq.query2,[id],(err, response)=>{
      if(err){

        res.send('This product does not exist');
      }
    if(!response.rowCount){
      res.status(404).send({id, results:[]})
    }
      else {

        res.send(response.rows[0])
      }
    })
  })

router.get('/products/:product_id/related', (req,res) => {
    let id = req.params.product_id;
    db.query(rq.query,[id],(err, response)=>{
      if(err){
        res.send(err);
      }
      if(!response.rowCount){
        res.status(404).send([])
      }
      else {
        res.send(response.rows[0]?.results)
      }
    })
})

module.exports = router;
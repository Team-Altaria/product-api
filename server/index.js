const express = require('express');
const morgan = require('morgan');
const db = require('../db/index.js')
const router = require('./router')
var cors = require('cors')
const app = express();
const PORT = 3000;
app.use(express.json());
app.use(morgan('dev'));
app.use(cors());
// app.get('/',(req, res)=>{
//   console.log('hi');
//   res.send('hit it')
// }
// )
app.use('/api/fec2/hr-lax', router)



app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`)
})
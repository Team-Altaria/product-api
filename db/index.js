const {Pool} = require('pg');
const config = require('./config.js');
const pool = new Pool(config);
console.log()
module.exports = pool;
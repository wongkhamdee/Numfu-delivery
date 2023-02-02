const mySQL = require('mysql');

const connectionString = {
    connectionLimit : 100,
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'fooddelivery',
    debug           : false,
    prompt          : 3306
}; 

const db = mySQL.createPool(connectionString);

module.exports = {
    db, 
};
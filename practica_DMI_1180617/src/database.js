const mysql = require('mysql');

const mysqlConnection =  mysql.createPool({
    /*host: 'localhost',
    port: '3308',
    user: 'api_dmi_10a',
    password: '1234',
    database: 'empresa_180617'*/
    host: 'bnkevihtav223qgeo5ve-mysql.services.clever-cloud.com',
    port: '3306',
    user: 'ub5lgdq0p9pdbjqf',
    password: 'opWzX6NpyFcZ3Yl6mJlk',
    database: 'bnkevihtav223qgeo5ve'
});




module.exports  = mysqlConnection;
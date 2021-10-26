const mysql = require('mysql');

const mysqlConnection =  mysql.createConnection({
    host: 'localhost',
    port: '3308',
    user: 'api_dmi_10a',
    password: '1234',
    database: 'empresa_180617'
});

mysqlConnection.connect(function (err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('DB esta conectada');
    }
});

module.exports  = mysqlConnection;
const express = require('express');
const res = require('express/lib/response');
const router = express.Router();



const mysqlConnection = require ('../database');

router.get('/', (req, res) => {
    mysqlConnection.query('SELECT * FROM empleados', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

router.get('/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('SELECT * FROM empleados WHERE id = ?', [id], (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    })
});

router.post('/', (req, res) => {
    const {id, nombre, salario} = req.body;
    const query = `

        CALL inserta_actualiza_empleado(?, ?, ?)
    `;
    mysqlConnection.query(query, [id, nombre, salario], (err, rows, fields) => {
        if (!err) {
            res.json({Status: 'Empleados Guardados'});
        } else {
            console.log(err);
        }
    })
});

router.put('/:id', (req, res) => {
    const {nombre, salario } = req.body;
    const {id} = req.params;
    const query = 'CALL inserta_actualiza_empleado(?, ?, ?)';
    mysqlConnection.query(query, [id, nombre, salario], (err, rows, fields) => {
        if (!err) {
            res.json({status: 'Empleado Actualizado'});
        } else {
            console.log(err);
        }
    })
})

router.delete('/:id', (req, res) => {
    const {id} = req.params;
    mysqlConnection.query('DELETE FROM empleados WHERE id = ?', [id], (err, rows, fields) => {
        if (!err) {
            res.json({status: 'Empleados Borrado'});
        } else {
            console.log(err);
        }
    })
})

module.exports = router;
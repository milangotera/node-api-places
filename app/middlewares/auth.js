'use strict';

const auth = {
    getToken: function(req, res, next) {
        if(!req.headers.authorization) {
            return res.status(401).send({
                status: 401,
                message: "No se proporciona token",
            });
        }
        next();
    }
};

module.exports = auth;
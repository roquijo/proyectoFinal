const db = require('../config/config');
const crypto = require('crypto');

const User = {};

User.getAll = () => {
    
    const sql = `
    SELECT 
        * 
    FROM 
        users
    `;

    return db.manyOrNone(sql);
}

User.isPasswordMatched = (userPassword, hash) => {
    const myPasswordHashed = crypto.createHash('md5').update(userPassword).digest('hex');
    if(myPasswordHashed === hash){
        return true;
    }
    return false;
}

User.findById = (id,callback) => {

    const sql = `
    SELECT 
        * 
    FROM 
        users
    WHERE id = '$1'
    `;

    return db.oneOrNone(sql,id).then(user => callback(null,user));
}

User.findByEmail = (email) => {

    const sql = `
    SELECT 
        * 
    FROM 
        users
    WHERE email = $1
    `;

    return db.oneOrNone(sql,email);
}


User.findLogin = (user) => {

    const sql = `
    SELECT 
        * 
    FROM 
        users
    WHERE (email = $1) AND (password=$2)
    `;

    const myPasswordHashed = crypto.createHash('md5').update(user.password).digest('hex');

    return db.oneOrNone(sql,[
        user.email,
        myPasswordHashed
    ]);
}

User.create = (user) => {

    const myPasswordHashed = crypto.createHash('md5').update(user.password).digest('hex');
    user.password = myPasswordHashed;

    const sql = `
    INSERT INTO public.users(
        email, name, lastname, phone, image, password, create_at, update_at)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id;
    `;

    return db.oneOrNone(sql, [
        user.email,
        user.name,
        user.lastname,
        user.phone,
        user.image,
        user.password,
        new Date(), 
        new Date()
    ]);
};

module.exports = User;
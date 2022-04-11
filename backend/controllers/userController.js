const User = require('../models/user');
const jwt =  require('jsonwebtoken');
const keys = require('../config/keys');

module.exports={
    async getAll(req, res, next){
        
        try{
            const data = await User.getAll();
            console.log(`Usuarios: ${data}`);
            return res.status(201).json(data);
        }
        catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al obtener los usuarios'
            });
        }
    },
    async register(req, res, next){

        try{
            const user = req.body;
            const data = await User.create(user);

            return res.status(201).json({
                success: true,
                message: 'El registro se realizo correctamente, ahora inicia sesion',
                data: data.id
            });
        }
        catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error con el registro del usuario',
                error: error
            });
        }
    },
    async login(req, res, next){

        try{
            const data = req.body;
            const user = await User.findByEmail(data.email);

            if(!user){
                return res.status(401).json({
                    success: false,
                    message: 'Email no registrado'
                });
            }
            if(User.isPasswordMatched(data.password, user.password)){
                const token = jwt.sign({id: user.id,email: user.email}, keys.secretOrKey,{
                    //expiresIn: (60*60*24)
                });
                const data = {
                    id:user.id,
                    name: user.name,
                    lastname: user.lastname,
                    email: user.email,
                    phone: user.phone,
                    image: user.image,
                    session_token: `JWT ${token}`
                }

                return res.status(201).json({
                    success: true,
                    message: 'Iniciando Sesion',
                    data: data
                });
            }
            else {
                return res.status(401).json({
                    success: false,
                    message: 'Contraseña incorrecta',
                    data: data
                });
            }         
        }
        catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error, credenciales invalidas',
                error: error
            });
        }
    }
}
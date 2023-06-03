import express from 'express'
import {config} from 'dotenv'
import productosRoutes from './routes/productoRoutes.js'
import proveedoresRoutes from './routes/proveedorRoutes.js'

const app = express()
config()
const PORT = process.env.PORT || 5000

app.use(express.json())

app.get('/',(req,res)=>{
    res.send("Hola mundo");
})

app.use(productosRoutes)
app.use(proveedoresRoutes)

app.listen(PORT,()=>{
    console.log("app running on port",PORT);
})
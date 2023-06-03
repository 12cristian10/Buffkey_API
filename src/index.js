import express from 'express'
import cors from 'cors'
import { PORT } from './config/config.js'
import indexRoutes from './routes/indexRoutes.js'
import productosRoutes from './routes/productoRoutes.js'
import proveedoresRoutes from './routes/proveedorRoutes.js'
import categoriasRoutes from './routes/categoriaRoutes.js'

const app = express()

app.use(cors())

app.use(express.json())

app.use(indexRoutes)
app.use(productosRoutes)
app.use(proveedoresRoutes)
app.use(categoriasRoutes)

app.listen(PORT,()=>{
    console.log("app running on port",PORT);
})
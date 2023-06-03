import {Router} from 'express'
import { getProduct, getAllProducts, createProduct } from '../controllers/productoController.js'

const router = Router()


//router.get('/productos/busqueda', searchProduct)

router.get('/productos/:id', getProduct)

router.get('/productos', getAllProducts)

router.post('/productos',createProduct)

//router.put('/productos/:id',updateProduct)

//router.delete('/productos/:id',deleteProduct)

export default router
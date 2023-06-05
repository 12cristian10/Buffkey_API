import {Router} from 'express'
import { getAllDetailsInv } from '../controllers/DetalleInventarioController.js'


const router = Router()

router.get('/detalle-inventario', getAllDetailsInv)

export default router
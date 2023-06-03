import {Router} from 'express'
import { getAllCategorys } from '../controllers/categoriaController.js'

const router = Router()

router.get('/categorias', getAllCategorys)

export default router
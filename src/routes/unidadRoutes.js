import {Router} from 'express'
import { getAllUnits } from '../controllers/unidadController.js'

const router = Router()

router.get('/unidades', getAllUnits)

export default router
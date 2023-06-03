import {Router} from 'express'
import { initialGreeting } from '../controllers/indexController.js'

const router = Router()

router.get('/', initialGreeting) 


export default router
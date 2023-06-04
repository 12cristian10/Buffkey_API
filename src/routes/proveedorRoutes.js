import {Router} from 'express'
import { getProvider, getAllProviders, createProvider, updateProvider, deleteProvider, searchProvider, getAllNamesProviders } from '../controllers/proveedorController.js'

const router = Router()


router.get('/proveedores/busqueda', searchProvider)

router.get('/proveedores/nombres', getAllNamesProviders)

router.get('/proveedores/:id', getProvider)

router.get('/proveedores', getAllProviders)

router.post('/proveedores',createProvider)

router.put('/proveedores/:id',updateProvider)

router.delete('/proveedores/:id',deleteProvider)

export default router
import { query } from 'express'
import {prisma} from '../dbconn.js'


export const getAllProviders = async (req,res)=>{
    try {
        const proveedores = await prisma.proveedor.findMany() 
        res.json(proveedores)   
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: 'error getting the providers' })
    }
}

export const getProvider = async (req,res)=>{
    try {
        const id = req.params.id
        const provedorEncontrado = await prisma.proveedor.findFirst({
            where:{
                idProveedor:+id 
            }
        })
        res.json(provedorEncontrado)    
    } catch (error) {
        console.error(error)
        res.status(404).json({ message: "Provider not found"})
    }
}

export const searchProvider = async(req,res)=>{
    try {
        const {query} = req.query
        const proveedoresBuscados = await prisma.proveedor.findMany({
            where:{
                nombre:{
                    contains: query,
                }
            }
        })
        res.json(proveedoresBuscados)    
    } catch (error) {
        console.error(error)
        return res.status(500).json({message:"Failed to search for suggestions"})    
    }
}

export const createProvider = async (req,res)=>{
    try {
        const nuevoProveedor = await prisma.proveedor.create({
            data: req.body,
        })
        res.json(nuevoProveedor)   
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error creating the provider' })
    }
}

export const updateProvider = async (req,res)=>{
    try {
        const id = req.params.id
        const proveedorExistente = await prisma.proveedor.findUnique({
            where:{
                idProveedor: +id
            }
        })

        if(!proveedorExistente){
            return res.status(404).json({ error: "Provider not found"})
        }
        const proveedorActualizado = await prisma.proveedor.update({
            where:{
                idProveedor: +id
            },
            data: req.body,
        })

        if(!proveedorActualizado){
            return res.status(404).json({ error: "Provider not updated"})
        }

        res.json(proveedorActualizado)
    } catch (error) {
        console.error(error)
        res.status(500).json({message:"Error internal server"})
    }
}

export const deleteProvider = async (req,res)=>{
    try {
        const id = req.params.id
        const proveedorExistente = await prisma.proveedor.findUnique({
            where:{
                idProveedor: +id
            }
        })

        if(!proveedorExistente){
            return res.status(404).json({ message: "Provider not found"})
        }

        const proveedorEliminado = await prisma.proveedor.delete({
            where:{
                idProveedor:+id 
            }
        })

        if(!proveedorEliminado){
            return res.status(404).json({ message: "Provider not deleted"})
        }
        res.json(proveedorEliminado)
        
    } catch (error) {
        console.error(error)
        res.status(500).json({message:"Error internal server"})        
    }
}

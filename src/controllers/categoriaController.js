import {prisma} from '../config/dbconn.js'

export const getAllCategorys = async (req,res) =>{
    try {
        const categorias = await prisma.categoria.findMany()
        
        res.json(categorias)

    } catch (error) {
        console.error(error)
        res.status(500).json({message:"Error internal server"})
    }
}
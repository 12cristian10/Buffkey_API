import {prisma} from '../config/dbconn.js'

export const getAllUnits = async (req,res) =>{
    try {
        const unidades = await prisma.unidadMedida.findMany()
        
        res.json(unidades)

    } catch (error) {
        console.error(error)
        res.status(500).json({message:"Error internal server"})
    }
}
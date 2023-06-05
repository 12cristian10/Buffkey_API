import {prisma} from '../config/dbconn.js'


export const getAllDetailsInv = async (req,res)=>{
    try {
        const detalles = await prisma.detalleInventario.findMany({
            include:{
                producto:{
                    select:{
                        idProducto:true,
                        nombre:true,
                        categoria:true,
                    }, 
                },
                unidad:true
            }
        }) 
        res.json(detalles)   
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: 'error getting the details' })
    }
}


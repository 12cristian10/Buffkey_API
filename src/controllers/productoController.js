import {prisma} from '../dbconn.js'


export const getAllProducts = async (req,res)=>{
    try {
        const productos = await prisma.producto.findMany() 
        res.json(productos)   
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: 'error getting the products' })
    }
}

export const getProduct = async (req,res)=>{
    try {
        const id = req.params.id
        const productoEncontrado = await prisma.producto.findFirst({
            where:{
                idProducto:+id 
            }
        })
        res.json(productoEncontrado)   
    } catch (error) {
        console.error(error)
        res.status(404).json({ error: "Product not found"})     
    }
}

export const createProduct = async (req,res)=>{
    try {
        const{codigo,nombre,precio,categoria,proveedor,unidad} = req.body 

        const categoriaEncontrada = await prisma.categoria.findUnique({
            where:{idCategoria: +categoria},   
        })
    
        if(!categoriaEncontrada){
            return res.status(404).json({message:"category not found"})
        }

        const proveedorEncontrado = await prisma.proveedor.findUnique({
            where:{idProveedor: +req.body.proveedor},   
        })
    
        if(!proveedorEncontrado){
            return res.status(404).json({message:"provider not found"})
        }
        const producto = await prisma.producto.create({
            data:{
                codigo,
                nombre,
                precio,
                categoria:{
                    connect:{idCategoria:categoria}
                },
                proveedor:{
                    connect:{idProveedor:proveedor}
                },
            },
        })

        return res.status(201).json(producto)
    } catch (error) {
        console.error(error)
        return res.status(500).json({message:"error creating product"})
    }
}

export const updateProduct = async (req,res)=>{
    try {
        
    } catch (error) {
        
    }
}
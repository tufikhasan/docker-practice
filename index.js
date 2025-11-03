const express = require('express')

const app = express()

const port = process.env.PORT || 3000

app.get('/',(req,res)=>{
    return res.json({message: "Hey, I am from container."});
})

app.listen(port,()=>{console.log(`Server started on port http://localhost:${port}`)})
import express from 'express'
import cors from 'cors'
import connectDB from "./db/connection.js";
import web from "./routes/web.js";


//const connectDB = require('./db/database/connection');

//var cors = require('cors')

const app = express()
const port = process.env.PORT || '3000'
//const DATABASE_URL = process.env.DATABASE_URL || "mongodb+srv://RashaSalahat:Asongoficeandfire77@newcluster.fnvdd.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

// Database Connection
connectDB();
// to make the uploads folder available to everyone
app.use('/uploads', express.static('uploads'));
// JSON
app.use(express.json())


//CORS
app.use(cors())

// Load Routes
app.use("/api", web)

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`)
 })

// he solved an issue with putting :"type": "module", in json file
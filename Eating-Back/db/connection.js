import mongoose from 'mongoose';//mongoose module
import dbConfig from "./dbconfig.js";
//const dbConfig = require('./dbconfig')

const connectDB = async() => {
    try {
        const conn = await mongoose.connect(dbConfig.database,)
        console.log(`MongoDB Connected: ${conn.connection.host}`)
    }
    catch (err) {
        console.log(err)
        process.exit(1)
    }
}
export default connectDB
//module.exports = connectDB
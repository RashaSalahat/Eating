import mongoose from "mongoose";

// Defining Schema
const foodSchema = new mongoose.Schema({
  foodname:{type:String, required:true, trim:true},
  time:{type:String, required:true, trim:true},
  calories:{type:String,  trim:true},
  duration:{type:String,  trim:true},
  description:{type:String,  trim:true},
  foodImage: { type: String }
})

// Model 
const FoodModel = mongoose.model("food", foodSchema)

export default FoodModel
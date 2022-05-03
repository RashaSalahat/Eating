import FoodModel from '../models/food.js'

class FoodController {
  static getAllDoc = async(req, res) =>{
    try {
      const result = await FoodModel.find()
      res.send(result)
    } catch (error) {
      console.log(error)
    }
  }
}

export default FoodController
import express from 'express';
import FoodController from '../controllers/foodController.js';
import FoodModel from '../models/food.js';
const router = express.Router();
import multer from 'multer';
import mongoose from 'mongoose';

// multer is an alternative for body-parser
//multer will store images inside uploads folder

const storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, './uploads/');
  },
  filename: function(req, file, cb) {
    cb(null, new Date().toISOString().replace(/:/g, '-') + file.originalname);

  }

});

const fileFilter = (req, file, cb) => {
  //to reject or accept an incoming file
  // reject a file
  if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
    cb(null, true);//accept the file
  } else {
    cb(null, false); // ignore the file
  }
};

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 5
  },
  fileFilter: fileFilter
});

router.get('/', (req, res) => {
    res.send('Hello World')
})
router.get('/food', FoodController.getAllDoc)


//upload.single('productImage'),
router.post("/", upload.single('foodImage'), (req, res, next) => {
  console.log(req.file); 
  //new obj available to you due to upload.single('productImage') this middleware being executed first
  req.file.path = req.file.path.replace(/\\/g, '/') ;
 const Food= new FoodModel({
    _id: new mongoose.Types.ObjectId(),
    foodname: req.body.foodname,
    time: req.body.time,
    duration:req.body.duration,
    calories:req.body.calories,
    description:req.body.description,
    foodImage: req.file.path 
  });
  Food
    .save()
    .then(result => {
      console.log(result);
      res.status(201).json({
        message: "Created product successfully",
      });
    })
    .catch(err => {
      console.log(err);
      res.status(500).json({
        error: err
      });
    });
});





export default router
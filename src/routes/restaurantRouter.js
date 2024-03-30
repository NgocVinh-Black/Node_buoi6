import express from "express";
import {
  getLikeResId,
  getRateResId,
} from "../controllers/restaurantController.js";

const restaurantRouter = express.Router();

restaurantRouter.get("/get-like-res/:resId", getLikeResId);
restaurantRouter.get("/get-rate-res/:resId", getRateResId);

export default restaurantRouter;

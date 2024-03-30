import express from "express";
import {
  getLikeUserId,
  getRateUserId,
  userLikeRes,
  userOderRes,
  userRateRes,
} from "../controllers/userController.js";

const userRouter = express.Router();

userRouter.get("/get-like-user/:userId", getLikeUserId);
userRouter.get("/get-rate-user/:userId", getRateUserId);
userRouter.post("/userLikeRes", userLikeRes);
userRouter.post("/userRateRes", userRateRes);
userRouter.post("/userOderRes", userOderRes);

export default userRouter;

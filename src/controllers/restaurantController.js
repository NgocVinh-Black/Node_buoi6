import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";

const model = initModels(sequelize);

const getLikeResId = async (req, res) => {
  try {
    let { resId } = req.params;
    let data = await model.like_res.findAll({
      where: {
        res_id: resId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi khi truy vấn dữ liệu", 500, null);
  }
};

const getRateResId = async (req, res) => {
  try {
    let { resId } = req.params;
    let data = await model.rate_res.findAll({
      where: {
        res_id: resId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi khi truy vấn dữ liệu", 500, null);
  }
};

export { getLikeResId,getRateResId };

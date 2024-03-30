import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";

const model = initModels(sequelize);

const getLikeUserId = async (req, res) => {
  try {
    let { userId } = req.params;
    let data = await model.like_res.findAll({
      where: {
        user_id: userId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi khi truy vấn dữ liệu", 500, null);
  }
};
const getRateUserId = async (req, res) => {
  try {
    let { userId } = req.params;
    let data = await model.rate_res.findAll({
      where: {
        user_id: userId,
      },
    });
    responseData(res, "Thành công", 200, data);
  } catch (error) {
    responseData(res, "Lỗi khi truy vấn dữ liệu", 500, null);
  }
};
const userLikeRes = async (req, res) => {
  try {
    let { userId, resId } = req.body;

    // Kiểm tra xem người dùng đã thích tài nguyên này trước đó hay chưa
    let existingLike = await model.like_res.findOne({
      where: {
        user_id: userId,
        res_id: resId,
      },
    });

    if (existingLike) {
      // Nếu đã thích trước đó, thực hiện unlike bằng cách xóa bản ghi khỏi bảng like_res
      await model.like_res.destroy({
        where: {
          user_id: userId,
          res_id: resId,
        },
      });
      // Phản hồi cho client với thông điệp đã unlike
      responseData(res, "Unlike thành công", 200, null);
    } else {
      // Nếu chưa thích trước đó, thực hiện like bằng cách thêm bản ghi mới vào bảng like_res
      await model.like_res.create({
        user_id: userId,
        res_id: resId,
        date_like: new Date(), // Lưu thời gian hiện tại khi thích
      });
      // Phản hồi cho client với thông điệp đã like
      responseData(res, "Like thành công", 200, null);
    }
  } catch (error) {
    console.error("Error:", error);
    // Phản hồi cho client trong trường hợp có lỗi
    responseData(res, "Lỗi nội bộ", 500, null);
  }
};
const userRateRes = async (req, res) => {
  try {
    let { userId, resId, amount } = req.body;

    // Thực hiện truy vấn INSERT để thêm đánh giá mới vào bảng rate_res
    await model.rate_res.create({
      user_id: userId,
      res_id: resId,
      amount: amount,
      date_rate: new Date(), // Lưu thời gian hiện tại khi thêm đánh giá
    });

    // Phản hồi cho client
    responseData(res, "Thành công", 200, "");
  } catch (error) {
    responseData(res, "Lỗi nội bộ", 500, "");
  }
};
const userOderRes = async (req, res) => {
  try {
    // Lấy thông tin từ req.body
    let { userId, foodId, amount, code, arr_sub_id } = req.body;

    // Kiểm tra xem có thiếu thông tin đơn hàng hay không
    if (!userId || !foodId || !amount || !code || !arr_sub_id) {
      responseData(res, "Thiếu thông tin đơn hàng", 400, null);
      return;
    }

    // Tạo một đối tượng model chứa thông tin của đơn hàng mới
    let orderData = {
      user_id: userId,
      food_id: foodId,
      amount: amount,
      code: code,
      arr_sub_id: arr_sub_id,
    };

    // Thêm đơn hàng mới vào bảng orders
    await model.orders.create(orderData);

    // Phản hồi cho client với thông điệp thành công
    responseData(res, "Đặt hàng thành công", 200, "");
  } catch (error) {
    console.error("Lỗi khi thêm đơn hàng:", error);
    // Phản hồi cho client trong trường hợp có lỗi
    responseData(res, "Lỗi nội bộ", 500, "");
  }
};

export { getLikeUserId, getRateUserId, userLikeRes, userRateRes, userOderRes };

CREATE TABLE Users (
                       user_id SERIAL PRIMARY KEY,
                       username VARCHAR(50) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       role VARCHAR(50) NOT NULL,
                       status BOOLEAN DEFAULT TRUE
);

CREATE TABLE Restaurants (
                             restaurant_id SERIAL PRIMARY KEY,
                             name VARCHAR(1000) NOT NULL,
                             description VARCHAR(1000),
                             address VARCHAR(1000),
                             image_url VARCHAR(255),
                             status BOOLEAN DEFAULT TRUE
);

CREATE TABLE Products (
                          product_id SERIAL PRIMARY KEY,
                          restaurant_id INT,
                          name VARCHAR(100) NOT NULL,
                          description VARCHAR(100),
                          price BIGINT NOT NULL,
                          image_url VARCHAR(1000),
                          quantity INT DEFAULT 0,
                          status BOOLEAN DEFAULT TRUE,
                          FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Carts (
                       user_id INT,
                       product_id INT,
                       quantity INT,
                       FOREIGN KEY (user_id) REFERENCES Users(user_id),
                       FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Addresses (
                           address_id SERIAL PRIMARY KEY,
                           order_id INT,
                           user_id INT,
                           receiver_name VARCHAR(100) NOT NULL,
                           phone_number VARCHAR(20) NOT NULL,
                           address VARCHAR(1000) NOT NULL,
                           status BOOLEAN DEFAULT TRUE,
                           FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Checkout (
                          user_id INT,
                          product_id INT,
                          quantity INT,
                          total BIGINT,
                          FOREIGN KEY (user_id) REFERENCES Users(user_id),
                          FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Orders (
                        order_id SERIAL PRIMARY KEY,
                        user_id INT,
                        order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        order_status INT DEFAULT 0,
                        status BOOLEAN DEFAULT TRUE,
                        FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE OrderDetails (
                              order_detail_id SERIAL PRIMARY KEY,
                              order_id INT,
                              product_id INT,
                              restaurant_id INT,
                              quantity INT,
                              total_price BIGINT,
                              address_id INT,
                              order_status INT DEFAULT 1,
                              status BOOLEAN DEFAULT TRUE,
                              FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                              FOREIGN KEY (product_id) REFERENCES Products(product_id),
                              FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
                              FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE OrderStatus (
                             status_id SERIAL PRIMARY KEY,
                             status_name VARCHAR(50) NOT NULL,
                             status_role VARCHAR(50)
);

CREATE TABLE Reviews (
                         review_id SERIAL PRIMARY KEY,
                         product_id INT,
                         user_id INT,
                         rating INT,
                         comment TEXT,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (product_id) REFERENCES Products(product_id),
                         FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE RestaurantManagement (
                                      seller_id INT,
                                      restaurant_id INT,
                                      FOREIGN KEY (seller_id) REFERENCES Users(user_id),
                                      FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE RestaurantRecords (
                                   restaurant_id INT,
                                   sales_id INTEGER,
                                   FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE RestaurantSales (
                                 index SERIAL PRIMARY KEY,
                                 sales_id INT,
                                 product_id INT,
                                 quantity INT,
                                 total_sales BIGINT,
                                 date DATE,
                                 FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Expenses (
                          restaurant_id INT,
                          expenses BIGINT,
                          FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

INSERT INTO Users (username, password, email, full_name, role)
VALUES
    ('admin', md5('123'), 'admin@example.com', 'Admin', 'admin'),
    ('Thien', md5('12345'), 'thien@gmail.com', 'Thien Seller', 'seller'),
    ('Khai', md5('12345'), 'khai@gmail.com', 'Khai Seller', 'seller'),
    ('Phat', md5('12345'), 'phat@gmail.com', 'Phat Seller','seller'),
    ('Bao', md5('12345'), 'bao@gmail.com', 'Bao Seller','seller'),
    ('Tien', md5('12345'), 'tien@gmail.com', 'Tien Seller','seller'),
    ('Khang', md5('12345'), 'khang@gmail.com', 'Khang Seller','seller'),
    ('Loi', md5('12345'), 'loi@gmail.com', 'Loi Seller','seller'),
    ('Nghia', md5('12345'), 'nghia@gmail.com', 'Nghia Seller','seller'),
    ('Hao', md5('12345'), 'hao@gmail.com', 'Hao Seller','seller'),
    ('Quy', md5('12345'), 'quy@gmail.com', 'Quy Seller','seller'),
    ('Huy', md5('12345'), 'huy@gmail.com', 'Huy Seller','seller'),
    ('Phong', md5('12345'), 'Phong@gmail.com', 'Phong Seller','seller'),
    ('Anh', md5('123az'), 'anh@gmail.com', 'Anh User', 'user'),
    ('Hoa', md5('123az'), 'hoa@gmail.com', 'Hoa User', 'user'),
    ('Nam', md5('123az'), 'nam@gmail.com', 'Nam User', 'user');



INSERT INTO Restaurants
VALUES
    (1, 'Nhà Hàng Bánh Mì', 'Nhà hàng chuyên phục vụ các loại bánh mì ngon và đa dạng.', '123 Đường NVL:, Cần Thơ', './images/shops/banh_mi_shop.jpg'),
    (2, 'Nhà Hàng Pizza', 'Nhà hàng chuyên phục vụ pizza hấp dẫn và đa dạng.', '456 Đường NVC, Cần Thơ', './images/shops/pizza_shop.jpg'),
    (3, 'Quán Trà Sữa', 'Quán trà sữa với nhiều loại thức uống độc đáo và ngon miệng.', '789 Đường TVK, Cần Thơ', './images/shops/tra_sua_shop.jpg'),
    (4, 'Quán Gà Rán và Hamburger', 'Quán phục vụ gà rán và hamburger chất lượng và đa dạng.', '101 Đường Trần Nam Phú, Cần Thơ', './images/shops/ga_ran_hamburger_shop.jpg'),
    (5, 'Quán Cháo', 'Quán cháo với các loại cháo truyền thống và đậm đà.', '222 Đường NVC Cần Thơ', './images/shops/chao_shop.jpg'),
    (6, 'Nhà Hàng Salad', 'Nhà hàng chuyên phục vụ các loại salad tươi ngon và bổ dưỡng.', '333 Đường Ngô Gia Tự, Cần Thơ', './images/shops/salad_shop.jpg'),
    (7, 'Nhà Hàng Mì Ý', 'Nhà hàng chuyên phục vụ các loại mì Ý thơm ngon và đa dạng.', '444 Đường Bùi Hữu Nghĩa, Cần Thơ', './images/shops/mi_y_shop.jpg'),
    (8, 'Nhà Hàng Hủ Tiếu', 'Nhà hàng chuyên phục vụ các loại hủ tiếu truyền thống và ngon miệng.', '555 Đường XVNT, Cần Thơ', './images/shops/hu_tieu_shop.jpg'),
    (9, 'Nhà Hàng Cơm', 'Nhà hàng phục vụ các loại cơm truyền thống và ngon miệng.', '666 Đường NVL, Cần Thơ', './images/shops/com_shop.jpg'),
    (10, 'Quán Ăn Vặt ', 'Quán ăn vặt phục vụ các loại đồ ăn vặt với nhiều hương vị đa dạng.', '777 Đường TVK, Cần Thơ', './images/shops/an_vat_shop.jpg'),
    (11, 'Quán Đồ Uống Lạnh', 'Quán phục vụ các loại đồ uống lạnh thơm ngon và đa dạng.', '888 Đường TVk, Cần Thơ', './images/shops/do_uong_lanh_shop.jpg'),
    (12, 'Nhà Hàng Phục Vụ Bún', 'Nhà hàng phục vụ đa dạng các món ăn từ bún.', '999 Đường NVC, Cần Thơ', './images/shops/bun_shop.jpg');



INSERT INTO Products
VALUES
    (10001,1, 'Bánh mì thịt nướng', 'Bánh mì bao gồm: Thịt nướng, dưa leo, rau mùi, hành tây, sốt me', 20000, 'https://cdn.tgdd.vn/Files/2021/08/20/1376583/cach-lam-banh-mi-thit-nuong-cuc-don-gian-bang-chai-nhua-co-san-tai-nha-202108201640593483.jpg'),
    (10002,1, 'Bánh mì gà xé', 'Bánh mì bao gồm: Gà xé, dưa leo, rau mùi, hành tây, sốt tiêu đen', 18000, 'https://img-global.cpcdn.com/recipes/af0effef7bda9eb1/1200x630cq70/photo.jpg'),
    (10003,1, 'Bánh mì bì', 'Bánh mì bao gồm: Bì heo, dưa leo, rau mùi, hành tây, sốt tương', 17000, 'https://bepnha.kingfoodmart.com/wp-content/uploads/2021/10/cach-lam-banh-mi-nhan-bi-banh-banh-ngot-930124246021.jpg'),
    (10004,1, 'Bánh mì chả cá', 'Bánh mì bao gồm: Chả cá, dưa leo, rau mùi, hành tây, sốt mắm', 22000, 'https://cdn.tgdd.vn/Files/2022/11/23/1489610/cach-lam-banh-mi-cha-ca-don-gian-cho-bua-sang-day-dinh-duong-202211301148589006.jpg'),
    (10005,1, 'Bánh mì trứng ốp-la', 'Bánh mì bao gồm: Trứng ốp-la, chả lụa, dưa leo, rau mùi, hành tây, sốt cà chua', 19000, 'https://img-global.cpcdn.com/recipes/01914f4be6cc4786/1200x630cq70/photo.jpg');

INSERT INTO Products
VALUES
    (20001, 2, 'Pizza Hải Sản', 'Pizza thơm ngon với các loại hải sản tươi ngon.', 90000, 'https://cdn.tgdd.vn/2020/09/CookProduct/1200bzhspm-1200x676.jpg'),
    (20002, 2, 'Pizza Bò Nướng', 'Pizza thơm ngon với thịt bò nướng và rau cải.', 120000, 'https://cdn.tgdd.vn/Files/2020/03/02/1239523/cach-lam-banh-pizza-bo-tai-nha-ngon-khong-kem-ngoai-tiem-202205241428465475.jpg'),
    (20003, 2, 'Pizza Gà BBQ', 'Pizza thơm ngon với thịt gà BBQ và rau cải.', 110000, 'https://daylambanh.edu.vn/wp-content/uploads/2019/12/pizza-ga-thom-ngon.jpg'),
    (20004, 2, 'Pizza Rau Cải', 'Pizza thơm ngon với nhiều loại rau cải tươi ngon.', 70000, 'https://img-global.cpcdn.com/recipes/840fe64391f60550/680x482cq70/pizza-rau-n%E1%BA%A5m-pizza-chay-recipe-main-photo.jpg'),
    (20005, 2, 'Pizza Phô Mai Tôm', 'Pizza thơm ngon với phô mai và tôm tươi.', 10000, 'https://chianui.vn/wp-content/uploads/2019/09/banh-pizza-tom.jpg');
-- Trà Sữa
INSERT INTO Products
VALUES
    (30001, 3, 'Trà Sữa Matcha', 'Trà sữa Matcha thơm ngon và bổ dưỡng.', 35000, 'https://lh3.googleusercontent.com/proxy/6LOseZXK-RME-vYkdZvficmweau6NDoDFGg4uaFkSuc7poeooLkaFu6qE4BYkx3kJWC6nATS2sfkQ3iF9qt7P2wdAHQOlchWRDAiO3tdgk2HbaEWYWYrj2GyjTaXhXCBavcC--LVB4224RXEKlKT'),
    (30002, 3, 'Trà Sữa Trân Châu Đen', 'Trà sữa trân châu đen thơm ngon và đặc biệt.', 25000, 'https://cdn.tgdd.vn/Files/2022/01/21/1412109/huong-dan-cach-lam-tra-sua-tran-chau-duong-den-202201211522033706.jpg'),
    (30003, 3, 'Trà Sữa Thái Xanh', 'Trà sữa Thái xanh thơm ngon và mát lạnh.', 28000, 'https://cdn.tgdd.vn/Files/2019/11/11/1217662/4-cach-nau-tra-sua-thai-xanh-va-tra-sua-thai-do-ngon-tai-nha-202203180949391758.jpg'),
    (30004, 3, 'Trà Sữa Oolong', 'Trà sữa Oolong thơm ngon và ngọt dịu.', 26000, 'https://cdn.tgdd.vn/Files/2021/08/10/1374190/cach-pha-tra-sua-o-long-truyen-thong-thom-ngon-de-lam-tai-nha-202108100854138710.jpg'),
    (30005, 3, 'Trà Sữa Hoa Hồng', 'Trà sữa Hoa Hồng thơm ngon và lạ miệng.', 22000, 'https://file.hstatic.net/1000135323/article/hh0_188ebf32b994471c9e974affde4b6a94.jpg');

-- Gà Rán và Hamburger
INSERT INTO Products
VALUES
    (40001, 4, 'Gà Rán Kentucky', 'Gà rán Kentucky thơm ngon và giòn rụm.', 80000, 'https://cdn.tgdd.vn/Files/2021/01/13/1320026/cach-lam-ga-ran-kfc-bang-noi-chien-khong-dau-gion-rum-an-khong-ngay-202202231031137197.jpg'),
    (40002, 4, 'Gà Rán Tẩm Bột', 'Gà rán tẩm bột thơm ngon và đậm đà.', 85000, 'https://cdn.tgdd.vn/2020/08/CookProduct/Untitled-4-1200x676-4.jpg'),
    (40003, 4, 'Hamburger Phô Mai', 'Hamburger phô mai thơm ngon và béo ngậy.', 40000, 'https://chianui.vn/wp-content/uploads/2019/05/burger-ga-trung.jpg'),
    (40004, 4, 'Hamburger Gà', 'Hamburger gà thơm ngon và nhiều chất dinh dưỡng.', 50000, 'https://cdn.tgdd.vn/Files/2022/01/06/1409368/3-cach-lam-banh-hamburger-ga-ngon-nhu-ngoai-tiem-202201070934570531.jpg'),
    (40005, 4, 'Gà Rán Hải Sản', 'Gà rán hải sản thơm ngon và đặc biệt.', 10000, 'https://haisanhonghiep.com/wp-content/uploads/2022/02/271795358_5000022550019859_2985223887380122764_n.jpg');

-- Cháo
INSERT INTO Products
VALUES
    (50001, 5, 'Cháo Gà', 'Cháo gà thơm ngon và bổ dưỡng.', 25000, 'https://images.squarespace-cdn.com/content/v1/52d3fafee4b03c7eaedee15f/cee25fa1-5b96-4d2c-9c6f-f90a1544bd84/2023_01_05EOS+M55795.jpg'),
    (50002, 5, 'Cháo Lươn', 'Cháo lươn thơm ngon và đặc sắc.', 27000, 'https://cdn.tgdd.vn/2022/05/CookRecipe/Avatar/chao-luon-an-dam-cho-be-thumbnail.jpeg'),
    (50003, 5, 'Cháo Cá', 'Cháo cá thơm ngon và đậm đà.', 26000, 'https://statics.vinpearl.com/chao-ca-loc--_1628433517.jpg'),
    (50004, 5, 'Cháo Bồ Câu', 'Cháo bồ câu thơm ngon và đặc biệt.', 32000, 'https://cdn.tgdd.vn/2020/12/CookProduct/1200nungla675nha-1200x675-1.jpg'),
    (50005, 5, 'Cháo Hải Sản', 'Cháo hải sản thơm ngon và đa dạng.', 30000, 'https://cdn.tgdd.vn/2021/12/CookDish/cach-nau-chao-hai-san-nhieu-dinh-duong-am-bung-cuc-don-gian-avt-1200x676.jpg');

-- Salad
INSERT INTO Products
VALUES
    (60001, 6, 'Salad Cà Rốt', 'Salad cà rốt tươi ngon và bổ dưỡng.', 30000, 'https://media.suckhoecong.vn/thumb_x800x450/Images/Uploaded/Share/2020/05/04/cach-lam-salad-ca-rot-tao-don-gian-thom-ngon-tai-nha11588645642.jpg'),
    (60002, 6, 'Salad Rau Cải', 'Salad rau cải tươi ngon và đa dạng.', 30000, 'https://cdn.tgdd.vn/2021/10/CookRecipe/Avatar/salad-bap-cai-tim-thumbnail.jpg'),
    (60003, 6, 'Salad Thịt Gà', 'Salad thịt gà thơm ngon và đầy dinh dưỡng.', 40000, 'https://cdn.tgdd.vn/Files/2022/04/07/1424461/cach-lam-salad-ga-xe-hap-dan-don-gian-ngon-me-ly-de-lam-tai-nha-202204071127552808.jpg'),
    (60004, 6, 'Salad Cá Ngừ', 'Salad cá ngừ tươi ngon và đặc sắc.', 45000, 'https://cdn.hellobacsi.com/wp-content/uploads/2021/12/salad-ca-ngu.jpg?w=750&q=75'),
    (60005, 6, 'Salad Hải Sản', 'Salad hải sản tươi ngon và đa dạng.', 55000, 'https://iv.vnecdn.net/giadinh/images/web/2021/06/09/salad-mien-tron-hai-san-kieu-thai-1623235320.png');

-- Mì Ý
INSERT INTO Products
VALUES
    (70001, 7, 'Mì Ý Carbonara', 'Mì Ý Carbonara thơm ngon và đậm đà.', 45000, 'https://cdn.tgdd.vn/Files/2022/04/14/1425697/cach-lam-mi-y-carbonara-la-mieng-kho-co-the-nao-quen-202204140906460529.jpg'),
    (70002, 7, 'Mì Ý Bò Bằm', 'Mì Ý Bò Bằm thơm ngon và đặc sắc.', 55000, 'https://cdn.tgdd.vn/2021/11/CookRecipe/Avatar/mi-y-sot-ca-chua-bo-bam-cong-thuc-duoc-chia-se-tu-nguoi-dung-thumbnail.jpg'),
    (70003, 7, 'Mì Ý Hải Sản', 'Mì Ý Hải Sản thơm ngon và đa dạng.', 55000, 'https://lh3.googleusercontent.com/proxy/9L-_P4Raqaqw5eqjGdSL5fOATt46hRU-CJQMeVIvj8pIJx_GKM3939tb2V1DlJpKVEbf7AjT9x8X38fBDEE7pOdVsMR5V9pGy7nVVQacUqQ2m4gI7Bqq9lTUnClxpd8'),
    (70004, 7, 'Mì Ý Xúc Xích', 'Mì Ý Xúc Xích thơm ngon và đầy đặn.', 50000, 'https://cdn.tgdd.vn/2021/10/CookRecipe/Avatar/mi-y-xien-xuc-xich-thumbnail.jpg'),
    (70005, 7, 'Mì Ý Nấm', 'Mì Ý Nấm thơm ngon và bổ dưỡng.', 53000, 'https://api.tomimarkets.com/uploads/My_Y_xao_nam_dong_co_Tomimarkets_1_7d3f151a55.jpg');

-- Hủ Tiếu
INSERT INTO Products
VALUES
    (80001, 8, 'Hủ Tiếu Nam Vang', 'Hủ tiếu Nam Vang thơm ngon và đặc sắc.', 27000, 'https://i-giadinh.vnecdn.net/2023/05/15/Buoc-8-Thanh-pham-1-8-8366-1684125654.jpg'),
    (80002, 8, 'Hủ Tiếu Mì Sài Gòn', 'Hủ tiếu mì Sài Gòn thơm ngon và đa dạng.', 25000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/07/anh-1.png'),
    (80003, 8, 'Hủ Tiếu Tôm', 'Hủ tiếu tôm thơm ngon và đặc biệt.', 28000, 'https://blog.onelife.vn/wp-content/uploads/2021/10/cach-lam-hu-tieu-tom-thit-mon-an-sang-626802401082.jpg'),
    (80004, 8, 'Hủ Tiếu Thịt Bò', 'Hủ tiếu thịt bò thơm ngon và đầy dinh dưỡng.', 32000, 'https://cdn.tgdd.vn/2021/08/CookRecipe/Avatar/hu-tieu-bo-vien-nam-bo-thumbnail-1.jpg'),
    (80005, 8, 'Hủ Tiếu Cá', 'Hủ tiếu cá thơm ngon và đa dạng.', 26000, 'https://cdn.tgdd.vn/Files/2020/04/21/1250656/1250604-760x367.jpg');

-- Cơm
INSERT INTO Products
VALUES
    (90001, 9, 'Cơm Gà Xào Xíu', 'Cơm gà xào xíu thơm ngon và đa dạng.', 25000, 'https://cdn.tgdd.vn/Files/2022/11/25/1489972/cong-thuc-lam-com-ga-quay-xa-xiu-ngon-ngat-ngay-chuan-vi-nha-hang-202211251157276867.jpg'),
    (90002, 9, 'Cơm Chiên Dương Châu', 'Cơm chiên Dương Châu thơm ngon và đặc sắc.', 25000, 'https://i.ytimg.com/vi/_cdBAMq5KZ0/maxresdefault.jpg'),
    (90003, 9, 'Cơm Thịt Kho Tàu', 'Cơm thịt kho tàu thơm ngon và đầy đặn.', 22000, 'https://img-global.cpcdn.com/recipes/9d2c41e852a2b33b/680x482cq70/th%E1%BB%8Bt-kho-tau-to-dong-pha-recipe-main-photo.jpg'),
    (90004, 9, 'Cơm Gà Nướng', 'Cơm gà nướng thơm ngon và bổ dưỡng.', 27000, 'https://cdn.tgdd.vn/2021/07/CookProduct/thum1200-1200x676-2.jpg'),
    (90005, 9, 'Cơm Cá Thu Nướng', 'Cơm cá thu nướng thơm ngon và đa dạng.', 28000, 'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/282007970_1201456687356223_5523487957077640780_n.jpg?stp=dst-jpg_p526x296&_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=DRdbdQPd3yMAX8PVBYR&_nc_ht=scontent.fsgn2-4.fna&oh=00_AfBChVZUA8Ao_ZvvzzSeJTkl4kYm1_YxQdgzB2auzjLM7Q&oe=65FCB405');


INSERT INTO Products
VALUES
    (100001, 10, 'Bánh Tráng Trộn', 'Bánh tráng trộn với nhiều loại gia vị và nguyên liệu đặc trưng.', 20000, 'https://i.ytimg.com/vi/8lNLepEuR8I/maxresdefault.jpg'),
    (100002, 10, 'Bánh Mì Que', 'Bánh mì que giòn tan và thơm ngon.', 12000, 'https://statics.vinpearl.com/banh-mi-que-hai-phong-8_1628412600.jpg'),
    (100003, 10, 'Khoai Tây Chiên', 'Khoai tây chiên giòn rụm và ngon miệng.', 20000, 'https://cdn.tgdd.vn/Files/2015/03/01/615221/bi-quyet-lam-moi-khoai-tay-chien-cu-5-760x367.jpg'),
    (100004, 10, 'Bánh Bèo', 'Bánh bèo mềm và thơm ngon, phủ đầy nước mắm chua ngọt.', 25000, 'https://mmbonappetit.com/wp-content/uploads/2023/03/Banh-beo-featured-1.jpg'),
    (100005, 10, 'Bánh Flan', 'Bánh flan mềm mịn và thơm ngon, kem caramel đặc trưng.', 12000, 'https://cdn.tgdd.vn/Files/2023/02/06/1507379/cach-lam-banh-flan-sua-chua-bat-vi-ai-an-cung-thich-202302061029516251.jpg');


-- Đồ uống lạnh
INSERT INTO Products
VALUES
    (110001, 11, 'Nước Dừa', 'Nước dừa tươi mát và ngọt ngào.', 20000, 'https://cdn.tuoitre.vn/471584752817336320/2023/5/31/co-nen-uong-nuoc-dua-hang-ngay-khong-2-1685515287698257077273.jpeg'),
    (110002, 11, 'Sinh Tố Dâu', 'Sinh tố dâu thơm ngon và bổ dưỡng.', 26000, 'https://cdn.tgdd.vn/2021/03/CookRecipe/GalleryStep/thanh-pham-756.jpg'),
    (110003, 11, 'Nước Ép Cà Rốt', 'Nước ép cà rốt tươi mát và giàu vitamin.', 22000, 'https://thanhnien.mediacdn.vn/Uploaded/ngocquy/2021_11_24/1-ca-rot-shutterstock-8244.jpg'),
    (110004, 11, 'Soda Sữa Hạt', 'Soda sữa hạt thơm ngon và lạ miệng.', 24000, 'https://cdn.tgdd.vn/2021/10/CookRecipe/Avatar/sua-hat-dieu-cacao-thumbnail.jpg'),
    (110005, 11, 'Smoothie Xoài', 'Smoothie xoài thơm ngon và giải khát.', 28000, 'https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/smoothie-xoai-dua-voi-sua-chua-thumbnail.jpg');

INSERT INTO Products
VALUES
    (120001, 12, 'Bún Riêu Cua', 'Bún riêu cua thơm ngon và đậm đà.', 25000, 'https://cdn.tgdd.vn/2020/11/CookRecipe/Avatar/bun-rieu-cua-dong-thumbnail.jpg'),
    (120002, 12, 'Bún Bò Huế', 'Bún bò Huế thơm ngon và đặc sắc.', 35000, 'https://i0.wp.com/seonkyounglongest.com/wp-content/uploads/2017/08/Bun-Bo-Hue-46.jpg?resize=1000%2C562'),
    (120003, 12, 'Bún Chả Cá', 'Bún chả cá thơm ngon và đa dạng.', 26000, 'https://www.cet.edu.vn/wp-content/uploads/2018/09/bun-cha-ca-nha-trang.jpg'),
    (120004, 12, 'Bún Thịt Nướng', 'Bún thịt nướng thơm ngon và đầy đặn.', 25000, 'https://statics.vinpearl.com/bun-thit-nuong-ha-noi-1_1693401623.jpg'),
    (120005, 12, 'Bún Mọc', 'Bún mọc thơm ngon và đặc biệt.', 30000, 'https://cdn.tgdd.vn/Files/2019/05/06/1165223/bi-quyet-gia-truyen-de-nau-bun-moc-sieu-ngon-lai-don-gian-de-lam-202202150953056206.jpg');

INSERT INTO RestaurantManagement
VALUES
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (6, 5),
    (7, 6),
    (8, 7),
    (9, 8),
    (10, 9),
    (11, 10),
    (12, 11),
    (13, 12);

INSERT INTO OrderStatus (status_name, status_role) VALUES ('Đang xử lý', 'seller'), ('Đang chuẩn bị', 'seller'), ('Đang giao hàng', 'seller'), ('Đã nhận hàng', 'user'), ('Đã hoàn thành', 'user'), ('Đã hủy', 'user'), ('Đã từ chối', 'seller');
UPDATE products p SET quantity = 10 WHERE p.quantity < 10;
CREATE EXTENSION IF NOT EXISTS unaccent;

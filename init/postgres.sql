CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
	role VARCHAR(50) NOT NULL
);

CREATE TABLE Restaurants (
    restaurant_id SERIAL PRIMARY KEY,
    name VARCHAR(1000) NOT NULL,
    description VARCHAR(1000),
    address VARCHAR(1000)
);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    restaurant_id INT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE OrderDetails (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
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
    (1, 'Nhà Hàng Bánh Mì', 'Nhà hàng chuyên phục vụ các loại bánh mì ngon và đa dạng.', '123 Đường NVL:, Cần Thơ'),
    (2, 'Nhà Hàng Pizza', 'Nhà hàng chuyên phục vụ pizza hấp dẫn và đa dạng.', '456 Đường NVC, Cần Thơ'),
    (3, 'Quán Trà Sữa', 'Quán trà sữa với nhiều loại thức uống độc đáo và ngon miệng.', '789 Đường TVK, Cần Thơ'),
    (4, 'Quán Gà Rán và Hamburger', 'Quán phục vụ gà rán và hamburger chất lượng và đa dạng.', '101 Đường Trần Nam Phú, Cần Thơ'),
    (5, 'Quán Cháo', 'Quán cháo với các loại cháo truyền thống và đậm đà.', '222 Đường NVC Cần Thơ'),
    (6, 'Nhà Hàng Salad', 'Nhà hàng chuyên phục vụ các loại salad tươi ngon và bổ dưỡng.', '333 Đường Ngô Gia Tự, Cần Thơ'),
    (7, 'Nhà Hàng Mì Ý', 'Nhà hàng chuyên phục vụ các loại mì Ý thơm ngon và đa dạng.', '444 Đường Bùi Hữu Nghĩa, Cần Thơ'),
    (8, 'Nhà Hàng Hủ Tiếu', 'Nhà hàng chuyên phục vụ các loại hủ tiếu truyền thống và ngon miệng.', '555 Đường XVNT, Cần Thơ'),
    (9, 'Nhà Hàng Cơm', 'Nhà hàng phục vụ các loại cơm truyền thống và ngon miệng.', '666 Đường NVL, Cần Thơ'),
    (10, 'Quán Ăn Vặt ', 'Quán ăn vặt phục vụ các loại đồ ăn vặt với nhiều hương vị đa dạng.', '777 Đường TVK, Cần Thơ'),
    (11, 'Quán Đồ Uống Lạnh', 'Quán phục vụ các loại đồ uống lạnh thơm ngon và đa dạng.', '888 Đường TVk, Cần Thơ'),
    (12, 'Nhà Hàng Phục Vụ Bún', 'Nhà hàng phục vụ đa dạng các món ăn từ bún.', '999 Đường NVC, Cần Thơ');



INSERT INTO Products
VALUES 
(10001,1, 'Bánh mì thịt nướng', 'Bánh mì bao gồm: Thịt nướng, dưa leo, rau mùi, hành tây, sốt me', 20000, 'http://example.com/banhmi_thitnuong.jpg'),
(10002,1, 'Bánh mì gà xé', 'Bánh mì bao gồm: Gà xé, dưa leo, rau mùi, hành tây, sốt tiêu đen', 18000, 'http://example.com/banhmi_gaxe.jpg'),
(10003,1, 'Bánh mì bì', 'Bánh mì bao gồm: Bì heo, dưa leo, rau mùi, hành tây, sốt tương', 17000, 'http://example.com/banhmi_bi.jpg'),
(10004,1, 'Bánh mì chả cá', 'Bánh mì bao gồm: Chả cá, dưa leo, rau mùi, hành tây, sốt mắm', 22000, 'http://example.com/banhmi_chaca.jpg'),
(10005,1, 'Bánh mì trứng ốp-la', 'Bánh mì bao gồm: Trứng ốp-la, chả lụa, dưa leo, rau mùi, hành tây, sốt cà chua', 19000, 'http://example.com/banhmi_trungopla.jpg');

INSERT INTO Products
VALUES
    (20001, 2, 'Pizza Hải Sản', 'Pizza thơm ngon với các loại hải sản tươi ngon.', 12.99, 'pizza_hai_san.jpg'),
    (20002, 2, 'Pizza Bò Nướng', 'Pizza thơm ngon với thịt bò nướng và rau cải.', 11.49, 'pizza_bo_nuong.jpg'),
    (20003, 2, 'Pizza Gà BBQ', 'Pizza thơm ngon với thịt gà BBQ và rau cải.', 10.99, 'pizza_ga_bbq.jpg'),
    (20004, 2, 'Pizza Rau Cải', 'Pizza thơm ngon với nhiều loại rau cải tươi ngon.', 9.99, 'pizza_rau_cai.jpg'),
    (20005, 2, 'Pizza Phô Mai Tôm', 'Pizza thơm ngon với phô mai và tôm tươi.', 11.99, 'pizza_pho_mai_tom.jpg');
	-- Trà Sữa
INSERT INTO Products
VALUES
    (30001, 3, 'Trà Sữa Matcha', 'Trà sữa Matcha thơm ngon và bổ dưỡng.', 4.99, 'tra_sua_matcha.jpg'),
    (30002, 3, 'Trà Sữa Trân Châu Đen', 'Trà sữa trân châu đen thơm ngon và đặc biệt.', 3.99, 'tra_sua_tran_chau_den.jpg'),
    (30003, 3, 'Trà Sữa Thái Xanh', 'Trà sữa Thái xanh thơm ngon và mát lạnh.', 5.49, 'tra_sua_thai_xanh.jpg'),
    (30004, 3, 'Trà Sữa Oolong', 'Trà sữa Oolong thơm ngon và ngọt dịu.', 4.49, 'tra_sua_oolong.jpg'),
    (30005, 3, 'Trà Sữa Hoa Hồng', 'Trà sữa Hoa Hồng thơm ngon và lạ miệng.', 4.99, 'tra_sua_hoa_hong.jpg');

-- Gà Rán và Hamburger
INSERT INTO Products
VALUES
    (40001, 4, 'Gà Rán Kentucky', 'Gà rán Kentucky thơm ngon và giòn rụm.', 8.99, 'ga_ran_kentucky.jpg'),
    (40002, 4, 'Gà Rán Tẩm Bột', 'Gà rán tẩm bột thơm ngon và đậm đà.', 7.99, 'ga_ran_tam_bot.jpg'),
    (40003, 4, 'Hamburger Phô Mai', 'Hamburger phô mai thơm ngon và béo ngậy.', 6.49, 'hamburger_pho_mai.jpg'),
    (40004, 4, 'Hamburger Gà', 'Hamburger gà thơm ngon và nhiều chất dinh dưỡng.', 7.49, 'hamburger_ga.jpg'),
    (40005, 4, 'Gà Rán Hải Sản', 'Gà rán hải sản thơm ngon và đặc biệt.', 9.49, 'ga_ran_hai_san.jpg');

-- Cháo
INSERT INTO Products
VALUES
    (50001, 5, 'Cháo Gà', 'Cháo gà thơm ngon và bổ dưỡng.', 5.99, 'chao_ga.jpg'),
    (50002, 5, 'Cháo Lươn', 'Cháo lươn thơm ngon và đặc sắc.', 6.49, 'chao_luon.jpg'),
    (50003, 5, 'Cháo Cá', 'Cháo cá thơm ngon và đậm đà.', 6.99, 'chao_ca.jpg'),
    (50004, 5, 'Cháo Bồ Câu', 'Cháo bồ câu thơm ngon và đặc biệt.', 7.49, 'chao_bo_cau.jpg'),
    (50005, 5, 'Cháo Hải Sản', 'Cháo hải sản thơm ngon và đa dạng.', 8.49, 'chao_hai_san.jpg');

-- Salad
INSERT INTO Products
VALUES
    (60001, 6, 'Salad Cà Rốt', 'Salad cà rốt tươi ngon và bổ dưỡng.', 6.99, 'salad_ca_rot.jpg'),
    (60002, 6, 'Salad Rau Cải', 'Salad rau cải tươi ngon và đa dạng.', 7.49, 'salad_rau_cai.jpg'),
    (60003, 6, 'Salad Thịt Gà', 'Salad thịt gà thơm ngon và đầy dinh dưỡng.', 8.49, 'salad_thit_ga.jpg'),
    (60004, 6, 'Salad Cá Ngừ', 'Salad cá ngừ tươi ngon và đặc sắc.', 9.49, 'salad_ca_ngu.jpg'),
    (60005, 6, 'Salad Hải Sản', 'Salad hải sản tươi ngon và đa dạng.', 10.49, 'salad_hai_san.jpg');

-- Mì Ý
INSERT INTO Products
VALUES
    (70001, 7, 'Mì Ý Carbonara', 'Mì Ý Carbonara thơm ngon và đậm đà.', 12.99, 'mi_y_carbonara.jpg'),
    (70002, 7, 'Mì Ý Bò Bằm', 'Mì Ý Bò Bằm thơm ngon và đặc sắc.', 11.49, 'mi_y_bo_bam.jpg'),
    (70003, 7, 'Mì Ý Hải Sản', 'Mì Ý Hải Sản thơm ngon và đa dạng.', 10.99, 'mi_y_hai_san.jpg'),
    (70004, 7, 'Mì Ý Xúc Xích', 'Mì Ý Xúc Xích thơm ngon và đầy đặn.', 9.99, 'mi_y_xuc_xich.jpg'),
    (70005, 7, 'Mì Ý Nấm', 'Mì Ý Nấm thơm ngon và bổ dưỡng.', 11.99, 'mi_y_nam.jpg');

-- Hủ Tiếu
INSERT INTO Products
VALUES
    (80001, 8, 'Hủ Tiếu Nam Vang', 'Hủ tiếu Nam Vang thơm ngon và đặc sắc.', 8.99, 'hu_tieu_nam_vang.jpg'),
    (80002, 8, 'Hủ Tiếu Mì Sài Gòn', 'Hủ tiếu mì Sài Gòn thơm ngon và đa dạng.', 7.99, 'hu_tieu_mi_sai_gon.jpg'),
    (80003, 8, 'Hủ Tiếu Tôm', 'Hủ tiếu tôm thơm ngon và đặc biệt.', 6.99, 'hu_tieu_tom.jpg'),
    (80004, 8, 'Hủ Tiếu Thịt Bò', 'Hủ tiếu thịt bò thơm ngon và đầy dinh dưỡng.', 9.49, 'hu_tieu_thit_bo.jpg'),
    (80005, 8, 'Hủ Tiếu Cá', 'Hủ tiếu cá thơm ngon và đa dạng.', 10.49, 'hu_tieu_ca.jpg');

-- Cơm
INSERT INTO Products
VALUES
    (90001, 9, 'Cơm Gà Xào Xíu', 'Cơm gà xào xíu thơm ngon và đa dạng.', 7.99, 'com_ga_xao_xiu.jpg'),
    (90002, 9, 'Cơm Chiên Dương Châu', 'Cơm chiên Dương Châu thơm ngon và đặc sắc.', 8.49, 'com_chien_duong_chau.jpg'),
    (90003, 9, 'Cơm Thịt Kho Tàu', 'Cơm thịt kho tàu thơm ngon và đầy đặn.', 9.99, 'com_thit_kho_tau.jpg'),
    (90004, 9, 'Cơm Gà Nướng', 'Cơm gà nướng thơm ngon và bổ dưỡng.', 10.49, 'com_ga_nuong.jpg'),
    (90005, 9, 'Cơm Cá Thu Nướng', 'Cơm cá thu nướng thơm ngon và đa dạng.', 11.49, 'com_ca_thu_nuong.jpg');


	INSERT INTO Products
VALUES
    (100001, 10, 'Bánh Tráng Trộn', 'Bánh tráng trộn với nhiều loại gia vị và nguyên liệu đặc trưng.', 15.99, 'banh_trang_tron.jpg'),
    (100002, 10, 'Bánh Mì Que', 'Bánh mì que giòn tan và thơm ngon.', 8.49, 'banh_mi_que.jpg'),
    (100003, 10, 'Khoai Tây Chiên', 'Khoai tây chiên giòn rụm và ngon miệng.', 10.99, 'khoai_tay_chien.jpg'),
    (100004, 10, 'Bánh Bèo', 'Bánh bèo mềm và thơm ngon, phủ đầy nước mắm chua ngọt.', 12.49, 'banh_beo.jpg'),
    (100005, 10, 'Bánh Flan', 'Bánh flan mềm mịn và thơm ngon, kem caramel đặc trưng.', 14.99, 'banh_flan.jpg');


-- Đồ uống lạnh
INSERT INTO Products
VALUES
    (110001, 11, 'Nước Dừa', 'Nước dừa tươi mát và ngọt ngào.', 3.99, 'nuoc_dua.jpg'),
    (110002, 11, 'Sinh Tố Dâu', 'Sinh tố dâu thơm ngon và bổ dưỡng.', 4.49, 'sinh_to_dau.jpg'),
    (110003, 11, 'Nước Ép Cà Rốt', 'Nước ép cà rốt tươi mát và giàu vitamin.', 4.99, 'nuoc_ep_ca_rot.jpg'),
    (110004, 11, 'Soda Sữa Hạt', 'Soda sữa hạt thơm ngon và lạ miệng.', 5.49, 'soda_sua_hat.jpg'),
    (110005, 11, 'Smoothie Xoài', 'Smoothie xoài thơm ngon và giải khát.', 5.99, 'smoothie_xoai.jpg');

	INSERT INTO Products
VALUES
    (120001, 12, 'Bún Riêu Cua', 'Bún riêu cua thơm ngon và đậm đà.', 6.99, 'bun_rieu_cua.jpg'),
    (120002, 12, 'Bún Bò Huế', 'Bún bò Huế thơm ngon và đặc sắc.', 7.49, 'bun_bo_hue.jpg'),
    (120003, 12, 'Bún Chả Cá', 'Bún chả cá thơm ngon và đa dạng.', 8.49, 'bun_cha_ca.jpg'),
    (120004, 12, 'Bún Thịt Nướng', 'Bún thịt nướng thơm ngon và đầy đặn.', 9.49, 'bun_thit_nuong.jpg'),
    (120005, 12, 'Bún Mọc', 'Bún mọc thơm ngon và đặc biệt.', 10.49, 'bun_moc.jpg');
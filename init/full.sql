CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,
	role NVARCHAR(50) NOT NULL
);

CREATE TABLE Restaurants (
    restaurant_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(1000) NOT NULL,
    description NVARCHAR(1000),
    address NVARCHAR(1000)
);

CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_id INT,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Reviews (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT, 
    user_id INT,
    rating INT, 
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

  -- Tài khoản Admin
INSERT INTO Users
VALUES ('admin', CONVERT(VARCHAR(32), HASHBYTES('MD5', '123'), 2), 'admin@example.com', 'Admin', 'admin');

-- Tài khoản Seller
INSERT INTO Users
VALUES 
    ('Thien', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'thien@gmail.com', 'Thien Seller', 'seller'),
    ('Khai', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'khai@gmail;.com', 'Khai Seller', 'seller'),
    ('Phat', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'phat@gmail.com', 'Phat Seller','seller'),
    ('Bao', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'bao@gmail.com', 'Bao Seller','seller'),
    ('Tien', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'tien@gmail.com', 'Tien Seller','seller'),
    ('Khang', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'khang@gmail.com', 'Khang Seller','seller'),
    ('Loi', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'loi@gmail.com', 'Loi Seller','seller'),
    ('Nghia', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'nghia@gmail.com', 'Nghia Seller','seller'),
    ('Hao', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'hao@gmail.com', 'Hao Seller','seller'),
    ('Quy', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'quy@gmail.com', 'Quy Seller','seller'),
    ('Huy', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'huy@gmail.com', 'Huy Seller','seller'),
	('Phong', CONVERT(VARCHAR(32), HASHBYTES('MD5', '12345'), 2), 'Phong@gmail.com', 'Phong Seller','seller');
-- Tài khoản User
INSERT INTO Users
VALUES 
    ('Anh', CONVERT(VARCHAR(32), HASHBYTES('MD5', '123az'), 2), 'anh@gmail.com', 'Anh User', 'user'),
    ('Hoa', CONVERT(VARCHAR(32), HASHBYTES('MD5', '123az'), 2), 'hoa@gmail.com', 'Hoa User', 'user'),
    ('Nam', CONVERT(VARCHAR(32), HASHBYTES('MD5', '123az'), 2), 'nam@gmail.com', 'Nam User', 'user');

INSERT INTO Restaurants
VALUES
    (N'Nhà Hàng Bánh Mì', N'Nhà hàng chuyên phục vụ các loại bánh mì ngon và đa dạng.', N'123 Đường NVL:, Cần Thơ'),
    (N'Nhà Hàng Pizza', N'Nhà hàng chuyên phục vụ pizza hấp dẫn và đa dạng.', N'456 Đường NVC, Cần Thơ'),
    (N'Quán Trà Sữa', N'Quán trà sữa với nhiều loại thức uống độc đáo và ngon miệng.', N'789 Đường TVK, Cần Thơ'),
    (N'Quán Gà Rán và Hamburger', N'Quán phục vụ gà rán và hamburger chất lượng và đa dạng.', N'101 Đường Trần Nam Phú, Cần Thơ'),
    (N'Quán Cháo', N'Quán cháo với các loại cháo truyền thống và đậm đà.', N'222 Đường NVC Cần Thơ'),
    (N'Nhà Hàng Salad', N'Nhà hàng chuyên phục vụ các loại salad tươi ngon và bổ dưỡng.', N'333 Đường Ngô Gia Tự, Cần Thơ'),
    (N'Nhà Hàng Mì Ý', N'Nhà hàng chuyên phục vụ các loại mì Ý thơm ngon và đa dạng.', N'444 Đường Bùi Hữu Nghĩa, Cần Thơ'),
    (N'Nhà Hàng Hủ Tiếu', N'Nhà hàng chuyên phục vụ các loại hủ tiếu truyền thống và ngon miệng.', N'555 Đường XVNT, Cần Thơ'),
    (N'Nhà Hàng Cơm', N'Nhà hàng phục vụ các loại cơm truyền thống và ngon miệng.', N'666 Đường NVL, Cần Thơ'),
    (N'Quán Ăn Vặt ', N'Quán ăn vặt phục vụ các loại đồ ăn vặt với nhiều hương vị đa dạng.', N'777 Đường TVK, Cần Thơ'),
    (N'Quán Đồ Uống Lạnh', N'Quán phục vụ các loại đồ uống lạnh thơm ngon và đa dạng.', N'888 Đường TVk, Cần Thơ'),
    (N'Nhà Hàng Phục Vụ Bún', N'Nhà hàng phục vụ đa dạng các món ăn từ bún.', N'999 Đường NVC, Cần Thơ')
   


INSERT INTO Products
VALUES 
(1, N'Bánh mì thịt nướng', N'Bánh mì bao gồm: Thịt nướng, dưa leo, rau mùi, hành tây, sốt me', 20000, 'http://example.com/banhmi_thitnuong.jpg'),
(1, N'Bánh mì gà xé', N'Bánh mì bao gồm: Gà xé, dưa leo, rau mùi, hành tây, sốt tiêu đen', 18000, 'http://example.com/banhmi_gaxe.jpg'),
(1, N'Bánh mì bì', N'Bánh mì bao gồm: Bì heo, dưa leo, rau mùi, hành tây, sốt tương', 17000, 'http://example.com/banhmi_bi.jpg'),
(1, N'Bánh mì chả cá', N'Bánh mì bao gồm: Chả cá, dưa leo, rau mùi, hành tây, sốt mắm', 22000, 'http://example.com/banhmi_chaca.jpg'),
(1, N'Bánh mì trứng ốp-la', N'Bánh mì bao gồm: Trứng ốp-la, chả lụa, dưa leo, rau mùi, hành tây, sốt cà chua', 19000, 'http://example.com/banhmi_trungopla.jpg');

INSERT INTO Products
VALUES
    (2, N'Pizza Hải Sản', N'Pizza thơm ngon với các loại hải sản tươi ngon.', 12.99, 'pizza_hai_san.jpg'),
    (2, N'Pizza Bò Nướng', N'Pizza thơm ngon với thịt bò nướng và rau cải.', 11.49, 'pizza_bo_nuong.jpg'),
    (2, N'Pizza Gà BBQ', N'Pizza thơm ngon với thịt gà BBQ và rau cải.', 10.99, 'pizza_ga_bbq.jpg'),
    (2, N'Pizza Rau Cải', N'Pizza thơm ngon với nhiều loại rau cải tươi ngon.', 9.99, 'pizza_rau_cai.jpg'),
    (2, N'Pizza Phô Mai Tôm', N'Pizza thơm ngon với phô mai và tôm tươi.', 11.99, 'pizza_pho_mai_tom.jpg');
	-- Trà Sữa
INSERT INTO Products
VALUES
    (3, N'Trà Sữa Matcha', N'Trà sữa Matcha thơm ngon và bổ dưỡng.', 4.99, 'tra_sua_matcha.jpg'),
    (3, N'Trà Sữa Trân Châu Đen', N'Trà sữa trân châu đen thơm ngon và đặc biệt.', 3.99, 'tra_sua_tran_chau_den.jpg'),
    (3, N'Trà Sữa Thái Xanh', N'Trà sữa Thái xanh thơm ngon và mát lạnh.', 5.49, 'tra_sua_thai_xanh.jpg'),
    (3, N'Trà Sữa Oolong', N'Trà sữa Oolong thơm ngon và ngọt dịu.', 4.49, 'tra_sua_oolong.jpg'),
    (3, N'Trà Sữa Hoa Hồng', N'Trà sữa Hoa Hồng thơm ngon và lạ miệng.', 4.99, 'tra_sua_hoa_hong.jpg');

-- Gà Rán và Hamburger
INSERT INTO Products
VALUES
    (4, N'Gà Rán Kentucky', N'Gà rán Kentucky thơm ngon và giòn rụm.', 8.99, 'ga_ran_kentucky.jpg'),
    (4, N'Gà Rán Tẩm Bột', N'Gà rán tẩm bột thơm ngon và đậm đà.', 7.99, 'ga_ran_tam_bot.jpg'),
    (4, N'Hamburger Phô Mai', N'Hamburger phô mai thơm ngon và béo ngậy.', 6.49, 'hamburger_pho_mai.jpg'),
    (4, N'Hamburger Gà', N'Hamburger gà thơm ngon và nhiều chất dinh dưỡng.', 7.49, 'hamburger_ga.jpg'),
    (4, N'Gà Rán Hải Sản', N'Gà rán hải sản thơm ngon và đặc biệt.', 9.49, 'ga_ran_hai_san.jpg');

-- Cháo
INSERT INTO Products
VALUES
    (5, N'Cháo Gà', N'Cháo gà thơm ngon và bổ dưỡng.', 5.99, 'chao_ga.jpg'),
    (5, N'Cháo Lươn', N'Cháo lươn thơm ngon và đặc sắc.', 6.49, 'chao_luon.jpg'),
    (5, N'Cháo Cá', N'Cháo cá thơm ngon và đậm đà.', 6.99, 'chao_ca.jpg'),
    (5, N'Cháo Bồ Câu', N'Cháo bồ câu thơm ngon và đặc biệt.', 7.49, 'chao_bo_cau.jpg'),
    (5, N'Cháo Hải Sản', N'Cháo hải sản thơm ngon và đa dạng.', 8.49, 'chao_hai_san.jpg');

-- Salad
INSERT INTO Products
VALUES
    (6, N'Salad Cà Rốt', N'Salad cà rốt tươi ngon và bổ dưỡng.', 6.99, 'salad_ca_rot.jpg'),
    (6, N'Salad Rau Cải', N'Salad rau cải tươi ngon và đa dạng.', 7.49, 'salad_rau_cai.jpg'),
    (6, N'Salad Thịt Gà', N'Salad thịt gà thơm ngon và đầy dinh dưỡng.', 8.49, 'salad_thit_ga.jpg'),
    (6, N'Salad Cá Ngừ', N'Salad cá ngừ tươi ngon và đặc sắc.', 9.49, 'salad_ca_ngu.jpg'),
    (6, N'Salad Hải Sản', N'Salad hải sản tươi ngon và đa dạng.', 10.49, 'salad_hai_san.jpg');

-- Mì Ý
INSERT INTO Products
VALUES
    (7, N'Mì Ý Carbonara', N'Mì Ý Carbonara thơm ngon và đậm đà.', 12.99, 'mi_y_carbonara.jpg'),
    (7, N'Mì Ý Bò Bằm', N'Mì Ý Bò Bằm thơm ngon và đặc sắc.', 11.49, 'mi_y_bo_bam.jpg'),
    (7, N'Mì Ý Hải Sản', N'Mì Ý Hải Sản thơm ngon và đa dạng.', 10.99, 'mi_y_hai_san.jpg'),
    (7, N'Mì Ý Xúc Xích', N'Mì Ý Xúc Xích thơm ngon và đầy đặn.', 9.99, 'mi_y_xuc_xich.jpg'),
    (7, N'Mì Ý Nấm', N'Mì Ý Nấm thơm ngon và bổ dưỡng.', 11.99, 'mi_y_nam.jpg');

-- Hủ Tiếu
INSERT INTO Products
VALUES
    (8, N'Hủ Tiếu Nam Vang', N'Hủ tiếu Nam Vang thơm ngon và đặc sắc.', 8.99, 'hu_tieu_nam_vang.jpg'),
    (8, N'Hủ Tiếu Mì Sài Gòn', N'Hủ tiếu mì Sài Gòn thơm ngon và đa dạng.', 7.99, 'hu_tieu_mi_sai_gon.jpg'),
    (8, N'Hủ Tiếu Tôm', N'Hủ tiếu tôm thơm ngon và đặc biệt.', 6.99, 'hu_tieu_tom.jpg'),
    (8, N'Hủ Tiếu Thịt Bò', N'Hủ tiếu thịt bò thơm ngon và đầy dinh dưỡng.', 9.49, 'hu_tieu_thit_bo.jpg'),
    (8, N'Hủ Tiếu Cá', N'Hủ tiếu cá thơm ngon và đa dạng.', 10.49, 'hu_tieu_ca.jpg');

-- Cơm
INSERT INTO Products
VALUES
    (9, N'Cơm Gà Xào Xíu', N'Cơm gà xào xíu thơm ngon và đa dạng.', 7.99, 'com_ga_xao_xiu.jpg'),
    (9, N'Cơm Chiên Dương Châu', N'Cơm chiên Dương Châu thơm ngon và đặc sắc.', 8.49, 'com_chien_duong_chau.jpg'),
    (9, N'Cơm Thịt Kho Tàu', N'Cơm thịt kho tàu thơm ngon và đầy đặn.', 9.99, 'com_thit_kho_tau.jpg'),
    (9, N'Cơm Gà Nướng', N'Cơm gà nướng thơm ngon và bổ dưỡng.', 10.49, 'com_ga_nuong.jpg'),
    (9, N'Cơm Cá Thu Nướng', N'Cơm cá thu nướng thơm ngon và đa dạng.', 11.49, 'com_ca_thu_nuong.jpg');


	INSERT INTO Products
VALUES
    (10, N'Bánh Tráng Trộn', N'Bánh tráng trộn với nhiều loại gia vị và nguyên liệu đặc trưng.', 15.99, 'banh_trang_tron.jpg'),
    (10, N'Bánh Mì Que', N'Bánh mì que giòn tan và thơm ngon.', 8.49, 'banh_mi_que.jpg'),
    (10, N'Khoai Tây Chiên', N'Khoai tây chiên giòn rụm và ngon miệng.', 10.99, 'khoai_tay_chien.jpg'),
    (10, N'Bánh Bèo', N'Bánh bèo mềm và thơm ngon, phủ đầy nước mắm chua ngọt.', 12.49, 'banh_beo.jpg'),
    (10, N'Bánh Flan', N'Bánh flan mềm mịn và thơm ngon, kem caramel đặc trưng.', 14.99, 'banh_flan.jpg');


-- Đồ uống lạnh
INSERT INTO Products
VALUES
    (11, N'Nước Dừa', N'Nước dừa tươi mát và ngọt ngào.', 3.99, 'nuoc_dua.jpg'),
    (11, N'Sinh Tố Dâu', N'Sinh tố dâu thơm ngon và bổ dưỡng.', 4.49, 'sinh_to_dau.jpg'),
    (11, N'Nước Ép Cà Rốt', N'Nước ép cà rốt tươi mát và giàu vitamin.', 4.99, 'nuoc_ep_ca_rot.jpg'),
    (11, N'Soda Sữa Hạt', N'Soda sữa hạt thơm ngon và lạ miệng.', 5.49, 'soda_sua_hat.jpg'),
    (11, N'Smoothie Xoài', N'Smoothie xoài thơm ngon và giải khát.', 5.99, 'smoothie_xoai.jpg');

	INSERT INTO Products
VALUES
    (12, N'Bún Riêu Cua', N'Bún riêu cua thơm ngon và đậm đà.', 6.99, 'bun_rieu_cua.jpg'),
    (12, N'Bún Bò Huế', N'Bún bò Huế thơm ngon và đặc sắc.', 7.49, 'bun_bo_hue.jpg'),
    (12, N'Bún Chả Cá', N'Bún chả cá thơm ngon và đa dạng.', 8.49, 'bun_cha_ca.jpg'),
    (12, N'Bún Thịt Nướng', N'Bún thịt nướng thơm ngon và đầy đặn.', 9.49, 'bun_thit_nuong.jpg'),
    (12, N'Bún Mọc', N'Bún mọc thơm ngon và đặc biệt.', 10.49, 'bun_moc.jpg');

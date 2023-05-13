Create database QL_WaterFlower

Use QL_WaterFlower

-- Bảng tài khoản
Create table tbUser(
	UserID INT IDENTITY(1,1) not null PRIMARY KEY,
	UserName Nvarchar(50) not null unique,
	Password Nvarchar(50) not null,
	Role bit not null
)

-- Bảng chi tiết tài khoản
Create table tbUserInfor(
	UserID int not null PRIMARY KEY,
	Name Nvarchar(50) not null,
	Address Nvarchar(255) not null,
	Phone Nvarchar(10) not null unique

	constraint fk_User_Infor foreign key(UserID) references tbUser(UserID)
) 

-- Bảng Catelory
Create table tbCate(
	CateID INT IDENTITY(1,1) not null PRIMARY KEY,
	CateName Nvarchar(50) not null
)

-- Bảng Sản phẩm
Create table tbProduct(
	ProductID INT IDENTITY(1,1) not null PRIMARY KEY,
	ProductName Nvarchar(50) not null,
	PurchasePrice int not null,
	SalePrice int not null,
	Image varchar(max),
	Description Nvarchar(max) not null,
	CateID int not null,
	Quantity int not null,
	LastDayImport datetime not null,

	constraint PurchasePrice check (PurchasePrice > 0),
	constraint SalePrice check (SalePrice > 0),
	constraint fk_Product_Cate foreign key(CateID) references tbCate(CateID)
)

-- Bảng Hóa đơn
Create table tbOrder(
	OrderID INT IDENTITY(1,1) not null PRIMARY KEY,
	DetailedID int not null,
	UserID int not null,
	OrderStatus Nvarchar(50) not null,
	Total int,

	constraint OrderStatus check (OrderStatus in ('Order placed','Preparing to ship','In transit','Delivered','Returned order')),
	constraint fk_Order_User foreign key(UserID) references tbUserInfor(UserID)
)

-- Bảng Chi tiết hóa đơn
Create table tbOrderDetails(
	OrderID INT not null ,
	ProductID int not null,
	OrderDate date not null,
	Quantity int not null,

	constraint pk_Detail primary key (OrderID, ProductID),
	constraint fk_Detail_Order foreign key(OrderID) references tbOrder(OrderID),
	constraint fk_Detail_Product foreign key(ProductID) references tbProduct(ProductID)
)
/*
Drop database QL_WaterFlower

Drop table tbUser
Drop table tbUserInfor
Drop table tbCate
Drop table tbProduct
Drop table tbOrder
Drop table tbOrderDetails
*/

-- Insert
Insert into tbUser
Values
(N'admin1',N'123',1),
(N'admin2',N'123',1),
(N'admin3',N'123',1),
(N'admin4',N'123',1),
(N'admin5',N'123',1),
(N'user1',N'234',0),
(N'user2',N'234',0),
(N'user3',N'234',0),
(N'user4',N'234',0),
(N'user5',N'234',0),
(N'user6',N'234',0),
(N'user7',N'234',0),
(N'user8',N'234',0),
(N'user9',N'234',0),
(N'user10',N'234',0),
(N'user11',N'234',0)

Insert into tbUserInfor
Values
(1, N'Nguyễn Hoàng Anh', N'Hà Tĩnh', N'0374201805'),
(2, N'Nguyễn Công Thành', N'Hà Tĩnh', N'0363012495'),
(3, N'Phạm Nguyễn Thiên Chương', N'Đà Nẵng', N'0126577420'),
(4, N'Nguyễn Bảo Trung', N'Quảng Ngãi', N'0356234672'),
(5, N'Ngô Tuấn Kiệt', N'Đắc Lắk', N'0776316789'),
(6, N'Vũ Văn Hoàng', N'Hà Nội', N'0989350596'),
(7, N'Trần Quốc Tuấn', N'Huế', N'0363148375'),
(8, N'Thủy Huyền Vũ', N'Bắc Ninh', N'0988816483'),
(9, N'Phong Bạch Hổ', N'Hải Phòng', N'0378462148'),
(10, N'Lôi Thanh Long', N'Hà Nội', N'0363278678'),
(11, N'Hỏa Chu Tước', N'Nghệ An', N'0776498513'),
(12, N'Kim Toan Nghê', N'Đà Lạt', N'0124889765'),
(13, N'Nhạc Tù Ngưu', N'Bắc Ninh', N'0656742885'),
(14, N'Thô Phủ Tiêu Đồ', N'Hà Nội', N'0343627232'),
(15, N'Đỗ Bạch Trạch', N'Quy Nhơn', N'0964432958'),
(16, N'Thạch Bí Hí', N'Thừa Thiên Huế', N'0472585666')

Insert into tbCate
Values
(N'Nước Hoa Mini'),
(N'Nước Hoa Nam'),
(N'Nước Hoa Nữ')

/*
	ProductID INT IDENTITY(1,1) not null PRIMARY KEY,
	ProductName Nvarchar(50) not null,
	PurchasePrice int not null,
	SalePrice int not null,
	Image varchar(max),
	Description Nvarchar(max) not null,
	CateID int not null,
	Quantity int not null,
	LastDayImport datetime not null,

	constraint PurchasePrice check (PurchasePrice > 0),
	constraint SalePrice check (SalePrice > 0),
	constraint fk_Product_Cate foreign key(CateID) references tbCate(CateID)
)*/

Insert into tbProduct
Values
/*Mini*/
(N'Burberry Brit For Men', 300000, 330000, 'https://orchard.vn/wp-content/uploads/2014/06/c288ee9b-df40-46e0-ad9b-0c97407b77e5-165x165.jpg
',N'Nước hoa Burberry Brit For Men là sự mô tả hoàn hảo nhất về tinh thần hiện đại hòa trộn cùng truyền thống của nước Anh. Hương thơm cổ điển ban đầu chuyển sang hiện đại, hợp thời hơn với chiết xuất ngọt lành tươi mát của cam quýt và cam bergamot hòa quyện cùng chiết xuất cay nồng đến từ gừng và bạch đậu khấu điểm thêm hương hoa hồng dại quyến rũ, bí ẩn, mang đến một vẻ gợi cảm đầy mê hoặc khi hòa quyện vào các hương gỗ phương đông quý hiếm, đậu tonka, hoắc hương, tuyết tùng và xạ hương xám. Thế mới biết, sự tài tình của Antoine Maisondieu đã biến nét cổ điển trong Burberry Brit for Men thành giản dị nhưng vẫn thu hút theo một cách độc đáo khác thường.
', 2, 10, '2023-09-01 00:00:00'),

(N'Bvlgari Omnia Amethyste EDT',  350000, 390000, 'https://orchard.vn/wp-content/uploads/2014/06/Bvlgari-Omnia-Amethyste-EDT-_1a-165x165.jpg
', N'Bản chất của nước hoa Omia Amethyste là sự quý phái và tinh tế của hương thơm hoa Iris và vườn hồng trong buổi sớm tinh mơ. Được thiết kế với mùi hương thanh lịch và tinh tế. Omnia Amethyste chắc chắn dành riêng cho những người phụ nữ trẻ. Những người năng động và thích thể hiện bản thân mình thông qua một hương thơm tươi mới, thuần khiết.
', 1, 6, '2023-02-22 12:31:00'),

(N'Bvlgari Rose Goldea Blossom Delight', 490000, 500000, 'https://orchard.vn/wp-content/uploads/2019/12/F03414FD-C09B-49D0-95F3-ADE375CEF44E_1_big.png
',N'Bvlgari Rose Goldea Blossom Delight là mùi hương mới nhất ra mắt năm 2019 nằm trong bộ sưu tập Goldea của thương hiệu Bvlgari. Hương thơm được nhà chế tác Alberto Morillas phác hoạ từ khung cảnh bình mình mua Xuân rực rỡ tràn ngập hoa trái và ánh sáng của những niềm vui rạng ngời.
', 1 , 8, '2023-02-16 13:21:00'),

(N'Cabotine Rose', 250000, 270000, 'https://orchard.vn/wp-content/uploads/2014/06/Cabotine-Rose-EDP--165x165.jpg
', N'Năm 2003, Jean Claude Delville cho trình làng phiên bản nước hoa Cabotine Rose của thương hiệu Gres nổi tiếng. Đẹp, quyến rũ, lãng mạn, sang trọng đó chính là những gì làm nên thành công công của Cabotine Rose. Một hương thơm kỳ thú và sinh động tràn đầy sức sống là những gì bạn cảm nhận được ngay khi chạm đến hương thơm của chai nước nước hoa này. Vẫn với kiểu dáng chai đựng xinh xắn dễ thương của dòng Cabotine truyền thống nhưng tạo sự khác biệt với màu hồng nhẹ nhàng trẻ trung, Cabotine Rose hứa hẹn sẽ mang đến một hương vị mới mẻ đáng yêu cho cuộc sống tươi đẹp của bạn thêm màu sắc và thú vị.Các tầng hương của Cabotine Rose xoáy trào lên nhau, cùng nhau đem đến cho phái nữ vẻ đẹp hoàn hảo nhất. Mùi hương bắt gặp đầu tiên là hương quả lê và quýt, hương hoa anh đào thi vị và lá xanh đẫm sương tươi mát. Kế đến bạn sẽ đựơc hoà cùng bản hợp tấu của các loài hoa thật ngọt ngào. Cuối cùng là chút vấn vương của hương lau và đàn hương sẽ khiến bạn nhớ mãi đến sản phẩm này.Bạn là một cô nàng trẻ trung? Bạn là một cô nàng sành điệu, đa phong cách? Đang phân vân không biết chọn cho mình loại nước hoa nào thì hãy đến với Cabotine Rose và mang vẻ đẹp hoàn hảo của sự thanh lịch, trẻ trung, quyến rũ về cho mình.
', 1 , 18, '2023-01-12 10:21:00'),

(N'Dior J’Adore', 400000, 410000, 'https://orchard.vn/wp-content/uploads/2014/06/dior-jadore.jpg
', N'Nếu nhắc đến những sản phẩm tôn vinh nét đẹp của người phụ nữ mà không có mặt nước hoa Dior J’Adore thì thật sự là một thiếu xót rất lớn. Thương hiệu Dior mang đến sản phẩm này với nguồn cảm hứng vô hạn của một người phụ nữ sở hữu vẻ đẹp xuất chúng, sự nữ tính vô hạn luôn chực chờ thời điểm bùng phát, mùi hương của nó là sự lan tỏa mạnh mẽ, kích động các giác quan một cách tối đa như mùi hương của bông hoa hồng tươi mát chớm nở trong ánh bình minh sớm mai. Rực rỡ, gợi cảm, tinh tế, đại diện cho vẻ đẹp nữ tính và sức mạnh của những xúc cảm bộc phát. Nó mang mùi hương của một bó hoa lan thơm ngát, cảm giác êm ái như nhung của mận xứ Damas và vị ngọt đậm của gỗ Amarante. Đây là sản phẩm được bình chọn là 1 trong mùi hương hay nhất mọi thời đại. Dior J’Adore tôn vinh nét đẹp nữ tính, dịu dàng mang hơi hướng hiện đại, phù hợp với những cô gái có cá tính mạnh, luôn tự tin với khả năng mình có được và sỡ hữu sự đam mê cháy bỏng muốn thể hiện cái tôi của bản thân nhưng vẫn còn thiếu chất xúc tác cần thiết.
', 1 , 5, '2022-10-12 19:21:00'),

(N'Dior Miss Dior EDP 2021', 400000, 450000, 'https://orchard.vn/wp-content/uploads/2021/12/miss-dior-edp-new-2021-orchardvn-hinh1.jpg
', N'Phiên bản 2021 của dòng nước hoa huyền thoại Miss Dior chính thức được giới thiệu đến công chúng với sắc hồng tím ngọt lịm và chiếc nơ truyền thống trên cổ chai đã được thay đổi bằng chiếc nơ vải ánh bạc điệu đà, nữ tính. 
Francois Demachy – nhà chế tác nước hoa danh tiếng của Dior đã miêu tả rằng phiên bản Miss Dior EDP này mang cảm hứng gợi cảm, tươi vui và thần thái lan toả hương thơm hạnh phú như một đoá hoa của ngày cười. Những nốt cao sang của tinh chất hoa hồng đắt giá len lỏi giữa những đoá hoa lan chuông trong trẻo và một chút thú vị, thơm ngát của hoa mẫu đơn và diên vỹ.
Miss Dior EDP phiên bản 2021 được thiết kế mùi hương hiện đại và ít lớp nền gia vị hơn so với các phiên bản cũ. Ngoài hương hoa đặc trưng, lần này Miss Dior gia tăng sự ngọt ngào nữ tính với thành phần trái cây của qủa đào, quả mơ và hương vani, tất cả hoà quyện lại như hương thơm của một loại mật ong hảo hạng.
', 1 , 12, '2023-01-10 21:41:00'),

(N'Giorgio Armani Acqua di Gioia Eau Fraiche', 342000, 342000, 'https://orchard.vn/wp-content/uploads/2014/06/Giorgio-Armani-Acqua-di-Gioia-Eau-Fraiche_1.jpg
', N'Đầu năm 2013, Armani ra mắt mùi hương  mới Acqua di Gioia Eau Fraiche. Hương thơm là một phiên bản mới của Acqua di Gioia nước hoa ban đầu từ năm 2010. Acqua di Gioia Eau Fraiche được lấy cảm hứng từ làn gió tinh tế và làn nước mát lạnh, đây là một phiên bản thơm mát, nhẹ nhàng tôn vinh vẻ đep tự nhiên. Acqua di Gioia Eau Fraiche mở đầu với hương thơm tươi mát của trái cây cam, chanh, bưởi. Tiếp đến là hương thơm nhẹ nhàng của hoa nhài, Ylang- Ylang. Hương cuối quyến rủ với xạ hương và gỗ tuyết tùng.
', 1 , 8, '2023-02-11 09:50:00'),

(N'Giorgio Armani Giò de Giorgio Armani', 236000, 236000, 'https://orchard.vn/wp-content/uploads/2014/06/Giorgio-Armani-Gio-5ml_1_dleu-3j.jpg
', N'Nước hoa Giorgio Armani Gio mang phong cách dịu dàng, ngây thơ và không thể đoán trước.', 1 , 4, '2022-10-22 19:25:00'),

(N'Gucci Guilty Black Pour Femme', 450000, 450000, 'https://orchard.vn/wp-content/uploads/2014/06/Gucci-Guilty-Black-Pour-Femme-_1.jpg
', N'Tiếp nối những thành công của Gucci Guilty, Gucci đã cho ra mắt sản phẩm mới Gucci Guilty Black Pour Femme, mang đậm phong cách Phương đông nhưng không kém phần gợi cảm và lôi cuốn. Gucci Guilty Black Pour Femme gợi tả hình ảnh người con gái hiện đại và sexy. Loại nước hoa này đã đoạt giải thưởng về tính táo bạo, khiêu khích và hoàn toàn gây nghiện.
Gucci Guilty Black Pour Femme là biểu tượng mùi hương quyến rũ thế kỷ 21. Gucci Guilty Black Pour Femme là nước hoa đã đoạt giải thưởng về sự hấp dẫn và mùi hương đầy mê đắm, hấp dẫn của nó. Những ai đã từng một lần đi qua nó đều “được” mùi hương của nó đánh gục rất dễ dàng và nhanh chóng. Bây giờ với 1 chương mới, một phần tiếp theo của Gucci Guilty là sự đen tối, bí ẩn, câu chuyện trở nên hấp dẫn hơn, đem lại 1 cái nhìn mới, đam mê hơn càng táo bạo hơn.  Màu đỏ, một sắc màu tượng trưng cho sự nóng bỏng, mạnh mẽ và may mắn đậm chất Phương Đông. Những người yêu thích màu đỏ, thường rất mãnh liệt và quyết đoán. Gucci Guilty Black Pour Femme với hương thơm tạo cảm giác mạnh mẽ cho người phụ nữ đem lại cảm giác rằng cô ấy có thể đạt được bất cứ điều gì mà cô ấy muốn. Hương đầu:Hương thơm đòi hỏi sự chú ý với khúc dạo đầu lấp lánh của loại quả màu đỏ mọng nước và một bàn tay xấc láo của hạt tiêu hồng. Tâm trạng táo bạo của tuổi trẻ. Tầng hương giữa: kết hợp của mâm xôi và đào với hương nồng nàn của hoa lily và màu tím violet. Hương cuối: hoắc hương tạo cảm giác thèm muốn gây nghiện kết hợp với sự gợi cảm của hổ phách đầy vẻ nữ tính.
', 1 , 9, '2023-02-22 20:30:00'),

(N'Gucci Guilty Pour Homme EDP', 2000000, 2000000, 'https://orchard.vn/san-pham/gucci-guilty-pour-homme-edp
', N'Guilty Pour Homme phiên bản EDP mới toanh vừa được thương hiệu Gucci cho ra mắt năm 2020. Guilty Pour Homme EDP nối tiếp cho việc tôn vinh sự tự do qua tuyên bố #ForeverGuilty, với hương thơm cay nồng của ớt hòa cùng hoa hồng tạo nên sự khiêu khích mãnh liệt và say đắm.
', 1 , 5, '2022-12-28 09:22:00'),

(N'Kenzo Flower EDP', 310000, 310000, 'https://orchard.vn/wp-content/uploads/2014/06/kenzo_flower_eau_de_parfum_refillable_spray_100ml_1.png
', N'Kenzo Flower là loại nước hoa dành cho những người phụ nữ thành thị hiện đại luôn hướng về thiên nhiên để tạo cảm hứng sống mới và sáng tạo cho riêng mình. Flower by Kenzo một đóa hoa giữa lòng thành phố. Mùi thơm này của Kenzo mang hương hoa nhẹ nhàng với dấu ấn của hoa violet, vani và hoa hồng. Kenzo Flower giúp bạn thưởng ngoạn vẻ đẹp của loài hoa này theo phong cách thật khác biệt, với loại nước hoa Flower đặc biệt này bạn sẽ cảm nhận được điều đó. Nó nồng nàn hơn, gợi cảm hơn với chút hương thơm của hổ phách. Hương thơm mang lại một ấn tượng ban đầu vừa nhẹ nhàng vừa kinh ngạc bởi hương đầu tươi mát và rạng rỡ bao gồm phúc bồn đen, cây táo gai, hoa hồng, quả quýt. Tiếp nối là mùi hương thảo mộc quyến rũ chiết xuất nhựa hương, hoa nhài, hoa Violet, hoa hồng lung linh trong nắng. Hương cuối nhạy cảm tinh tế làm giàu với mùi hương sắc nét của hương vani, xạ hương, trầm hương. Từng khoảng khắc cứ trôi qua, ánh nắng dần tắt, cuốn bạn vào hành trình của tình yêu. Vỏ chai được thiết kế lấy cảm hứng từ vẻ đẹp quyến rũ của cơ thể người con gái và cảm giác bay bổng khi cất cánh bay lên. Nó chìm ngập trong ánh sáng và được bao phủ bởi một màn sương mờ mềm mại, mơ mộng.
', 1 , 8, '2023-01-28 08:00:00'),

(N'Lacoste Eau de Lacoste L.12.12 Blanc', 400000, 400000, 'https://orchard.vn/wp-content/uploads/2014/06/Lacoste-L_9kpx-k5.12.12.-Blanc_1.jpg
', N'French tennis player Rene Lacoste là người tạo ra chiếc áo polo đầu tiên của mình vào năm 1927. Code của nó là L.12.12. (“L” là viết tắt của Lacoste, số 1 tượng trưng cho “Petit Pique” vật liệu được sử dụng, 2 đại diện cho tay áo ngắn và 12 là số nguyên mẫu thực hiện trước khi sản phẩm cuối cùng). Lacoste L.12.12 ra mắt 3 loại nước hoa mới đầy nam tính lấy cảm hứng từ áo polo của họ. Ba loại nước hoa phù hợp với ba màu sắc của polos: trắng (Blanc), xanh dương (Bleu) và xanh lá cây (Vert).Nước hoa Lacoste L.12.12. Blanc mang hương thơm tinh khiết cổ điển của thân gỗ hoa. Đây là một sản phẩm không thể thiếu dành cho mùa hè năm nay.
', 1 , 7, '2023-01-29 09:10:00'),

(N'Paris Hilton For Woman', 352000, 352000, 'https://orchard.vn/wp-content/uploads/2014/06/nd.1434.jpg
', N'“Tôi luôn mơ ước sẽ có một nhãn hiệu thời trang của riêng mình. Những năm qua tôi đã cố gắng rất nhiều vì điều này. Tôi thực sự muốn thể hiện tính sáng tạo trong lĩnh vực thiết kế thời trang”, Paris tâm sự. Đó là lí do các sản phẩm của cô luôn được lấy cảm hứng từ chính phong cách thời trang cá nhân của cô. Không cần phải quảng cáo rầm rộ, mọi thứ đều đã quen thuộc, một nữ diễn viên, người mẫu, người thừa kế của tập đoàn khách sạn Hilton danh giá trên toàn thế giới và luôn là tâm điểm của các nhiếp ảnh gia săn đón. Một nhãn hiệu nước hoa mang tên chính cô – Paris Hilton – được thiết kế bởi Steve Demercado và James Krivda, đã ra đời vào năm 2005 và trở nên nổi tiếng trên thế giới. Khi bắt đầu, nước hoa Paris Hilton mát trong mùi trái táo ướp lạnh. Nó khiến người ta chìm sâu hơn vào lớp hương tiếp theo ướp đầy cảm giác nhẹ nhàng và lãng mạn của những thứ hoa màu trắng tinh khiết như lan nam phi, mimosa, hồng và huệ để rồi không muốn thoát ra nữa khi bị lớp hương cuối từ vỏ cây xạ hương cây sồi và gỗ đàn hương mê hoặc. Cả ba lớp hương đều quyến rũ và kiêu kỳ như người đẹp nó mang tên.
', 1 , 6, '2023-01-29 09:14:50'),

(N'Versace Crystal Noir', 390000, 390000, 'https://orchard.vn/wp-content/uploads/2014/06/Versace-Crystal-Noir-EDT_1.jpg
', N'Một loại nước hoa hiếm thấy bởi sự pha trộn giữa sự thanh lịch và vô cùng gợi cảm. Chai nước hoa được làm từ thủy tinh đen và ngọc hồng lựu hết sức tinh xảo và công phu. Hương thơm của nó làm bạn liên tưởng ngay đến những bông hoa dành dành tươi mới, một biểu tượng của sự gợi cảm. Nước hoa Crystal Noir sẽ “đánh thức” nàng công chúa lộng lẫy bên trong mỗi người phụ nữ và làm bạn toả sáng.
', 1 , 17, '2023-02-02 22:21:00'),

(N'Versace Pour Femme', 390000, 390000, 'https://orchard.vn/wp-content/uploads/2014/06/Versace-Pour-Femme-EDP-1.jpg
', N'Hãng nước hoa Versace vừa cho ra đời một loại mới thật đơn giản với tên Versace (Versace Pour Femme hoặc Versace Femme) dành cho nữ. Được xếp vào loại với hương hoa cổ điển. Donatella Versace đã phát biểu rằng: “Tôi đã khởi nghiệp bằng việc sáng chế ra dòng cổ điển, và cho đến nay tôi vẫn rất tự tin vào phong cách này. Vì phong cách cổ điển thì luôn là cái cốt lõi của mọi xu hướng thời trang và chắng bao giờ lỗi thời cả. Tôi tự tin rằng với nước hoa Versace Femme cùng phong cách cổ điển truyền thống của Versace tôi vẫn có thể gặt hái thành công”.
', 1 , 11, '2023-12-21 19:21:00'),

(N'Versace Yellow Diamond', 390000, 390000, 'https://orchard.vn/wp-content/uploads/2014/06/Versace-Yellow-Diamond_1_p6yz-1d.jpg
', N'Bạn chưa đủ tự tin để tỏa sáng, hãy để Versace giúp bạn với sản phẩm nước hoa Versace Yellow Diamond kiêu sa, quyến rũ. Với mùi hương tươi mát, tinh khiết của nó, sự quyến rũ của bạn sẽ được nâng lên mức hoàn hảo nhất. Mang đến một hương thơm sang trọng và mới mẻ, nước hoa Versace Yellow Diamond gửi tặng phái đẹp món quà của sự đam mê và hoàn hảo. Được thiết kế mô phỏng hình dạng viên kim cương tỏa sáng rực rỡ dưới ánh nắng mặt trời, hình ảnh đầy ý nghĩa mang thông điệp cho niềm kiêu hãnh riêng không thể nhầm lẫn của thương hiệu nước hoa Versace – cho phụ nữ khắp nơi trên thế giới tỏa sáng với vẻ đẹp nữ tính và vô cùng hấp dẫn, trở thành biểu tượng sang trọng và sự tinh tế ở mọi nơi mà phái đẹp xuất hiện. Mẫu nước hoa này mở đầu là sự hòa quyện rất hoàn hảo giữa nét tinh khiết, sang trọng, lôi cuốn đầy nữ tính và mê hoặc thông qua các mùi hương của cam Bergamot, hoa lan Nam Phi, hoa mimosa,… trong hình hài viên cương đầy quyền năng. Mở đầu với mùi hương tươi mát của chanh, cam bergamot, tinh dầu hoa cam và hương quả lê. Lớp hương giữa là hỗn hợp hương nhẹ nhàng của hoa cam, lan nam phi, mimosa và hoa súng. Cuối cùng, lớp hương đọng lại là hỗn hợp giữa hổ phách, xạ hương và gỗ guaiac. Đúng như tên gọi của mình, hình dáng lọ chai của Versace Yellow Diamond cũng được thiết kế mô phỏng viên kim cương vô cùng quý phái với phần nắp được gọt dũa, chăm chút đến từng chi tiết nhỏ nhằm tạo ra một viên kim cương thật sự hoàn hảo.
', 1 , 12, '2023-11-21 19:00:00')

Insert into tbProduct
Values
/*Nam*/
(N'Calvin Klein CK Be', 390000, 390000, 'https://orchard.vn/wp-content/uploads/2014/06/ckbe.jpg
', N'Nước hoa CK Be được thương hiệu Calvin Klein cho ra mắt vào năm 1996 bởi nhà sáng lập Ann Gottlieb đến nay vẫn luôn nhận được sự yêu thích của nhiều người, bất kể tuổi tác hay giới tính.
', 2 , 14, '2021-10-12 07:04:00'),

(N'Chanel Allure Homme Sport Eau Extreme', 2585000, 2585000, 'https://orchard.vn/wp-content/uploads/2014/06/Chanel-Allure-Homme-Sport-Eau-Extr%C3%AAme-_1_8rtf-q8.jpg
', N'Chanel vừa cho ra mắt dòng nước hoa nam – Allure Homme Sport Eau Extreme và bổ sung thêm vào bộ sưu tập nổi tiếng của Allure Homme. Sản phẩm đầu tiên của dòng này được tung ra vào năm 1999 và không lâu sau đó 1 vài phiên bản khác đã được xuất hiện như: Allure Homme Eau Fraichissante Pour l`Ete, Allure Homme Edition Blanche, Allure Homme Sport and Allure Homme Sport Cologne Sport.
Bậc thầy Jacques Polge một lần nữa đưa dòng sản phẩm này lên tầm cao mới với mùi hương phong trần, lôi cuốn hơn. Allure Sport Extreme hướng đến đối tượng là những tín đồ thể thao nên hãng đã chọn vận động viên lướt ván chuyên nghiệp Danny Fully làm đại diện hình ảnh với vẻ đẹp nam tính, cuốn hút của mình, anh đã định nghĩa đầy đủ thông điệp mà sản phẩm này mang lại chỉ với không đầy 20 giây trước khung hình. “Bạn là người đàn ông độc nhất và duy nhất, đấy là các tính riêng của bạn”.
', 2 , 17, '2021-12-22 21:21:00'),

(N'Diesel Fuel For Life Pour Homme', 1850000, 1850000, 'https://orchard.vn/wp-content/uploads/2014/06/diesel-fuel-for-life-homme-eau-de-toilette-125ml-avatar.jpg
', N'Nước hoa Fuel for Life đánh dấu sự trở lại của Diesel với lĩnh vực sản xuất nước hoa. Được ra mắt bằng hình thức cặp đôi hoàn hảo, hương thơm này là biểu tượng cho sự quyến rũ, tươi tắn và sành điệu hợp thời. Hình dáng chai đựng được thiết kế như một chai rượu Whisky được quấn trong tấm vải bạt nâu nhằm thể hiện một phong cách nam tính mạnh mẽ và độc đáo rất riêng biệt. Mở đầu với hương trái cây của Badian và bưởi đầy hứng thú, Fuel for Life tiếp tục bừng sáng với oải hương và cây vòi voi; sau đó lắng dịu với hương gỗ, Frambinone và hương cúc trường sinh lưu luyến.
', 2 , 15, '2021-05-16 14:30:00'),

(N'Dior Sauvage EDP', 570000, 570000, 'https://orchard.vn/wp-content/uploads/2018/04/m18230616_P3220029_medium.jpg
', N'Vào năm 2018, Dior giới thiệu phiên bản mới của Dior Sauvage đã ra mắt vào năm 2015 với nồng độ Eau De Parfum. Các thành phần với hơi hướng phương Đông và vani. Tạo nên mùi hương ngọt ngào, bí ẩn và gợi cảm.
Nhà chế tạo nước hoa Francois Demachy lấy sa mạc trong cảnh hoàng hôn làm cảm hứng điều chế nên Dior Sauvage. Ngài đã đưa làn gió mát, ngọt lành của màn đêm hoà cùng không khí nóng bỏng của sa mạc. Bằng cách đó một mùi hương nước hoa nam Dior nóng bỏng bậc nhất được ra đời.
', 2 , 8, '2021-06-13 19:21:10'),

(N'Dior Sauvage Elixir', 3990000, 3990000, 'https://orchard.vn/wp-content/uploads/2022/01/dior_sauvage_elixir_orchardvn_hinh2.png
', N'Dior Sauvage Elixir là hương thơm mới trong bộ sưu tập Sauvage của Dior, được ra mắt vào mùa hè 2021 được tạo nên bởi nhà chế tạo nước hoa Francois Demachy. Dior Sauvage luôn lọt top nước hoa nam được yêu thích trong phân khúc designer.
Với nồng độ S Elixir, Dior đã đi theo một hướng mới và bất ngờ, chỉ với một dung tích duy nhất 60ml cho lần đầu ra mắt. Lớp hương đầu bùng nổ với hương bưởi và gia vị. Quế và nhục đậu khấu, mang lại sự ấm áp và gợi cảm xen lẫn với hương bưởi vàng mạnh mẽ. Tinh hoa được chắt lọc lại ở tâm điểm oải hương được thu hoạch và chiết xuất theo mùa vụ mỗi năm mang đến những biến hoá đặc biệt cho Dior Sauvage Elixir. Những hình ảnh hoang dại nổi loạn của người đàn ông phong trần vẫn mãi là tượng đài là mọi phiên bản của Dior Sauvage hướng tới.
Ở tầng hương cuối nhất định phải gọi tên sự xuất hiện của hổ phách nóng bỏng tạo nên sức hút khó cưỡng của dòng nước hoa này. Pha trộn với mùi hương khô bốc từ cỏ hương bài vùng Haiti, hoắc hương và gỗ đàn hương.
', 2 , 5, '2022-01-22 21:50:30'),

(N'Dior Sauvage Parfum', 660000, 660000, 'https://orchard.vn/wp-content/uploads/2019/09/3348901486392_672fa1db2d985714658c181fc5f0ac72.jpg
', N'Dior Sauvage Eau De Toilette ra mắt từ năm 2015 đã làm “bấn loạn” giới yêu nước hoa bởi hương thơm vừa quyến rũ, vừa hoang dại. Và 2018 này hãng tung ra phiên bản Dior Sauvage Eau De Parfum tăng cường độ lưu hương để thỏa mãn các tín đồ nước hoa.
Mùi hương của phố thị hiện đại ồn ào. Phảng phất đâu đó mùi Cocktail Mojito mát lạnh cùng lớp gỗ mỏng manh, đậm mùi vỏ cam chanh tươi mát.
Khác với phiên bản EDP và EDT trước, Sauvage Parfum năm nay sẽ rất dữ dằn, mạnh mẽ với việc tăng cường các thành phần phương đông đặc biệt với Đậu Vanilla , hoa hồi, và hạt nhục đậu khấu.
Dior Sauvage Eau De Parfum với thiết kế và hương thơm đầy mạnh mẽ và nam tính nhưng hoàn toàn có thể cảm nhận được hương thơm quyến rũ lan tỏa ra từ dòng nước hoa huyền bí này.
Dior Sauvage lại ra mẫu mới lấy lấy cảm hứng từ tự nhiên, từ bầu trời xanh, núi đá, nóng dưới ánh mặt trời sa mạc với hương thơm có khả năng thu hút cả phái đẹp lẫn phái mạnh.
Thực tế, đây là sản phẩm nước hoa dành cho nam, tuy nhiên các cô nàng có cá tính mạnh mẽ hoàn toàn có thể sử dụng làm bật lên sức hấp dẫn và phong thái sang trọng của mình nhờ hương thơm này.
', 2 , 7, '2022-05-02 13:11:21'),

(N'Giorgio Armani Acqua Di Gio Pour Homme For Men', 450000, 450000, 'https://orchard.vn/wp-content/uploads/2014/06/Giorgio-Armani-Acqua-Di-Gi%C3%B2-Pour-Homme_1.jpg
', N'Giorgio Armani tạo ra hương nước hoa Giorgio Armani Acqua Di Gio được lấy cảm hứng từ những gì tinh túy nhất. Chai nước hoa được chính thức tung lên thị trường vào năm 1996 và vẫn được sử dụng rộng rãi tới bây giờ.
Nhà sáng chế Alberto Morillas lấy cảm hứng từ vẻ đẹp của vùng đất Pantellerie. Hương thơm không phân biệt bất kỳ giới tính nào. Sự tự do, hoà hợp giữa vị mặn ngọt của biển và nắng, gió ấm áp từ tinh không. Hương nước hoa đầy ánh nắng mặt trời Địa Trung Hải nóng như thiêu đốt mơn trơn trên làn da. Chai nước hoa bùng nổ sự nam tính trong con người bạn.
', 2 , 3, '2022-07-25 06:23:00'),

(N'Giorgio Armani Acqua Di Gio Profumo Pour Homme', 450000, 450000, 'https://orchard.vn/wp-content/uploads/2015/05/giorgio_armani_acqua_di_gio_profumo_1_pasb-u9.jpg
', N'Hương thơm nước hoa nam huyền thoại Acqua di Gio được hãng Giorgio Armani ra mắt vào năm 1996 và gần 20 năm sau phiên bản mới nhất của nó đã được giới thiệu với người hâm mộ với tên gọi Giorgio Armani Acqua Di Gio Profumo Pour Homme. Hương thơm này tượng trưng cho sự kết hợp của sóng biển với những tảng đá đen huyền bí.
', 2 , 12, '2021-09-02 09:03:51'),

(N'Gucci Guilty Black Pour Homme', 610000, 610000, 'https://orchard.vn/wp-content/uploads/2014/06/Gucci-Guilty-Black-Pour-Homme_1.jpg
', N'Gucci Guilty Black Pour Homme là phiên bản nước hoa ra đời năm 2013 của thương hiệu thời trang nổi tiếng bậc nhất thế giới Gucci. Với chủ trương nước hoa là thời trang và thời trang là nước hoa, Gucci đã đem đến thế giới này những bộ cánh lộng lẫy, những phụ kiện bắt mắt cùng những giọt nước hoa tinh tế, tuyệt vời. Với hương thơm nam tính mạnh mẽ và táo bạo Guilty Black Pour Homme là lựa chọn số 1 của các anh chàng thời thượng, thích khám phá. Xuất hiện trong không gian huyền bí của đêm đen để thêu dệt một câu chuyện tình đầy kịch tính, phiêu lưu đó chính là mục đích của Gucci Guilty Black Pour Homme. Nếu Gucci Guilty là hương thơm của niềm đam mê và thú vui tội lỗi. Thì bây giờ, Gucci Guilty Black còn hơn thế nữa. Đây là hương thơm dành cho những người phá cách, muốn thể hiện bản thân, muốn phá vỡ các nguyên tắc, muốn sự khác biệt. Về thiết kế chai thì không chê vào đâu được, rất hiện đại, rất sexy và rất ..rất…rất Gucci. Mùi hương có chiết xuất từ nhóm  nguyên liệu có mùi hương mê đắm, khiêu khích như  rau mùi xanh, hoa oải hương kết hợp với hoa cam, dầu hoa cam, hương xanh hòa quyện cùng hoắc hương, tuyết tùng tạo nên một phong cách rất đàn ông, rất Gucci, kiến tạo nên một phong cách riêng biệt.
', 2 , 14, '2021-05-27 23:01:00'),

(N'Hugo Boss Hugo Reversed EDT', 2290000, 2290000, 'https://orchard.vn/wp-content/uploads/2022/01/hugo_boss_hugo_reversed_orchardvn_hinh5.jpg
', N'Hugo Boss cho ra mắt hương thơm mới cho Bộ sưu tập Hugo, được lấy cảm hứng từ dòng thời trang Hugo Reversed. Bạn có thể dễ dàng nhận biết chai nước hoa Hugo Reversed, bởi vỏ màu trắng và phong cách đặc trưng của thương hiệu. Logo Hugo cũng được in đối xứng, và bản thân nó cũng là 1 hình ảnh phản chiếu của bộ sưu tập thời trang Reversed.
Hugo Reversed mang trong mình hơi hướng của thành thị hiện đại, nhưng vẫn giữ được nét phá cách của dòng thời trang Hugo Reversed. Hương thơm thành thị  được mô tả như 1 ly cocktail cam quýt tươi mới, tương phản với hương gỗ lịch lãm từ cỏ hương bài. Hugo Reversed tỏa ra sức mạnh và bạn chủ động định hình trong cuộc sống.
', 2 , 17, '2021-08-15 05:30:50'),

(N'Jean Paul Gaultier Le Male', 2290000, 2290000, 'https://orchard.vn/wp-content/uploads/2014/06/Jean-Paul-Gaultier-Le-Male.jpg
', N'Đây là loại nước hoa đầu tiên mà Gaultier dành cho nam giới, ông muốn làm hồi sinh những giá trị truyền thống trong nước hoa Le Male. Kiểu chai thể hiện một cách gợi cảm qua hình tượng bán thân của nam giới với chiếc áo thủy thủ. Le Male đánh dấu một kỷ nguyên mới của thị trường nước hoa nam tạo nên tượng đài mùi hương gợi cảm bậc nhất cho đến ngày nay, chính vì điều đó đã làm nên những doanh số vượt thời gian cho nhà Jean Paul Gaultier. Hình tượng những chàng trai ngon nghẻ hay một người đàn ông cuồn cuộn cơ bắp vẫn có thể ướp lên mình thứ hương thơm cực đỉnh từ Le male. Những dòng chảy vani phối trộn cùng bạc hà và oải hương, hoa cam đơn giản nhưng bằng khướu giác vượt bậc của nhà chế tác Francis Kurkdjian đã đủ tạo nên một thứ bùa yêu mãnh liệt có thể hớp hồn cả nam giới lẫn nữ giới.
', 2 , 7, '2021-02-21 21:21:21'),

(N'Jean Paul Gaultier Ultra Male EDT', 3290000, 3290000, 'https://orchard.vn/wp-content/uploads/2021/03/Jean-Paul-Gaultier-Ultra-Male-EDT-orchard.vn_.jpg
', N'Jean Paul Gaultier Ultra Male chai nước hoa quyến rũ đầy ngọt ngào. Mùi hương phảng phất, mê hoặc, ai “bắt” lấy được hương thơm này rồi thì nhớ mãi không quên. Không hẳn mà tự nhiên chai nước hoa này được mô tả đầy sự kích thích và tò mò đến vậy. 
', 2 , 22, '2023-02-26 07:03:15'),

(N'Mancera Paris Cedrat Boise EDP', 2900000, 2900000, 'https://orchard.vn/wp-content/uploads/2019/03/Mancera-Cedrat-Boise-e1553240900557.jpg
', N'Thuộc dòng nước hoa unisex, nước hoa Mancera Paris Cedrat Boise được ra đời vào năm 2011 của thương hiệu Mancera. Mang đậm sắc hương của hương cam chanh thơm ngát. Một mùi hương không sinh ra để dành cho đám đông nhưng làm mê đắm những ai có chiều sâu và mãi vương vấn sau một vài lần thưởng thức. 
Nước hoa Mancera Paris Cedrat Boise được ra đời vào năm 2011 mang đậm sắc hương của hương cam chanh thơm ngát.
', 2 , 9, '2022-12-15 15:43:33'),

(N'Montblanc Signature', 2650000, 2650000, 'https://orchard.vn/wp-content/uploads/2021/06/montblanc-signature-orchardvn-anh1.jpg
', N'Dòng nước hoa Signature được Montblanc giới thiệu như một loại mùi hương hoa trên nền hổ phách ngọt ngào cho nữ giới. Được sáng tạo bởi nhà điều chế hương Guillaume Flavigny và Nathalie Gracia-Cetto.
Nếu bạn muốn sở hữu một mùi hương đầy lưu luyến mỗi khi lướt ngang một ai đó và để lại ấn tượng đối lập giữa sức hút gợi cảm pha lẫn nét tinh khôi thanh lịch thì tất cả sẽ là lý do để bạn nên chọn Signature
', 2 , 6, '2022-11-22 14:17:42'),

(N'Nautica Voyage N-83', 2100000, 2120000, 'https://orchard.vn/wp-content/uploads/2016/08/zoom_variation_999_view_A_2200x2200.jpg
', N'Sau Voyage ra đời năm 2006, Nautica đã trình làng dòng Nautica Voyage N-83, một loại nước hoa mới dành cho nam giới.
Mùi hương thể hiện cảm giác của thăm dò, quyền lực, và một mong muốn mạnh mẽ để khám phá cuộc phiêu lưu mới. Con số “83” vinh danh năm thành lập của công ty và biểu tượng cánh buồm phong phú của thương hiệu. Cổ điển, tinh tế, và ly kỳ, hương thơm gợi lên những cơn gió biển đượm vị mặn sắc nét, gia vị nồng nàn, và hương gỗ trầm ấm.
Note hương đầu lôi cuốn của nước biển đại dương vùng bờ biển Junqillat ở Costa Rica, kết hợp với hương cay thanh thoát của lá bạc hà và tinh dầu lá cam. Điểm nhấn của hương giữa là các dấu ấn nồng ấm của bạch đậu khấu, nhục đậu khấu, và Lavender. Hương cuối gợi cảm của xạ hương, gỗ đàn hương và gỗ tuyết tùng neo lại, giữ đó một cảm xúc hưng phấn cho mùi hương này.
', 2 , 6, '2023-02-25 09:21:41'),

(N'Trussardi Black Extreme For Men', 350000, 350000, 'https://orchard.vn/wp-content/uploads/2017/08/trussardi-uomo-black-extreme-eau-de-toilette.jpg
', N'Một tuyên bố của thương hiệu Trussardi: “Tất cả giá trị chính của thương hiệu Trussardi đều nằm trong hương nước hoa phiên bản mới Trussardi Black Extreme này, Mạnh mẽ và đa dạng, nó thu hút và chiến thắng cảm giác như một thứ vũ khí quyến rũ mới của sự quyến rũ. “.
Hương thơm mới Trussardi Black Extreme dựa trên sự quý hiếm của da thuộc được bao quanh bởi những note hương gỗ trang nhã. Thành phần này mở ra với sự kết hợp sáng tươi của chanh Ý và hương nước tươi mát. Để rồi dẫn đến lớp hương giữa là sự ngọt ngào của tổng hợp các loại trái cây, trong đó vai trò chính của quả mận đen làm nổi bật nét quyến rũ đặc trưng, hiện đại cho hoa diên vỹ Iris Ý. Hương cuối làm dịu lắng lại với sự có mặt của cỏ vertiver và hoắc hương tăng cường với da thuộc, góp phần làm nên nét đặc sắc của sự nam tính.
Nước hoa phiên bản mới này vẫn mang phong cách thiết kế của phiên bản Trussardi Uomo 2011 trước, được ra mắt vào năm 2014. Có sẵn các dung tích 50ml và 100ml
', 2 , 9, '2021-09-16 21:31:50'),

(N'Versace Eros For Men EDT', 1250000, 1250000, 'https://orchard.vn/wp-content/uploads/2014/06/Versace-Eros-For-Men_1.jpg
', N'Được giới thiệu lần đầu tại liên hoan phim Cannes 2012, Versace Eros lấy nguồn cảm hứng từ vị thần tình yêu trong thần thoại  thần thoại Hy Lạp(Eros là vị thần hy lạp của tình yêu). Versace Eros For Men là sự kết hợp và thể hiện của niềm đam mê vô tận và ham muốn mãnh liệt.
', 2 , 5, '2022-12-12 19:51:45'),

(N'Versace Pour Homme', 2068000, 2070000, 'https://orchard.vn/wp-content/uploads/2014/06/Versace-Pour-Homme_1.jpg
', N'Mùi hương mới cho nam giới – Nước hoa Versace Pour Homme – là sự pha trộn các thành phần tinh chất có nguồn gốc Địa Trung Hải với hỗn hợp hương thơm hàng đầu rất phù hợp cho nam giới ngày nay: đó là những người đàn ông tri thức và tự tin, năng động, mạnh mẽ và đầy đam mê, sống hài hòa với thế giới tự nhiên.
', 2 , 6, '2023-02-22 19:21:37')
	
Insert into tbProduct
Values
/*Nữ*/
(N'Armaf Club De Nuit Women EDP', 100000, 120000, 'https://orchard.vn/wp-content/uploads/2018/08/Armaf-Club-De-Nuit-105ml-EDP-for-Women-bottle.jpg', N'Club De Nuit Women của Armaf là một hương thơm thuộc nhóm hương trái cây dành cho nữ. Đây là phiên bản có cấu tạo & sự phân bố các nốt hương gần như chuẩn xác nhất so với Chanel Coco Mademoiselle đó là mở đầy với nốt hương citrus, tiếp đến là hương thơm floral và cuối cùng là tầng hương gỗ và hoắc hương, xạ hương
', 3 , 9, '2022-10-12 12:21:33'),

(N'Chanel Chance Eau Tendre EDP', 3500000, 4700000, 'https://orchard.vn/wp-content/uploads/2019/02/Untitledxx.jpg', N'Một sự đổi mới trong những nốt hương tạo nên nét tươi mới cho dòng sản phẩm nước hoa của Chanel. Chance Eau Tendre đã đem đến sự đột phá với phong cách tao nhã, dường như biến mọi cô gái trở nên nàng thơ với vẻ đẹp thuần khiết lấp lánh điệu dáng tươi vui.
Jacques Polge rất nghệ sĩ khi kết hợp vị hương thanh khiết, mong manh của hương hoa hòa cùng sức hương sống động tươi mát của hương thơm trái cây đã tạo nên những tầng hương êm dịu và thanh tao. Chance Eau Tendre được ra đời vào năm 2010.
Chance Eau Tendre làm say đắm nàng bởi lớp hương đầu của bưởi và mộc qua, thanh mát và tao nhã, tiếp đến là những nốt hương nồng nàn của huệ dạ hương lan tỏa để lại chút ấn tượng khó phai. Sau khi tất cả dường như lắng dần, thì nốt cuối cùng của xạ hương lại bắt đầu ấm lên nhẹ nhàng và đậm chất thơ lãng mạn.
Chance Eau Tendre không quá cuốn hút ngay lần đầu, nhưng cũng không dễ để có thể quên ngay được
', 3 , 7, '2019-9-7 11:22:23'),

(N'Chanel Chance EDP', 2580000, 3900000, 'https://orchard.vn/wp-content/uploads/2014/06/Chanel-Chance-EDP-_1_6nk0-i9.jpg', N'Chance, hương thơm mới từ Chanel, là một kết hợp đầy bất ngờ, là sự va chạm của những làn sóng hương hoa tươi mát bất tận, toát lên một vẻ quyến rũ nồng nàn. Nước hoa Chanel Chance mang một tên gọi làm gợi lên một cảm giác thần thoại. Nếu Chanel và Chance mang phát âm gần giống nhau, đó không chỉ là do may mắn, đó còn là vì “chúng được sáng tạo nên để dành cho nhau”.
Như những đợt sóng tươi mát, hòa với hương hoa thơm ngát cùng những thành phần mùi hương đặc biệt khiến cho Chanel Chance trở nên rất gợi cảm và ngọt ngào, nữ tính đến đáng kinh ngạc, dồi dào năng lượng sống, táo bạo pha chút gợi tình và nghịch ngợm.
', 3 , 7, '2019-9-7 11:22:23'),

(N'Chanel Coco Mademoiselle EDP', 3590000, 4790000, 'https://orchard.vn/wp-content/uploads/2014/06/Chanel-Coco-Mademoiselle-EDP-1_iukh-g7.jpg
', N'Coco Mademoiselle Intense Eau de Parfum là một ví dụ điển hình về một loại nước hoa thực sự là một phiên bản mãnh liệt hơn của bản gốc. CHANEL gọi đó là “trên cả tự nhiên”, và là “hương thơm không thể bị lãng quên” . Đây là một tuyên bố táo bạo và để đạt được điều này, CHANEL đã khuếch đại từng khía cạnh quan trọng của bản gốc – từng hơi thở của cam quýt, phảng phất màu đen xạ hương và màu hổ phách sáng – để vẽ một bức tranh rõ nét hơn về Coco Mademoiselle. Một khía cạnh mới mãnh liệt của Coco Chanel  xuất hiện để tạo ra một mùi hương đầy sức mạnh, sâu sắc và gây nghiện không thể cưỡng lại dưới mọi hình thức. Một nồng độ cao-EDP, sáng và sâu của hoắc hương truyền vào Coco Mademoiselle với một nồng độ dễ chịu. Hợp chất hổ phách ấm áp, mềm mại và nữ tính cùng với sự pha trộn độc đáo của đậu tonka và vanilla từ Madagascar – kết hợp tất cả để cho ra một mùi hương trong sự gợi cảm
', 3 , 8, '2019-7-9 11:22:23'),

(N'Elie Saab Girl of Now Shine EDP', 3000000, 3200000, 'https://orchard.vn/wp-content/uploads/2020/01/elie-saab-girl-of-now-shine-orchard.png', N'Elie Saab tiếp tục cho ra mắt dòng nước hoa dành cho nữ giới mới với tên gọi Elie Saab Girl Of Now Shine và được giới thiệu vào năm 2018. Lấy cảm hứng từ dòng thời trang cao cấp.
Nốt hương đầu của Elie Saab Girl Of Now Shine mở ra với vị thanh mát, tươi mát của các loại quả lê, dứa. Ở hương kế tiếp, tổ hợp các loại hoa trắng từ nhài, ngọc lan tây gợi cảm mang đến mùi hương ngọt ngào, tinh tế rất dễ gây nghiện. Hương cuối với hoắc hương, vani sẽ để lại sự vương vấn dai dẳng hàng giờ sau, khiến cho các nàng khó có thể chối từ
', 3 , 6, '2019-4-6 9:49:23'),

(N'Giftset Dior Miss Dior EDP 2021 2pcs', 3490000, 4000000, 'https://orchard.vn/wp-content/uploads/2022/03/2588646.jpg', N'Francois Demachy – nhà chế tác nước hoa danh tiếng của Dior đã miêu tả rằng phiên bản Miss Dior EDP này mang cảm hứng gợi cảm, tươi vui và thần thái lan toả hương thơm hạnh phú như một đoá hoa của ngày cười. Những nốt cao sang của tinh chất hoa hồng đắt giá len lỏi giữa những đoá hoa lan chuông trong trẻo và một chút thú vị, thơm ngát của hoa mẫu đơn và diên vỹ.
Miss Dior EDP phiên bản 2021 được thiết kế mùi hương hiện đại và ít lớp nền gia vị hơn so với các phiên bản cũ. Ngoài hương hoa đặc trưng, lần này Miss Dior gia tăng sự ngọt ngào nữ tính với thành phần trái cây của qủa đào, quả mơ và hương vani, tất cả hoà quyện lại như hương thơm của một loại mật ong hảo hạng
', 5 , 4, '2019-5-4 9:51:23'),

(N'Gucci Bloom For Women EDP', 710000, 3490000, 'https://orchard.vn/wp-content/uploads/2017/09/Untitled-1-9.jpg', N'Một mùi hương được chế tạo để tạo dấu ấn, sức sống và sự biến hoá đa dạng của phụ nữ. Gucci Bloom “đậm” hương hoa. Hương thơm toả trên da thịt khiến bạn như một vườn hoa ngát hương. Mùi hương sang trọng và tinh tế.
Cảm nhận đầu tiên khi xịt lên da là một hương thơm vô cùng nữ tính từ hoa Kim Ngân. Tiếp đến là sự nồng nàn từ hoa Nhài Sambac. Chiết xuất hoa nhài thu được thông qua một phương pháp khai thác độc quyền để truyền đạt một mùi hương tươi xanh trên da. Hoa đào chuông (Rangoon creeper) thể hiện ý tưởng và tên của nước hoa.
Mùi hoa huệ trắng mềm mại, nhẹ nhàng mà trang trọng. Nhà thiết kế đã thêm vào đó hương của rễ cây diên vĩ để tất cả các hương hoa có trong Gucci Bloom trộn lẫn hài hòa với nhau
', 3 , 5, '2020-2-6 9:52:25'),

(N'Gucci Flora Gorgeous Gardenia EDP', 640000, 3900000, 'https://orchard.vn/wp-content/uploads/2022/01/gucci_flora_gorgeous_orchardvn_hinh1.jpg
', N'Gucci Flora Gorgeous Gardenia mang đến 1 phiên bản Eau de Parfum mới cho bộ sưu tập. Với mùi hương mới từ những loài hoa, thể hiện sự mạnh mẽ và sắc xảo hơn so với phiên bản Eau De Toilette ban đầu. Gorgeous Gardenia EDP mang 1 mùi hương gợi cảm và ngọt ngào. Hương hoa lê mở đầu với sắc thái tươi mới xuất hiện sớm trong lớp hương đầu. Hương hoa dành dành và hoa nhài dần lộ diện, làm cho lớp hương đầu trở nên ngọt ngào và quyến rũ hơn hẳng. Mùi hương được điểm xuyến thêm, bởi sự ngọt ngào của đường nâu, và hoắc hương. Nếu bạn là tính đồ của nhóm hương hoa cỏ, thì bạn không thể bỏ qua em Flora Gorgeous Gardenia Eau de Parfum từ nhà Gucci đâu nhé.
', 3 , 10, '2021-6-2 11:52:25'),

(N'Lancôme La Vie Est Belle L’Eau De Parfum', 560000, 3600000, 'https://orchard.vn/wp-content/uploads/2015/10/Lanc%C3%B4me-La-Vie-Est-Belle-EDP-_1_4134-da.jpg
', N'Mở đầu với hương thơm là sự bùng nổ mới mẻ của nho đen Hy Lạp và quả lê mọng nước, hương thơm trái cây dần chuyển sang những hương hoa khi note hương giữa lộ diện cùng hoa diên vỹ và hoa nhài quyến rũ. Và đến cuối hương va ni bắt đầu tỏa sáng cùng với một mùi thơm của bánh nhân hạt praline. Sự ngọt ngào từ lớp hương vẫn mượt mà từ lớp đầu đến lớp cuối, tạo nên một tổng thể hương thực phẩm thơm ngon nhưng vẫn rất nhẹ nhàng và trang nhã
', 3 , 5, '2021-6-2 11:52:25'),

(N'Lancôme Miracle', 450000, 2850000, 'https://orchard.vn/wp-content/uploads/2014/06/Lanc%C3%B4me-Miracle-1_s5qd-ax.jpg', N'Miracle đem đến điều những điều huyền diệu đúng như tinh thần của nó. Gương mặt quảng cáo cho nước hoa Miracle là Uma Thurman-người phụ nữ có nét đẹp thanh tao, hiện đại, năng động và rất tài ba. Nước hoa Miracle củaLancômemang đầy đủ tính chất của loại nước hoa mang phong cách Phương Đông hiện đại. 
Sự hiện đại, tao nhã được thể hiện rõ trong khúc biến tấu hương thơm với quả vải, lan Nam Phi ở nốt hương đầu, ở nốt hương giữa có thể cảm nhận rõ hoa mộc lan, gừng, quả quýt, hạt tiêu, hoa nhài đang nhảy múa, cuối cùng vũ điệu mùi hương từng bước nhẹ nhàng lắng đọng cùng hổ phách, xạ hương.
Lancôme Miracle tạo ra sự khác biệt từ những gì tưởng chừng quen thuộc nhất. Kiểu chai được làm bằng thủy tinh màu hồng, hình dáng sang trọng với những đường cong rất đẹp và nắp bằng kim loại sáng bóng – dịu dàng và nữ tính mang đến một nét đẹp tao nhã nhưng diệu kỳ dành cho người phụ nữ. Miracle được tạo ra bởi Harry Fremont và Alberto Morillas. 
', 3 , 8, '2022-2-6 13:35:53'),

(N'Moschino Toy 2 Bubble Gum For Women', 320000, 2500000, 'https://orchard.vn/wp-content/uploads/2021/12/moschino-toy-2-bubble-gum-orchardvn-hinh6.jpg
', N'Sau thành công của các phiên bản Toy 2 cho nữ giới và Toy Boy cho nam giới, nhà mốt Moschino tiếp tục cho ra mắt phiên bản “gấu hồng” Toy 2 Bubble Gum cực xinh để tiếp nối bộ sưu tập nước hoa hiện đại này. Moschino Toy 2 Bubble Gum như được nhân đôi phong cách vui nhộn, tinh nghịch và đáng yêu của các cô gái trẻ. Hỗn hợp bùng nổ từ hàng loạt nốt hương trái cây và kẹo ngọt như đưa tâm hồn của bạn bay lên hành tinh của sự ngọt ngào. Nốt hương đặc biệt kẹo gum bạc hà mang lại một chút the mát cho tầng hương giữa, kết thúc là xạ hương, hỗn hợp long diên hương nhân tạo và gỗ tuyết tùng
', 3 , 7, '2020-2-6 9:35:53'),

(N'Moschino Toy 2 EDP', 320000, 2500000, 'https://orchard.vn/wp-content/uploads/2019/07/moschino-toy-2-orchardvn-avt.jpeg
', N'Sau bốn năm sau khi ra mắt mùi hương Toy, Moschino đã cho ra mắt một phiên bản mới của nước hoa dành cho nữ. Với thiết kế phải nói cực dễ thương nhưng lại toát lên được sự đẳng cấp và tinh tế. Moschino Toy 2 EDP là hương thơm tươi mới, nhẹ nhàng và xen chút ấm áp nhờ sự kết hợp độc đáp của 3 tầng hương. Ba tầng hương quả và hoa, kết lại với tông gỗ phá cách. Đó là một sự kết hợp tuyệt vời đem đến cho người dùng như một nguồn cảm hứng mới sinh khí mơi rất tươi mát và trong sáng. 
', 3 , 6, '2022-2-6 9:35:53'),

(N'Narciso Rodriguez For Her EDP', 620000, 3400000, 'https://orchard.vn/wp-content/uploads/2015/01/Narciso-Rodriguez-For-Her-EDP-100ML_t6av-n0.jpg', N'Nước hoa Narciso Rodriguez Pure Mucs For Her EDP là dòng nước hoa mới nhất của thương hiệu nổi tiếng thế giới Narciso Rodriguez, ra mắt năm 2019. Với thành phần hương chính là mùi xạ hương và hoa. Mùi hương này lấy cảm hứng từ vẻ đẹp thuần khiết của người mẫu Julia Bergshoeff.
Narciso Rodriguez Pure Musc For Her EDP được tạo ra bởi nhà điều chế Sonia Constant tượng trưng cho một loại nước hoa tinh khiết, thanh tao và mềm mại. Vẫn giữ nguyên thiết kế chai thủy tinh mờ đơn giản nhưng sang trọng, cùng tông màu đen trắng toát lên vẻ đẹp kiêu kỳ. Pure Musc For Her EDP trở nên nổi bật và đáng nhớ nhất khi đứng cạnh các dòng nước hoa For Her của hãng
', 3 , 4, '2023-4-2 10:34:42'),

(N'Versace Bright Crystal EDT', 85000, 2400000, 'https://orchard.vn/wp-content/uploads/2014/06/Versace-Bright-Crystal-EDT-1a.jpg', N'Gợi tình, trong suốt và sáng bóng. Lấy cảm hứng từ sự kết hợp giữa các sản phẩm nước hoa độc đáo nhất của Donatella Versace, nước hoa Bright Crystal ra đời mang trong mình hương thơm mát dịu của lựu, yuzu cùng mùi hương đầy lãng mạn và gợi tình của mẫu đơn, mộc lan, hoà quyện cùng hương thơm ấm áp của xạ hương và hổ phách.
Nước hoa được thiết kế bởi Alberto Morillas vào năm 2006. Bright Crystal kết hợp với kiểu chai màu hồng cùng hương thơm mềm mại và sáng hơn Crystal Noir. Với thiết kế tương tự một viên pha lê thật càng lèm vẻ đẹp của nó được tăng lên nhiều lần.
Bright Crystal mang trong mình hương thơm mát dịu của lựu, cam yuzu trộn lẫn với mùi hương đầy thu hút của mẫu đơn, mộc lan, hoà quyện cùng hương thơm ấm áp của xạ hương và hổ phách. Các tầng hương cứ quyện tròn, xoáy trào lên nhau và tạo nên những khúc ca thanh xuân tươi đẹp
', 3 , 8, '2023-4-2 10:04:40'),

(N'Versace Dylan Turquoise EDT', 100000, 2500000, 'https://orchard.vn/wp-content/uploads/2021/04/versace-dylan-turquoise-orchard.vn_.jpg', N'Hương thơm mở ra đầy tươi mát và sản khoái của chanh và quýt tượng trưng cho những điều ngọt ngào, để rồi dần thả mình tan vào cùng nốt hương Hồng tiêu nhẹ nhàng nhưng sâu lắng. Sự bùng nổ thật sự phải nối đến đó là sự xuất hiện của những note hương ổi, hoa nhài, gỗ lành, xạ hương, sự kết hợp gợi cảm và tinh tế này mở ra một khía đầy quyến rũ và cuốn hút của người phụ nữ hiện đại.
Thiết kế chai là một biểu hiện của thiết kế sáng tạo, đường cong thanh lịch của nó mang đến cảm giác như một chiếc bình amphora của văn hóa Hy Lạp và thần thoại. Thân chai phủ một lớp mờ phản chiếu làn nước nước hoa màu xanh lam bên trong lấp lánh như một viên pha lê của biển cả. Các chữ cái tên thương hiệu theo phong cách Baroque được khéo léo khắc nổi trên phần thân kim của chai như một tác phẩm nghệ thuật
', 3 , 10, '2023-5-2 10:52:25'),

(N'Narciso Rodriguez Pure Musc For Her EDP', 100000, 120000, 'https://orchard.vn/wp-content/uploads/2020/09/narciso-rodriguez-pure-musc-10ml.jpeg', N'', 3 , 7, ''),


-- Function 

-- Procedure

-- Trigger

-- Insert

Create table detailUser


Select top 8 ProductID, ProductName, Image, SalePrice, CateID 
from tbProduct
Where CateID = 1


Select * from tbUser
Select * from tbUserInfor

Select UserID from tbUser
Where UserName = 'admin1'

Select UserName, Password, Name, Address, Phone 
from tbUser a inner join tbUserInfor b 
on a.UserID = b.UserID and a.UserName = 'admin1'


Update tbUser 
set Password = '123'
Where UserName = 'admin1'

Select UserName, Password, Name, Address, Phone 
from tbUser a inner join tbUserInfor b 
on a.UserID = b.UserID and a.UserName = 'admin1'


Update tbUserInfor
set Name = N'Nguyễn Anh Hoàng' , Phone = N'0374201805', Address = N'Hà Tĩnh'
Where UserID = '1'

Select UserName, Password, Name, Address, Phone 
from tbUser a inner join tbUserInfor b 
on a.UserID = b.UserID and a.UserName = 'admin1'

Update tbUserInfor
set Name = N'Nguyễn Hoàng Anh' , 
	Phone = N'0374201809', 
	Address = N'Hà Tĩnh'
Where UserID = '1'

Select * from tbUserInfor
Select * from tbUser


Select UserID from tbUser 
Where UserName = 'admin1'


Update tbUser 
Set Password = 123
Where UserName = 'admin1'







<-- Drop table tbUserInforDetail -->

Create table tbUserInforDetail(
	UserID int not null PRIMARY KEY,
	Name Nvarchar(50) not null,
	Address Nvarchar(255) not null,
	Phone Nvarchar(10) not null unique,
	constraint fk_User_Infor foreign key(UserID) references tbUser(UserID)
)


Insert into tbUserInforDetail
Values
(1, N'admin1',N'123',N'Nguyễn Hoàng Anh', N'Hà Tĩnh', N'0374201805'),
(2, N'admin2',N'123',N'Nguyễn Công Thành', N'Hà Tĩnh', N'0363012495'),
(3, N'admin3',N'123',N'Phạm Nguyễn Thiên Chương', N'Đà Nẵng', N'0126577420'),
(4, N'admin4',N'123',N'Nguyễn Bảo Trung', N'Quảng Ngãi', N'0356234672'),
(5, N'admin5',N'123',N'Ngô Tuấn Kiệt', N'Đắc Lắk', N'0776316789'),
(6, N'user1',N'234',N'Vũ Văn Hoàng', N'Hà Nội', N'0989350596'),
(7, N'user2',N'234',N'Trần Quốc Tuấn', N'Huế', N'0363148375'),
(8, N'user3',N'234',N'Thủy Huyền Vũ', N'Bắc Ninh', N'0988816483'),
(9, N'user4',N'234',N'Phong Bạch Hổ', N'Hải Phòng', N'0378462148'),
(10, N'user5',N'234',N'Lôi Thanh Long', N'Hà Nội', N'0363278678'),
(11, N'user6',N'234',N'Hỏa Chu Tước', N'Nghệ An', N'0776498513'),
(12, N'user7',N'234',N'Kim Toan Nghê', N'Đà Lạt', N'0124889765'),
(13, N'user8',N'234',N'Nhạc Tù Ngưu', N'Bắc Ninh', N'0656742885'),
(14, N'user9',N'234',N'Thô Phủ Tiêu Đồ', N'Hà Nội', N'0343627232'),
(15, N'user10',N'234',N'Đỗ Bạch Trạch', N'Quy Nhơn', N'0964432958'),
(18, N'user11',N'234',N'Thạch Bí Hí', N'Thừa Thiên Huế', N'0472585666')

-- Bảng chi tiết tài khoản


Create table tbCookie(
UserName nvarchar(50) not null primary key,
Name nvarchar(30),
Value nvarchar(max),
constraint fk_User_Cookie foreign key(UserName) references tbUser(UserName)
)

Select * from tbCookie

Select Name, Value from tbCookie
Where UserName = 'admin1'


Drop table Cookie

Insert into tbCookie
Values
(N'user1', N'cart', N'51:1/51:1/51:1/52:1/53:1/54:1/51:1/62:1/65:1/64:1/50:1')

	Delete from tbCookie
	Where UserName = 'user1'

Select * from tbUser

Select * from tbCookie
Where UserName = 'user1'


Insert into tbCookie Values
(N'user1', N'cart', N'51:1/51:1/51:1/52:1/53:1/54:1/51:1/62:1/65:1/64:1/50:1')

Update tbCookie
set	Value = ''
Where UserName = 'user1'

Select * from tbUser
Select * from tbUserInfor

Insert into tbUserInfor
Values
(17, N'Test', N'Đà Nẵng', N'0968752163')

Delete from tbUserInfor
	Where UserID = 17


Insert into tbUserInfor
                            Values
                            (17,N'Va',N'Hà Tĩnh',N'09766665')
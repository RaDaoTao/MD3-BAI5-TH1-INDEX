-- Bước 1: Import file vừa vào MYSQL theo hướng dẫn 
-- Bước 2: Chọn Database `classicmodels` để thao tác với cơ sở dữ liệu này:
USE `classicmodels`;
-- Bươc 3 : Tìm thông tin của khách hàng có tên là Land Of Toys In
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

-- Bước 4: Dùng EXPLAIN Query; 
-- Bằng lệnh này bạn sẽ nhận ra được với câu Query của bạn, điều gì đang xảy ra và kiểu kết hợp (Join) nào đang diễn ra bên trong.
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

-- Bước 5: Thêm chỉ mục cho bảng customers
ALTER TABLE customers ADD INDEX idx_customerName(customerName);

-- Bước 6 : Chạy lại lệnh EXPLAIN Query của Bước 4 và quan sát kết quả so sánh với lúc chưa tạo index
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

-- Tốt hơn nhiều rồi, kiểu TYPE = ref có nghĩa rằng MYSQL hiểu ra chỉ có 1 hàng đúng với ý ta, 
-- và thể hiện qua cột Rows = 1, kiểu key= idx_customerName được sử dụng và chiều dài key_len là 52.
-- Chỉ tìm 1 hàng tất nhiên rằng tốt hơn nhiều so với tìm 17123 hàng 

-- Để xoá chỉ mục trong bảng, bạn làm như sau:
ALTER TABLE customers DROP INDEX idx_customerName; 




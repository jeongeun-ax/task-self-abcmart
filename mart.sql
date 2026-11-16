-- 상품용 데이터베이스 생성 
CREATE DATABASE products; 

-- 회원 테이블 설계
CREATE TABLE users
(
    user_id     SERIAL      PRIMARY KEY,
    user_name   VARCHAR(10) NOT NULL, 
    phone       VARCHAR(20) NOT NULL,
    region      VARCHAR(30) 
);

INSERT INTO users (user_name, phone, region) VALUES ('홍길동', '010-1234-5678', '마포구')
INSERT INTO users (user_name, phone, region) VALUES ('김하나', '010-9876-5432', '중랑구');



-- 상품 테이블 설계 
CREATE TABLE products
(
    product_id      SERIAL      PRIMARY KEY, 
    product_name    VARCHAR(30) NOT NULL,
    price           SMALLINT    NOT NULL,
    stock           SMALLINT    NOT NULL, 
    category_name   VARCHAR(20) NOT NULL, 
    product_info    VARCHAR(50) 
);

INSERT INTO products (product_name, price, stock, category_name, product_info) VALUES ('만두', '5000', '30', '식품', '간편조리식품');
INSERT INTO products (product_name, price, stock, category_name, product_info) VALUES ('샴푸', '13000', '10', '생필품', '머리 위생 물품');
INSERT INTO products (product_name, price, stock, category_name, product_info) VALUES ('소주', '3000', '100', '주류', '19세미만 구매 불가 상품');


-- 카테고리 테이블 설계 
CREATE TABLE categorys
(
    category_id     SERIAL      PRIMARY KEY,
    category_name   VARCHAR(20) NOT NULL REFERENCES products (category_name),  -- 외래키 
    category_info   VARCHAR(50)
);

INSERT INTO categorys (category_name, category_info) VALUES ('식품', '모든 연령 구매 가능');
INSERT INTO categorys (category_name, category_info) VALUES ('생필품', '모든 연령 구매 가능');
INSERT INTO categorys (category_name, category_info) VALUES ('주류', '19세미만 구매 불가 상품');


-- 상품 장바구니 테이블 설계 (1인 1장바구니)
CREATE TABLE carts
(
    cart_id         SERIAL      PRIMARY KEY,
    user_id         INT         NOT NULL UNIQUE REFERENCES users (user_id) ON DELETE CASCADE,     -- 1인 1장바구니 
    product_name    VARCHAR(30) NOT NULL REFERENCES products (product_name),                      -- 외래키 
    cart_quantity   INT         NOT NULL 
);



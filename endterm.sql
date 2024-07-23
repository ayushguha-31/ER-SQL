create database end_term
create table user_review(
id int primary key,
user_id varchar(1000),
ordered_product_id varchar(1000),
rating_value int,
comments varchar(1000))

create table user_payment_method(
account_number varchar(1000),
provider varchar(1000),
id int not null primary key,
user_id varchar(1000),
payment_type_id varchar(1000))

create table site_user(
id int not null primary key,
email_address varchar(1000),
phone_number int,
password int)

create table user_address(
user_id varchar(1000),
address_id varchar(1000),
is_default varchar(1000))

create table address(
country_id int not null primary key,
postal_code int,
region varchar(1000),
city varchar(1000))

create table country(
id int not null primary key,
country_name varchar(1000))

create table payment_type(
id varchar(1000) not null primary key,
value float)

create table shopping_cart (
id varchar(2000) not null primary key,
user_id varchar(1000))

create table Shopping_cart_item(
id varchar(1000) not null primary key,
cart_id varchar(1000),
product_item_id varchar(1000))

create table order_line(
id varchar(2000) not null primary key,
product_item_id varchar(2000),
price float)
alter table order_line 
add qty int

create table product_item(
sku int,
qty_in_stock int,
product_image varchar(2000),
price float,
id varchar(2000) not null primary key,
product_id varchar(2000))

create table product (
id varchar(2000) not null primary key,
category_id varchar(2000),
product_image varchar(2000),
description varchar(2000),
name varchar(2000) )

create table validation_option(
id varchar(2000) not null primary key,
variation_id varchar(2000),
value int)

create table product_configuration(
product_item_id varchar(2000) not null primary key,
variation_option_id varchar(2000))

create table product_category(
id varchar(2000) not null primary key,
category_name varchar(2000),
parent_category_id varchar(2000))

create table variation(
id varchar(2000) not null primary key,
name varchar(2000),
category_id varchar(2000))

create table promotion_category(
category_id varchar(2000),
promotion_id varchar(2000))

create table promtion(
id varchar(2000) not null primary key,
description varchar(2000),
name varchar(2000),
discount_rate varchar(2000))

create table shop_order(
order_total float,
id varchar(2000) not null primary key,
user_id varchar(2000),
order_date date,
payment_method_id varchar(2000),
shipping_method varchar(2000),
order_status varchar(2000),
shipping_address varchar(2000))

create table wishlist(
product_id varchar(2000),
product_variant_id varchar(2000),
user_id varchar(2000),
id varchar(2000) not null primary key )

create table shipping_method(
id varchar(2000) not null primary key,
name varchar(2000),
price float )

create table order_status(
id varchar(2000) not null primary key,
status varchar(2000))

create table offers(
discount_value float,
start_date date,
end_date date,
coupon_code varchar(2000),
description varchar(2000),
id varchar(2000) not null primary key)

create table order_track (
updated_time datetime,
status varchar(2000),
id varchar(2000),
order_id varchar(2000))

create table product_images(
id varchar(2000) not null primary key,
product_id varchar(2000),
image_url varchar(2000))

create table product_reviews(
rating varchar(2000),
user_id varchar(2000),
id varchar(2000) not null primary key,
product_id varchar(2000))

create table saved_payments(
id varchar(2000) not null primary key,
user_id varchar(2000))

create table sellers (
rating varchar(2000),
contact_info int,
seller_name varchar(2000),
id varchar(2000) not null primary key)

create table seller_reviews(
id varchar(2000) not null primary key,
seller_id varchar(2000),
user_id varchar(2000))

create table seller_products(
id varchar(2000) not null primary key,
seller_id varchar(2000))

create table affilate_partners(
contact_info int ,
commission_rate float,
partner_name varchar(2000),
id varchar(2000) not null primary key)

create table affiliate_sales(
affiliate_partner_id varchar(2000),
id varchar(2000) not null primary key,
salesamount float,
commission_amount float)

create table affiliate_log(
timestamp,
action varchar(2000),
affliate_partner_id varchar(2000),
id varchar(2000))

create table user_wishlist_history(
product_id varchar(2000),
added_date date)

create table user_cart_history(
id varchar(2000) not null primary key,
user_id varchar(2000),
product_id varchar(2000))

create table user_order_history(
order_id varchar(2000),
order_date date,
id varchar(2000) not null primary key,
user_id varchar(2000))

create table user_referrals(
reward_points int,
referral_code varchar(2000),
id varchar(2000) not null primary key,
user_id varchar(2000))

create table user_rewards(
id varchar(2000) not null primary key,
user_id varchar(2000),
reward_points int )

create table user_payment_history(
payment_mathod varchar(2000),
id varchar(2000) not null primary key,
user_id varchar(2000),
order_id varchar(2000),
payment_status varchar(2000),
payment_date date,
transaction_id varchar(2000))

create table user_viewed_products(
id varchar(2000) not null primary key,
user_id varchar(2000),
product_id varchar(2000),
timestamp )

create table product_faqs(
questions varchar(2000),
answer varchar(2000),
id varchar(2000) not null primary key,
product_id varchar(2000))


ALTER TABLE [dbo].[address]
ADD FOREIGN KEY (country_id) references country(id)


ALTER TABLE [dbo].[affilate_partners]
ADD FOREIGN KEY () references (customer_id);

ALTER TABLE [dbo].[affiliate_log]
ADD FOREIGN KEY (affliate_partner_id) references [dbo].[affilate_partners] (id);


ALTER TABLE [dbo].[affiliate_sales]
ADD FOREIGN KEY (affiliate_partner_id) references [dbo].[affilate_partners] (id);

ALTER TABLE [dbo].[country]
ADD FOREIGN KEY  references [dbo].[affilate_partners] (id);

ALTER TABLE [dbo].[offers]
ADD FOREIGN KEY (affiliate_partner_id) references [dbo].[affilate_partners] (id);


ALTER TABLE [dbo].[order_line]
ADD FOREIGN KEY (order_id) references shop_order (id);
alter table order_line
add order_id varchar(2000)
alter table order_line
add product_item_id varchar(2000)
select *
from order_line

ALTER TABLE [dbo].[order_line]
ADD FOREIGN KEY (order_id) references product_item(id);

ALTER TABLE [dbo].[order_status]
ADD FOREIGN KEY () references shop_order (id);

ALTER TABLE [dbo].[order_track]
ADD FOREIGN KEY (order_id) references shop_order (id);

ALTER TABLE [dbo].[order_track]
ADD FOREIGN KEY (status) references order_status (id);

ALTER TABLE [dbo].[payment_type]
ADD FOREIGN KEY (status) references order_status (id);

ALTER TABLE [dbo].[product]
ADD FOREIGN KEY (category_id) references product_category (id);
ALTER TABLE [dbo].[product]
ADD FOREIGN KEY (product_image) references product_images (id);


ALTER TABLE [dbo].[product_category]
ADD FOREIGN KEY (parent_category_id) references product_category (id);


ALTER TABLE [dbo].[product_configuration]
ADD FOREIGN KEY (product_item_id) references product_item(id)
select * from [dbo].[product_configuration]
select * from [dbo].[product_configuration]
ALTER TABLE [dbo].[product_configuration]
ADD FOREIGN KEY (variation_option_id) references validation_option (id)

ALTER TABLE [dbo].[product_faqs]
ADD FOREIGN KEY (product_id) references product_item (id)
ALTER TABLE [dbo].[product_images]
ADD FOREIGN KEY (product_id) references product_item (id)
ALTER TABLE[dbo].[product_item]
ADD FOREIGN KEY (product_id) references order_line (id)
ALTER TABLE [dbo].[product_reviews]
ADD FOREIGN KEY (product_id) references product_item (id)

ALTER TABLE [dbo].[promotion_category]
ADD FOREIGN KEY (category_id) references product_category (id)
ALTER TABLE [dbo].[promotion_category]
ADD FOREIGN KEY (promotion_id) references promtion (id)

ALTER TABLE [dbo].[saved_payments]
ADD FOREIGN KEY (user_id) references site_user (id)
select* from[dbo].[saved_payments]
select* from site_user 
alter table site_user 
alter column id varchar(2000)

[dbo].[seller_products]

ALTER TABLE [dbo].[seller_products]
ADD FOREIGN KEY (seller_id) references sellers (id)
ALTER TABLE [dbo].[seller_reviews]
ADD FOREIGN KEY (seller_id) references sellers (id)
ALTER TABLE [dbo].[seller_reviews]
ADD FOREIGN KEY (user_id) references site_user (id)

ALTER TABLE [dbo].[seller]
ADD FOREIGN KEY (user_id) references site_user (id)
ALTER TABLE[dbo].[shipping_method]
ADD FOREIGN KEY (user_id) references site_user (id)

ALTER TABLE[dbo].[shop_order]
ADD FOREIGN KEY (order_status) references order_status (id)
ALTER TABLE[dbo].[shop_order]
ADD FOREIGN KEY (shipping_address) references address (id)
ALTER TABLE[dbo].[shop_order]
ADD FOREIGN KEY (shipping_method) references shipping_method (id)
select* from address
alter table address
add id varchar(2000) not null primary key 

alter table[dbo].[shopping_cart]
add foreign key (user_id) references site_user(cast(id as varchar)

ALTER TABLE [dbo].[shopping_cart]
ADD CONSTRAINT FK_shopping_cart_user_id FOREIGN KEY (user_id) REFERENCES site_user(id);

alter table site_user
alter column id varchar(2000) not null

alter table site_user

ALTER TABLE [dbo].[shopping_cart_item]
ADD PRIMARY KEY(id)

alter table[dbo].[user_address]
add foreign key (user_id) references site_user(id)

alter table user_address
alter column user_id varchar(2000)

alter table[dbo].[user_address]
add foreign key (address_id) references address(id)



alter table[dbo].[user_cart_history]
add foreign key (product_id) references product_item(id)
alter table[dbo].[user_cart_history]
add foreign key (user_id) references site_user(id)

alter table[dbo].[user_order_history]
add foreign key (order_id) references order_line(id)

alter table[dbo].[user_order_history]
add foreign key (user_id) references site_user(id)
[dbo].[user_payment_history]
alter table[dbo].[user_payment_history]
add foreign key (order_id) references order_line(id)

alter table[dbo].[user_payment_history]
add foreign key (user_id) references site_user(id)

alter table[dbo].[user_payment_method]
add foreign key (user_id) references site_user(id)
alter table[dbo].[user_payment_method]
add foreign key (payment_type_id) references payment_type(id)


INSERT INTO user_review (id, user_id, ordered_product_id, rating_value, comments)
VALUES
    (1, 'user123', 'product456', 4, 'Great product, fast delivery'),
    (2, 'user456', 'product789', 5, 'Excellent service and quality'),
    (3, 'user789', 'product123', 3, 'Product arrived damaged'),
    (4, 'user123', 'product789', 5, 'Highly recommended'),
    (5, 'user456', 'product123', 2, 'Disappointed with the product quality');

select *
from user_payment_method

INSERT INTO user_payment_method (account_number, provider, id, user_id, payment_type_id)
VALUES
    ('1234567890', 'Visa', 1, 'user123', 'visa'),
    ('9876543210', 'Mastercard', 2, 'user456', 'mastercard'),
    ('5555666677778888', 'American Express', 3, 'user789', 'amex'),
    ('1234123412341234', 'Discover', 4, 'user123', 'discover'),
    ('4444333322221111', 'Visa', 5, 'user456', 'visa');

INSERT INTO site_user (id, email_address, phone_number, password)
VALUES
('U_001', 'user1@example.com', 1234567890, 123456),
('U_002', 'user2@example.com', 2345678901, 234567),
('U_003', 'user3@example.com', 3456789012, 345678),
('U_004', 'user4@example.com', 4567890123, 456789),
('U_005', 'user5@example.com', 5678901234, 567890);

INSERT INTO user_address (user_id, address_id, is_default)
VALUES
    ('user123', 'address123', 'true'),
    ('user456', 'address456', 'true'),
    ('user789', 'address789', 'true'),
    ('user123', 'address987', 'true'),
    ('user456', 'address654', 'true');

select * from address
INSERT INTO address (country_id, postal_code, region, city, id)
VALUES
(1, 12345, 'Region A', 'City A', 'ADD_001'),
(2, 23456, 'Region B', 'City B', 'ADD_002'),
(3, 34567, 'Region C', 'City C', 'ADD_003'),
(4, 45678, 'Region D', 'City D', 'ADD_004'),
(5, 56789, 'Region E', 'City E', 'ADD_005');


INSERT INTO country (id, country_name)
VALUES
    (1, 'Country X'),
    (2, 'Country Y'),
    (3, 'Country Z'),
    (4, 'Country W'),
    (5, 'Country V');


INSERT INTO payment_type (id, value)
VALUES
    ('visa', 100.00),
    ('mastercard', 150.00),
    ('amex', 200.00),
    ('discover', 120.00),
    ('paypal', 180.00);


INSERT INTO shopping_cart (id, user_id)
VALUES
    ('cart123', 'user123'),
    ('cart456', 'user456'),
    ('cart789', 'user789'),
    ('cart101', 'user123'),
    ('cart202', 'user456');

INSERT INTO Shopping_cart_item (id, cart_id, product_item_id)
VALUES
    ('item123', 'cart123', 'product123'),
    ('item456', 'cart456', 'product456'),
    ('item789', 'cart789', 'product789'),
    ('item101', 'cart101', 'product101'),
    ('item202', 'cart202', 'product202');


INSERT INTO order_line (id, product_item_id, price, qty)
VALUES
    ('orderline123', 'product123', 50.00, 2),
    ('orderline456', 'product456', 75.00, 1),
    ('orderline789', 'product789', 100.00, 3),
    ('orderline101', 'product101', 25.00, 4),
    ('orderline202', 'product202', 80.00, 2);

INSERT INTO product_item (sku, qty_in_stock, product_image, price, id, product_id) 
VALUES 
(1001, 50, 'image1.jpg', 29.99, 'PI_001', 'P_001'),
(1002, 30, 'image2.jpg', 49.99, 'PI_002', 'P_001'),
(1003, 20, 'image3.jpg', 39.99, 'PI_003', 'P_002'),
(1004, 10, 'image4.jpg', 19.99, 'PI_004', 'P_002'),
(1005, 5, 'image5.jpg', 59.99, 'PI_005', 'P_003');

INSERT INTO product (id, category_id, product_image, description, name)
VALUES
('P_001', 'C_001', 'image1.jpg', 'Description of Product 1', 'Product 1'),
('P_002', 'C_001', 'image2.jpg', 'Description of Product 2', 'Product 2'),
('P_003', 'C_002', 'image3.jpg', 'Description of Product 3', 'Product 3'),
('P_004', 'C_002', 'image4.jpg', 'Description of Product 4', 'Product 4'),
('P_005', 'C_003', 'image5.jpg', 'Description of Product 5', 'Product 5');
	
	
INSERT INTO validation_option (id, variation_id, value)
VALUES
('VO_001', 'V_001', 10),
('VO_002', 'V_001', 20),
('VO_003', 'V_002', 30),
('VO_004', 'V_002', 40),
('VO_005', 'V_003', 50);
INSERT INTO product_configuration (product_item_id, variation_option_id)
VALUES
('PI_001', 'VO_001'),
('PI_002', 'VO_002'),
('PI_003', 'VO_003'),
('PI_004', 'VO_004'),
('PI_005', 'VO_005');


INSERT INTO product_category (id, category_name, parent_category_id)
VALUES
('C_001', 'Electronics', NULL),
('C_002', 'Clothing', NULL),
('C_003', 'Books', NULL),
('C_004', 'Laptops', 'C_001'),
('C_005', 'Shirts', 'C_002');


INSERT INTO variation (id, name, category_id)
VALUES
('V_001', 'Color', 'C_001'),
('V_002', 'Size', 'C_002'),
('V_003', 'Genre', 'C_003'),
('V_004', 'RAM', 'C_004'),
('V_005', 'Fabric', 'C_005');


INSERT INTO promotion_category (category_id, promotion_id)
VALUES
('C_001', 'P_001'),
('C_002', 'P_002'),
('C_003', 'P_003'),
('C_004', 'P_004'),
('C_005', 'P_005');

INSERT INTO promtion (id, description, name, discount_rate)
VALUES
('P_001', '10% off on electronics', 'Electronics Sale', '10%'),
('P_002', '20% off on clothing', 'Clothing Sale', '20%'),
('P_003', 'Buy one get one free on books', 'Books Promotion', 'BOGO'),
('P_004', '50% off on laptops', 'Laptops Sale', '50%'),
('P_005', 'Free shipping on all orders', 'Free Shipping', 'Free');


INSERT INTO wishlist (product_id, product_variant_id, user_id, id)
VALUES
('P_001', 'PV_001', 'U_001', 'W_001'),
('P_002', 'PV_002', 'U_001', 'W_002'),
('P_003', 'PV_003', 'U_002', 'W_003'),
('P_004', 'PV_004', 'U_002', 'W_004'),
('P_005', 'PV_005', 'U_003', 'W_005');

INSERT INTO shipping_method (id, name, price)
VALUES
('SM_001', 'Standard Shipping', 5.99),
('SM_002', 'Express Shipping', 9.99),
('SM_003', 'Two-Day Shipping', 7.99),
('SM_004', 'Same-Day Shipping', 12.99),
('SM_005', 'Free Shipping', 0.00);


INSERT INTO order_status (id, status)
VALUES
('OS_001', 'Processing'),
('OS_002', 'Shipped'),
('OS_003', 'Delivered'),
('OS_004', 'Cancelled'),
('OS_005', 'Returned');

INSERT INTO offers (discount_value, start_date, end_date, coupon_code, description, id)
VALUES
(10.00, '2024-04-01', '2024-04-30', 'APRIL10', 'Get $10 off on orders over $50', 'O_001'),
(20.00, '2024-04-15', '2024-04-30', 'SPRING20', 'Spring sale: Get $20 off on all items', 'O_002'),
(0.15, '2024-04-01', '2024-04-30', 'SAVEMORE', 'Save 15% on your order', 'O_003'),
(5.00, '2024-04-01', '2024-04-30', 'FREESHIP', 'Free shipping on orders over $25', 'O_004'),
(30.00, '2024-04-25', '2024-05-05', 'MAY30', 'Pre-May sale: Get $30 off on all products', 'O_005');


INSERT INTO order_track (updated_time, status, id, order_id)
VALUES
('2024-04-02 10:00:00', 'Processing', 'OT_001', 'SO_001'),
('2024-04-05 15:30:00', 'Shipped', 'OT_002', 'SO_001'),
('2024-04-10 08:45:00', 'Delivered', 'OT_003', 'SO_001'),
('2024-04-03 11:20:00', 'Processing', 'OT_004', 'SO_002'),
('2024-04-08 14:10:00', 'Cancelled', 'OT_005', 'SO_002');

INSERT INTO product_images (id, product_id, image_url)
VALUES
('PI_001', 'P_001', 'https://example.com/image1.jpg'),
('PI_002', 'P_002', 'https://example.com/image2.jpg'),
('PI_003', 'P_003', 'https://example.com/image3.jpg'),
('PI_004', 'P_004', 'https://example.com/image4.jpg'),
('PI_005', 'P_005', 'https://example.com/image5.jpg');

INSERT INTO product_reviews (rating, user_id, id, product_id)
VALUES
('4', 'U_001', 'PR_001', 'P_001'),
('5', 'U_002', 'PR_002', 'P_002'),
('3', 'U_003', 'PR_003', 'P_003'),
('4', 'U_004', 'PR_004', 'P_004'),
('5', 'U_005', 'PR_005', 'P_005');

INSERT INTO saved_payments (id, user_id)
VALUES
('SP_001', 'U_001'),
('SP_002', 'U_002'),
('SP_003', 'U_003'),
('SP_004', 'U_004'),
('SP_005', 'U_005');

INSERT INTO sellers (rating, contact_info, seller_name, id)
VALUES
('4.5', '1234567890', 'Example Seller 1', 'S_001'),
('4.2', '9876543210', 'Example Seller 2', 'S_002'),
('4.7', '1357924680', 'Example Seller 3', 'S_003'),
('4.0', '2468013579', 'Example Seller 4', 'S_004'),
('4.8', '1122334455', 'Example Seller 5', 'S_005');

INSERT INTO seller_reviews (id, seller_id, user_id)
VALUES
('SR_001', 'S_001', 'U_001'),
('SR_002', 'S_002', 'U_002'),
('SR_003', 'S_003', 'U_003'),
('SR_004', 'S_004', 'U_004'),
('SR_005', 'S_005', 'U_005');

INSERT INTO seller_products (id, seller_id)
VALUES
('SP_001', 'S_001'),
('SP_002', 'S_002'),
('SP_003', 'S_003'),
('SP_004', 'S_004'),
('SP_005', 'S_005');

INSERT INTO affiliate_log (timestamp, action, affliate_partner_id, id)
VALUES
('2024-04-01 08:00:00', 'Click', 'AP_001', 'AL_001'),
('2024-04-02 10:30:00', 'Conversion', 'AP_002', 'AL_002'),
('2024-04-03 12:15:00', 'Click', 'AP_003', 'AL_003'),
('2024-04-04 14:45:00', 'Conversion', 'AP_004', 'AL_004'),
('2024-04-05 16:20:00', 'Click', 'AP_005', 'AL_005');

INSERT INTO user_wishlist_history (product_id, added_date)
VALUES
('P_001', '2024-04-01'),
('P_002', '2024-04-02'),
('P_003', '2024-04-03'),
('P_004', '2024-04-04'),
('P_005', '2024-04-05');

INSERT INTO user_cart_history (id, user_id, product_id)
VALUES
('UCH_001', 'U_001', 'P_001'),
('UCH_002', 'U_002', 'P_002'),
('UCH_003', 'U_003', 'P_003'),
('UCH_004', 'U_004', 'P_004'),
('UCH_005', 'U_005', 'P_005');

INSERT INTO user_order_history (order_id, order_date, id, user_id)
VALUES
('SO_001', '2024-04-01', 'UOH_001', 'U_001'),
('SO_002', '2024-04-02', 'UOH_002', 'U_002'),
('SO_003', '2024-04-03', 'UOH_003', 'U_003'),
('SO_004', '2024-04-04', 'UOH_004', 'U_004'),
('SO_005', '2024-04-05', 'UOH_005', 'U_005');

INSERT INTO user_referrals (reward_points, referral_code, id, user_id)
VALUES
(100, 'REF001', 'UR_001', 'U_001'),
(150, 'REF002', 'UR_002', 'U_002'),
(200, 'REF003', 'UR_003', 'U_003'),
(250, 'REF004', 'UR_004', 'U_004'),
(300, 'REF005', 'UR_005', 'U_005');

INSERT INTO user_rewards (id, user_id, reward_points)
VALUES
('URW_001', 'U_001', 50),
('URW_002', 'U_002', 100),
('URW_003', 'U_003', 150),
('URW_004', 'U_004', 200),
('URW_005', 'U_005', 250);


INSERT INTO user_payment_history (payment_mathod, id, user_id, order_id, payment_status, payment_date, transaction_id)
VALUES
('Credit Card', 'UPH_001', 'U_001', 'OL_001', 'Paid', '2024-04-01', 'TRX001'),
('PayPal', 'UPH_002', 'U_002', 'OL_002', 'Paid', '2024-04-02', 'TRX002'),
('Debit Card', 'UPH_003', 'U_003', 'OL_003', 'Pending', '2024-04-03', 'TRX003'),
('Cash on Delivery', 'UPH_004', 'U_004', 'OL_004', 'Processing', '2024-04-04', 'TRX004'),
('Bank Transfer', 'UPH_005', 'U_005', 'OL_005', 'Paid', '2024-04-05', 'TRX005');

INSERT INTO user_viewed_products (id, user_id, product_id, timestamp)
VALUES
('UVP_001', 'U_001', 'P_001', '2024-04-01 08:00:00'),
('UVP_002', 'U_002', 'P_002', '2024-04-02 10:00:00'),
('UVP_003', 'U_003', 'P_003', '2024-04-03 12:00:00'),
('UVP_004', 'U_004', 'P_004', '2024-04-04 14:00:00'),
('UVP_005', 'U_005', 'P_005', '2024-04-05 16:00:00');


INSERT INTO product_faqs (questions, answer, id, product_id)
VALUES
('What are the dimensions of this product?', 'Dimensions are 10x10x10 inches.', 'FAQ_001', 'P_001'),
('Is this product waterproof?', 'Yes, it is waterproof.', 'FAQ_002', 'P_002'),
('Can this product be machine washed?', 'No, it is recommended for hand wash only.', 'FAQ_003', 'P_003'),
('Does this product come with a warranty?', 'Yes, it comes with a 1-year warranty.', 'FAQ_004', 'P_004'),
('What is the material of this product?', 'The material is 100% cotton.', 'FAQ_005', 'P_005');

INSERT INTO product_faqs (questions, answer, id, product_id)
VALUES
('What are the dimensions of this product?', 'Dimensions are 10x10x10 inches.', 'FAQ_001', 'P_001'),
('Is this product waterproof?', 'Yes, it is waterproof.', 'FAQ_002', 'P_002'),
('Can this product be machine washed?', 'No, it is recommended for hand wash only.', 'FAQ_003', 'P_003'),
('Does this product come with a warranty?', 'Yes, it comes with a 1-year warranty.', 'FAQ_004', 'P_004'),
('What is the material of this product?', 'The material is 100% cotton.', 'FAQ_005', 'P_005');






--Q1 What are the pairs of products that belong to the same category?

SELECT p1.name AS product_name, p2.name AS related_product_name
FROM product p1
JOIN product p2 ON p1.category_id = p2.category_id AND p1.id <> p2.id;

--Q2 what are the top 5 Most Reviewed Products

SELECT pr.product_id, p.name, COUNT(*) AS review_count
FROM product_reviews pr
INNER JOIN product p ON pr.product_id = p.id
GROUP BY pr.product_id, p.name
ORDER BY review_count DESC
offset 0 rows fetch next 5 rows only



--Q3 For each product category, what is the total number of products and 
--what is the average price of the products?

SELECT p.category_id, COUNT(p.id) AS total_products, AVG(pi.price) AS average_price
FROM product p
JOIN product_item pi ON p.id = pi.product_id
GROUP BY p.category_id;

--Q4 Find the total number of products in each category

SELECT category_id, COUNT(*) AS total_products
FROM product
GROUP BY category_id;


-- Q1 What is the average rating for each product, and 
--how do these products rank in terms of their average rating?


SELECT ordered_product_id, AVG(rating_value) OVER (PARTITION BY ordered_product_id) as avg_rating,
RANK() OVER (ORDER BY AVG(rating_value) DESC) as rank
FROM user_review
group by ordered_product_id, rating_value;


--Q2 What is the total number of users from each country?

SELECT UPPER(c.country_name) AS country_name, COUNT(su.id) AS total_users
FROM site_user su
JOIN address a ON su.id = a.id
JOIN country c ON a.country_id = c.id
GROUP BY UPPER(c.country_name);



--Q3 What are the pairs of users who have ordered the same product?

SELECT a.user_id AS user1, b.user_id AS user2
FROM user_review a, user_review b
WHERE a.ordered_product_id = b.ordered_product_id AND a.user_id != b.user_id;





--Q4.The SQL query you provided is selecting the unique IDs of users 
--who have ordered products with an average rating greater than 4.

SELECT DISTINCT user_id
FROM user_review
WHERE ordered_product_id IN (
    SELECT ordered_product_id
    FROM user_review
    GROUP BY ordered_product_id
    HAVING AVG(rating_value) > 4
);

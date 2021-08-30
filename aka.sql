
CREATE DATABASE restaurant;
SET foreign_key_checks=0;
USE restaurant;
CREATE TABLE employee(
	emID int primary key,
    employee_name varchar(30),
    phone_number int,
    shift varchar(30),
    employee_role varchar(30),
    check (shift = 'day' or shift = 'night')
);

CREATE TABLE shipper(
	emID int primary key,
    type_of_vehicle varchar(30),
    constraint fk_shipper_employee foreign key (emID) references employee (emID)
);

CREATE TABLE accountant(
	emID int primary key,
    constraint fk_accountant_employee foreign key (emID) references employee (emID)
);

CREATE TABLE security_guard(
	emID int primary key,
	constraint fk_security_guard_employee foreign key (emID) references employee (emID)
);

CREATE TABLE waiter(
	emID int primary key,
    constraint fk_waiter_employee foreign key (emID) references employee (emID)
);

CREATE TABLE chef(
	emID int primary key,
	constraint fk_chef_employee foreign key (emID) references employee (emID)
);

CREATE TABLE manager(
	emID int primary key,
    constraint fk_manager_employee foreign key (emID) references employee (emID)
);

CREATE TABLE manage(
	timekeeping float,
    emID int primary key,
    managerID int,
    constraint fk_manage_employee foreign key (emID) references employee (emID),
	constraint fk_manage_manager foreign key (managerID) references manager (emID)
);

CREATE TABLE administrator(
	emID int primary key,
    email varchar(30) null,
    constraint fk_administrator_employee foreign key (emID) references employee (emID)
);

CREATE TABLE customer(
	cID int primary key,
    customer_name varchar(30),
    phone_number int,
    number_of_people int,
    arrival_time time(6)
);

CREATE TABLE users(
	user_name varchar(30) primary key,
    email varchar (30),
	national_id int,
    address varchar(50),
    cID int,
    constraint fk_users_customer foreign key (cId) references customer (cID)
);

CREATE TABLE crud(
	verify boolean,
    reviewed_rating float,
    duration_hour_per_day float,
    emId int,
    user_name varchar(30) primary key,
    constraint crud_employee foreign key (emID) references employee (emID),
    constraint crud_users foreign key (user_name) references users (user_name)
);

CREATE TABLE status_of_order(
	oID int primary key,
    date_of_order datetime,
    discount float null,
    check_list boolean,
    emID int,
    cID int,
    payment_method varchar(30),
    user_name varchar(30),
    check (discount = '0.25' or discount = '0.5'),
    constraint fk_status_of_order_employee foreign key (emID) references employee (emID),
    constraint fk_status_of_order_customer foreign key (cID) references customer (cID),
    constraint fk_status_of_order_users foreign key (user_name) references users (user_name)
);

CREATE TABLE receipt(
	receipt_number int primary key,
	oID int,
    cId int,
    total_payment int,
	emID int,
    constraint fk_receipt_accountant foreign key (emID) references accountant (emID),
    constraint fk_receipt_status_of_order foreign key (oID) references status_of_order (oID),
    constraint fk_receipt_customer foreign key (cID) references customer (cID)
);

DROP TABLE provider;
CREATE TABLE provider(
    provider_number int primary key,
    prID int,
    name_of_provider varchar(30),
    phone_number int,
    date_of_issues datetime,
    emID int,
    constraint provider_manager foreign key (emID) references manager (emID)
);

CREATE TABLE payment(
	pID int primary key,
    total_payment int,
    payment_method varchar(30),
    date_of_payment datetime,
    check (payment_method = 'cash' or payment_method = 'bank transfer' or payment_method = 'mobile payment' or payment_method = 'electronic wallet')
);

CREATE TABLE ingredient(
	iID int primary key,
    name_of_ingredient varchar(30),
    ingredient_price int,
    unit varchar(30),
    prID int,
    constraint fk_ingredient_provider foreign key (prID) references provider (prID)
);
DROP TABLE ingredient;
CREATE TABLE meal(
	menu varchar(30) primary key,
	emID int,
    constraint meal_chef foreign key (emID) references chef (emID)
);

CREATE TABLE use_of_portion(
	portion_use float primary key,
	menu varchar(30),
	iID int,
    constraint use_of_portion_meal foreign key (menu) references meal (menu),
    constraint use_of_portion_ingredient foreign key (iID) references ingredient (iID)
);
DROP TABLE use_of_portion;

DROP DATABASE restaurant;
CREATE DATABASE restaurant;
USE restaurant;
CREATE TABLE employee(
	emID int primary key,
    employee_name varchar(30),
    phone_number int,
    shift varchar(30),
    employee_role varchar(30),
    check (shift = 'day' or shift = 'night')
);

CREATE TABLE shipper(
	emID int primary key,
    type_of_vehicle varchar(30),
    constraint fk_shipper_employee foreign key (emID) references employee (emID)
);

CREATE TABLE accountant(
	emID int primary key,
    constraint fk_accountant_employee foreign key (emID) references employee (emID)
);

CREATE TABLE security_guard(
	emID int primary key,
	constraint fk_security_guard_employee foreign key (emID) references employee (emID)
);

CREATE TABLE waiter(
	emID int primary key,
    constraint fk_waiter_employee foreign key (emID) references employee (emID)
);

CREATE TABLE chef(
	emID int primary key,
	constraint fk_chef_employee foreign key (emID) references employee (emID)
);

CREATE TABLE manager(
	emID int primary key,
    constraint fk_manager_employee foreign key (emID) references employee (emID)
);

CREATE TABLE manage(
	timekeeping float,
    emID int primary key,
    managerID int,
    constraint fk_manage_employee foreign key (emID) references employee (emID),
	constraint fk_manage_manager foreign key (managerID) references manager (emID)
);

CREATE TABLE administrator(
	emID int primary key,
    email varchar(30) null,
    constraint fk_administrator_employee foreign key (emID) references employee (emID)
);

CREATE TABLE customer(
	cID int primary key,
    customer_name varchar(30),
    phone_number int,
    number_of_people int,
    arrival_time time(6)
);

CREATE TABLE users(
	user_name varchar(30) primary key,
    email varchar (30),
	national_id varchar(12),
    address varchar(150),
    cID int,
    constraint fk_users_customer foreign key (cID) references customer (cID)
);

CREATE TABLE crud(
	verify varchar(30),
    reviewed_rating float,
    duration_hour_per_day float,
    emId int,
    user_name varchar(30)  primary key,
    constraint crud_employee foreign key (emID) references employee (emID),
    constraint crud_users foreign key (user_name) references users (user_name)
);

CREATE TABLE status_of_order(
	oID int primary key,
    date_of_order date,
    discount float null,
    check_list varchar(30),
    emID int,
    cID int,
    payment_method varchar(30),
    user_name varchar(30),
    check (discount = '0.25' or discount = '0.5'),
    constraint fk_status_of_order_employee foreign key (emID) references employee (emID),
    constraint fk_status_of_order_customer foreign key (cID) references customer (cID),
    constraint fk_status_of_order_users foreign key (user_name) references users (user_name)
);

CREATE TABLE receipt(
	receipt_number int primary key,
	oID int,
    cId int,
    total_payment int,
	emID int,
    constraint fk_receipt_accountant foreign key (emID) references accountant (emID),
    constraint fk_receipt_status_of_order foreign key (oID) references status_of_order (oID),
    constraint fk_receipt_customer foreign key (cID) references customer (cID)
);


CREATE TABLE provider(
    prID int primary key,
    phone_number int,
    date_of_issues date,
    name_of_provider varchar(50),
    emID int,
    constraint provider_manager foreign key (emID) references manager (emID)
);

CREATE TABLE payment(
	pID int primary key,
    total_payment int,
    payment_method varchar(30),
    date_of_payment date
);

CREATE TABLE ingredient(
	iID varchar(30) primary key,
    name_of_ingredient varchar(30),
    ingredient_price int,
    unit varchar(30),
    prID int,
    constraint fk_ingredient_provider foreign key (prID) references provider (prID)
);

CREATE TABLE meal(
	menu varchar(30) primary key,
	emID int,
    constraint meal_chef foreign key (emID) references chef (emID)
);

CREATE TABLE use_of_portion(
	portion_use float primary key,
	menu varchar(30),
	iID varchar(30),
    constraint use_of_portion_meal foreign key (menu) references meal (menu),
    constraint use_of_portion_ingredient foreign key (iID) references ingredient (iID)
);

insert into employee values (1028, 'Lam Gia Bao', 0916175566, 'day', 'accountant');
insert into employee values (1234, 'Lai Van Dung', 0911983360, 'night', 'waiter');
insert into employee values (1235, 'Luong Xuan Truong', 0988585568, 'day', 'manager');
insert into employee values (1456, 'Vu Viet Huong', 0978557560, 'night', 'accountant');
insert into employee values (1475, 'Khalid Mi Golem', 0988585571, 'night', 'manager');
insert into employee values (2222, 'Do Thi My Truc', 0988837462, 'night', 'security');
insert into employee values (2315, 'Nguyen Phu Quy', 0942858857, 'day', 'administrator');
insert into employee values (2345, 'Luc Thi Thuy My', 0988585591, 'night', 'waiter');
insert into employee values (2486, 'Doan Chung', 0988585573, 'day', 'shipper');
insert into employee values (2541, 'Doan Chi Binh', 0988587345, 'day', 'shipper');
insert into employee values (2543, 'Hoang Gia Cat Thinh', 0988585578, 'night', 'shipper');
insert into employee values (3180, 'Tran Huy Khanh', 0988585587, 'night', 'waiter');
insert into employee values (3456, 'Nguyen Tran Xuan Hao', 0932871599, 'day', 'chef');
insert into employee values (4587, 'Ly Hoang Hung', 0988585576, 'day', 'shipper');
insert into employee values (5556, 'Kris Wu', 0988582411, 'day', 'chef');
insert into employee values (5957, 'Ngo Thi My Dung', 0372583788, 'night', 'waiter');
insert into employee values (6047, 'Nguyen Gia Dinh', 0988585583, 'night', 'shipper');
insert into employee values (6401, 'Duong Hoang Anh Khoa', 0903875923, 'day', 'security');
insert into employee values (6480, 'Lam Gia Khang', 0988585586, 'day', 'waiter');
insert into employee values (6658, 'Lam Cat Trung', 0988585574, 'day', 'shipper');
insert into employee values (6674, 'Hoang Dao My Nghi', 0988585579, 'night', 'shipper');
insert into employee values (6801, 'Hoang Manh Cong', 0988585584, 'day', 'waiter' );
insert into employee values (6985, 'Ly Van Kiet', 0988585575, 'day', 'shipper');
insert into employee values (7001, 'Tran Binh My', 0988585388, 'night', 'chef');
insert into employee values (7045, 'Gia Cat Tai', 0964925561, 'day', 'waiter');
insert into employee values (7781, 'Luong Hoang Ha', 0915827580, 'night', 'shipper');
insert into employee values (8423, 'Nguyen Hoai Linh', 0934185505, 'night', 'chef');
insert into employee values (9093, 'Mai Xuan Thu', 0988585581, 'night', 'shipper');
insert into employee values (9095, 'Daniel Ngo', 0933785582, 'night', 'shipper');
insert into employee values (9461, 'Dang Hong Mai Thu', 0988585589, 'night', 'waiter');


insert into shipper values (2486, 'Motor');
insert into shipper values (2541, 'Motor');
insert into shipper values (2543, 'Motor');
insert into shipper values (4587, 'Motor');
insert into shipper values (6047, 'Motor');
insert into shipper values (6658, 'Motor');
insert into shipper values (6674, 'Motor');
insert into shipper values (6985, 'Motor');
insert into shipper values (7781, 'Motor');
insert into shipper values (9093, 'Motor');
insert into shipper values (9095, 'Motor');

insert into accountant values (1028);
insert into accountant values (1456);

insert into security_guard values (6401);
insert into security_guard values (8423);

insert into waiter values (1234);
insert into waiter values (2345);
insert into waiter values (3180);
insert into waiter values (5957);
insert into waiter values (6480);
insert into waiter values (6801);
insert into waiter values (7045);
insert into waiter values (9461);

insert into chef values (3456);
insert into chef values (5556);
insert into chef values (7001);
insert into chef values (8423);

insert into manager values (1235);
insert into manager values (1475);

insert into manage values (16, 1028, 1235);
insert into manage values (7.5, 2315, 1235);
insert into manage values (8, 2486, 1235);
insert into manage values (16, 6658, 1235);
insert into manage values (15, 6985, 1235);
insert into manage values (15.5, 4587, 1235);
insert into manage values (16, 2541, 1235);
insert into manage values (18, 6801, 1235);
insert into manage values (18, 7045, 1235);
insert into manage values (16, 6480, 1235);
insert into manage values (16, 3456, 1235);
insert into manage values (16, 5556, 1235);
insert into manage values (16, 6401, 1235);
insert into manage values (16, 2222, 1475);
insert into manage values (11, 1456, 1475);
insert into manage values (12, 8423, 1475);
insert into manage values (12, 2543, 1475);
insert into manage values (12.5, 6674, 1475);
insert into manage values (13, 7781, 1475);
insert into manage values (14, 9093, 1475);

insert into administrator values (2315, 'nguyenphuquy@gmail.com');

insert into customer values (3502, 'Dang Tuan Anh', 0919814702, 4, '10:30:00');
insert into customer values (3554, 'Pham Hoang Anh', 0977475566, 2, '12:30:00');
insert into customer values (3538, 'Do Gia Bao', 0975924124, 4, '12:30:00');
insert into customer values (3509, 'Nguyen Le Hieu', 0924919274, 4, '12:30:00');
insert into customer values (3514, 'Mac Trung Duc', 0983568618, 6, '13:00:00');
insert into customer values (3560, 'Michael Pham', 0916385316, 3, '13:00:00');
insert into customer values (3524, 'Daniel Smith', 0938504583, 4, '5:00:00');
insert into customer values (3569, 'John Dell', 0915085455, 3, '5:00:00');
insert into customer values (3584, 'Darik Peterson', 0949575707, 3, '5:30:00');
insert into customer values (3542, 'Saki Ukai', 0996626689, 3, '6:00:00');
insert into customer values (3549, 'Pham Vu Ngoc Diep', 0912913360, 2, '6:00:00');
insert into customer values (3529, 'Dinh Thuy Linh', 0961557107, 4, '6:00:00');
insert into customer values (4493, 'Park MinKyung', 0926116304, 3, '11:00:00');
insert into customer values (4521, 'Nguyen Nam Giang', 0958442018, 4, '11:00:00');
insert into customer values (4487, 'Ngo Gia Minh', 0928926222, 5, '11:30:00');
insert into customer values (4553, 'Mai Hoang Duc', 0969296063, 4, '12:00:00');
insert into customer values (4539, 'Nguyen Quoc Huy', 0954086097, 3, '12:00:00');
insert into customer values (4462, 'Phan The Bao', 0916275059, 5, '12:00:00');
insert into customer values (4534, 'Phan Hong Ngoc', 0983290694, 2, '12:00:00');
insert into customer values (4515, 'Pham Vu Diep Lam', 0981461529, 3, '12:00:00');
insert into customer values (4466, 'Vu Duc Huy', 0946344558, 2, '12:30:00');
insert into customer values (4540, 'Nguyen Huu Khanh', 0986671459, 3, '12:30:00');
insert into customer values (4480, 'Le Quang Phong', 0956524355, 4, '12:30:00');
insert into customer values (4508, 'Saigou Homura', 0994943861, 3, '12:30:00');
insert into customer values (4506, 'Tran Gia Huy', 0963369890, 4, '12:30:00');

insert into users values ('hoado', 'hoado@gmail.com', '528440752052', '65 Le Loi Dist 1 Ho Chi Minh City Vietnam', 3452);
insert into users values ('dunghanhatm', 'dunghanhatm@gmail.com', '542659193128', '294 lo 8 Cu Chi Ho Chi Minh City Vietnam', 4334);
insert into users values ('kicm', 'kicm@gmail.com', '316824027259', '400 - 402 Ton Dan Ward 4 District 4 Ho Chi Minh Vietnam', 3464);
insert into users values ('jack97', 'jack97@gmail.com', '206978673819', '84 Pham Van Chieu Ward 9 Go Vap District Ho Chi Minh Vietnam', 6534);
insert into users values ('chaoyenmach', 'chaoyenmach@gmail.com', '563616534504', '713B Dien Bien Phu Ward 22 Binh Thanh District Ho Chi Minh Vietnam', 6335);
insert into users values ('phobokhonghanh', 'phobokhonghanh@gmail.com', '791290981457', '100 Tran Hung Dao Pham Ngu Lao Ward District 1, Ho Chi Minh Vietnam', 3462);
insert into users values ('bundaumamtom', 'bundaumamtom@gmail.com', '186492426733', '19 Nguyen Binh Khiem Da Kao Ward District 1 Ho Chi Minh Vietnam', 8567);
insert into users values ('comtam', 'comtam@gmail.com', '776986750239', '290 Cach Mang Thang Tam Ward 12 District 10 Ho Chi Minh Vietnam', 1356);
insert into users values ('viyeumaden', 'viyeumaden@gmail.com', '576167114329', '29A Nguyen Dinh Chieu Da Kao Ward District 1 Ho Chi Minh Vietnam', 4672);
insert into users values ('congdungngonhanh', 'congdungngonhanh@gmail.com', '397052573330', '114 Street No. 2 Do Thanh Residence Ward 04 District 3, Ho Chi Minh Vietnam', 1123);
insert into users values ('covid21', 'covid21@gmail.com', '579982624907', '1119 Tran Hung Dao Ward 05 District 5 Ho Chi Minh Vietnam', 1231);
insert into users values ('chungtalaconnguoi', 'chungtalaconnguoi@gmail.com', '767602573311', '175 Phan Chu Trinh Ward 13 Binh Thanh District Ho Chi Minh Vietnam', 1342);
insert into users values ('hocsinhgioi', 'hocsinhgioi@gmail.com', '945790189725', '10 Tran Van Quang Ward 10 Tan Binh District Ho Chi Minh Vietnam', 7363);
insert into users values ('connhanguoita', 'connhanguoita@gmail.com', '159923812172', '18 Giai Phong Ward 4 Tan Binh District Ho Chi Minh Vietnam', 3535);
insert into users values ('tachfinal', 'tachfinal@gmail.com', '252554025351', '97 Pham Huu Lau Quarter 2 Phu My Ward District 7 Ho Chi Minh Vietnam', 5632);
insert into users values ('onhachanqua', 'onhachanqua@gmail.com', '566996960750', 'Floor 72 Landmark 81 Building Vinhomes Central Park 720A Dien Bien Phu Ward 22 Binh Thanh District Ho Chi Minh Vietnam', 2452);
insert into users values ('tmuondian', 'tmuondian@gmail.com', '978945777820', 'No. 44 Street 56 Binh Trung Dong Ward Thu Duc City Ho Chi Minh Vietnam', 6735);
insert into users values ('hoctaithiphan', 'hoctaithiphanl@gmail.com', '525715463034', '44/12 Street 7 Hiep Binh Chanh Ward Thu Duc City Ho Chi Minh Vietnam', 4562);
insert into users values ('ngusuotngay', 'ngusuotngay@gmail.com', '946193694584', 'A1/8 Hamlet 1 Tan Kien Commune Binh Chanh District Ho Chi Minh Vietnam', 6316);
insert into users values ('tapcanbinh', 'tapcanbinh@gmail.com', '353516290139', 'B8/26B VO VAN VAN Vinh Loc B Commune Binh Chanh District Ho Chi Minh Vietnam',3463);
insert into users values ('aothatday', 'aothatday@gmail.com', '306671365624', '8th floor 520 Cach Mang Thang 8 Ward 11 District 3 Ho Chi Minh Vietnam', 6314);
insert into users values ('chacalavong', 'chacalavong@gmail.com', '575014816423', '27C Quoc Huong Thao Dien Ward Thu Duc City Ho Chi Minh Vietnam', 2464);
insert into users values ('bunthitnuong', 'bunthitnuong@gmail.com', '429928078200', '395 Nguyen Van Qua Quarter 4 Dong Hung Thuan Ward District 12, Ho Chi Minh Vietnam', 3463);
insert into users values ('buncha', 'buncha@gmail.com', '358459457414', '80/8 Duong Cong Khi Street Hamlet 4 Xuan Thoi Son Commune Hoc Mon District Ho Chi Minh Vietnam', 1496);
insert into users values ('mycayhanquoc', 'mycayhanquoc@gmail.com', '962167561822', '385D Nguyen Trai Nguyen Cu Trinh Ward District 1 Ho Chi Minh Vietnam', 8732);
insert into users values ('comchannuoc', 'comchannuoc@gmail.com', '788854507403', 'L10-06 10th Floor Vincom Center Building 72 Le Thanh Ton Ben Nghe Ward District 1 Ho Chi Minh Vietnam', 9643);

insert into crud values ('TRUE', 7, 0.2, 2315, 'hoado');
insert into crud values ('TRUE', 7.5, 0.15, 2315, 'dunghanhatm');
insert into crud values ('TRUE', 7, 0.15, 2315, 'kicm');
insert into crud values ('TRUE', 8, 0, 2315, 'jack97');
insert into crud values ('TRUE', 8.3, 0, 2315, 'chaoyenmach');
insert into crud values ('TRUE', 7.6, 0.12, 2315, 'phobokhonghanh');
insert into crud values ('TRUE', 6.6, 0, 2315, 'bundaumamtom');
insert into crud values ('TRUE', 8.4, 0.12, 2315, 'comtam');
insert into crud values ('TRUE', 8 ,0.12, 2315, 'viyeumaden');
insert into crud values ('TRUE', 8, 0.13, 2315, 'congdungngonhanh');
insert into crud values ('TRUE', 9, 0.12, 2315, 'covid21');
insert into crud values ('TRUE', 9.5, 0.4, 2315, 'chungtalaconnguoi');
insert into crud values ('TRUE', 10, 0.5, 2315, 'hocsinhgioi');
insert into crud values ('TRUE', 10, 0.13, 2315, 'connhanguoita');
insert into crud values ('TRUE', 10, 0.15, 2315, 'tachfinal');
insert into crud values ('TRUE', 10, 0.12, 2315, 'onhachanqua');
insert into crud values ('FALSE', 10, 0.26, 2315, 'tmuondian');
insert into crud values ('TRUE', 10, 0.22, 2315,  'hoctaithiphan');
insert into crud values ('TRUE', 10, 0.55, 2315, 'ngusuotngay');
insert into crud values ('TRUE', 10, 0.12, 2315, 'tapcanbinh');
insert into crud values ('TRUE', 10, 0.11, 2315, 'aothatday');
insert into crud values ('TRUE', 10, 0.1, 2315, 'chacalavong');
insert into crud values ('TRUE', 10, 0.1, 2315, 'bunthitnuong');
insert into crud values ('TRUE', 10, 0.13, 2315, 'buncha');
insert into crud values ('TRUE', 10, 0, 2315, 'mycayhanquoc');

insert into status_of_order values (1247121, 20210816, 0.25, 'yes', NULL, 3550, 'cash', 'None');
insert into status_of_order values (1247127, 20210816, NULL, 'no', NULL, 6735, 'banking transfer', 'None');
insert into status_of_order values (1247128, 20210816, NULL, 'no', NULL, 3482, 'banking transfer', 'None');
insert into status_of_order values (1247129, 20210816, NULL, 'no', NULL, 3510, 'cash', 'None');
insert into status_of_order values (1247130, 20210816, NULL, 'no', 2541, 1496, 'cash', 'buncha' );
insert into status_of_order values (1247131, 20210816, NULL, 'no', 2541, 8553, 'cash', 'taobao');
insert into status_of_order values (1247132, 20210816, NULL, 'no', NULL, 6316, 'cash', 'tmuondian');
insert into status_of_order values (1247133, 20210816, NULL, 'no', NULL, 6314, 'cash', 'ngusuotngay');
insert into status_of_order values (5512134, 20210817, NULL, 'no', NULL, 3551, 'cash', 'None');
insert into status_of_order values (5512135, 20210817, NULL, 'no', 2543, 1120, 'cash', 'alibaba');
insert into status_of_order values (5512136, 20210817, NULL, 'no', NULL, 3527, 'cash', 'None');
insert into status_of_order values (5512137, 20210817, NULL, 'no', NULL, 3494, 'cash', 'None');
insert into status_of_order values (5512138, 20210817, NULL, 'no', NULL, 3581, 'cash', 'None');
insert into status_of_order values (5512139, 20210817, NULL, 'no', NULL, 3523, 'cash', 'None');
insert into status_of_order values (5512140, 20210817, NULL, 'no', NULL, 3517, 'cash', 'None');
insert into status_of_order values (5512141, 20210817, NULL, 'no', NULL, 3521, 'cash', 'None');

insert into receipt values (1009, 1247128, 3527, 523000, 1456);
insert into receipt values (1497, 1247125, 6316, 633000, 1028);
insert into receipt values (1547, 1247121, 3550, 354000, 1028);
insert into receipt values (1687, 1247124, 3510, 167000, 1028);
insert into receipt values (2247, 1247122, 6735, 423000, 1028);
insert into receipt values (2547, 1247127, 3551, 234000, 1028);
insert into receipt values (3457, 1247126, 6314, 413000, 1028);
insert into receipt values (3547, 1247123, 3482, 635000, 1028);
insert into receipt values (6108, 1247129, 3494, 534000, 1456);
insert into receipt values (9974, 1247130, 1496, 214000, 1456);

insert into provider values (1,3164, 'Hoang Dong private enterprise', 0970252003, 20210816, 1235);
insert into provider values (2, 8676, 'Tien Giang vegetable company', 0976960012, 20210816, 1475);
insert into provider values (3,6055, 0989827109, 20210816, 'Viet Hiep cooking spices company', 1235);
insert into provider values (4,3164, 0962154352, 20210817, 'Hoang Dong private enterprise', 1235);
insert into provider values (5,3164, 0971678410, 20210818, 'Hoang Dong private enterprise', 1235);
insert into provider values (6,3164, 0971733860, 20210819, 'Hoang Dong private enterprise', 1475);
insert into provider values (7,8676, 0935755910, 20210819, 'Tien Giang vegetable company', 1475);
insert into provider values (8,3164, 0918443377, 20210820, 'Hoang Dong private enterprise', 1235);
insert into provider values (9,3164, 0936863401, 20210821, 'Hoang Dong private enterprise', 1475);
insert into provider values (10,8676, 0979872376, 20210821, 'Tien Giang vegetable company', 1475);

insert into payment values (971858, 923000, 'cash', 20210816);
insert into payment values (385916, 476000, 'cash', 20210816);
insert into payment values (257491, 1530000, 'banking card', 20210816);
insert into payment values (827919, 2000000, 'banking card', 20210816);
insert into payment values (295704, 743000, 'banking card', 20210816);
insert into payment values (393884, 842000, 'banking transfer', 20210816);
insert into payment values (390949, 750000, 'banking card', 20210816);
insert into payment values (399633, 640000, 'banking card', 20210816);
insert into payment values (256167, 217000, 'cash', 20210816);
insert into payment values (472639, 555000, 'banking card', 20210816);
insert into payment values (647432, 460000, 'cash', 20210816);
insert into payment values (764766, 90000, 'cash', 20210816);
insert into payment values (782968, 140000, 'banking card', 20210816);
insert into payment values (176666, 250000, 'banking card', 20210816);
insert into payment values (317739, 380000, 'banking card', 20210816);
insert into payment values (862763, 70000, 'banking card', 20210817);
insert into payment values (996882, 860000, 'banking card', 20210817);
insert into payment values (897861, 740000, 'cash', 20210817);
insert into payment values (542561, 1260000, 'banking card', 20210817);
insert into payment values (755469, 630000, 'banking transfer', 20210817);
insert into payment values (337174, 80000, 'banking card', 20210817);
insert into payment values (383566, 90000, 'banking card', 20210817);
insert into payment values (562116, 156000, 'cash', 20210817);
insert into payment values (564473, 245000, 'cash', 20210817);
insert into payment values (840498, 407000, 'cash', 20210817);

insert into ingredient values (341863, 'Beef', 250000, 'kg', 8676);
insert into ingredient values (488754, 'Chicken meat', 38000, 'kg', 3164);
insert into ingredient values (977907, 'Fish', 120000, 'kg', 8676);
insert into ingredient values (235454, 'Shrimp', 180000, 'kg', 3164);
insert into ingredient values (896855, 'Goose meat', 160000, 'kg', 3164);
insert into ingredient values (979656, 'Crab', 350000, 'kg', 6055);
insert into ingredient values (329087, 'Duck meat', 64000, 'kg', 3164);
insert into ingredient values (785967, 'Rice noodles', 2000, 'kg', 6055);
insert into ingredient values (214574, 'Snail', 35000, 'kg', 3164);

insert into meal values ('Bun mam', 3456);
insert into meal values ('Bun bo hue', 5556);
insert into meal values ('Bun ca nha trang', 7001);
insert into meal values ('Bun ca chau doc', 8423);
insert into meal values ('Bun nuoc leo', 3456);
insert into meal values ('Bun canh chua Nam Bo', 3456);
insert into meal values ('Mien ga', 7001);
insert into meal values ('Mien ngan', 8423);
insert into meal values ('Banh da cua', 3456);
insert into meal values ('Bun oc', 8423);
insert into meal values ('Hu tiu vam vang', 5556);
insert into meal values ('Bun rieu cua', 5556);
insert into meal values ('Mi quang', 8423);
insert into meal values ('Pho', 8423);
insert into meal values ('Mi hoanh thanh', 8423);
insert into meal values ('Bun mang vit', 5556);

INSERT INTO use_of_portion VALUES (35.5, 'Bun bo hue', 341863);
INSERT INTO use_of_portion VALUES (37, 'Bun rieu cua', 97965);
INSERT INTO use_of_portion VALUES (32.7, 'Bun nuoc leo', 785967);
INSERT INTO use_of_portion VALUES (45.1, 'Bun ca Nha Trang', 977907);
INSERT INTO use_of_portion VALUES (39.2, 'Bun mam', 235454);
INSERT INTO use_of_portion VALUES (29.8, 'Bun ca chau doc', 977907);
INSERT INTO use_of_portion VALUES (31.5, 'Bun mang vit', 329087);
INSERT INTO use_of_portion VALUES (29, 'Mien ga', 488754);
INSERT INTO use_of_portion VALUES (30.9, 'Bun canh chua nam bo', 785967);
INSERT INTO use_of_portion VALUES (41, 'Banh da cua', 979656);
INSERT INTO use_of_portion VALUES (39.3, 'Mien ngan', 896855);
INSERT INTO use_of_portion VALUES (33.1, 'Hu tiu nam vang', 785967);
INSERT INTO use_of_portion VALUES (31.3, 'Bun oc', 214574);
# Querry 1
SELECT	e.emID , (m.timekeeping - 10) * 50000 AS supporting_income
FROM	employee e, manage m
WHERE	e.emID = m.emID AND m.timekeeping > 2 AND e.employee_role = 'shipper' AND e.shift = 'night';

# Querry 2
SELECT e.employee_name, e.shift, e.employee_role
FROM	employee e
WHERE	e.shift = 'day' AND NOT EXISTS(
SELECT e.employee_name, e.shift, e.employee_role
FROM	employee e
WHERE	e.shift = 'day' AND e.employee_role = 'administrator');

# Querry 3
SELECT	u.user_name, u.email, o.date_of_order, avg(cr.reviewed_rating)
FROM	users u, status_of_order o, CRUD cr
WHERE	u.user_name = o.user_name AND o.date_of_order = 20210816 AND u.user_name = cr.user_name;


#Querry 5
SELECT i.name_of_ingredient, pr.date_of_issues, pr.name_of_provider
FROM	ingredient i, Provider pr
WHERE	pr.prID = i.prID AND pr.date_of_issues = 20210819 AND i.prID is not null AND i.prID <> ''
UNION
SELECT i.name_of_ingredient, pr.date_of_issues, pr.name_of_provider
FROM	ingredient i, Provider pr
WHERE	pr.prID = i.prID AND pr.date_of_issues = 20210820 AND i.prID is not null AND i.prID <> ''
UNION
SELECT i.name_of_ingredient, pr.date_of_issues, pr.name_of_provider
FROM	ingredient i, Provider pr
WHERE	pr.prID = i.prID AND pr.date_of_issues = 20210821 AND i.prID is not null AND i.prID <> '';

#Querry 4
SELECT	u.user_name, u.cID, o.payment_method, o.date_of_order, r1.total_payment, r2.total_payment *0.3 AS Discount_voucher
FROM		users u, status_of_order o, receipt r1, receipt r2
WHERE	r1.receipt_number = r2.receipt_number AND r1.cId = o.cID AND u.user_name = o.user_name AND r1.total_payment > 150000 AND o.date_of_order = 20210816 AND o.payment_method = 'card'
UNION
SELECT	u.user_name, u.cID, o.payment_method, o.date_of_order, r1.total_payment, r2.total_payment *0.3 AS Discount_voucher
FROM		users u, status_of_order o, receipt r1, receipt r2
WHERE	r1.receipt_number = r2.receipt_number AND r1.cId = o.cID AND u.user_name = o.user_name AND r1.total_payment > 150000 AND o.date_of_order = 20210816 AND o.payment_method = 'banking transfer';


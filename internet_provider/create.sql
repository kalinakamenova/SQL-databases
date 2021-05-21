drop database if exists internet_provider;
create database internet_provider;
use internet_provider;

create table Areas(
	id int not null auto_increment primary key,
    area_name varchar(100) not null
);

create table SubscriptionPlans(
	id int not null auto_increment primary key,
    price int not null,
    speed_mbps int not null
);

create table Users(
	id int not null auto_increment primary key,
    first_name varchar(100) not null,
	last_name varchar(100) not null,
	phone_number varchar(100) not null,
    birth_date Date not null,
    area_id int not null,
    constraint foreign key (area_id) references Areas(id),
    mac_address varchar(100) not null,
    ip_address varchar(100) not null,
    subscription_plan_id int not null,
    constraint foreign key (subscription_plan_id) references SubscriptionPlans(id),
    pay_date Date not null,
    used_traffic_gb int not null -- traffic used by user in gigabytes
);

create table Employees(
	id int not null auto_increment primary key,
    first_name varchar(100) not null,
	last_name varchar(100) not null,
    area_id int not null,
    foreign key (area_id) references Areas(id) -- the area in which the employee works
);

create table Issues(
	id int not null auto_increment primary key, 
    employee_id int not null,
	foreign key (employee_id) references Employees (id),
    area_id int not null,
    foreign key (area_id) references Areas(id), -- the area in which the problem is located, an employee from a different area could have solved it
    solution varchar(300) not null,
    cost int not null
);
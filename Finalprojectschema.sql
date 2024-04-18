drop table employee cascade constraints;
drop table customer cascade constraints;
drop table item cascade constraints;
drop table sale cascade constraints;
drop table saledescription cascade constraints;

create table employee (
    employeeid int not null,
    firstname varchar(20),
    lastname varchar(20),
    phonenumber int,
    address varchar(100),
    startdate date,
    enddate date,
    hourlysalary number(5, 2)
);

create table customer (
    customerid int not null,
    firstname varchar(20),
    lastname varchar(20),
    phonenumber int,
    address varchar(100)
);

create table item (
    itemid int not null,
    itemname varchar(100),
    price number(6, 2)
);

create table sale (
    transactionid int not null,
    discountid int not null
);

create table saledescription (
    discountid int not null,
    description varchar(250)
);
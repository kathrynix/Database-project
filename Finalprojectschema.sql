drop table employee cascade constraints;
drop table customer cascade constraints;
drop table item cascade constraints;
drop table sale cascade constraints;
drop table saledescription cascade constraints;
drop table purchases cascade constraints;
drop table itemsbought cascade constraints;
drop table processedby cascade constraints;

create table employee (
    employeeid int not null,
    firstname varchar(20),
    lastname varchar(20),
    phonenumber int,
    address varchar(100),
    startdate date,
    enddate date,
    hourlysalary number(5, 2),
    bankaccount int,
    constraint employeepk primary key(employeeid)
);

create table customer (
    customerid int not null,
    firstname varchar(20),
    lastname varchar(20),
    phonenumber int,
    address varchar(100),
    creditcard int,
    constraint customerpk primary key(customerid)
);

create table item (
    itemid int not null,
    itemname varchar(100),
    price number(6, 2),
    constraint itempk primary key(itemid)
);

create table purchases (
    transactionid int not null,
    customerid int not null,
    constraint purchasespk primary key(transactionid),
    constraint purchasesfk foreign key(customerid) references customer(customerid)
);

create table saledescription (
    discountid int not null,
    description varchar(250),
    constraint saledescpk primary key(discountid)
);

create table sale (
    transactionid int not null,
    discountid int not null,
    constraint salepk primary key(transactionid, discountid),
    constraint salefk foreign key(discountid) references saledescription(discountid)
);

create table itemsbought (
    transactionid int not null,
    itemid int not null,
    constraint ibpk primary key(transactionid, itemid),
    constraint ibfk1 foreign key(transactionid) references purchases(transactionid),
    constraint ibfk2 foreign key(itemid) references item(itemid)
);

create table processedby (
    transactionid int not null,
    employeeid int not null,
    constraint pbpk primary key(transactionid),
    constraint pbfk1 foreign key(transactionid) references purchases(transactionid),
    constraint pbfk2 foreign key(employeeid) references employee(employeeid)
);
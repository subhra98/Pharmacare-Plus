--  Medicine Store Database by Subhrajyoti Bera
-- 
--  DISCLAIMER
--  To the best of our knowledge, this data is fabricated, and
--  it does not correspond to real entities. 
--  Any similarity to existing entities is purely coincidental.


drop database if exists pharmacy;
create database if not exists pharmacy;
use pharmacy;

drop table if exists Employee,
					 Sales,
                     Customer,
                     Consultation,
                     Appointment,
                     Doctor,
                     Prescription,
                     Supplier,
                     Medicine;

# Create Employee table
create table Employee (
	employee_id int not null,
    name varchar(255) not null,
    role varchar(100) not null,
    salary decimal(10,2) not null,
    contact varchar(15) not null,
    email varchar(255) not null,
    hire_date date not null,
    primary key (employee_id)
);

# Create Customer table
create table Customer (
	customer_id int not null,
    name varchar(255) not null,
    contact varchar(15) not null,
    email varchar(255) not null,
    address varchar(255) not null,
    primary key (customer_id)
);

# Create Doctor table
create table Doctor (
	doctor_id int not null,
    name varchar(255) not null,
    specialization varchar(255) not null,
    contact varchar(15) not null,
    email varchar(255) not null,
    consultation_fee decimal(10,2) not null,
    availability varchar(255) not null,
    primary key (doctor_id)
);

# Create Supplier table
create table Supplier (
	supplier_id int not null,
    name varchar(255) not null,
    contact varchar(15) not null,
    email varchar(255) not null,
    address varchar(255) not null,
    primary key (supplier_id)
);

# Create Medicine Table
create table Medicine (
	medicine_id int not null,
    supplier_id int not null,
    name varchar(255) not null,
    category varchar(100) not null,
    brand varchar(100) not null,
    price decimal(10,2) not null,
    quantity int not null,
    expiry_date date,
    primary key (medicine_id),
    foreign key (supplier_id) references Supplier(supplier_id) on delete cascade
);

# Create Sales Table
create table Sales (
	sales_id int not null,
    customer_id int not null,
    employee_id int not null,
    medicine_id int not null,
    quantity int not null,
    total_price decimal(10,2) not null,
    salestime datetime not null,
    primary key (sales_id),
    foreign key (customer_id) references Customer(customer_id) on delete cascade,
    foreign key (employee_id) references Employee(employee_id) on delete cascade,
    foreign key (medicine_id) references Medicine(medicine_id) on delete cascade
);

# Create Consultation Table
create table Consultation (
	consultation_id int not null,
    doctor_id int not null,
    customer_id int not null,
    diagnosis text not null,
    consultation_date datetime not null,
    fee_paid decimal(10,2) not null,
    primary key (consultation_id),
    foreign key (doctor_id) references Doctor(doctor_id) on delete cascade,
    foreign key (customer_id) references Customer(customer_id) on delete cascade
);

# Create Prescription Table
create table Prescription (
	prescription_id int not null,
    customer_id int not null,
    doctor_id int not null,
    medicine_id int not null,
    consultation_id int not null,
    dosage varchar(50) not null,
    prescription_date date not null,
    primary key (prescription_id),
    foreign key (customer_id) references Customer(customer_id) on delete cascade,
    foreign key (doctor_id) references Doctor(doctor_id) on delete cascade,
    foreign key (medicine_id) references Medicine(medicine_id) on delete cascade,
    foreign key (consultation_id) references Consultation(consultation_id) on delete cascade
);
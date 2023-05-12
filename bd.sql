CREATE TABLE usertypes(
	id int primary key,
	name varchar(40) not null,
	assing_task boolean default false
);
CREATE TABLE categories(
	id serial primary key,
	name varchar(20) not null unique
);
create table users(
	id serial primary key,	
	username varchar(50) not null,
	user_type_id int,
	foreign key (user_type_id) references usertypes(id)
);
CREATE TABLE tasks(
	id serial,
	title varchar(50) not null,
	description text,
	status varchar(12) CHECK (status IN
		('Proceso', 'Pendiente', 'Terminado')) NOT NULL,
	dealine date,
	user_id int not null,
	Foreign key (user_id) references users(id)
);
alter table tasks add primary key (id);

create table task_categories(
	id serial primary key,
	task_id int,
	category_id int,
	foreign key (task_id) references tasks(id),
	foreign key (category_id) references categories(id)
);


insert into usertypes(id,name,assing_task)
values(1,'admin',TRUE),(2,'Slave',FALSE),(3,'Dean',TRUE),
(4,'Backend Developer',FALSE);

insert into users (username,user_type_id)
values('sebastian',4),('Hary',4),
('Carolina',1),('Sergio',2),('Vannesa',3);

insert into tasks(title, description, status,dealine,user_id) 
values ('1','1','Proceso','2023-08-01',2)
, ('2','1','Proceso','2023-08-01',4);


insert into categories (name) 
values 
('Desarrollo'),('Administrativo'),('Contenido');

INSERT INTO task_categories(task_id,category_id) 
values(1,1),(1,2),(1,3),(2,2);


delete from tasks;
delete from users;
SELECT setval('users_id_seq', 1, false);

SELECT setval('tasks_id_seq', 1, false);

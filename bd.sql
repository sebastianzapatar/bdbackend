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

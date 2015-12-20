create table posts (
  id serial primary key,
  parent integer,
  name varchar(255),
  title varchar(255),
  message text
);

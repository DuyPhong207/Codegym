create table class (
id int primary key not null,
name varchar(50) not null);
insert into class
values(1,"aaaaa"),
      (2,"bbbbb"),
      (3,"ccccc"),
      (4,"ddddd");
select * from class;
insert into teacher
values(1,"a",20,"A"),
      (2,"b",20,"B"),
      (3,"c",20,"C"),
      (4,"d",20,"D");
select * from teacher;

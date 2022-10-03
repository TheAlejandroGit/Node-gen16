CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "is_active" bool DEFAULT true,
  "id_role" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "Level" int NOT NULL,
  "teacher" varchar NOT NULL,
  "id_categories" uuid NOT NULL
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "id_course" uuid NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "id_course" uuid NOT NULL,
  "id_user" uuid NOT NULL
);

ALTER TABLE "course_video" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_categories") REFERENCES "categories" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id_role") REFERENCES "roles" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

insert into roles
values ('a215960a-42d5-11ed-b878-0242ac120002', 'student' ),
('b2ab8ec0-42d5-11ed-b878-0242ac120002', 'teacher'),
('cfa11dba-42d5-11ed-b878-0242ac120002', 'admin');


insert into users 
values('34ab0f82-42d5-11ed-b878-0242ac120002', 'Manuel Mijangos', 'alex@hotmail.com', 'asssdsvlm', 26, true, 'a215960a-42d5-11ed-b878-0242ac120002'),
('9848725e-42d6-11ed-b878-0242ac120002', 'Candy Martinez', 'candy@hotmail.com', 'vdfbvdfbd', 25, false, 'b2ab8ec0-42d5-11ed-b878-0242ac120002' );

insert into categories 
values('3288242c-42d7-11ed-b878-0242ac120002', 'Art'),
      ('489b9802-42d7-11ed-b878-0242ac120002', 'Programming');

insert into courses 
values ('e25b572a-42d7-11ed-b878-0242ac120002','Learning JS', 'You will learn JS', 1, 'Gustavo Mendoza', '3288242c-42d7-11ed-b878-0242ac120002'),
       ('2b7a96f0-42d8-11ed-b878-0242ac120002','Learning to Paint', 'You will learn paint', 1, 'Luis Ramirez', '489b9802-42d7-11ed-b878-0242ac120002');

insert into course_video 
values ('817c0d82-42d7-11ed-b878-0242ac120002', 'installing app', 'www.app.com', 'e25b572a-42d7-11ed-b878-0242ac120002'),
       ('2f02a0c2-42da-11ed-b878-0242ac120002', 'painting body', 'www.body.com','2b7a96f0-42d8-11ed-b878-0242ac120002');

insert into users_courses 
values ('07b0afb2-42dc-11ed-b878-0242ac120002', 'e25b572a-42d7-11ed-b878-0242ac120002','34ab0f82-42d5-11ed-b878-0242ac120002'),
       ('5e83b0e6-42dc-11ed-b878-0242ac120002', '2b7a96f0-42d8-11ed-b878-0242ac120002', '9848725e-42d6-11ed-b878-0242ac120002' );

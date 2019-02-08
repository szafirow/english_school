CREATE TABLE [Name_course] (
	name_course_id decimal,
	name_course_name varchar(20),
  CONSTRAINT [PK_NAME_COURSE] PRIMARY KEY CLUSTERED
  (
  [name_course_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Language] (
	language_id decimal,
	language_name varchar(20),
  CONSTRAINT [PK_LANGUAGE] PRIMARY KEY CLUSTERED
  (
  [language_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Status] (
	status_id decimal,
	status_name varchar(20),
  CONSTRAINT [PK_STATUS] PRIMARY KEY CLUSTERED
  (
  [status_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Kind_education] (
	kind_education_id decimal,
	kind_education_name varchar(20),
  CONSTRAINT [PK_KIND_EDUCATION] PRIMARY KEY CLUSTERED
  (
  [kind_education_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Level] (
	level_id decimal,
	level_name varchar(20),
  CONSTRAINT [PK_LEVEL] PRIMARY KEY CLUSTERED
  (
  [level_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Class] (
	class_id decimal,
	class_number integer,
  CONSTRAINT [PK_CLASS] PRIMARY KEY CLUSTERED
  (
  [class_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Contract] (
	contract_id decimal,
	contract_number varchar(20),
	contract_date date,
  CONSTRAINT [PK_CONTRACT] PRIMARY KEY CLUSTERED
  (
  [contract_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Schedule] (
	schedule_id decimal,
	schedule_date date,
	group_id decimal,
  CONSTRAINT [PK_SCHEDULE] PRIMARY KEY CLUSTERED
  (
  [schedule_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Teacher] (
	teacher_id decimal,
	teacher_name varchar(20),
	teacher_phone cast(20 as int),
	course_id decimal,
	language_id decimal,
  CONSTRAINT [PK_TEACHER] PRIMARY KEY CLUSTERED
  (
  [teacher_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Course] (
	course_id decimal,
	course_duration integer,
	course_cost integer,
	name_course_id decimal,
	level_id decimal,
  CONSTRAINT [PK_COURSE] PRIMARY KEY CLUSTERED
  (
  [course_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Student] (
	student_id decimal,
	student_name varchar(20),
	student_birthday date,
	student_adress concat(40),
	student_phone cast(15 as int),
	student_passport cast(15 as int),
	course_id decimal,
	contract_id decimal,
	group_id decimal,
	level_id decimal,
	language_id decimal,
  CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED
  (
  [student_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Groupe] (
	group_id decimal,
	group_start date,
	group_finish date,
	course_id decimal,
	teacher_id decimal,
	kind_education_id decimal,
	status_id decimal,
  CONSTRAINT [PK_GROUPE] PRIMARY KEY CLUSTERED
  (
  [group_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO








ALTER TABLE [Teacher] WITH CHECK ADD CONSTRAINT [Teacher_fk0] FOREIGN KEY ([course_id]) REFERENCES [Course]([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Teacher] CHECK CONSTRAINT [Teacher_fk0]
GO
ALTER TABLE [Teacher] WITH CHECK ADD CONSTRAINT [Teacher_fk1] FOREIGN KEY ([language_id]) REFERENCES [Language]([language_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Teacher] CHECK CONSTRAINT [Teacher_fk1]
GO

ALTER TABLE [Course] WITH CHECK ADD CONSTRAINT [Course_fk0] FOREIGN KEY ([name_course_id]) REFERENCES [Name_course]([name_course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Course] CHECK CONSTRAINT [Course_fk0]
GO
ALTER TABLE [Course] WITH CHECK ADD CONSTRAINT [Course_fk1] FOREIGN KEY ([level_id]) REFERENCES [Level]([level_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Course] CHECK CONSTRAINT [Course_fk1]
GO

ALTER TABLE [Student] WITH CHECK ADD CONSTRAINT [Student_fk0] FOREIGN KEY ([course_id]) REFERENCES [Course]([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Student] CHECK CONSTRAINT [Student_fk0]
GO
ALTER TABLE [Student] WITH CHECK ADD CONSTRAINT [Student_fk1] FOREIGN KEY ([contract_id]) REFERENCES [Contract]([contract_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Student] CHECK CONSTRAINT [Student_fk1]
GO
ALTER TABLE [Student] WITH CHECK ADD CONSTRAINT [Student_fk2] FOREIGN KEY ([group_id]) REFERENCES [Groupe]([group_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Student] CHECK CONSTRAINT [Student_fk2]
GO
ALTER TABLE [Student] WITH CHECK ADD CONSTRAINT [Student_fk3] FOREIGN KEY ([level_id]) REFERENCES [Level]([level_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Student] CHECK CONSTRAINT [Student_fk3]
GO
ALTER TABLE [Student] WITH CHECK ADD CONSTRAINT [Student_fk4] FOREIGN KEY ([language_id]) REFERENCES [Language]([language_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Student] CHECK CONSTRAINT [Student_fk4]
GO

ALTER TABLE [Groupe] WITH CHECK ADD CONSTRAINT [Groupe_fk0] FOREIGN KEY ([course_id]) REFERENCES [Course]([course_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Groupe] CHECK CONSTRAINT [Groupe_fk0]
GO
ALTER TABLE [Groupe] WITH CHECK ADD CONSTRAINT [Groupe_fk1] FOREIGN KEY ([teacher_id]) REFERENCES [Teacher]([teacher_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Groupe] CHECK CONSTRAINT [Groupe_fk1]
GO
ALTER TABLE [Groupe] WITH CHECK ADD CONSTRAINT [Groupe_fk2] FOREIGN KEY ([kind_education_id]) REFERENCES [Kind_education]([kind_education_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Groupe] CHECK CONSTRAINT [Groupe_fk2]
GO
ALTER TABLE [Groupe] WITH CHECK ADD CONSTRAINT [Groupe_fk3] FOREIGN KEY ([status_id]) REFERENCES [Status]([status_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Groupe] CHECK CONSTRAINT [Groupe_fk3]
GO

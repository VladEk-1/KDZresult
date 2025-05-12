create table Patient
(
	PatientID int primary key identity,
	FirstName nvarchar(50) not null check(FirstName != ''),
	MiddleName nvarchar(50) not null check(MiddleName != ''),
	LastName nvarchar(50),
	Gender nvarchar(30) check(Gender in('male','female')),
	DateOfBirth date not null,
	PhoneNumber varchar(20) unique not null check((PhoneNumber != '') and (len(PhoneNumber)=11)),
	Address nvarchar(50) not null check(Address !='')
)
--Заполнение Patient
INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Иван', 'Иванович', 'Иванов', 'male', '1985-03-15', '79123456789', 'Москва, ул. Ленина, 12');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Мария', 'Сергеевна', 'Петрова', 'female', '1990-07-22', '79234567890', 'Санкт-Петербург, пр. Невского, 45');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Алексей', 'Александрович', 'Сидоров', 'male', '1982-11-10', '79345678901', 'Новосибирск, ул. Кирова, 3');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Екатерина', 'Владимировна', 'Кузнецова', 'female', '1995-04-05', '79456789012', 'Екатеринбург, ул. Мира, 17');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Дмитрий', 'Олегович', 'Морозов', 'male', '1988-09-30', '79567890123', 'Казань, ул. Гагарина, 25');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Анна', 'Игоревна', 'Васильева', 'female', '1992-12-18', '79678901234', 'Нижний Новгород, ул. Горького, 8');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Сергей', 'Владиславович', 'Козлов', 'male', '1980-06-25', '79789012345', 'Самара, ул. Победы, 10');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Ольга', 'Андреевна', 'Соколова', 'female', '1998-02-14', '79890123456', 'Ростов-на-Дону, ул. Чехова, 30');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Павел', 'Дмитриевич', 'Новиков', 'male', '1987-08-08', '79901234567', 'Воронеж, ул. Ленина, 5');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('Татьяна', 'Сергеевна', 'Федорова', 'female', '1993-10-20', '79012345678', 'Красноярск, ул. Мира, 15');
select * from Patient 


create table Department
(
	DepartmentID int primary key identity,
	DepartmentName nvarchar(50) not null check(DepartmentName!=''),
	WardQuantity int not null check(WardQuantity>0)
)
--заполнение Department
INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Хирургия', 5);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Терапия', 4);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Кардиология', 6);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Неврология', 3);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Гинекология', 2);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Оториноларингология', 2);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Урология', 3);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Педиатрия', 4);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Онкология', 5);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('Ревматология', 1);

select * from Department

create table Doctors
(
	DoctorID int primary key identity,
	DoctorFirstName nvarchar(50) not null check(DoctorFirstName != ''),
	DoctorMiddleName nvarchar(50) not null check(DoctorMiddleName != ''),
	DoctorLastName nvarchar(50),
	DoctorPhoneNumber varchar(20) unique not null check((DoctorPhoneNumber != '') and (len(DoctorPhoneNumber)=11)),
	WorkExperienceYears int not null check(WorkExperienceYears>0), 
	ProfessionID int,
	foreign key (ProfessionID) references DoctorsProfessions(ProfessionID) 
)
-- Доктор для профессии "Хирург" (ProfessionID = 1)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Иван', 'Иванович', 'Иванов', '79123456789', 10, 1);

-- Доктор для профессии "Кардиохирург" (ProfessionID = 2)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Петр', 'Петрович', 'Петров', '79234567890', 12, 2);

-- Доктор для профессии "Травматолог" (ProfessionID = 3)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Алексей', 'Алексеевич', 'Сидоров', '79345678901', 8, 3);

-- Доктор для профессии "Онкологический хирург" (ProfessionID = 4)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Дмитрий', 'Дмитриевич', 'Морозов', '79456789012', 15, 4);

-- Доктор для профессии "Терапевт" (ProfessionID = 5)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Екатерина', 'Евгеньевна', 'Кузнецова', '79567890123', 7, 5);

-- Доктор для профессии "Пульмонолог" (ProfessionID = 6)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Анна', 'Игоревна', 'Васильева', '79678901234', 9, 6);

-- Доктор для профессии "Гастроэнтеролог" (ProfessionID = 7)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Сергей', 'Владиславович', 'Козлов', '79789012345', 11, 7);

-- Доктор для профессии "Нефролог" (ProfessionID = 8)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Ольга', 'Андреевна', 'Соколова', '79890123456', 6, 8);

-- Доктор для профессии "Кардиолог" (ProfessionID = 9)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Павел', 'Дмитриевич', 'Новиков', '79901234567', 14, 9);

-- Доктор для профессии "Электрофизиолог" (ProfessionID = 10)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Татьяна', 'Сергеевна', 'Федорова', '79012345678', 5, 10);

-- Доктор для профессии "Хирург-кардиоторакальщик" (ProfessionID = 11)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Николай', 'Николаевич', 'Николаев', '79112233445', 13, 11);

-- Доктор для профессии "Невролог" (ProfessionID = 12)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Мария', 'Сергеевна', 'Петрова', '79223344556', 10, 12);

-- Доктор для профессии "Нейрохирург" (ProfessionID = 13)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Владимир', 'Владимирович', 'Владимиров', '79334455667', 12, 13);

-- Доктор для профессии "Педиатрический невролог" (ProfessionID = 14)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Ирина', 'Ивановна', 'Иванова', '79445566778', 8, 14);

-- Доктор для профессии "Гинеколог" (ProfessionID = 15)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Александр', 'Александрович', 'Александров', '79556677889', 9, 15);

-- Доктор для профессии "Онколог-гинеколог" (ProfessionID = 16)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Елена', 'Егоровна', 'Егорова', '79667788990', 11, 16);

-- Доктор для профессии "Отоларинголог" (ProfessionID = 17)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Михаил', 'Михайлович', 'Михайлов', '79778899001', 7, 17);

-- Доктор для профессии "Сурдолог" (ProfessionID = 18)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Олег', 'Олегович', 'Олегов', '79889900112', 6, 18);

-- Доктор для профессии "Уролог" (ProfessionID = 19)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Юлия', 'Юрьевна', 'Юрьева', '79990011223', 10, 19);

-- Доктор для профессии "Андролог" (ProfessionID = 20)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Светлана', 'Сергеевна', 'Сергеева', '79001122334', 8, 20);

-- Доктор для профессии "Педиатр" (ProfessionID = 21)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Игорь', 'Игоревич', 'Игорев', '79111222333', 5, 21);

-- Доктор для профессии "Неонатолог" (ProfessionID = 22)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Наталья', 'Николаевна', 'Николаева', '79222333444', 7, 22);

-- Доктор для профессии "Аллерголог-иммунолог" (ProfessionID = 23)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Виктор', 'Викторович', 'Викторов', '79333444555', 9, 23);

-- Доктор для профессии "Онколог" (ProfessionID = 24)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Оксана', 'Олеговна', 'Олегова', '79444555666', 12, 24);

-- Доктор для профессии "Радиолог" (ProfessionID = 25)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Денис', 'Денисович', 'Денисов', '79555666777', 8, 25);

-- Доктор для профессии "Хирург-онколог" (ProfessionID = 26)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Евгений', 'Евгеньевич', 'Евгеньев', '79666777888', 10, 26);

-- Доктор для профессии "Ревматолог" (ProfessionID = 27)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Людмила', 'Леонидовна', 'Леонидова', '79777888999', 6, 27);

-- Доктор для профессии "Иммунолог" (ProfessionID = 28)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('Василий', 'Васильевич', 'Васильев', '79888999000', 7, 28);

select * from Doctors

create table DoctorsProfessions
(
	ProfessionID int primary key identity,
	ProfessionName nvarchar(50) not null check(ProfessionName != ''),
	DepartmentID int,
	foreign key (DepartmentID) references  Department(DepartmentID) 
)
--заполнение Профессий
-- Профессии для отдела "Хирургия" (DepartmentID = 1002)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Хирург', 1);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Кардиохирург', 1);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Травматолог', 1);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Онкологический хирург', 1);

-- Профессии для отдела "Терапия" (DepartmentID = 1003)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Терапевт', 2);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Пульмонолог', 2);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Гастроэнтеролог', 2);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Нефролог', 2);

-- Профессии для отдела "Кардиология" (DepartmentID = 1004)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Кардиолог', 3);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Электрофизиолог', 3);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Хирург-кардиоторакальщик', 3);

-- Профессии для отдела "Неврология" (DepartmentID = 1005)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Невролог', 4);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Нейрохирург', 4);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Педиатрический невролог', 4);

-- Профессии для отдела "Гинекология" (DepartmentID = 1006)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Гинеколог', 5);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Онколог-гинеколог', 5);

-- Профессии для отдела "Оториноларингология" (DepartmentID = 1007)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Отоларинголог', 6);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Сурдолог', 6);

-- Профессии для отдела "Урология" (DepartmentID = 1008)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Уролог', 7);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Андролог', 7);
-- Профессии для отдела "Педиатрия" (DepartmentID = 1009)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Педиатр', 8);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Неонатолог', 8);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Аллерголог-иммунолог', 8);

-- Профессии для отдела "Онкология" (DepartmentID = 1010)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Онколог', 9);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Радиолог', 9);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Хирург-онколог', 9);

-- Профессии для отдела "Ревматология" (DepartmentID = 1011)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Ревматолог', 10);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('Иммунолог', 10);

select * from DoctorsProfessions


create table SurgeryPriceList
(
	SurgeryName nvarchar(50) not null check(SurgeryName!='') primary key,
	Price int not null check(Price > 0)
)

--Заполнение SurgeryPriceList
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Аппендэктомия', 5000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Катаракта', 3500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Замена тазобедренного сустава', 20000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Замена коленного сустава', 18000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Аортокоронарное шунтирование', 25000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Грыжесечение', 4000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Холецистэктомия', 6000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лапароскопия', 3000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Тромбэктомия', 8000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Удаление кисты', 4500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Грыжи', 5000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Катаракты', 3500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Перелома ноги', 8000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Аппендицита', 4000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Гайморита', 2500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Пневмонии', 6000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Гипертонии', 3000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Остеохондроза', 7000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Гастрита', 2000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('Лечение Бронхита', 3500);
select * from SurgeryPriceList

create table Surgery
(
	SurgeryID int primary key identity,
	TreatmentID int,
	SurgeryName nvarchar(50) not null check(SurgeryName!=''),
	SurgeryDate date not null,
	SurgeryResult nvarchar(50) check(SurgeryResult in('Успешно','С осложнениями','Смерть'))
	foreign key (TreatmentID) references Treatment(TreatmentID) ,
	foreign key (SurgeryName) references SurgeryPriceList(SurgeryName) 
)
-- Хирургическая операция для лечения пациента 1 (Грыжа)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (1, 'Лечение Грыжи', '2023-01-12', 'Успешно');

-- Хирургическая операция для лечения пациента 2 (Катаракта)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (2, 'Лечение Катаракты', '2023-02-17', 'Успешно');

-- Хирургическая операция для лечения пациента 3 (Перелом ноги)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (3, 'Лечение Перелома ноги', '2023-03-07', 'С осложнениями');

-- Хирургическая операция для лечения пациента 4 (Аппендицит)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (4, 'Лечение Аппендицита', '2023-04-22', 'Успешно');


-- Хирургическая операция для лечения пациента 6 (Пневмония)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (6, 'Лечение Пневмонии', '2023-06-03', 'Успешно');


-- Хирургическая операция для лечения пациента 8 (Остеохондроз)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (8, 'Лечение Остеохондроза', '2023-08-24', 'Успешно');


-- Хирургическая операция для лечения пациента 10 (Бронхит)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (10, 'Лечение Бронхита', '2023-10-07', 'Смерть');
select * from Surgery
create table Treatment
(
	TreatmentID int primary key identity,
	AdmissionID int,
	DoctorID int,
	TreatmentResult nvarchar(50) check(TreatmentResult in('Окончено','В процессе')),
	foreign key (AdmissionID) references Admission(AdmissionID),
	foreign key (DoctorID) references Doctors(DoctorID)
)
-- Лечение для пациента 1 (Грыжа)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (1, 2, 'Окончено'); -- Хирург (DoctorID = 2)

-- Лечение для пациента 2 (Катаракта)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (2, 3, 'Окончено'); -- Кардиохирург (DoctorID = 2)

-- Лечение для пациента 3 (Перелом ноги)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (3, 4, 'В процессе'); -- Травматолог (DoctorID = 3)

-- Лечение для пациента 4 (Аппендицит)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (4, 2, 'Окончено'); -- Хирург (DoctorID = 2)

-- Лечение для пациента 5 (Гайморит)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (5, 7, 'В процессе'); -- Пульмонолог (DoctorID = 6)

-- Лечение для пациента 6 (Пневмония)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (6, 7, 'Окончено'); -- Пульмонолог (DoctorID = 6)

-- Лечение для пациента 7 (Гипертония)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (7, 6, 'В процессе'); -- Терапевт (DoctorID = 5)

-- Лечение для пациента 8 (Остеохондроз)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (8, 8, 'Окончено'); -- Гастроэнтеролог (DoctorID = 7)

-- Лечение для пациента 9 (Гастрит)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (9, 8, 'В процессе'); -- Гастроэнтеролог (DoctorID = 7)

-- Лечение для пациента 10 (Бронхит)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (10, 7, 'Окончено'); -- Пульмонолог (DoctorID = 6)


create table AdmissionWard
(
	AdmissionID int,
	WardID int,
	primary key(AdmissionID,WardID),
	foreign key (AdmissionID) references Admission(AdmissionID),
	foreign key (WardID) references Ward(WardID)
)
--заполнение AdmissionWard
-- Пациенты 3, 5, 7 в палате 37
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (3, 37);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (5, 37);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (7, 37);

-- Остальные пациенты в других палатах
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (1, 36);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (2, 38);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (4, 39);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (6, 40);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (8, 41);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (9, 42);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (10, 43);
select * from AdmissionWard
create table Admission
(
	AdmissionID int primary key identity,
	PatientID int,
	Diagnos nvarchar(50) not null check(Diagnos!=''),
	TreatmentStartDate date not null,
	TreatmentEndDate date,
	TotalCost int default 0,
	foreign key (PatientID) references Patient(PatientID)
)
--заполнение Admission
INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (1, 'Грыжа', '2023-01-10', '2023-01-20');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (2, 'Катаракта', '2023-02-15', '2023-02-25');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (3, 'Перелом ноги', '2023-03-05');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (4, 'Аппендицит', '2023-04-20', '2023-04-25');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (5, 'Гайморит', '2023-05-12');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (6, 'Пневмония', '2023-06-01', '2023-06-10');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (7, 'Гипертония', '2023-07-15');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (8, 'Остеохондроз', '2023-08-22', '2023-08-30');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (9, 'Гастрит', '2023-09-10');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (10, 'Бронхит', '2023-10-05', '2023-10-15');
select * from Admission
create table Ward
(
	WardID int primary key identity,
	DepartmentID int,
	WardNumber int not null unique check(WardNumber > 0),
	WardBedCount int not null check(WardBedCount > 0),
	foreign key (DepartmentID) references  Department(DepartmentID)
)
-- Хирургия (5 палат)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 101, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 102, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 103, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 104, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 105, 3);

-- Терапия (4 палаты)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 201, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 202, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 203, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 204, 4);

-- Кардиология (6 палат)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 301, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 302, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 303, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 304, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 305, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 306, 3);

-- Неврология (3 палаты)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (4, 401, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (4, 402, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (4, 403, 2);

-- Гинекология (2 палаты)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (5, 501, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (5, 502, 2);

-- Оториноларингология (2 палаты)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (6, 601, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (6, 602, 3);

-- Урология (3 палаты)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (7, 701, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (7, 702, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (7, 703, 4);

-- Педиатрия (4 палаты)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 801, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 802, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 803, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 804, 4);

-- Онкология (5 палат)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 901, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 902, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 903, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 904, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 905, 3);

-- Ревматология (1 палата)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (10, 1001, 2);

select * from Ward
create table Invoice
(
	Invoice int primary key identity,
	AdmissionID int not null,
	InvoiceDate date not null,
	InvoiceAmount int,
	PaymentStatus nvarchar(50) check(PaymentStatus in('Оплачено','Не оплачено')),
	foreign key (AdmissionID) references  Admission(AdmissionID)
)

-- Счет для пациента 1 (Грыжа)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (1, '2023-01-20', 5000, 'Оплачено'); -- Дата совпадает с TreatmentEndDate

-- Счет для пациента 2 (Катаракта)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (2, '2023-02-25', 3500, 'Оплачено'); -- Дата совпадает с TreatmentEndDate

-- Счет для пациента 4 (Аппендицит)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (4, '2023-04-25', 4000, 'Не оплачено'); -- Дата совпадает с TreatmentEndDate

-- Счет для пациента 6 (Пневмония)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (6, '2023-06-10', 6000, 'Оплачено'); -- Дата совпадает с TreatmentEndDate

-- Счет для пациента 8 (Остеохондроз)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (8, '2023-08-30', 7000, 'Не оплачено'); -- Дата совпадает с TreatmentEndDate
select * from Invoice

create trigger CheckTreatmentEndDate
on Admission
after insert, update
as
begin
	if exists(select 1 from inserted where TreatmentEndDate < TreatmentStartDate)
	begin 
		raiserror('TreatmentEndDate не может быть раньше TreatmentStartDate',16,1)
		rollback tran
	end
end

create trigger CheckInvoiceDate
on Invoice
after insert, update
as
begin
	if exists(select 1 from inserted i
			join Admission a on i.AdmissionID=a.AdmissionID
			where i.InvoiceDate != a.TreatmentEndDate)
	begin 
		raiserror('InvoiceDate должен быть равен TreatmentEndDate',16,1)
		rollback tran
	end
end

create function dbo.calculatetotalcost(@admissionid int)
returns int
as
begin
    declare @totalcost int = 0
    declare @surgeryprice int
    declare surgerycursor cursor for
    select sp.Price
    from Treatment t
    join Surgery s on t.TreatmentID = s.TreatmentID
    join SurgeryPriceList sp on s.SurgeryName = sp.SurgeryName
    where t.AdmissionID = @admissionid
    open surgerycursor
    fetch next from surgerycursor into @surgeryprice
    while @@fetch_status = 0
    begin
        set @totalcost = @totalcost + @surgeryprice
        fetch next from surgerycursor into @surgeryprice
    end;
    close surgerycursor
    deallocate surgerycursor
    return @totalcost
end

select dbo.CalculateTotalCost(2)

create trigger RecalculateTotalCost
on Surgery
after insert, update, delete
as
begin
    update a
    set a.TotalCost = dbo.CalculateTotalCost(a.AdmissionID)
    from Admission a
    join Treatment t on a.AdmissionID = t.AdmissionID
    where t.AdmissionID in (
        select t.AdmissionID
        from Treatment t
        join inserted i on t.TreatmentID = i.TreatmentID
        union
        select t.AdmissionID
        from Treatment t
        join deleted d on t.TreatmentID = d.TreatmentID
    )
end

select TotalCost from Admission

create trigger IfDeathSetZero
on Surgery
after insert, update
as
begin

    declare @treatmentid int
    declare @surgeryresult nvarchar(50)

    select @treatmentid = TreatmentID, @surgeryresult = SurgeryResult
    from inserted

    if @surgeryresult = 'Смерть'
    begin
        update Admission
        set TotalCost = 0
        where AdmissionID = (
            select AdmissionID
            from Treatment
            where TreatmentID = @treatmentid
        )
    end
end

exec sp_settriggerorder
@triggername = 'RecalculateTotalCost',
@order = 'first',
@stmttype = 'update'
exec sp_settriggerorder
@triggername = 'IfDeathSetZero',
@order = 'last',
@stmttype = 'update'

exec sp_settriggerorder
@triggername = 'RecalculateTotalCost',
@order = 'first',
@stmttype = 'insert'
exec sp_settriggerorder
@triggername = 'IfDeathSetZero',
@order = 'last',
@stmttype = 'insert'

create view PatientView
as select p.FirstName, p.MiddleName, p.LastName, p.DateOfBirth,a.Diagnos,a.TreatmentStartDate,a.TreatmentEndDate from Patient p
join Admission a on p.PatientID = a.PatientID
select * from PatientView


create view DoctorsSurgery
as select d.DoctorFirstName, d.DoctorMiddleName, d.DoctorLastName,dp.ProfessionName,s.SurgeryName,s.SurgeryDate,s.SurgeryResult from Doctors d
join DoctorsProfessions dp on d.ProfessionID = dp.ProfessionID
join Treatment t on d.DoctorID = t.DoctorID
join Surgery s on t.TreatmentID = s.TreatmentID
select * from DoctorsSurgery


create function PoiskDolzhnikov()
returns table as
return( select p.PatientID, p.FirstName, p.MiddleName, p.LastName, i.InvoiceDate, i.InvoiceAmount
from Invoice i 
join Admission a on i.AdmissionID = a.AdmissionID
join Patient p on a.PatientID = p.PatientID
where i.PaymentStatus = 'Не оплачено' and DATEDIFF(day, i.InvoiceDate, getdate()) > 7)

select * from PoiskDolzhnikov()

create function GetFreeWards (@departmentID int)
returns table
as
return( select w.WardID, w.WardNumber, w.WardBedCount, (w.WardBedCount - count(aw.AdmissionID)) as FreeBeds
from Ward w
left join AdmissionWard aw on w.WardID = aw.WardID
where w.DepartmentID = @departmentID
group by w.WardID,w.WardNumber,w.WardBedCount
having (w.WardBedCount - count(aw.AdmissionID)) > 0)

select * from GetFreeWards(1)

create procedure AddNewDoctor
@DoctorFirstName nvarchar(50),
@DoctorMiddleName nvarchar(50),
@DoctorLastName nvarchar(50),
@DoctorPhoneNumber varchar(20),
@WorkExperienceYears int,
@ProfessionID int
as
begin
if exists(select 1 from Doctors where DoctorPhoneNumber = @DoctorPhoneNumber)
begin 
raiserror('Такой телефон уже существует',16,1)
return
end
insert into Doctors(DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
values (@DoctorFirstName, @DoctorMiddleName, @DoctorLastName, @DoctorPhoneNumber, @WorkExperienceYears, @ProfessionID)
print 'Врач добавлен'
end

exec AddNewDoctor @DoctorFirstName = 'Андрей',
    @DoctorMiddleName = 'Андреевич',
    @DoctorLastName = 'Андреев',
    @DoctorPhoneNumber = '79123456789',
    @WorkExperienceYears = 5,
    @ProfessionID = 1;


create procedure OkonchanyeLechenya
@AdmissionID int,
@TreatmentEndDate date
as
begin
if not exists(select 1 from Admission where AdmissionID = @AdmissionID)
begin 
raiserror('Заезда с таким ID не существует',16,1)
return
end
update Admission
set TreatmentEndDate = @TreatmentEndDate
where AdmissionID = @AdmissionID
update Treatment
set TreatmentResult = 'Окончено'
where AdmissionID = @AdmissionID
print 'Данные обновлены'
end

select * from Treatment
select * from Admission
exec OkonchanyeLechenya @AdmissionID = 9, @TreatmentEndDate = '2024-09-09'


create view PeopleInWards
as 
select 
w.WardID,
w.WardNumber,
w.WardBedCount,
p.PatientID,
p.FirstName,
p.MiddleName,
p.LastName,
a.Diagnos,
a.TreatmentStartDate
from Ward w
join AdmissionWard aw on w.WardID = aw.WardID
join Admission a on aw.AdmissionID = a.AdmissionID
join Patient p on a.PatientID = p.PatientID
where a.TreatmentEndDate is null

select * from PeopleInWards


create procedure NewSurgery
@TreatmentID int,
@SurgeryName nvarchar(50),
@SurgeryDate date,
@SurgeryResult nvarchar(50)
as
begin
if not exists(select 1 from Treatment where TreatmentID = @TreatmentID)
begin
raiserror('Лечения с таким ID нет', 16,1)
return
end 
if not exists(select 1 from SurgeryPriceList where SurgeryName = @SurgeryName)
begin
raiserror('Такой операции нет в прайс-листе',16,1)
return
end
insert into Surgery(TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
values(@TreatmentID, @SurgeryName, @SurgeryDate, @SurgeryResult)
print 'Операция добавлена'
end

exec NewSurgery
@TreatmentID = 7,
@SurgeryName = 'Лечение гипертонии',
@SurgeryDate = '2024-09-09',
@SurgeryResult = 'С осложнениями'


create trigger DeleteFromAdmissionWard
on Admission
after update
as
begin
if update(TreatmentEndDate)
begin
delete from AdmissionWard
where AdmissionID in(select AdmissionID from inserted where TreatmentEndDate is not null)
end
end

create procedure AddNewPatient
@FirstName nvarchar(50),
@MiddleName nvarchar(50),
@LastName nvarchar(50),
@Gender nvarchar(30),
@DateOfBirth date,
@PhoneNumber varchar(20),
@Address nvarchar(50)
as
begin
if exists (select 1 from Patient where PhoneNumber = @PhoneNumber)
begin
print 'Пациент с таким телефоном уже существует'
return
end
insert into Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
values (@FirstName, @MiddleName, @LastName, @Gender, @DateOfBirth, @PhoneNumber, @Address)
print 'Пациент добавлен'
end
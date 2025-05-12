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
--���������� Patient
INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('����', '��������', '������', 'male', '1985-03-15', '79123456789', '������, ��. ������, 12');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('�����', '���������', '�������', 'female', '1990-07-22', '79234567890', '�����-���������, ��. ��������, 45');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('�������', '�������������', '�������', 'male', '1982-11-10', '79345678901', '�����������, ��. ������, 3');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('���������', '������������', '���������', 'female', '1995-04-05', '79456789012', '������������, ��. ����, 17');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('�������', '��������', '�������', 'male', '1988-09-30', '79567890123', '������, ��. ��������, 25');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('����', '��������', '���������', 'female', '1992-12-18', '79678901234', '������ ��������, ��. ��������, 8');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('������', '�������������', '������', 'male', '1980-06-25', '79789012345', '������, ��. ������, 10');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('�����', '���������', '��������', 'female', '1998-02-14', '79890123456', '������-��-����, ��. ������, 30');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('�����', '����������', '�������', 'male', '1987-08-08', '79901234567', '�������, ��. ������, 5');

INSERT INTO Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES ('�������', '���������', '��������', 'female', '1993-10-20', '79012345678', '����������, ��. ����, 15');
select * from Patient 


create table Department
(
	DepartmentID int primary key identity,
	DepartmentName nvarchar(50) not null check(DepartmentName!=''),
	WardQuantity int not null check(WardQuantity>0)
)
--���������� Department
INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('��������', 5);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('�������', 4);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('�����������', 6);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('����������', 3);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('�����������', 2);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('�������������������', 2);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('��������', 3);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('���������', 4);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('���������', 5);

INSERT INTO Department (DepartmentName, WardQuantity)
VALUES ('������������', 1);

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
-- ������ ��� ��������� "������" (ProfessionID = 1)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('����', '��������', '������', '79123456789', 10, 1);

-- ������ ��� ��������� "������������" (ProfessionID = 2)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('����', '��������', '������', '79234567890', 12, 2);

-- ������ ��� ��������� "�����������" (ProfessionID = 3)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '�������', '79345678901', 8, 3);

-- ������ ��� ��������� "�������������� ������" (ProfessionID = 4)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '�������', '79456789012', 15, 4);

-- ������ ��� ��������� "��������" (ProfessionID = 5)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('���������', '����������', '���������', '79567890123', 7, 5);

-- ������ ��� ��������� "�����������" (ProfessionID = 6)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('����', '��������', '���������', '79678901234', 9, 6);

-- ������ ��� ��������� "���������������" (ProfessionID = 7)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('������', '�������������', '������', '79789012345', 11, 7);

-- ������ ��� ��������� "��������" (ProfessionID = 8)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '���������', '��������', '79890123456', 6, 8);

-- ������ ��� ��������� "���������" (ProfessionID = 9)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '����������', '�������', '79901234567', 14, 9);

-- ������ ��� ��������� "���������������" (ProfessionID = 10)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '���������', '��������', '79012345678', 5, 10);

-- ������ ��� ��������� "������-�����������������" (ProfessionID = 11)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '��������', '79112233445', 13, 11);

-- ������ ��� ��������� "��������" (ProfessionID = 12)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '���������', '�������', '79223344556', 10, 12);

-- ������ ��� ��������� "�����������" (ProfessionID = 13)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('��������', '������������', '����������', '79334455667', 12, 13);

-- ������ ��� ��������� "�������������� ��������" (ProfessionID = 14)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '��������', '�������', '79445566778', 8, 14);

-- ������ ��� ��������� "���������" (ProfessionID = 15)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('���������', '�������������', '�����������', '79556677889', 9, 15);

-- ������ ��� ��������� "�������-���������" (ProfessionID = 16)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '��������', '�������', '79667788990', 11, 16);

-- ������ ��� ��������� "�������������" (ProfessionID = 17)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('������', '����������', '��������', '79778899001', 7, 17);

-- ������ ��� ��������� "��������" (ProfessionID = 18)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('����', '��������', '������', '79889900112', 6, 18);

-- ������ ��� ��������� "������" (ProfessionID = 19)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('����', '�������', '������', '79990011223', 10, 19);

-- ������ ��� ��������� "��������" (ProfessionID = 20)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('��������', '���������', '��������', '79001122334', 8, 20);

-- ������ ��� ��������� "�������" (ProfessionID = 21)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '��������', '������', '79111222333', 5, 21);

-- ������ ��� ��������� "����������" (ProfessionID = 22)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '���������', '79222333444', 7, 22);

-- ������ ��� ��������� "����������-���������" (ProfessionID = 23)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('������', '����������', '��������', '79333444555', 9, 23);

-- ������ ��� ��������� "�������" (ProfessionID = 24)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('������', '��������', '�������', '79444555666', 12, 24);

-- ������ ��� ��������� "��������" (ProfessionID = 25)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�����', '���������', '�������', '79555666777', 8, 25);

-- ������ ��� ��������� "������-�������" (ProfessionID = 26)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '��������', '79666777888', 10, 26);

-- ������ ��� ��������� "����������" (ProfessionID = 27)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '���������', '79777888999', 6, 27);

-- ������ ��� ��������� "���������" (ProfessionID = 28)
INSERT INTO Doctors (DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
VALUES ('�������', '����������', '��������', '79888999000', 7, 28);

select * from Doctors

create table DoctorsProfessions
(
	ProfessionID int primary key identity,
	ProfessionName nvarchar(50) not null check(ProfessionName != ''),
	DepartmentID int,
	foreign key (DepartmentID) references  Department(DepartmentID) 
)
--���������� ���������
-- ��������� ��� ������ "��������" (DepartmentID = 1002)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('������', 1);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('������������', 1);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�����������', 1);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�������������� ������', 1);

-- ��������� ��� ������ "�������" (DepartmentID = 1003)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('��������', 2);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�����������', 2);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('���������������', 2);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('��������', 2);

-- ��������� ��� ������ "�����������" (DepartmentID = 1004)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('���������', 3);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('���������������', 3);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('������-�����������������', 3);

-- ��������� ��� ������ "����������" (DepartmentID = 1005)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('��������', 4);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�����������', 4);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�������������� ��������', 4);

-- ��������� ��� ������ "�����������" (DepartmentID = 1006)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('���������', 5);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�������-���������', 5);

-- ��������� ��� ������ "�������������������" (DepartmentID = 1007)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�������������', 6);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('��������', 6);

-- ��������� ��� ������ "��������" (DepartmentID = 1008)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('������', 7);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('��������', 7);
-- ��������� ��� ������ "���������" (DepartmentID = 1009)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�������', 8);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('����������', 8);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('����������-���������', 8);

-- ��������� ��� ������ "���������" (DepartmentID = 1010)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('�������', 9);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('��������', 9);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('������-�������', 9);

-- ��������� ��� ������ "������������" (DepartmentID = 1011)
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('����������', 10);
INSERT INTO DoctorsProfessions (ProfessionName, DepartmentID) VALUES ('���������', 10);

select * from DoctorsProfessions


create table SurgeryPriceList
(
	SurgeryName nvarchar(50) not null check(SurgeryName!='') primary key,
	Price int not null check(Price > 0)
)

--���������� SurgeryPriceList
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('�������������', 5000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('���������', 3500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������ �������������� �������', 20000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������ ��������� �������', 18000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('��������������� ������������', 25000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������������', 4000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('���������������', 6000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������������', 3000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������������', 8000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('�������� �����', 4500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� �����', 5000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� ���������', 3500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� �������� ����', 8000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� �����������', 4000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� ���������', 2500);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� ���������', 6000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� ����������', 3000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� �������������', 7000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� ��������', 2000);
INSERT INTO SurgeryPriceList (SurgeryName, Price) VALUES ('������� ��������', 3500);
select * from SurgeryPriceList

create table Surgery
(
	SurgeryID int primary key identity,
	TreatmentID int,
	SurgeryName nvarchar(50) not null check(SurgeryName!=''),
	SurgeryDate date not null,
	SurgeryResult nvarchar(50) check(SurgeryResult in('�������','� ������������','������'))
	foreign key (TreatmentID) references Treatment(TreatmentID) ,
	foreign key (SurgeryName) references SurgeryPriceList(SurgeryName) 
)
-- ������������� �������� ��� ������� �������� 1 (�����)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (1, '������� �����', '2023-01-12', '�������');

-- ������������� �������� ��� ������� �������� 2 (���������)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (2, '������� ���������', '2023-02-17', '�������');

-- ������������� �������� ��� ������� �������� 3 (������� ����)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (3, '������� �������� ����', '2023-03-07', '� ������������');

-- ������������� �������� ��� ������� �������� 4 (����������)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (4, '������� �����������', '2023-04-22', '�������');


-- ������������� �������� ��� ������� �������� 6 (���������)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (6, '������� ���������', '2023-06-03', '�������');


-- ������������� �������� ��� ������� �������� 8 (������������)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (8, '������� �������������', '2023-08-24', '�������');


-- ������������� �������� ��� ������� �������� 10 (�������)
INSERT INTO Surgery (TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
VALUES (10, '������� ��������', '2023-10-07', '������');
select * from Surgery
create table Treatment
(
	TreatmentID int primary key identity,
	AdmissionID int,
	DoctorID int,
	TreatmentResult nvarchar(50) check(TreatmentResult in('��������','� ��������')),
	foreign key (AdmissionID) references Admission(AdmissionID),
	foreign key (DoctorID) references Doctors(DoctorID)
)
-- ������� ��� �������� 1 (�����)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (1, 2, '��������'); -- ������ (DoctorID = 2)

-- ������� ��� �������� 2 (���������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (2, 3, '��������'); -- ������������ (DoctorID = 2)

-- ������� ��� �������� 3 (������� ����)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (3, 4, '� ��������'); -- ����������� (DoctorID = 3)

-- ������� ��� �������� 4 (����������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (4, 2, '��������'); -- ������ (DoctorID = 2)

-- ������� ��� �������� 5 (��������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (5, 7, '� ��������'); -- ����������� (DoctorID = 6)

-- ������� ��� �������� 6 (���������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (6, 7, '��������'); -- ����������� (DoctorID = 6)

-- ������� ��� �������� 7 (����������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (7, 6, '� ��������'); -- �������� (DoctorID = 5)

-- ������� ��� �������� 8 (������������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (8, 8, '��������'); -- ��������������� (DoctorID = 7)

-- ������� ��� �������� 9 (�������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (9, 8, '� ��������'); -- ��������������� (DoctorID = 7)

-- ������� ��� �������� 10 (�������)
INSERT INTO Treatment (AdmissionID, DoctorID, TreatmentResult)
VALUES (10, 7, '��������'); -- ����������� (DoctorID = 6)


create table AdmissionWard
(
	AdmissionID int,
	WardID int,
	primary key(AdmissionID,WardID),
	foreign key (AdmissionID) references Admission(AdmissionID),
	foreign key (WardID) references Ward(WardID)
)
--���������� AdmissionWard
-- �������� 3, 5, 7 � ������ 37
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (3, 37);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (5, 37);
INSERT INTO AdmissionWard (AdmissionID, WardID) VALUES (7, 37);

-- ��������� �������� � ������ �������
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
--���������� Admission
INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (1, '�����', '2023-01-10', '2023-01-20');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (2, '���������', '2023-02-15', '2023-02-25');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (3, '������� ����', '2023-03-05');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (4, '����������', '2023-04-20', '2023-04-25');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (5, '��������', '2023-05-12');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (6, '���������', '2023-06-01', '2023-06-10');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (7, '����������', '2023-07-15');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (8, '������������', '2023-08-22', '2023-08-30');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate)
VALUES (9, '�������', '2023-09-10');

INSERT INTO Admission (PatientID, Diagnos, TreatmentStartDate, TreatmentEndDate)
VALUES (10, '�������', '2023-10-05', '2023-10-15');
select * from Admission
create table Ward
(
	WardID int primary key identity,
	DepartmentID int,
	WardNumber int not null unique check(WardNumber > 0),
	WardBedCount int not null check(WardBedCount > 0),
	foreign key (DepartmentID) references  Department(DepartmentID)
)
-- �������� (5 �����)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 101, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 102, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 103, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 104, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (1, 105, 3);

-- ������� (4 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 201, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 202, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 203, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (2, 204, 4);

-- ����������� (6 �����)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 301, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 302, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 303, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 304, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 305, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (3, 306, 3);

-- ���������� (3 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (4, 401, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (4, 402, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (4, 403, 2);

-- ����������� (2 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (5, 501, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (5, 502, 2);

-- ������������������� (2 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (6, 601, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (6, 602, 3);

-- �������� (3 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (7, 701, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (7, 702, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (7, 703, 4);

-- ��������� (4 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 801, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 802, 2);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 803, 3);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (8, 804, 4);

-- ��������� (5 �����)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 901, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 902, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 903, 5);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 904, 4);
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (9, 905, 3);

-- ������������ (1 ������)
INSERT INTO Ward (DepartmentID, WardNumber, WardBedCount) VALUES (10, 1001, 2);

select * from Ward
create table Invoice
(
	Invoice int primary key identity,
	AdmissionID int not null,
	InvoiceDate date not null,
	InvoiceAmount int,
	PaymentStatus nvarchar(50) check(PaymentStatus in('��������','�� ��������')),
	foreign key (AdmissionID) references  Admission(AdmissionID)
)

-- ���� ��� �������� 1 (�����)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (1, '2023-01-20', 5000, '��������'); -- ���� ��������� � TreatmentEndDate

-- ���� ��� �������� 2 (���������)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (2, '2023-02-25', 3500, '��������'); -- ���� ��������� � TreatmentEndDate

-- ���� ��� �������� 4 (����������)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (4, '2023-04-25', 4000, '�� ��������'); -- ���� ��������� � TreatmentEndDate

-- ���� ��� �������� 6 (���������)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (6, '2023-06-10', 6000, '��������'); -- ���� ��������� � TreatmentEndDate

-- ���� ��� �������� 8 (������������)
INSERT INTO Invoice (AdmissionID, InvoiceDate, InvoiceAmount, PaymentStatus)
VALUES (8, '2023-08-30', 7000, '�� ��������'); -- ���� ��������� � TreatmentEndDate
select * from Invoice

create trigger CheckTreatmentEndDate
on Admission
after insert, update
as
begin
	if exists(select 1 from inserted where TreatmentEndDate < TreatmentStartDate)
	begin 
		raiserror('TreatmentEndDate �� ����� ���� ������ TreatmentStartDate',16,1)
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
		raiserror('InvoiceDate ������ ���� ����� TreatmentEndDate',16,1)
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

    if @surgeryresult = '������'
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
where i.PaymentStatus = '�� ��������' and DATEDIFF(day, i.InvoiceDate, getdate()) > 7)

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
raiserror('����� ������� ��� ����������',16,1)
return
end
insert into Doctors(DoctorFirstName, DoctorMiddleName, DoctorLastName, DoctorPhoneNumber, WorkExperienceYears, ProfessionID)
values (@DoctorFirstName, @DoctorMiddleName, @DoctorLastName, @DoctorPhoneNumber, @WorkExperienceYears, @ProfessionID)
print '���� ��������'
end

exec AddNewDoctor @DoctorFirstName = '������',
    @DoctorMiddleName = '���������',
    @DoctorLastName = '�������',
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
raiserror('������ � ����� ID �� ����������',16,1)
return
end
update Admission
set TreatmentEndDate = @TreatmentEndDate
where AdmissionID = @AdmissionID
update Treatment
set TreatmentResult = '��������'
where AdmissionID = @AdmissionID
print '������ ���������'
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
raiserror('������� � ����� ID ���', 16,1)
return
end 
if not exists(select 1 from SurgeryPriceList where SurgeryName = @SurgeryName)
begin
raiserror('����� �������� ��� � �����-�����',16,1)
return
end
insert into Surgery(TreatmentID, SurgeryName, SurgeryDate, SurgeryResult)
values(@TreatmentID, @SurgeryName, @SurgeryDate, @SurgeryResult)
print '�������� ���������'
end

exec NewSurgery
@TreatmentID = 7,
@SurgeryName = '������� ����������',
@SurgeryDate = '2024-09-09',
@SurgeryResult = '� ������������'


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
print '������� � ����� ��������� ��� ����������'
return
end
insert into Patient (FirstName, MiddleName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
values (@FirstName, @MiddleName, @LastName, @Gender, @DateOfBirth, @PhoneNumber, @Address)
print '������� ��������'
end
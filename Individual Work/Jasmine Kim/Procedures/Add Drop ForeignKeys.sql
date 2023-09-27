--Adding Foreign Keys
	--INSTRUCTOR TABLE
	ALTER TABLE HR.Instructor
		ADD CONSTRAINT FK_Instructor_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)

	--DEPTINSTRUCTOR TABLE
	ALTER TABLE HR.DepartmentInstructor
		ADD CONSTRAINT FK_DepartmentInstructor_Instructor
			FOREIGN KEY (InstructorNum) REFERENCES HR.Instructor (InstructorNum)

	ALTER TABLE HR.DepartmentInstructor
		ADD CONSTRAINT FK_DepartmentInstructor_Department
			FOREIGN KEY (DepartmentID) REFERENCES HR.Department (departmentId)

	ALTER TABLE HR.DepartmentInstructor
		ADD CONSTRAINT FK_DepartmentInstructor_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)

			

	--DEPARTMENT TABLE
	ALTER TABLE HR.Department
		ADD CONSTRAINT FK_Department_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)


	--CLASS TABLE
	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_Course
			FOREIGN KEY (CourseId) REFERENCES Enrollment.Course (CourseId)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_Instructor 
	 		FOREIGN KEY (InstructorNum) REFERENCES HR.Instructor (InstructorNum)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_InstructionMode
		 	FOREIGN KEY (ModeOfInstructionID) REFERENCES Schedule.InstructionMode (ModeOfInstructionID)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_ClassDayTime 
	 		FOREIGN KEY (ClassTimeId) REFERENCES Schedule.ClassDayTime (ClassTimeID)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_Room
			FOREIGN KEY (RoomId) REFERENCES Ground.Room (roomId)	

	--CLASSDAYTIME TABLE
	ALTER TABLE Schedule.ClassDayTime
		ADD CONSTRAINT FK_ClassDayTime_UserAuthorization 
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey) 

--Dropping Foreign Keys
	--INSTRUCTOR TABLE
    ALTER TABLE HR.Instructor
		DROP CONSTRAINT FK_Instructor_UserAuthorization

	-- DEPARTMENT TABLE
	ALTER TABLE HR.Department
		DROP CONSTRAINT FK_Department_UserAuthorization
	-- DEPTINSTRUCTOR TABLE
	ALTER TABLE hr.departmentInstructor
		DROP CONSTRAINT FK_DepartmentInstructor_UserAuthorization
	
	ALTER TABLE hr.departmentInstructor
		DROP CONSTRAINT FK_DepartmentInstructor_Department

	ALTER TABLE hr.departmentInstructor
		DROP CONSTRAINT FK_DepartmentInstructor_Instructor


	--Class Table
	
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_ClassDayTime
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_Course
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_InstructionMode
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_Instructor
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_Room

	--ClassDayTime table
	ALTER TABLE Schedule.ClassDayTime
		DROP CONSTRAINT FK_ClassDayTime_UserAuthorization
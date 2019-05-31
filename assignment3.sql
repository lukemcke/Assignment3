use assignment3;

DROP TABLE IssueComment;
DROP TABLE Issue;
DROP TABLE UserAccount;
DROP TABLE KnowledgeBase;


CREATE TABLE UserAccount (
UserID int Primary key AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(50),
Phone INT,
Password VARCHAR(50),
IsAdmin Bool);

CREATE TABLE Issue (
IssueID INT Primary Key AUTO_INCREMENT,
Title VARCHAR(40),
Description VARCHAR(256),
ResolveDetails VARCHAR(256) NULL,
DateReported Datetime,
DateResolved Datetime NULL,
Status VARCHAR(30) CHECK(Status = "New" OR Status = "In Progress" OR Status = "Waiting on third party" 
OR Status = "Completed" OR Status = "Not accepted" OR Status = "Resolved" OR Status = "Waiting on reporter"),
Category VARCHAR(50),
SubCategory VARCHAR(50),
UserID Int,
FOREIGN KEY (UserID) REFERENCES UserAccount(UserID));

CREATE TABLE KnowledgeBase (
ArticleID INT Primary Key AUTO_INCREMENT,
OriginalIssue VARCHAR(50),
Description VARCHAR(256),
ResolveDetails VARCHAR(256),
DateSolved Datetime,
Comment VARCHAR(256));

CREATE TABLE IssueComment (
CommentID INT Primary Key AUTO_INCREMENT,
Title VARCHAR(50),
Field VARCHAR(256),
IssueID INT,
FOREIGN KEY (IssueID) REFERENCES Issue(IssueID));

insert into UserAccount values (0001, "James", "Smith", "james@gmail.com", 0445795767, "password123", true);
insert into UserAccount values (0002, "David", "Smithy", "david@gmail.com", 0400864565, "password123", false);
insert into UserAccount values (0003, "Jane", "Smithers", "jane@gmail.com", 0449219345, "password123", false);
insert into UserAccount values (0004, "Stacey", "Smiths", "stacey@gmail.com", 0485663232, "password123", false);
insert into UserAccount values (0005, "Chad", "Smitts", "stacey@gmail.com", 0483321113, "password123", false);

insert into Issue (Title, Description, ResolveDetails, DateReported, DateResolved, Status, Category, SubCategory, UserID)
			Values ("Help can't connect", "Display error when connecting", null, "2019-05-29", null, "Waiting on reporter", "Network", "Can't Connect", 2);

SELECT * FROM Issue;
SELECT Title, Category, SubCategory, DateReported FROM Issue WHERE UserID = 2 AND Status = 'Waiting on reporter';
UPDATE Issue SET Status = "New" WHERE IssueID =  24;
DEletE FROM Issue;

SELECT * FROM Issue WHERE Category LIKE '%Hardware%';

SELECT * FROM UserAccount WHERE Email = 'james@gmail.com';
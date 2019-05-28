use assignment3;

DROP TABLE UserAccount;
DROP TABLE Issue;
DROP TABLE KnowledgeBase;
DROP TABLE IssueComment;
DROP TABLE Category;
DROP TABLE SubCategory;

CREATE TABLE UserAccount (
UserID int Primary key,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(50),
Phone INT,
Password VARCHAR(50),
IsAdmin Bool);

CREATE TABLE Issue (
IssueID INT Primary Key,
Title VARCHAR(40),
Description VARCHAR(256),
ResolveDetails VARCHAR(256),
DateReported Datetime,
DateResolved Datetime NULL,
Status VARCHAR(30) CHECK(Status = "New" OR Status = "In Progress" OR Status = "Waiting on third Party" 
OR Status = "Completed" OR Status = "Not Completed" OR Status = "Resolved"),
CategoryID INT);

CREATE TABLE KnowledgeBase (
ArticleID INT Primary Key,
OriginalIssue VARCHAR(50),
Description VARCHAR(256),
ResolveDetails VARCHAR(256),
DateSolved Datetime,
Comment VARCHAR(256));

CREATE TABLE IssueComment (
CommentID INT Primary Key,
Title VARCHAR(50),
Field VARCHAR(256),
IssueID INT,
FOREIGN KEY (IssueID) REFERENCES Issue(IssueID));

CREATE TABLE Category (
CategoryID INT Primary Key,
CategoryType VARCHAR(50),
SubCategoryID INT,
FOREIGN KEY (CategoryID) REFERENCES Issue(CategoryID)
)

CREATE TABLE SubCategory(
SubCategoryID INT Primary Key,
SubCategoryType VARCHAR(50),
FOREIGN KEY (SubCategoryID) REFERENCES Category(SubCategoryID)
);

insert into UserAccount values (0001, "James", "Smith", "james@gmail.com", 0445795767, "password123", true);
insert into UserAccount values (0002, "David", "Smithy", "david@gmail.com", 0400864565, "password123", false);
insert into UserAccount values (0003, "Jane", "Smithers", "jane@gmail.com", 0449219345, "password123", false);
insert into UserAccount values (0004, "Stacey", "Smiths", "stacey@gmail.com", 0485663232, "password123", false);
insert into UserAccount values (0005, "Chad", "Smitts", "stacey@gmail.com", 0483321113, "password123", false);

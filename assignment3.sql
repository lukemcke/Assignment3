Create Schema assignment3;
use assignment3;

DROP TABLE IssueComment;
DROP Table ArticleComment;
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
IsArticle boolean Default false,
FOREIGN KEY (UserID) REFERENCES UserAccount(UserID));

CREATE TABLE KnowledgeBase (
ArticleID INT Primary Key AUTO_INCREMENT,
OriginalIssue VARCHAR(50),
Description VARCHAR(256),
ResolveDetails VARCHAR(256),
Category VARCHAR(50), 
SubCategory VARCHAR(50),
DateSolved Datetime);

CREATE TABLE ArticleComment (
CommentID INT Primary Key AUTO_INCREMENT,
Title VARCHAR(50),
Field VARCHAR(256),
ArticleID INT,
FOREIGN KEY (ArticleID) REFERENCES KnowledgeBase(ArticleID));

CREATE TABLE IssueComment (
CommentID INT Primary Key AUTO_INCREMENT,
Title VARCHAR(50),
Field VARCHAR(256),
IssueID INT,
FOREIGN KEY (IssueID) REFERENCES Issue(IssueID));

ALTER TABLE Issue AUTO_INCREMENT = 1;
ALTER TABLE knowledgebase auto_increment = 1;

insert into UserAccount values (0001, "James", "Smith", "james@gmail.com", 0445795767, "password123", true);
insert into UserAccount values (0002, "David", "Smithy", "david@gmail.com", 0400864565, "password123", false);
insert into UserAccount values (0003, "Jane", "Smithers", "jane@gmail.com", 0404364565, "password123", false);
insert into UserAccount values (0004, "Harry", "Smitt", "harry@gmail.com", 0400864565, "password123", false);

insert into Issue (Title, Description, DateReported, DateResolved, Status, ResolveDetails, Category, SubCategory, UserID)
Values ("Help can't connect", "Displaying 'ERR_CERT_SYMANTEC_LEGACY' Error Please help ASAP",  "2019-05-29", null,"In Progress", null, "Network", "Can't Connect", 2),
		("Can't Send Email", " Error : Your email was unable to send because the connection to mail server was interrupted", "2019-06-1", null, "New", null, "Email", "Can't Send", 2),
        ("Disk is broken", " I don't have permission to access my U drive!", "2019-05-11", "2019-06-23", "Completed", "The Admin was contacted and permission was given", "Hardware", "Disk drive", 4),
        ("My Computer keeps bluescreening :(", "blue screen error 'memory_management'", "2019-06-05", null, "Not accepted",  null, "Hardware", "Computer 'blue screens'", 3);
        
INSERT INTO KnowledgeBase (OriginalIssue, Description, ResolveDetails, Category, SubCategory, DateSolved)
VALUES ("Eclipse Keeps crashing help", "Every time I open Eclipse it closes almost immediately", "Changed Computers", "Software", "Slow to load", "2019-06-03"),
		("My internet not working", "Internet icon keeps coming up with warning sign", "Took out the ethernet cable and put it back in", "Network", "Constant dropouts", "2019-05-11"),
        ("Password is wrong", "I tried logging in with same account and it is not working", "Contacted my admin to help reset my password", "Account", "Wrong Details", "2019-02-21");

INSERT INTO ArticleComment (Title, Field, ArticleID)
VALUES ("Thanks", "Very useful article helped alot", 1),
		("Not working!", "I tried this and didn't work someone please help", 2),
        ("Worked", "Worked thank you very much", 2),
        ("Contacted!", "Contacting you administrator always helps", 3);
 

INSERT INTO IssueComment (Title, Field, IssueID)
VALUES ("Solved?", "Hello has the issue been solved yet?", 1),
		("In Progress", "Hi we are currently trying to solve the issue now", 1),
        ("Third party", "We have sent the issue to a third party to try and help", 2),
        ("Thanks", "Thank your it would be nice to have internet again", 2);
        
        




Welcome to the Library Management System developed by SA43 Team 10A! (Team members: Htet Zar Chi Aung, Krithiga Gunasekaran, Kun Mei Ching, Liu Huiqiu)



Platform for Development

- Visual Studio 2013
- MS SQL Server 2012
- Crystal Report VS13
- Monitor 22" LCD Display
- Resolution 1920 x 1080 pixel



User Name: Venkat
Password: p@ssw0rd

Login

- Three attempts per session
- If unsuccessful, application closes
- Staff to contact HR for login detail before trying again (assume HR has separate system for maintaining staff records)
- If successful, first window will be for book borrowing (most frequent task in library)

Member Maintenance

- Member ID is read-only and auto-generated after adding a record to the table (identity column in database)
- Record number shown in prompt
- Click "Load" before performing other actions
- Basic functions: View, Add, Update, Delete
To add new record, click "Add" and fill in relevant fields before clicking "Update"
- By default, null value is updated to the Birthdate column of the table 
- If Birthdate is provided, check the option next to the datetimepicker


Book Maintenance

- Only load button enabled at start
- Basic funcions: View, Add, Update, Delete
- To add new record, click add and fill in relevant fields before clicking "Update" 
- If book has loan history, deletion of record not allowed to keep integrity of data
- Book ID is read only and auto-generated (identity column in database)

Borrow Book

- Press tab to autopopulate member name and book title after entering valid Id.
- If member ID is not known, press "..." to search through name. (Press search without input to show all members)
- Prompt shown when all copies of book loaned out
- Prompt shown if borrow limit (3) is exceeded
- Warning sign if Due Date is set before Date of Issue
- Able to borrow multiple books within one transaction
- To borrow, fill in info and click "Add". 
- If borrowing more than one book, simply change Book ID and Title before adding the next entry
- Wrong entry can be removed by clicking "Delete" on the list
- To uphold data integrity, staff are not allowed to delete records from the database
- Click "Update" to save into database
- After updating, click "Print" to print receipt of books borrowed (generated using crystal report)


Return Book

- Enter member ID and click ... to continue
- User friendly status bar guiding users in different scenarios (no pending return, >=1 books to return, invalid member ID)
- Able to return multiple books in one go


Book Search

- Able to search either by title, author or book type (not case sensitive)


Report

Book List - Shows the list of books currently owned by the library
Popular books - Shows list of most borrowed books in the library



Innovation

- Tab key to autopopulate member name and book title in Borrow Book
- Ablility to borrow multiple books in one go (same for return)
- Warning sign when non-numeric characters are entered in columns restricted to integer (Book Maintenance & Borrow Book)
- Demonstration of string.contain method in Book Search
- Demonstration of date time picker format in Member Maintenance
- Exploration of formatting in crystal report to remove duplicated text display in report 
- Modeless window so user can nagivate freely, input in other windows kept (logic behind keeping inactive window rather than closing it) 
- Prompt on exiting application rather than closing directly





SQL Table Create Statements
===========================

Some comments on SQL
--------------------

1. See below for naming conventions.
2. Attribute abbreviation. Clarity is key and longer names are okay for clarity. Try to define the attribute names so they are fully spelled out (whithin reason).  Most DB systems define a maximum object name as 128 characters.  We have a lot of room to play with. For example, why use `SubT` when it would be perfectly valid and legible to use `sub_type`?
3. Backticks versus apostrophes.  When naming an object in SQL, you must use a backtick character around the name.  For example, 'ServiceOrder' should be written as `ServiceOrder`.  Backticks around a group of characters serve as a type of escape action for the character set.  If you wanted to name your table in a similar fashion to a reserved word, say 'TABLE', the action of placing backticks around the word `TABLE` indicates to the SQL engine that this is an object name, not the command TABLE.  **Where to find the key**: The backtick operator is in the upper-left corner of the keyboard on the same key as the tilda ~.

Naming Conventions
==================

From the provided 'Deliverables' document:
------------------------------------------

**SQL Naming Conventions: (See sample submission from T-square for more details.)**

- **Entity/Table Names (singular noun):** UpperCamelCase Example: RegularUser (note: without the ‘s’ singular)
- **Attribute Names: lowercase_underscore Example:** start_date
- **Primary Surrogate Keys (phase3 only):** tableNameID Example: userID (where ‘ID’ is capitalized)
- **Foreign Keys:** FK_ChildTable_childColumn_ParentTable_parentColumn Example: fk_AdminUser_email_User_email

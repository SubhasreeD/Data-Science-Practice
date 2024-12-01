# SQL Date Functions and Their Uses

This document provides an overview of commonly used SQL date functions along with their purposes and examples. These functions can vary slightly between database systems (like MySQL, PostgreSQL, SQL Server, or Oracle).

---

## General Date Functions

| **Function**         | **Description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| `CURRENT_DATE`        | Returns the current date (without time).                                                             |
| `CURRENT_TIME`        | Returns the current time (without date).                                                             |
| `CURRENT_TIMESTAMP`   | Returns the current date and time.                                                                   |
| `NOW()`               | Returns the current date and time (same as `CURRENT_TIMESTAMP` in many databases).                   |
| `SYSDATE()`           | Returns the current system date and time (Oracle and MySQL).                                         |

---

## Date Extraction Functions

| **Function**          | **Description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| `YEAR(date)`          | Extracts the year from a date.                                                                        |
| `MONTH(date)`         | Extracts the month (1-12) from a date.                                                                |
| `DAY(date)`           | Extracts the day of the month (1-31) from a date.                                                     |
| `HOUR(datetime)`      | Extracts the hour (0-23) from a datetime value.                                                       |
| `MINUTE(datetime)`    | Extracts the minute (0-59) from a datetime value.                                                     |
| `SECOND(datetime)`    | Extracts the second (0-59) from a datetime value.                                                     |
| `WEEK(date)`          | Extracts the week number (1-53) of the year from a date.                                              |
| `DAYOFWEEK(date)`     | Returns the day of the week (1=Sunday, 2=Monday, ...) in MySQL.                                       |
| `DAYNAME(date)`       | Returns the name of the weekday (e.g., 'Sunday', 'Monday').                                           |
| `MONTHNAME(date)`     | Returns the name of the month (e.g., 'January', 'February').                                          |
| `QUARTER(date)`       | Returns the quarter of the year (1-4).                                                                |
| `EXTRACT(field FROM date)` | Extracts a specific part of a date (e.g., `YEAR`, `MONTH`, `DAY`).                                 |

---

## Date Arithmetic Functions

| **Function**          | **Description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| `DATE_ADD(date, INTERVAL value unit)` | Adds a specified time interval to a date. Example: `DATE_ADD('2024-01-01', INTERVAL 7 DAY)` adds 7 days. |
| `DATE_SUB(date, INTERVAL value unit)` | Subtracts a specified time interval from a date.                                        |
| `DATEDIFF(date1, date2)` | Returns the number of days between two dates.                                                       |
| `TIMESTAMPDIFF(unit, datetime1, datetime2)` | Returns the difference between two datetime values in a specified unit (e.g., `YEAR`, `MONTH`). |
| `ADD_MONTHS(date, n)` | Adds `n` months to a date (Oracle).                                                                    |

---

## Date Formatting Functions

| **Function**          | **Description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| `DATE_FORMAT(date, format)` | Formats a date according to a specified pattern (MySQL). Example: `DATE_FORMAT('2024-01-01', '%Y-%m-%d')`. |
| `TO_CHAR(date, format)` | Formats a date or timestamp into a string (Oracle, PostgreSQL).                                       |
| `STR_TO_DATE(string, format)` | Converts a string to a date using the specified format (MySQL). Example: `STR_TO_DATE('01-Jan-2024', '%d-%b-%Y')`. |

---

## Date Comparison Functions

| **Function**          | **Description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| `DATE()`              | Extracts the date part of a datetime value (removes time).                                            |
| `TIME()`              | Extracts the time part of a datetime value (removes date).                                            |
| `IF(date1 > date2)`   | Compares two dates to evaluate conditions.                                                            |

---

## Examples of Use

### 1. **Calculate Age**
```sql
SELECT TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age FROM users;
```

### 2. **Find Orders in the Current Month**
```sql
SELECT * 
FROM orders 
WHERE MONTH(order_date) = MONTH(CURDATE()) 
  AND YEAR(order_date) = YEAR(CURDATE());
```

### 3. **Get the Last Friday of a Month**
```sql
SELECT LAST_DAY('2024-01-01') - INTERVAL DAYOFWEEK(LAST_DAY('2024-01-01')) + 6 DAY;
```

---

### Notes:
- Ensure that the database system you are using (e.g., MySQL, PostgreSQL, SQL Server, Oracle) supports the functions you use.
- Some systems might require slight syntax adjustments.

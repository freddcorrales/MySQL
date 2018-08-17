
-- CONCAT()
SELECT CONCAT(first_name, ' ', last_name) AS 'Name' FROM clients;

-- CONCAT_WS()
SELECT CONCAT_WS('  ', first_name, last_name) AS 'Full Name' FROM clients;

-- LENGTH()
SELECT LENGTH(last_name) AS 'Last_len' FROM clients;
-- LOWER()
SELECT LOWER(last_name) FROM clients;

-- DATE

-- HOUR()
SELECT HOUR(joined_datetime) AS date_hour, joined_datetime FROM clients;

-- DAYNAME()
SELECT DAYNAME(joined_datetime) AS 'Day Name', joined_datetime FROM clients;

-- MONTH()
SELECT MONTH(joined_datetime) AS 'Day Month', joined_datetime FROM clients;

-- NOW()
SELECT NOW() AS right_now;

-- DATE_FORMAT()
SELECT DATE_FORMAT(joined_datetime, '%W %M %e, %Y') AS 'date' FROM clients;

-- JOIN

-- Finda all clients (first and last name), billing amounts and charged date
SELECT clients.first_name, clients.last_name, billing.amount, billing.charged_datetime 
FROM clients
JOIN billing
ON billing.clients_id = clients.id;

-- List all domain names and leads (first and last name) for each site

SELECT sites.domain_name, CONCAT_WS('  ', leads.first_name, leads.last_name) AS 'Full Name' 
FROM sites
JOIN leads
ON sites.id = leads.sites_id;

-- JOIN ON MULT TABLES
-- Get the names of the clients, their domain names and the first names of the all the leads generated from those sites.

SELECT clients.first_name AS 'First Name', clients.last_name AS 'Last Name', sites.domain_name, leads.first_name AS 'Lead Names' 
FROM clients
JOIN sites
ON clients.id = sites.clients_id
JOIN leads 
ON sites.id = leads.sites_id;

-- LEFT & Right JOIN
-- List all the clients and the sites each client has. even if the client hasn't landed a site yet.
SELECT clients.first_name, sites.domain_name FROM clients
LEFT JOIN sites
ON clients.id = sites.clients_id;

-- Grouping Rows
-- Group By
-- SUM, MIN, MAX, AVG
-- Find all the clients (first and last name) and their total billing amounts
SELECT clients.first_name, clients.last_name, MIN(billing.amount) AS 'Total Billing'
FROM clients
JOIN billing
ON billing.clients_id = clients.id
GROUP BY clients.id;
-- GROUP CONCAT
-- List all the domain names associated with each client 
SELECT GROUP_CONCAT(' ', sites.domain_name) AS 'Domains', clients.first_name, clients.last_name FROM clients
JOIN sites
ON clients.id = sites.clients_id
GROUP BY clients.id;


-- COUNT
-- Find the total number of leads for each site
SELECT sites.domain_name, COUNT(leads.id) FROM sites
JOIN leads 
ON sites.id = leads.sites_id
GROUP BY sites.id;



# Deliverable #1

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
	
INTO retirees_titles
FROM employees as e
	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO retirees_titles_edit
FROM retirees_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT (rt.emp_no), rt.title
INTO retiring_titles
FROM retirees_titles_edit as rt
GROUP BY title
ORDER BY COUNT(title) DESC;

# Deliverable #2
SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
	INTO mentorship
FROM employees as e
	INNER JOIN department_emp as de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles as t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
	
SELECT * FROM retirees_titles_edit
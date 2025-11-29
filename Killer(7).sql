SELECT name AS killer
FROM employees
WHERE employee_id=(
SELECT employee_id
FROM keycard_logs
WHERE room='CEO Office'
AND entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
LIMIT 1
);

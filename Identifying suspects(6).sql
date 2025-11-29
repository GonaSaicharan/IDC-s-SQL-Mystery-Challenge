WITH ceo_access AS(SELECT kl.employee_id FROM keycard_logs kl 
WHERE kl.room='CEO Office'
AND kl.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
),
false_alibi AS(SELECT a.employee_id FROM alibis a LEFT JOIN keycard_logs kl ON a.employee_id=kl.employee_id AND a.claim_time BETWEEN kl.entry_time AND kl.exit_time 
WHERE a.claim_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
),
calls_nearby AS(SELECT DISTINCT caller_id AS employee_id FROM calls
WHERE call_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
UNION
SELECT DISTINCT receiver_id AS employee_id FROM calls
WHERE call_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
)
SELECT DISTINCT emp.employee_id, emp.name
FROM employees emp
JOIN ceo_access ca ON emp.employee_id=ca.employee_id
LEFT JOIN alibis a ON emp.employee_id=a.employee_id
LEFT JOIN calls c ON emp.employee_id IN(c.caller_id, c.receiver_id)
WHERE emp.employee_id IN(SELECT employee_id FROM ceo_access)
ORDER BY emp.employee_id;


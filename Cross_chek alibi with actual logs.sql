SELECT a.alibi_id, a.employee_id, emp.name, a.claimed_location, a.claim_time, kl.room AS actual_room, kl.entry_time, kl.exit_time
FROM alibis a
JOIN employees emp ON a.employee_id = emp.employee_id
LEFT JOIN keycard_logs kl
 ON a.employee_id = kl.employee_id
 AND a.claim_time BETWEEN kl.entry_time AND kl.exit_time
WHERE a.claim_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05';

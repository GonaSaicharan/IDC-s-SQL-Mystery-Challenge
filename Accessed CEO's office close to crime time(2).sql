SELECT kl.log_id, kl.employee_id, e.name, kl.room, kl.entry_time, kl.exit_time
FROM keycard_logs kl
JOIN employees e ON kl.employee_id=e.employee_id
WHERE kl.room='CEO Office'
AND kl.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05';


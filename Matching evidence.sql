WITH ceo_access AS ( SELECT kl.*, e.name FROM keycard_logs kl
JOIN employees e ON kl.employee_id=e.employee_id
WHERE kl.room='CEO Office'
AND kl.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
)
SELECT ca.log_id, ca.employee_id, ca.name, ca.entry_time, ca.exit_time, a.claimed_location, a.claim_time,c.call_time, c.duration_sec, c.caller_id, c.receiver_id
FROM ceo_access ca
LEFT JOIN alibis a ON ca.employee_id = a.employee_id AND a.claim_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
LEFT JOIN calls c ON (c.caller_id = ca.employee_id OR c.receiver_id = ca.employee_id) AND c.call_time BETWEEN '2025-10-15 20:40' AND '2025-10-15 21:05'
ORDER BY ca.entry_time;

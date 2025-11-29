SELECT c.call_id, c.caller_id, caller.name AS caller_name, c.receiver_id, receiver.name AS receiver_name, c.call_time, c.duration_sec FROM alls c
JOIN employees caller ON c.caller_id=caller.employee_id
JOIN employees receiver ON c.receiver_id=receiver.employee_id
WHERE c.call_time BETWEEN '2025-10-15 20:50' AND '2025-10-15 21:00'
ORDER BY c.call_time;


--Pobieranie informacji o sekwencjach
SELECT sequence_name, min_value, max_value, increment_by, cycle_flag, order_flag, cache_size, last_number
FROM user_sequences
ORDER BY sequence_name;
/

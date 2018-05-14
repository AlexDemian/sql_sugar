CREATE OR REPLACE FUNCTION public.array_median(real[]) RETURNS real AS $$
DECLARE
    dig_arr real[] := (SELECT ARRAY(SELECT unnest($1) ORDER BY 1));
    arr_len int := ARRAY_LENGTH(dig_arr , 1);
BEGIN
    RETURN (CASE
    WHEN arr_len = 1 THEN dig_arr[1]
    WHEN arr_len = 0 THEN 0
    WHEN arr_len % 2 = 0 THEN (dig_arr[arr_len / 2] + dig_arr[arr_len / 2 + 1]) / 2.
    ELSE dig_arr[arr_len / 2 + 1]
    END);
END;
$$ LANGUAGE plpgsql;
-- 1. Scalar Function

    -- a. Math Scalar Function -> input single and output single value
        -- 1) ABS()
        SELECT StudentId, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) AS MarkGrowth FROM students;
        -- 2) CEILING()
        SELECT StudentId, FirstName, LastName, CEILING(Semester1) AS Semester1, CEILING(Semester2) AS Semester2, MarkGrowth FROM students
        -- 3) FLOOR()
        SELECT StudentID, FirstName, LastName,FLOOR(Semester1) AS Semester1, FLOOR(Semester2) AS Semester2, MarkGrowth FROM students
        -- 4) ROUND(value, digit)
        SELECT StudentId, FirstName, LastName, ROUND(Semester1, 1) AS Semester1, ROUND(Semester2, 0) AS Semester2, MarkGrowth FROM students
        -- 5) SQRT
        SELECT StudentID, FirstName, LastName, SQRT(Semester1) AS Semester1, Semester2, MarkGrowth FROM students;
        -- 6) MOD(value, modulus) & EXP()
        SELECT StudentId, FirstName, LastName, MOD(Semester1, 2) AS Semester1, Semester2, EXP(MarkGrowth) FROM students;

    -- b. String Scalar Function
        -- 1) CONCAT()
        SELECT StudentID, CONCAT(FirstName, LastName) AS NAME, Semester1, Semester2, MarkGrowth FROM students
        -- 2) SUBSTRING_INDEX(column, delimiter, index to return) --> student@name -> delimiter @ -> 'student', 'name' -> index 1 -> 'student'
        SELECT StudentId, SUBSTRING_INDEX(Email, '@', 1) AS NAME FROM students;
        -- 3) SUBSTR(columnName, Start Index, Number of string to be extract) 
        SELECT StudentID, SUBSTR(FirstName, 2, 3) AS Initial FROM students
        -- 4) LENGTH()
        SELECT StudentId, FirstName, LENGTH(FirstName) AS Total_Char FROM students
        -- 5) REPLACE()
        SELECT StudentId, Email, REPLACE(Email, 'yahoo', 'gmail') AS New_Email FROM students
        -- 6) UPPER() & LOWER()
        SELECT StudentID, UPPER(FirstName) AS FirstName, LOWER(LastName) AS LastName FROM students

-- 2. Aggregate Function-> input multi output single
    -- a) SUM()
    SELECT SUM(Semester1) AS Total_1, SUm(Semester2) AS Total_2 FROM students
    -- b) CONT()
    SELECT COUNT(FirstName) AS Total_Student FROM students
    -- c) AVG()
    SELECT AVG(Semester1) AS AVG_1, AVG(Semester2) AS AVG_2 FROM students
    -- d) MIN() & MAX()
    SELECT MIN(Semester1) AS Min1, MAX(Semester1) AS Max1,MIN(Semester2) AS Min2, MAX(Semester2) AS Max2 FROM students

-- 3. GROUP BY
    -- a) Single Column
    SELECT province, COUNT(DISTINCT order_id) AS total_order, SUM(item_price) AS total_price FROM sales_retail_2019
    GROUP BY province
    -- b) Multiple Columne
    SELECT province, brand, COUNT(DISTINCT order_id) as total_order, SUM(item_price) AS total_price FROM sales_retail_2019 
    GROUP BY province, brand

-- 4. CASE..WHEN
        SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
    CASE  
        WHEN SUM(item_price) >= 30000000000 THEN 'Target Achieved'
        WHEN SUM(item_price) <= 25000000000 THEN 'Less Performed'
        ELSE 'Follow Up'
    END as remark
    FROM sales_retail_2019
    GROUP BY MONTH(order_date);

-- STUDY CASE
-- ## 1. Total jumlah seluruh penjualan (total/revenue).
SELECT SUM(total) as total 
FROM tr_penjualan;
-- ## 2. Total quantity seluruh produk yang terjual.
SELECT SUM(qty) as qty 
FROM tr_penjualan;
-- ## 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, SUM(qty) as qty, SUM(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;

-- ## 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
-- ## 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'   
    ELSE 'Medium'  
END as kategori 
FROM tr_penjualan;
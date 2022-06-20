DELETE FROM worker.employee WHERE Empid IN(  
       SELECT Empid FROM (SELECT Empid, ROW_NUMBER()   
       OVER (PARTITION BY Email ORDER BY Email) AS row_num   
       FROM worker.employee) AS temp_table WHERE row_num>1);  

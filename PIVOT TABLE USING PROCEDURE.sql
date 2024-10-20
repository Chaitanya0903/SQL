---DYNAMIC PIVOT TABLE USING PROCEDURE

--SOLUTION 1 :- USING STOREDATA DATABASE

Select * from Storedata

CREATE PROCEDURE STORE_DATA
    @st_name VARCHAR(MAX),
    @reg1 VARCHAR(MAX),
	@reg2 VARCHAR(MAX),
	@reg3 VARCHAR(MAX),
	@reg4 VARCHAR(MAX)
AS
BEGIN
    SELECT storename,[east], [west], [north], [south]
    FROM 
    (
        SELECT storename, region, plastic 
        FROM storedata 
		WHERE storename = @st_name 
          AND region IN (@reg1,@reg2,@reg3,@reg4) 
    ) AS SourceTable
    PIVOT
    (
        SUM(plastic) FOR region IN ([east], [west], [north], [south])
    ) AS PivotTable;
	END;
   
EXECUTE STORE_DATA @st_name = 'Reliance Mart', @reg1 = 'east' ,@reg2 = 'WEST' ,@reg3 = 'North' , @reg4 = 'South';


---SOLUTION 2 :- USING SALESTABLE DATANASE

Select * from salestable;

CREATE PROCEDURE sales_table
@Gen varchar(max),
@mon1 varchar(max),
@mon2 varchar(max),
@mon3 varchar(max)
AS
BEGIN
SELECT Genre, [Jan],[Feb],[Mar] 
from(
      select genre,month,SalesAmount from salestable
	  where genre = @Gen
	   AND month in (@mon1,@mon2,@mon3)
			) as sourcetable
Pivot
(Sum(SalesAmount) for month in ([Jan],[Feb],[Mar])) 
as pivottable;
end;

EXECUTE sales_table @Gen = 'Non-Fiction' , @mon1 = 'jan',@mon2 = 'feb',@mon3 = 'mar';



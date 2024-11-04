
CREATE TRIGGER trg_SetEndDate
ON Employees
AFTER UPDATE
AS
BEGIN
    UPDATE Employees
    SET EndDate = CAST(GETDATE() AS DATE)
    FROM Employees e 
    INNER JOIN Inserted i ON e.EmployeeID = i.EmployeeID
    WHERE i.Active = 0 AND e.EndDate IS NULL;
END;

ALTER TABLE Employees
ADD Constraint chk_EndDate
CHECK (
    (Active = 1 AND EndDate IS NULL) OR
    (Active = 0 AND EndDate IS NOT NULL)
);

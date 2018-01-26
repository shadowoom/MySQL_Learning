#The Syntax
CREATE TRIGGER trigger_name 
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;
    
trigger_time    trigger_event    ON     table_name
BEFORE            INSERT                  photos
AFTER             UPDATE                  users
                  DELETE
                  
DROP TRIGGER trigger_name;







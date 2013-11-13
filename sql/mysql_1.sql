SELECT Ordinal_Position, Column_Comment, Data_type, Character_Octet_Length, Column_Name
FROM information_schema.columns WHERE table_schema = DATABASE() and table_name ='g202';


#varchar=1
#decimal=10
#dateitme=7
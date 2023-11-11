--------------------------------------------------------------------------------------------------------
GM = GM or GAMEMODE
--------------------------------------------------------------------------------------------------------
function GM:SetupDatabase()
    -- Which method of storage: sqlite, tmysql4, mysqloo
    lia.db.module = "sqlite"
    -- The hostname for the MySQL server.
    lia.db.hostname = "127.0.0.1"
    -- The username to login to the database.
    lia.db.username = ""
    -- The password that is associated with the username.
    lia.db.password = ""
    -- The database that the user should login to.
    lia.db.database = ""
    -- The port for the database, you shouldn't need to change this.
    lia.db.port = 3306
end
--------------------------------------------------------------------------------------------------------

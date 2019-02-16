require 'sqlite3'

class DBHandler
   def initialize
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "CREATE TABLE IF NOT EXISTS Student(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, email TEXT, major TEXT, graduated BOOLEAN);"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end
   
   def create(firstname, lastname, email, major, graduated)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "INSERT INTO Student(firstname, lastname, email, major, graduated) VALUES('#{firstname}', '#{lastname}', '#{email}', '#{major}', '#{graduated}');"
        puts dbstatement
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   def all
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Student;"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end
   
   def graduated
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Student WHERE graduated = 'Graduate';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end
   
   def undergrad
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Student WHERE graduated = 'Undergraduate';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end
   
   
   def get(id)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "SELECT * FROM Student WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end    
  
   def update(id, firstname, lastname, email, major, graduated)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "UPDATE Student SET firstname='#{firstname}', lastname='#{lastname}', email='#{email}',
        major='#{major}', graduated='#{graduated}' WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end   
   
   def destroy(id)
      begin
        db = SQLite3::Database.open "student.db"
        dbstatement = "DELETE FROM Student WHERE id='#{id}';"
        db.execute dbstatement
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      ensure
        db.close if db
      end
   end    
   
end
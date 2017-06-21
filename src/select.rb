require 'rethinkdb'

# Import Driver
include RethinkDB::Shortcuts

# Open a connection
r.connect(:host => 'localhost', :port => 28015).repl

# Retrieve documents
## Get all documents
puts 'Get all documents'
cursor = r.table("authors").run
cursor.each{ |document| p document }
puts

## Get documents based on conditions - Author name
puts 'Get documents based on a given Author name'
cursor = r.table("authors").filter{|author| author["name"].eq("William Adama") }.run
cursor.each{ |document| p document }
puts

## Get documents based on conditions - Posts quantity
puts 'Get documents based on posts quantity (> 2)'
cursor = r.table("authors").filter{|author| author["posts"].count > 2}.run
cursor.each{ |document| p document }
puts

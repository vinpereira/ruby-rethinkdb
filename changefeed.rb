require 'rethinkdb'

# Import Driver
include RethinkDB::Shortcuts

# Open a connection
r.connect(:host => 'localhost', :port => 28015).repl

# Realtime feeds
puts 'Real-time feeds'
cursor = r.table("authors").changes.run
cursor.each{ |document| p document }
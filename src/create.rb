require 'rethinkdb'

# Import Driver
include RethinkDB::Shortcuts

# Open a connection
r.connect(:host => 'localhost', :port => 28015).repl

# # Create a table/document
r.db("test").table_create("authors").run

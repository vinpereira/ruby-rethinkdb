require 'rethinkdb'

# Import Driver
include RethinkDB::Shortcuts

# Open a connection
r.connect(:host => 'localhost', :port => 28015).repl

# Delete documents
r.table("authors").
    filter{ |author| author["posts"].count < 3 }.
    delete.run
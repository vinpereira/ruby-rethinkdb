require 'rethinkdb'

# Import Driver
include RethinkDB::Shortcuts

# Open a connection
r.connect(:host => 'localhost', :port => 28015).repl

# Updates documents
## Update all documents
r.table("authors").update({"type"=>"fictional"}).run

## Update based on author's name
r.table("authors").
    filter{|author| author["name"].eq("William Adama")}.
    update({"rank"=>"Admiral"}).run

## Update array field in documents
r.table('authors').filter{|author| author["name"].eq("Jean-Luc Picard")}.
    update{|author| {"posts"=>author["posts"].append({
        "title"=>"Shakespeare",
        "content"=>"What a piece of work is man..."})
    }}.run
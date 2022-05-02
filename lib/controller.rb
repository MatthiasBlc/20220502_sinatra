require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    
    erb :display_gossip, locals: {gossip: Gossip.find(params['id'])}
  end

end


# class Controller
#   # attr_accessor :view

#   # def initialize(view)
#   #   @view = view
#   # end
  
#   # def create_gossip
#   #   params = view.display_create_gossip
#   #   gossip = Gossip.new(params['id'], params['author'], params['content'])
#   #   gossip.save
#   # end
#   # def all_gossip
#   #   view.display_all_gossip
#   #   Gossip.show_all
#   # end
#   # def delete_gossip
#   #   view.display_destroy_gossip
#   #   Gossip.show_all
#   #   id = gets.chomp
#   #   Gossip.delete(id)
#   # end

# end
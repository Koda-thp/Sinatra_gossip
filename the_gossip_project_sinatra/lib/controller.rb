require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do #adresse de l'index
    erb :index, locals: {gossips: Gossip.all} 
  end
      get '/gossips/new/' do #adresse de gossip
        erb :new_gossip #adresse du fichier gossip mais en ruby/html
      end
      post '/gossips/new/' do
        Gossip.new(params["gossip_author"], params["gossip_content"]).save
        redirect '/'
      end
end
require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end
    
    post '/teams' do
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @hero_name = []
      @hero_power = []
      @hero_bio = []
      @team_members = params[:team][:members]
      @team_members.each do |team_member|
        @hero_name << team_member[:name]
        @hero_power << team_member[:power]
        @hero_bio << team_member[:bio]
      end
    end

end

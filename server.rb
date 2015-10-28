require "sinatra"
require "json"

set :public_folder, 'public'
get '/' do
  redirect '/index.html'
end
get "/kelvin-to-celsius/:name" do
    (params[:name].to_f - 272.15).round(2).to_s
    #{ "kelvin" => params[:name].to_f.round(2).to_s , "celsius" => (params[:name].to_f - 272.15).round(2).to_s }.to_json 
end

get "/celsius-to-kelvin/:name" do
  #(params["name"].to_f + 272.15).round(2).to_s
  {"celsius" => params[:name].to_f.round(2).to_s , "kelvin" => (params["name"].to_f + 272.15).round(2).to_s}.to_json
end

get "/celsius-to-fahrenheit/:name" do
   #(((params["name"].to_i *  9) / 5) + 32).round(2).to_s
  {"celsius" => params[:name].to_f.round(2).to_s , "fahrenheit" => (((params["name"].to_i *  9) / 5) + 32).round(2).to_s }.to_json
end

get "/fahrenheit-to-celsius/:name" do
   #(((params["name"].to_f - 32 ) * 5) / 9).round(2).to_s
  {"fahrenheit" => params[:name].to_f.round(2).to_s , "celsius" => (((params["name"].to_f - 32 ) * 5) / 9).round(2).to_s }.to_json
end

get "/kelvin-to-fahrenheit/:name" do
  #(((params["name"].to_f * 9) / 5) - 459.67).round(2).to_s
  {"kelvin" => params[:name].to_f.round(2).to_s , "fahrenheit" => (((params["name"].to_f * 9) / 5) - 459.67).round(2).to_s }.to_json
end

get "/fahrenheit-to-kelvin/:name" do
  #(((params["name"].to_f + 459.67) * 5) / 9).round(2).to_s
  {"fahrenheit" => params[:name].to_f.round(2).to_s , "kelvin" => (((params["name"].to_f + 459.67) * 5) / 9).round(2).to_s }.to_json
end

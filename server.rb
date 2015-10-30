require "sinatra"
require "json"
require "nokogiri"

set :public_folder, 'public'

get '/' do
  redirect '/index.html'
end

get "/kelvin-to-celsius/:name/?:format?" do
   unless params[:format] 
    (params[:name].to_f - 272.15).round(2).to_s
   else
     if params[:format] == "json"
       { "from_kelvin" => params[:name].to_f.round(2).to_s , "to_celsius" => (params[:name].to_f - 272.15).round(2).to_s }.to_json 
     else params[:format] == "xml"
       
       output = { "from_kelvin" => params[:name].to_f.round(2).to_s , "to_celsius" => (params[:name].to_f - 272.15).round(2).to_s }
       builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_kelvin output["from_kelvin"]
           xml.to_celsius output["to_celsius"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s

     end
   end
end

get "/celsius-to-kelvin/:name/?:format?" do
  unless params[:format]
    (params["name"].to_f + 272.15).round(2).to_s
  else
    if params[:format] == "json"
      {"from_celsius" => params[:name].to_f.round(2).to_s , "to_kelvin" => (params["name"].to_f + 272.15).round(2).to_s}.to_json
    elsif params[:format] == "xml"
      output = { "from_celsius" => params[:name].to_f.round(2).to_s , "to_kelvin" => (params["name"].to_f + 272.15).round(2).to_s }
       builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_celsius output["from_celsius"]
           xml.to_kelvin output["to_kelvin"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s

    end
  end
end

get "/celsius-to-fahrenheit/:name/?:format?" do
  unless params[:format]
    (((params["name"].to_i *  9) / 5) + 32).round(2).to_s
  else
    if params[:format] == "json"
      {"form_celsius" => params[:name].to_f.round(2).to_s , "to_fahrenheit" => (((params["name"].to_i *  9) / 5) + 32).round(2).to_s }.to_json
    elsif params[:format] == "xml"
       output = {"from_celsius" => params[:name].to_f.round(2).to_s , "to_fahrenheit" => (((params["name"].to_i *  9) / 5) + 32).round(2).to_s }
       builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_celsius output["from_celsius"]
           xml.to_fahrenheit output["to_fahrenheit"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s


    end
  end
end

get "/fahrenheit-to-celsius/:name/?:format?" do
  unless params[:format]
   (((params["name"].to_f - 32 ) * 5) / 9).round(2).to_s
  else
    if params[:format] == "json"
      {"from_fahrenheit" => params[:name].to_f.round(2).to_s , "to_celsius" => (((params["name"].to_f - 32 ) * 5) / 9).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_fahrenheit" => params[:name].to_f.round(2).to_s , "to_celsius" => (((params["name"].to_f - 32 ) * 5) / 9).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_fahrenheit output["from_fahrenheit"]
           xml.to_celsius output["to_celsius"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s

    end
  end
end

get "/kelvin-to-fahrenheit/:name/?:format?" do
  unless params[:format] 
    (((params["name"].to_f * 9) / 5) - 459.67).round(2).to_s
  else
    if params[:format] == "json"
      {"from_kelvin" => params[:name].to_f.round(2).to_s , "to_fahrenheit" => (((params["name"].to_f * 9) / 5) - 459.67).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_kelvin" => params[:name].to_f.round(2).to_s , "to_fahrenheit" => (((params["name"].to_f * 9) / 5) - 459.67).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_kelvin output["from_kelvin"]
           xml.to_fahrenheit output["to_fahrenheit"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

get "/fahrenheit-to-kelvin/:name/?:format?" do
  unless params[:format]
    (((params["name"].to_f + 459.67) * 5) / 9).round(2).to_s
  else
    if params[:format] == "json"
      {"from_fahrenheit" => params[:name].to_f.round(2).to_s , "to_kelvin" => (((params["name"].to_f + 459.67) * 5) / 9).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_fahrenheit" => params[:name].to_f.round(2).to_s , "to_kelvin" => (((params["name"].to_f + 459.67) * 5) / 9).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_fahrenheit output["from_fahrenheit"]
           xml.to_kelvin output["to_kelvin"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

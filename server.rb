require "sinatra"
require "json"
require "nokogiri"

set :public_folder, 'public'

get '/' do
  redirect '/index.html'
end

get "/kelvin-to-celsius/:degree/?:format?" do
   unless params[:format] 
    (params[:degree].to_f - 273.15).round(2).to_s
   else
     if params[:format] == "json"
       { "from_kelvin" => params[:degree].to_f.round(2).to_s , "to_celsius" => (params[:degree].to_f - 273.15).round(2).to_s }.to_json 
     else params[:format] == "xml"
       
       output = { "from_kelvin" => params[:degree].to_f.round(2).to_s , "to_celsius" => (params[:degree].to_f - 273.15).round(2).to_s }
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

get "/celsius-to-kelvin/:degree/?:format?" do
  unless params[:format]
    (params[:degree].to_f + 273.15).round(2).to_s
  else
    if params[:format] == "json"
      {"from_celsius" => params[:degree].to_f.round(2).to_s , "to_kelvin" => (params[:degree].to_f + 273.15).round(2).to_s}.to_json
    elsif params[:format] == "xml"
      output = { "from_celsius" => params[:degree].to_f.round(2).to_s , "to_kelvin" => (params[:degree].to_f + 273.15).round(2).to_s }
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

get "/celsius-to-fahrenheit/:degree/?:format?" do
  unless params[:format]
    (((params[:degree].to_i *  9) / 5) + 32).round(2).to_s
  else
    if params[:format] == "json"
      {"from_celsius" => params[:degree].to_f.round(2).to_s , "to_fahrenheit" => (((params[:degree].to_i *  9) / 5) + 32).round(2).to_s }.to_json
    elsif params[:format] == "xml"
       output = {"from_celsius" => params[:degree].to_f.round(2).to_s , "to_fahrenheit" => (((params[:degree].to_i *  9) / 5) + 32).round(2).to_s }
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

get "/fahrenheit-to-celsius/:degree/?:format?" do
  unless params[:format]
   (((params[:degree].to_f - 32 ) * 5) / 9).round(2).to_s
  else
    if params[:format] == "json"
      {"from_fahrenheit" => params[:degree].to_f.round(2).to_s , "to_celsius" => (((params[:degree].to_f - 32 ) * 5) / 9).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_fahrenheit" => params[:degree].to_f.round(2).to_s , "to_celsius" => (((params[:degree].to_f - 32 ) * 5) / 9).round(2).to_s }
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

get "/kelvin-to-fahrenheit/:degree/?:format?" do
  unless params[:format] 
    (((params[:degree].to_f * 9) / 5) - 459.67).round(2).to_s
  else
    if params[:format] == "json"
      {"from_kelvin" => params[:degree].to_f.round(2).to_s , "to_fahrenheit" => (((params[:degree].to_f * 9) / 5) - 459.67).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_kelvin" => params[:degree].to_f.round(2).to_s , "to_fahrenheit" => (((params[:degree].to_f * 9) / 5) - 459.67).round(2).to_s }
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

get "/fahrenheit-to-kelvin/:degree/?:format?" do
  unless params[:format]
    (((params[:degree].to_f + 459.67) * 5) / 9).round(2).to_s
  else
    if params[:format] == "json"
      {"from_fahrenheit" => params[:degree].to_f.round(2).to_s , "to_kelvin" => (((params[:degree].to_f + 459.67) * 5) / 9).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_fahrenheit" => params[:degree].to_f.round(2).to_s , "to_kelvin" => (((params[:degree].to_f + 459.67) * 5) / 9).round(2).to_s }
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

get "/reaumur-to-kelvin/:degree/?:format?" do
  unless params[:format]
    ((((params[:degree].to_f)*5)/4.0) + 273.15).round(2).to_s
  else
    if params[:format] == "json"
      {"from_reaumur" => params[:degree].to_f.round(2).to_s , "to_kelvin" => ((((params[:degree].to_f)*5)/4.0) + 273.15).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_reaumur" => params[:degree].to_f.round(2).to_s , "to_kelvin" => ((((params[:degree].to_f)*5)/4.0) + 273.15).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_reaumur output["from_reaumur"]
           xml.to_kelvin output["to_kelvin"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

get "/reaumur-to-fahrenheit/:degree/?:format?" do
  unless params[:format]
    ((((params[:degree].to_f)*9)/4.0) + 32).round(2).to_s
  else
    if params[:format] == "json"
      {"from_reaumur" => params[:degree].to_f.round(2).to_s , "to_fahrenheit" => ((((params[:degree].to_f)*9)/4.0) + 32).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_reaumur" => params[:degree].to_f.round(2).to_s , "to_fahrenheit" =>  ((((params[:degree].to_f)*9)/4.0) + 32).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_reaumur output["from_reaumur"]
           xml.to_fahrenheit output["to_fahrenheit"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

get "/reaumur-to-celsius/:degree/?:format?" do
  unless params[:format]
    (((params[:degree].to_f)*5)/4.0).round(2).to_s
  else
    if params[:format] == "json"
      {"from_reaumur" => params[:degree].to_f.round(2).to_s , "to_celsius" =>  (((params[:degree].to_f)*5)/4.0).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_reaumur" => params[:degree].to_f.round(2).to_s , "to_celsius" =>  (((params[:degree].to_f)*5)/4.0).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_reaumur output["from_reaumur"]
           xml.to_celsius output["to_celsius"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

get "/kelvin-to-reaumur/:degree/?:format?" do
  unless params[:format]
    ((((params[:degree].to_f) -273.15)*4.0)/5).round(2).to_s
  else
    if params[:format] == "json"
      {"from_kelvin" => params[:degree].to_f.round(2).to_s , "to_reaumur" =>  ((((params[:degree].to_f) -273.15)*4.0)/5).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_kelvin" => params[:degree].to_f.round(2).to_s , "to_reaumur" =>  ((((params[:degree].to_f) -273.15)*4.0)/5).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_kelvin output["from_kelvin"]
           xml.to_reaumur output["to_reaumur"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

get "/celsius-to-reaumur/:degree/?:format?" do
  unless params[:format]
    ((((params[:degree].to_f))*4.0)/5).round(2).to_s
  else
    if params[:format] == "json"
      {"from_celsius" => params[:degree].to_f.round(2).to_s , "to_reaumur" =>  ((((params[:degree].to_f) -273.15)*4.0)/5).round(2).to_s }.to_json
    elsif params[:format] == "xml"
      output = {"from_celsius" => params[:degree].to_f.round(2).to_s , "to_reaumur" =>  ((((params[:degree].to_f) -273.15)*4.0)/5).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_celsius output["from_celsius"]
           xml.to_reaumur output["to_reaumur"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end
get "/fahrenheit-to-reaumur/:degree/?:format?" do
  unless params[:format]
    (((((params[:degree].to_f))-32)*4.0)/9).round(2).to_s
  else
    if params[:format] == "json"
      {"from_fahrenheit" => params[:degree].to_f.round(2).to_s , "to_reaumur" =>   (((((params[:degree].to_f))-32)*4.0)/9).round(2).to_s}.to_json
    elsif params[:format] == "xml"
      output = {"from_fahrenheit" => params[:degree].to_f.round(2).to_s , "to_reaumur" =>  (((((params[:degree].to_f))-32)*4.0)/9).round(2).to_s }
      builder = Nokogiri::XML::Builder.new do |xml|
         xml.response do
           xml.from_fahrenheit output["from_fahrenheit"]
           xml.to_reaumur output["to_reaumur"]
         end 
       end
        
       content_type "text/xml"
       builder.to_xml.to_s
    end
  end
end

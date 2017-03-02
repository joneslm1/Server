require 'sinatra'
require "HTTParty"
require 'nokogiri'

    get '/' do

      job = params[:job]

    if job == nil
       url1 = "https://miami.craigslist.org/search/jjj"
    else
          url1 = "https://miami.craigslist.org/search/#{job}"
    end

   response1 = HTTParty.get url1
   home_page = Nokogiri::HTML(response1.body)

     cats = []
     jobs = []
     joblinks = []
     url_tag = []


   home_page.css('ul li p a').each do |job_cat|
     cats << job_cat
   end

  output = []

   n=1
     cats.each do |cat|
      output << cat.content
       n += 1
     end

     output.map! { |x|
         if x == "\n                restore\n                restore this posting\n            "
           x = nil
         else
           x = x
         end
       }

     output.compact!

 end



  get "/sinatra" do
    "Hello Sinatra"
  end

get "/hello.txt" do
  'hello.txt'
end

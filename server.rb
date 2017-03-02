require 'sinatra'
load 'craigslist.rb'

    get '/' do

      require "httparty"
      require 'nokogiri'




        url1 = "https://miami.craigslist.org/"

        response1 = HTTParty.get url1
        home_page = Nokogiri::HTML(response1.body)

          cats = []
          url_tag = []
          jobs = []
          joblinks = []


        home_page.css('ul#jjj0 li').each do |job_cat|
          cats << job_cat
        end

        puts "

          Choose one to search:

          *****************************

            "

        n=1
          cats.each do |cat|
            puts ("#{n}: " + cat.content)
            n += 1
          end

        cat_select = (gets.chomp!.to_i - 1)

          z=0
          while z < 33
          url_tag << (cats[z].children[0][:class])
          z+=1
          end


        tag = url_tag[cat_select]

        if cat_select != 32
        url_2 = "https://miami.craigslist.org/search/#{tag}"
        else url_2 = "https://miami.craigslist.org/search/jjj?employment_type=2"
        end


         response2 = HTTParty.get url_2
         job_page = Nokogiri::HTML(response2.body)

        job_page.css('p a').each do |element|
          jobs << element.content
         end

        job_page.css('a').each do |element|
          joblinks << element[:href]
         end

         joblinks.map! { |x|
           unless x.start_with?("/") && x.end_with?("html")
             x = nil
           else
             x = x.prepend("https://miami.craigslist.org")
           end
          }

        jobs.map! { |x|
            if x == "\n                restore\n                restore this posting\n            "
              x = nil
            else
              x = ("\n\n"+ x)
            end
          }

        jobs.compact!
        joblinks.uniq!.compact!

        puts jobs.zip(joblinks)

  end


    # current_time = Time.now.wday
    # weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    #
    # "Hello! Today is #{weekdays[current_time]}"


  get "/sinatra" do
    "Hello Sinatra"
  end

get "/hello.txt" do
  'hello.txt'
end

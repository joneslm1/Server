require 'sinatra'


    get '/' do

File.read('public/hello.txt')
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

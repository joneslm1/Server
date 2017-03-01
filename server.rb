require 'sinatra'


  get '/' do
    current_time = Time.now.wday
    weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    "Hello! Today is #{weekdays[current_time]}"
  end

  get "/sinatra" do
    "Hello Sinatra"
  end

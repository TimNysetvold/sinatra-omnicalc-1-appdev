require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square)
end

get("/square/") do
  number = params.fetch("number").to_f
  @result = number**2
  erb(:result)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/") do
  number = params.fetch("number").to_f
  @result = number**(0.5)
  erb(:result)
end

get("/random/new") do
  erb(:random)
end

get("/random/") do
  low = params.fetch("low").to_i
  high = params.fetch("high").to_i
  @result = die = rand(low..high)
  erb(:result)
end

get("/random/new") do
  erb(:random)
end

get("/random/") do
  low = params.fetch("low").to_f
  high = params.fetch("high").to_f
  @result = die = rand(low..high)
  erb(:result)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/") do
  @years = params.fetch("years")
  months = @years.to_f*12.0
  @PVal = params.fetch("PV").to_f.to_fs(:currency)
  @APRate = params.fetch("APR").to_f.to_fs(:percentage, {:precision => 4})
  r = APRate.to_f/(100)*1.0/(12.0)
  numerator = r*PVal.to_f
  denominator = 1-(1+r)**(-months)
  @result = (numerator/denominator).to_fs(:currency, {:precision => 4})

  erb(:payment_result)
end

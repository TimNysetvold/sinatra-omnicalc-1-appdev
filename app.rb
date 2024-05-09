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
  @low = params.fetch("low").to_f
  @high = params.fetch("high").to_f
  @result = rand(@low..@high)
  erb(:resultsrand)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment") do
  @years = params.fetch("user_years")
  months = @years.to_f*12.0
  pv = params.fetch("user_pv").to_f
  @PVal = pv.to_fs(:currency)
  APR = params.fetch("user_apr").to_f
  @APRate = APR.to_fs(:percentage, {:precision => 4})
  r = APR/(100.0)*1.0/(12.0)
  numerator = r*pv
  denominator = 1-(1+r)**(-months)
  @result = (numerator/denominator).to_fs(:currency, {:precision => 2})

  erb(:payment_result)
end

require 'pry'
require 'sinatra'
require 'sinatra/activerecord'
require './lib/model'
require './lib/my_helpers'

account = Account.new

get '/' do
  erb :index
end

get '/expense/list' do
  @expenditures = account.expenditures
  #binding.pry
  erb :'expense/list'
end

get '/expense/new' do
  erb :'expense/new'
end

post '/expense/save' do
  amount = params[:amount].to_i
  reason = params[:reason]
  
  #puts ">>>>>Amount: #{amount}<<<<<<"
  #puts ">>>>>Reason: #{reason}<<<<<<"
  account.spend(amount, reason: reason)
  redirect('/expense/list')
end

require 'sinatra'
require 'sinatra/activerecord'
require './lib/model'
require './lib/my_helpers'
require 'pry'

account = Account.new

get '/' do
  erb :index
end

get '/expense/list' do
  expenditures = expenditure_list( account.expenditures )
  puts "---->>>#{expenditures}<<<<<----"
  show_expense_list(expenditures)
end

get '/expense/new' do
  show_new_expense
end

post '/expense/save' do
  amount = params[:amount].to_i
  reason = params[:reason]

  account.spend(amount, reason: reason)
  redirect('/expense/list')
end

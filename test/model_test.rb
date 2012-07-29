#require './app'
#require 'capybara'
#require 'capybara/dsl'
require './lib/model'
require 'test/unit'

class ModelTest < Test::Unit::TestCase

  def setup
  end

  def test_account_initial_balance
    a = Account.new
    assert_equal(0, a.balance)
  end

  def test_total_spent_for
    account = Account.new
    amount_spent = 30
    reason = 'groceries'
    account.expenditures['groceries'] = account.expenditures['groceries'] + amount_spent 

    total_spent = account.total_spent_for reason 

    assert_equal(total_spent, amount_spent)

  end

  def test_account_received
    account = Account.new
    amount_received = 30
    source = 'PNB'
    account.received(amount_received, from: source) 

    total_received = account.total_received_from source 
    assert_equal(total_received, amount_received)
    assert_equal(account.balance, amount_received)

  end
  
  def test_account_spent
    account = Account.new
    initial_balance = 25
    account.set_initial_balance initial_balance 
    amount_spent = 10
    reason = 'book'

    account.spend(amount_spent, reason: reason)
    total_spent = account.total_spent_for reason

    assert_equal(total_spent, amount_spent)
    assert_equal(account.balance, initial_balance - amount_spent)
  end

  def test_account_spend
    account = Account.new

  end

end

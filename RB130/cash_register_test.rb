<<<<<<< HEAD
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
    @transaction.amount_paid = 20
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    @transaction.amount_paid = 120
    change_amount = @register.change(@transaction)
    assert_equal(20, change_amount)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end
end
=======
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
    @transaction.amount_paid = 20
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    @transaction.amount_paid = 120
    change_amount = @register.change(@transaction)
    assert_equal(20, change_amount)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end
end
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9

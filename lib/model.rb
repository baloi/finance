class Account
  def initialize
    set_initial_balance 0

  end

  def set_initial_balance aBalance
    @balance = aBalance 
    @incomes = Hash.new(0)
    @expenditures = Hash.new(0)
  end

  def balance
    @balance
  end

  def deposit anAmount
    @balance = @balance + anAmount
  end

  def expenditures
    @expenditures
  end

  def spend( anAmount, options={} )
    reason = options[:reason]
    @expenditures[reason] = total_spent_for( reason ) + anAmount
    @balance = balance - anAmount
  end

  def received( anAmount, options={} )
    source = options[:from]
    @incomes[source] = total_received_from( source ) + anAmount
    @balance = balance + anAmount
  end

  def total_spent_for( aReason )
    total = 0
    if @expenditures.has_key? aReason
      total = @expenditures[aReason]
    end
    total
  end

  def find_value(source, key)
    total = 0
    if source.has_key?(key )
      total = @incomes[key] 
    end

    total
  end
  def total_received_from( aSource )
    total = find_value(@incomes, aSource)
  end
end

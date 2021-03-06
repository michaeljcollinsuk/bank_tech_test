class Statement

  attr_reader :log, :balance

  def initialize
    @balance = 0
    @log = []
  end

  def add_transaction(transaction)
    @log.push(transaction)
  end

  def calculate_balance(transaction)
    if transaction.class == Deposit
      @balance += transaction.amount
    else
      @balance -= transaction.amount
    end
    return @balance
  end

  def print_statement
    puts "date || credit || debit || balance\n"
    output = []
    @log.each do |transaction|
      output << "#{transaction.date} || #{deposit_or_withdrawal?(transaction)} || #{calculate_balance(transaction)}"
    end
    output.reverse.each { |line| puts line}
  end

  private

  def deposit_or_withdrawal?(transaction)
    if transaction.class == Deposit
      return "#{transaction.amount} ||"
    else
      return "|| #{transaction.amount}"
    end
  end

  def withdrawal?(transaction)
    object.class == Withdrawal
  end

end

module ApplicationHelper
  def get_split_total(split)
    split.bills.sum(&:price)
  end

  def get_user_split_balance(split)
    @balance = get_balance(split)
    @balance.positive? ? "You claim $#{@balance}" : "You pay $#{@balance}"
  end

  def balance_positive?(split)
    @balance = get_balance(split)
    get_balance(split).positive?
  end

 private

  def get_balance(split)
    user_split_total = split.bills.where(user: current_user).sum(&:price)
    even_split = split.bills.sum(&:price)/2
    user_split_total - even_split
  end
end

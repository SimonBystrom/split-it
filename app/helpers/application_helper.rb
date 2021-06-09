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
    @balance.positive?
  end

  def non_current_user(split)
    split.payment_group.users.filter do |user|
      user != current_user
    end
  end

  def other_user_balance(split, user)
    @user_total = split.bills.where(user: user).sum(&:price)
    even_split = split.bills.sum(&:price)/split.payment_group.users.count
    even_split - @user_total
  end

  def user_payed(split, user)
    split.bills.where(user: user).sum(&:price)
  end

 private

  def get_balance(split)
    user_split_total = split.bills.where(user: current_user).sum(&:price)
    even_split = split.bills.sum(&:price)/split.payment_group.users.count
    user_split_total - even_split
  end


end

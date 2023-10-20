class Transaction < ActiveRecord::Base
  def authorize?
    return !(has_cbk? ||
      multiple_purchases_short_time? ||
      after_18h_above_1k? ||
      before_06h_above_1k?)
  end
  
  private

  def has_cbk?
    Transaction.where(user_id: user_id, has_cbk: true).count > 0
  end

  def multiple_purchases_short_time?
    last_transaction = Transaction.where(user_id: user_id).order(:transaction_date).last

    if self.transaction_id != last_transaction.transaction_id && (self.transaction_date - last_transaction.transaction_date)/60 <= 5
      return true
    end
    false
  end

  def after_18h_above_1k?
    if self.transaction_amount > 1000.0 && self.transaction_date.hour >= 18
      return true
    end
    false
  end

    def before_06h_above_1k?
    if self.transaction_amount > 1000.0 && self.transaction_date.hour <= 6
      return true
    end
    false
  end
end

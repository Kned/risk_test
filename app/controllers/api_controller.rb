class ApiController < ApplicationController
  def authorize_transaction
    transaction_params = permited_params
    transaction = Transaction.create(transaction_params)
    response = {
      transaction_id: transaction.id
    }
    if transaction.authorize?
      response[:recommendation] = "approve"
    else
      response[:recommendation] = "deny"
    end

    render json: response
  rescue ActiveRecord::RecordNotUnique
    render json: { 
      transaction_id: transaction_params[:transaction_id],
      recommendation: "deny"
    }
  end

  private

  def permited_params
    params.permit(
        :transaction_id,
        :merchant_id,
        :user_id,
        :card_number,
        :transaction_date,
        :transaction_amount,
        :device_id
    )
  end
end

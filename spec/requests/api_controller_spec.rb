require 'rails_helper'

describe "Api Controller", type: :request do
  fixtures :transactions
  context "invalid valid transaction" do
    let(:params) do
      {
        transaction_id: 2342357,
        merchant_id: 29744,
        user_id: 97051,
        card_number: "434505******9116",
        transaction_date: "2019-11-31T23:16:32.812632",
        transaction_amount: 373,
        device_id: 285475
      }
    end
    it 'deny transaction' do
      post('/api/authorize_transaction', params: params)
      expect(JSON.parse(response.body)['recommendation']).to eq('deny')
    end
  end
  context "valid transaction" do
    let(:params) do
      {
        transaction_id: 100,
        merchant_id: 29744,
        user_id: 1,
        card_number: "434505******9116",
        transaction_date: "2020-12-31T23:16:32.812632",
        transaction_amount: 30,
        device_id: 1
      }
    end
    it 'approve transaction' do
      post('/api/authorize_transaction', params: params)
      expect(JSON.parse(response.body)['recommendation']).to eq('approve')
    end
  end

  context "user already have changeback" do
    let(:params) do
      {
        transaction_id: 101,
        merchant_id: 29744,
        user_id: 2,
        card_number: "434505******9116",
        transaction_date: "2019-11-31T23:16:32.812632",
        transaction_amount: 30,
        device_id: 2
      }
    end
    it 'deny transaction' do
      post('/api/authorize_transaction', params: params)
      expect(JSON.parse(response.body)['recommendation']).to eq('deny')
    end
  end

  context "user already has a transaction in short time" do
    let(:params) do
      {
        transaction_id: 102,
        merchant_id: 29744,
        user_id: 3,
        card_number: "434505******9116",
        transaction_date: "2019-11-31T23:16:32.812632",
        transaction_amount: 30,
        device_id: 2
      }
    end
    it 'deny transaction' do
      post('/api/authorize_transaction', params: params)
      expect(JSON.parse(response.body)['recommendation']).to eq('deny')
    end
  end

    context "Transaction after 18h with value above 1k" do
    let(:params) do
      {
        transaction_id: 103,
        merchant_id: 29744,
        user_id: 4,
        card_number: "434505******9116",
        transaction_date: "2019-11-31T23:21:32.812632",
        transaction_amount: 1001,
        device_id: 2
      }
    end
    it 'deny transaction' do
      post('/api/authorize_transaction', params: params)
      expect(JSON.parse(response.body)['recommendation']).to eq('deny')
    end
  end

    context "transaction before 06h with value above 1k" do
    let(:params) do
      {
        transaction_id: 103,
        merchant_id: 29744,
        user_id: 4,
        card_number: "434505******9116",
        transaction_date: "2019-11-31T04:21:32.812632",
        transaction_amount: 1002,
        device_id: 2
      }
    end
    it 'deny transaction' do
      post('/api/authorize_transaction', params: params)
      expect(JSON.parse(response.body)['recommendation']).to eq('deny')
    end
  end


end
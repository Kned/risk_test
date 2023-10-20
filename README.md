# Software Engineer - risk test
## 1. This test is for the position of Software Engineering positions at CloudWalk.
## 2.  Task 1 Understand the Industry
### 1. Money and information flow 
- When sell order is made, first we have a payment gateway receiving the store information and customer payment choice, the gateway send the information to the accquirer, who is responsible to process the payment with the bank or credit card company. The credit card company check if the customer has credit and authorize the order. Once the payment is approved a third party can analize the transaction to detect fraud and stop the flow or let run the normal flow.
 ### 2. Acquirer, sub-acquirer, payment gateways
- Acquirer are responsible for processing payments to a vendor, they have multiple partners to offer different payment options. Acquirers comunicate card companies or banks to authorize the orders. Cielo is a example of acquirer
- Sub-acquirer are very similar to acquirers, but they are in the middle of vendor and acquirer, they can't do all the steps acquirers do to ensure the payment process, they complement the payment process making it easyer to the vendor, but this comes with a cost per operation. Paypal is a example of sub-acquirer
- Payment Gateways connect e-commerces and payment methods, the order is made in the e-commerce and send to the payment gateway, the gateway get the customer information and send it to the acquirers, credit card companies or banks to process the payment or cancelations. Payment gateways require more simple integration. EBANX is a payment gateway
 ### 3. Chargebacks and Cancelations
- Chargeback doenst need the approval of the merchant to happen, usualy is used when the charge was unauthorized by the customer or when a dispute can't be resolved, is also used to commit fraud, because the merchant is only notified that the chargeback happened.
- Cancelations and refund are started by the merchant, when a problem happen with the order of it can't be fullfiled.

## 3. Task 2 CSV analysis
### 1. Spreadshee analysis
- Looking at past transactions we can observe if the user has made multiple purchases in a row or if he has requested chargebacks in multiple purchases before, this behavior is suspect. Also we can see if the transactions are outside bussiness hours and the amount spend.
### 2. Additional validation
- Assuming all orders are made by mobile phone, we can use geolocation to determine if the user is outside his usual places and detect theft of his account.

## 4. Task 3 Solve the problem
  I've made a simple API with one endpoint that receives the transaction information and make the decision to approve or deny the transaction based on fixed rules:
  - Transactions with the same transaction id are denied.
  - Transactions between 18h and 06h with the value above 1k are denied.
  - Transactions of users that already have chargebacks are denied..
  - Transactions made in less than 5 minutes apart are denied.

  You can run rspec to test the rules.  
  I also made a "processor" to import the csv data, this is not required to test, but make it easier to test manualy.  
  For improvements would make some type of authentication, at least token based, to improve security of the API.

  ### Requirements
  - ruby "3.2.2"
  - rails 7.0.6
  ### Setup
   ```
   $bundle install  
   $bundle exec rspec  
   $rails s

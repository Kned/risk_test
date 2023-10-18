# Software Engineer - risk test
1. This test is for the position of Software Engineering positions at CloudWalk.
2.  Understand the Industry
  1. When sell order is made, first we have a payment gateway receiving the store information and customer payment choice, the gateway send the information to the accquirer, who is responsible to process the payment with the bank or credit card company. The credit card company check if the customer has credit and authorize the order. Once the payment is approved a third party can analize the transaction to detect fraud and stop the flow or let run the normal flow.
  2. Acquirer, sub-acquirer, payment gateways
     Acquirer are responsible for processing payments to a vendor, they have multiple partners to offer different payment options. Acquirers comunicate card companies or banks to authorize the orders. Cielo is a example of acquirer
     Sub-acquirer are very similar to acquirers, but they are in the middle of vendor and acquirer, they can't do all the steps acquirers do to ensure the payment process, they complement the payment process making it easyer to the vendor, but this comes with a cost per operation. Paypal is a example of sub-acquirer
     Payment Gateways connect e-commerces and payment methods, the order is made in the e-commerce and send to the payment gateway, the gateway get the customer information and send it to the acquirers, credit card companies or banks to process the payment or cancelations. Payment gateways require more simple integration. EBANX is a payment gateway
   3. Chargebacks and Cancelations
     Chargeback doenst need the approval of the merchant to happen, usualy is used when the charge was unauthorized by the customer or when a dispute can't be resolved, is also used to commit fraud, because the merchant is only notified that the chargeback happened.
     Cancelations and refund are started by the merchant, when a problem happen with the order of it can't be fullfiled.

3. 
   

# MyHomie

Home Assignment : An API only app that has an endpoint to create reservation records by accepting any kind of payload with configuration done in the code beforehand. 

## Steps to run locally 

1. Run bundle install
2. Run rails db:migrate
3. Start rails server - rails s
4. Hit the following APIs on postman :
 - POST `localhost:3000/reservations` with following payloads :

Payload 1 :
`{
    "reservation_code": "YYY12345678",
    "start_date": "2021-04-14",
    "end_date": "2021-04-18",
    "nights": 4,
    "guests": 4,
    "adults": 2,
    "children": 2,
    "infants": 0,
    "status": "accepted",
    "guest": {
    "first_name": "Wayne",
    "last_name": "Woodbridge",
    "phone": "639123456789",
    "email": "wayne_woodbridge@bnb.com"
    },
    "currency": "AUD",
    "payout_price": "4200.00",
    "security_price": "500",
    "total_price": "4700.00"
}`

Payload 2 :

`{
"reservation": {
"code": "XXX12345678",
"start_date": "2021-03-12",
"end_date": "2021-03-16",
"expected_paayout_amount": "3800.00",
"guest_details": {
"localized_description": "4 guests",
"number_of_adults": 2,
"number_of_children": 2,
"number_of_infants": 0
},
"guest_email": "new_dummy_mail@bnb.com",
"guest_first_name": "Wayne",
"guest_last_name": "Woodbridge",
"guest_phone_numbers": [
"639123456789",
"639123456789"
],
"listing_security_price_accurate": "500.00",
"host_currency": "AUD",
"nights": 4,
"number_of_guests": 4,
"status_type": "accepted",
"total_paid_amount_accurate": "4300.00"
}
}`

Expectations : With both payloads, API should be successful and should create respective `reservation` and `guest` records should be created, else return proper errors in response.

## Todo

- Refactor the code.
- Explore GraphQL as a solution to be flexible to any type of payload.
- Write more testcases
- Create a proper documentation using Swagger

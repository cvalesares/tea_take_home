# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(first_name: 'Bob', last_name: 'Belcher', email: 'bburger@yahoo.com', address: '123 burger st')
customer2 = Customer.create!(first_name: 'Linda', last_name: 'Belcher', email: 'lburger@yahoo.com', address: '123 burger st')
customer3 = Customer.create!(first_name: 'Gene', last_name: 'Belcher', email: 'babyboybelcher@yahoo.com', address: '123 burger st')
customer4 = Customer.create!(first_name: 'Jimmy', last_name: 'Pesto', email: 'ihatebob@yahoo.com', address: '125 burger st')

subscription1 = Subscription.create!(title: "basic sub", price: 15.00, status: 0, frequency: 2, customer_id: customer1.id)
subscription2 = Subscription.create!(title: "fancy stuff", price: 45.00, status: 1, frequency: 2, customer_id: customer1.id)
subscription3 = Subscription.create!(title: "fancy stuff", price: 45.00, status: 0, frequency: 2, customer_id: customer2.id)
subscription4 = Subscription.create!(title: "italian stallion", price: 25.00, status: 0, frequency: 4, customer_id: customer4.id)

tea1 = Tea.create!(title: "green tea", description: "earthy", temperature: 100, brew_time: 30, subscription_id: subscription1.id)
tea2 = Tea.create!(title: "oolong tea", description: "even more earthy", temperature: 100, brew_time: 60, subscription_id: subscription2.id)
tea3 = Tea.create!(title: "grey tea", description: "boring and drab", temperature: 105, brew_time: 30, subscription_id: subscription2.id)
tea4 = Tea.create!(title: "pesto tea", description: "who drinks this", temperature: 100, brew_time: 0, subscription_id: subscription4.id)

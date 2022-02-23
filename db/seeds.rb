# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(first_name: 'Bob', last_name: 'Belcher', email: 'bburger@yahoo.com', address: '123 burger st')
subscription1 = Subscription.create!(title: "basic sub", price: 15.00, status: 0, frequency: 2, customer_id: customer1.id)
tea1 = Tea.create!(title: "green tea", description: "earthy", temperature: 100, brew_time: 30, subscription_id: subscription1.id)

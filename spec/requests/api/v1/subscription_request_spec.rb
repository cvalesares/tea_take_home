require 'rails_helper'

describe "Subscirption" do
  before :each do
    @customer1 = Customer.create!(first_name: 'Bob', last_name: 'Belcher', email: 'bburger@yahoo.com', address: '123 burger st')
    @subscription1 = Subscription.create!(title: "basic sub", price: 15.00, status: 0, frequency: 2, customer_id: @customer1.id)
    @subscription2 = Subscription.create!(title: "fancy stuff", price: 45.00, status: 1, frequency: 2, customer_id: @customer1.id)
    @tea1 = Tea.create!(title: "green tea", description: "earthy", temperature: 100, brew_time: 30, subscription_id: @subscription1.id)
    @tea2 = Tea.create!(title: "oolong tea", description: "even more earthy", temperature: 100, brew_time: 60, subscription_id: @subscription2.id)
    @tea3 = Tea.create!(title: "grey tea", description: "boring and drab", temperature: 105, brew_time: 30, subscription_id: @subscription2.id)
  end

  it 'can show all of a customer\'s subscriptions' do
    get "/api/v1/customers/#{@customer1.id}/subscriptions"

    subscriptions = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful
    expect(subscriptions.count).to eq(2)
    expect(subscriptions.first[:attributes][:status]).to eq("active")
    expect(subscriptions.last[:attributes][:status]).to eq("cancelled")
  end

  it 'can subscribe a customer to a tea subscription' do
    params = {
      title: 'average stuff',
      price: 24.99,
      status: 0,
      frequency: 2,
      customer_id: @customer1.id
    }

    post "/api/v1/customers/#{@customer1.id}/subscriptions", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response.status).to eq(201)
  end

  it 'can cancel a customer\'s subscriptions' do
    params = {
      title: 'basic sub',
      price: 15,
      status: 1,
      frequency: 2,
      customer_id: @customer1.id
    }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/customers/#{@customer1.id}/subscriptions/#{@subscription1.id}", headers: header, params: JSON.generate(params)

    subscription = Subscription.find_by(id: @subscription1.id)

    expect(response).to be_successful
    expect(subscription.status).to eq("cancelled")
  end
end

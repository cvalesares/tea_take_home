class Api::V1::SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.create!(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(Subscription.find(subscription.id)), status: 201
    else
      render json: { errors: { details: "There was an error creating this request" } }, status: 400
    end
  end

  private
  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id)
  end
end

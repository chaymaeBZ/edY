class ChargesController < ApplicationController
  def new
    @session = Session.find(params[:id])
  end

  def create
    @session = Session.find(params[:session_id])
    @amount = @session.price.to_i * 100
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    @session.users << current_user

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end

  def index
    redirect_to root_url
  end
end

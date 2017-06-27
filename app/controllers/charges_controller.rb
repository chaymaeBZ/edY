class ChargesController < ApplicationController
  def new
    @session = Session.find(params[:id])
  end

  def create
    @amount = params[:amount].to_i
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

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end

  def index
    redirect_to root_url
  end
end

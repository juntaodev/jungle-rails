class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:user], password: Rails.configuration.admin[:password]
  def show
    @products = Product.all
    @category = Category.all
  end
end

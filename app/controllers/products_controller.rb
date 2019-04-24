require 'pry'

class ProductsController < Sinatra::Base

    set :views, "app/views/products"

    get "/products" do
      @products = Product.all
      erb :index
    end

    get "/products/new" do
      erb :new
    end





end

require 'pry'

class ProductsController < Sinatra::Base

    set :views, "app/views/products"
    set :method_override, true

    get "/products" do
      @products = Product.all
      erb :index
    end

    get "/products/new" do
      erb :new
    end

    get "/products/:id" do
        id = params[:id]
        @product = Product.find(id)
        erb :show
    end

    post "/products" do
        category_id = params[:category]
        # binding.pry
        # category = Category.find(category_id)
        category = Category.find_by(name: params[:category])
        name = params[:name]
        description = params[:description]
        price = params[:price]
        product = Product.create(category: category, name: name, description: description, price: price)
        # product.save
        #create is the same as doing new and save
        redirect "/products/#{product.id}"
    end

    get "/products/:id/edit" do
        @product = Product.find(params[:id])
        erb :edit
    end

    patch "/products/:id" do
        @product = Product.find(params[:id])
        @product.update(category: category, name: name, description: description, price: price)
        redirect "/products/#{@product.id}"
    end

    delete "/products/:id" do
        binding.pry
        @product = Product.find(params[:id])
        @product.destroy
        redirect "/products"
    end



end

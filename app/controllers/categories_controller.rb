require 'pry'

class CategoriesController < Sinatra::Base

    set :views, "app/views/categories"

    get "/categories" do
      @categories = Category.all
      erb :index
    end

    get "/categories/new" do
      erb :new
    end

    post "/categories" do
      # binding.pry
      category = Category.create(name: params[:name])
      # binding.pry
      params[:product].each do |product_info|
          Product.find_or_create_by(name: product_info[:name],
                                 description: product_info[:description],
                                 price: product_info[:price],
                                 category: category)
      end
      redirect "/categories/#{category.id}"
    end

    get "/categories/:id" do
      @category = Category.find(params[:id])
    erb :show
end

end

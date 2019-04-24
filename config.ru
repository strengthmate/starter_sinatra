require_relative './config/environment'

run ApplicationController
use CategoriesController
use ProductsController

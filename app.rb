require("bundler/setup")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

post('/add_store') do
  store_name = params[:store_name]
  @store = Store.create({:name => store_name})
  @stores = Store.all
  redirect('/stores')
end

get('/brand/:id') do
  erb(:brand)
end

get('/brands') do
  @brands = Brand.all
  erb(:brands)
end

post('/add_brand') do
  brand_name = params[:brand_name]
  @brand = Brand.create({:name => brand_name})
  @brands = Brand.all
  redirect('/brands')
end

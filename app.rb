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

get('/store/:id') do
  @store = Store.find(params['id'].to_i)
  erb(:store)
end

patch('/update_store/:id') do
  store_name = params[:edit_name]
  @store = Store.find(params[:id].to_i)
  @store.update({:name => store_name})
  redirect("/store/#{@store.id}")
end

delete('/delete_store/:id') do
  @store = Store.find(params[:id].to_i)
  @store.destroy
  @stores = Store.all
  redirect("/stores")
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

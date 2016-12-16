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
  @store = Store.new({:name => store_name})
  @stores = Store.all
  if @store.save()
    redirect('/stores')
  else
    erb(:error_store)
  end
end

get('/store/:id') do
  @store = Store.find(params['id'].to_i)
  @all_brands = Brand.all
  erb(:store)
end

patch('/add_brand_to_store/:id') do
  @store = Store.find(params[:id].to_i)
  brand_to_add = Brand.find(params[:add_brand_to_store])
  @store.brands.push(brand_to_add)
  redirect("/store/#{@store.id}")
end

patch('/update_store/:id') do
  store_name = params[:edit_name]
  @store = Store.find(params[:id].to_i)
  if @store.update({:name => store_name})
    redirect("/store/#{@store.id}")
  else
    erb(:error_store)
  end
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
  @brand = Brand.new({:name => brand_name})
  @brands = Brand.all
  if @brand.save()
    redirect('/brands')
  else
    erb(:error_brand)
  end
end

get('/brand/:id') do
  @brand = Brand.find(params[:id].to_i)
  erb(:brand)
end

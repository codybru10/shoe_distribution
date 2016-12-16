require 'spec_helper'

describe(Store) do
  it('adds a shoe brand to a store') do
    test_store = Store.create({:name => 'Foot Locker'})
    test_brand = Brand.create({:name => 'Nike'})
    test_store.brands.push(test_brand)
    expect(test_store.brands()).to(eq([test_brand]))
  end

  it('validates presence for the name of the store') do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end

  it('capitalizes the store name no matter what user inputs') do
    test_store = Store.create({:name => "finish line"})
    expect(test_store.name()).to(eq("Finish Line"))
  end

  it('doesnt allow duplicates of a store') do
    test_store1 = Store.new({:name => "Payless"})
    test_store1.save
    test_store2 = Store.new({:name => "Payless"})
    expect(test_store2.save()).to(eq(false))
  end

end

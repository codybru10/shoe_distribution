require 'spec_helper'

describe(Brand) do
  it('adds a shoe brand to a store') do
    test_store = Store.create({:name => 'Foot Locker'})
    test_brand = Brand.create({:name => 'Nike'})
    test_brand.stores.push(test_store)
    expect(test_brand.stores()).to(eq([test_store]))
  end

  it('validates presence for the name of the brand') do
    test_brand = Brand.new({:name => ""})
    expect(test_brand.save()).to(eq(false))
  end

  it('capitalizes the shoe brand no matter what user inputs') do
    test_brand = Brand.create({:name => "foot locker"})
    expect(test_brand.name()).to(eq("Foot Locker"))
  end

  it('doesnt allow duplicates of a brand') do
    test_brand1 = Store.new({:name => "Converse"})
    test_brand1.save
    test_brand2 = Store.new({:name => "Converse"})
    expect(test_brand2.save()).to(eq(false))
  end

end

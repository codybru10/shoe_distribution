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
    test_brand = Brand.create({:name => "nike"})
    expect(test_brand.name()).to(eq("Nike"))
  end

end

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

end

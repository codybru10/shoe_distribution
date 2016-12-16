class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  before_save(:capitalize)

  private

  define_method(:capitalize) do
    self.name=(name().capitalize())
  end
end

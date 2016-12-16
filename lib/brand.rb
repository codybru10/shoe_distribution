class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  validates_uniqueness_of :name
  before_save(:capitalize)

  private

  define_method(:capitalize) do
    self.name=(name.capitalize)
  end
end

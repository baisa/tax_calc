require 'rspec'
require_relative 'tax'

describe TaxCalculator do
  # let defines method person
  let(:person) do
    p = Person.new
    p.age = 21
    p.children_count = 0
    p.married = false
    p.handicap  = false
    p.income  = 10_000
    p
  end

  describe 'basic example' do
    it 'calculates no tax' do
      # person defined by let above
      t = TaxCalculator.new(person)
      expect(t.calculate).to equal(0)
    end

    it 'calculates tax' do
      # person defined by let above
      person.income = 20_000
      t = TaxCalculator.new(person)
      expect(t.calculate).to eq(2000) # 20% from 10k - note 10k free income
    end
  end
end
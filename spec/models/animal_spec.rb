require "rails_helper"

describe Animal do
  it { should validate_presence_of :name }
  it { should validate_presence_of :species }
  it { should validate_presence_of :gender }
  it { should validate_presence_of :dob }

  describe 'birthday' do
    it "should allow save if dob is today or before" do
      animal = FactoryBot.build(:animal, dob: Date.today, arrival_date: Date.today)
      expect(animal.save).to eq(true)
    end
  end

  describe 'arrival_date' do
    it "should prevent save if arrival date is in the future" do
      animal = FactoryBot.build(:animal, arrival_date: Date.today + 7.day)
      expect(animal.save).to eq(false)
    end
  end

  describe 'confirm_arrival' do
    it "keeps given arrival date if one is provided" do
      animal = FactoryBot.create(:animal, arrival_date: Date.today - 3.day)
      expect(animal.arrival_date).to eq(Date.today - 3.day)
    end
  end

  describe '.random' do
    it "returns a random animal" do
      animals = FactoryBot.create_list(:animal, 10)
      expect(animals.include?(Animal.random)).to eq(true)
    end
  end

  describe '.search' do
    it "finds all animals with a name that partially matches the search term" do
      a1 = FactoryBot.create(:animal, name: 'Catherine')
      a2 = FactoryBot.create(:animal, name: 'Cathy')
      a3 = FactoryBot.create(:animal, name: 'Kathleen')
      expect(Animal.search('Cath')).to eq([a1, a2])
    end
  end

end

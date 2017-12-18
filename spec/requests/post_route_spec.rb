require 'rails_helper'

describe "post a animal route", :type => :request do

  before do
    post '/animals', params: { :name => 'Tommy', :species => 'Dog', :gender => 'Male', :dob => Date.today - 1.year, :description => 'A cute dog', :arrival_date => Date.today - 7.day }
  end

  it 'returns the animal name' do
    expect(JSON.parse(response.body)['name']).to eq('Tommy')
  end

  it 'returns the animal species' do
    expect(JSON.parse(response.body)['species']).to eq('Dog')
  end

  it 'returns a animal gender' do
    expect(JSON.parse(response.body)['gender']).to eq('Male')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
  
end

require 'spec_helper'

describe 'Feeling Lucky' do
  it 'doesnt effect working methods' do
    expect("hello".upcase).to eq("HELLO")
  end

  it 'corrects spelling mistakes' do
    expect("hello".uppcase).to eq("HELLO")
  end
end

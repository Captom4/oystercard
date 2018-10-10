require 'rspec'
require_relative '../lib/oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument}
    
    it 'It can top up balance' do
      expect{ subject.top_up 1}.to change{ subject.balance}.by 1
    end
  end
end
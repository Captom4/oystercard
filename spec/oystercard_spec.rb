require 'rspec'
require_relative '../lib/oystercard'

describe OysterCard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'It can top up balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it 'Raises an error if the maximum amount is passed' do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} passed"
    end

    it 'deducts an amount from the balance' do
      subject.top_up(20)
      expect { subject.deduct 3 }.to change { subject.balance }.by -3
    end
    
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
    
    it 'can touch in' do
      subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    
    it
    
    it 'can touch out' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end

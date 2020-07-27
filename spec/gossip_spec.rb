require 'csv'
require 'gossip'

describe 'Gossip' do
  before do
    @gossip = Gossip.new('auteur', 'gossip')
  end

  it 'find the first gossip by id' do
    p Gossip.find(1)
    expect(Gossip.find(2)).to be_an(['Allo'])
  end

  it 'find the first gossip by id' do
    expect(@gossip.update(@gossip, 1)).to be_an(['Allo'])
  end
end

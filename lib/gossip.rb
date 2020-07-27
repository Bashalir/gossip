class Gossip
  attr_accessor :author, :content, :id

  def initialize(author, content)
    @author = author
    @content = content
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.find(id)
    all[id.to_i]
  end

  def self.update(id, author, content)
    modify_gossip = []

    CSV.read('./db/gossip.csv').each_with_index do |gossip, index|
      modify_gossip << if index == id.to_i
                         [author, content]
                       else
                         gossip
                       end
    end

    File.open('./db/gossip.csv', 'w') { |file| file.truncate(0) }
    modify_gossip.each do |gossip|
      Gossip.new(gossip[0], gossip[1]).save
    end

  end
end

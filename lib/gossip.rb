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
    all_gossips = all

# Reset the csv file
    CSV.open('./db/gossip.csv', 'w')

# Rewrite the csv file
    all_gossips.each_with_index do |gossip, index|
      gossip = if index == id.to_i
                 Gossip.new(author, content)
               else
                 gossip
                 end
      gossip.save
    end
  end
end

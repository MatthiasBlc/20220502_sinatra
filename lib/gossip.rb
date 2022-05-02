class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(selected_gossips_id)
    selected_gossip = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      selected_gossip << Gossip.new(csv_line[0], csv_line[1])
    end
    return selected_gossip[selected_gossips_id.to_i]
  end
  
  def self.update(id, updated_author, updated_content)
    gossip_updated = CSV.read("./db/gossip.csv")
    puts gossip_updated.inspect
    gossip_updated[id.to_i][0] = updated_author
    gossip_updated[id.to_i][1] = updated_content
    CSV.open("./db/gossip.csv", "w+") do |csv|
      gossip_updated.each do |row_updated|
        csv << row_updated
      end
    end
  end
  
end
class Gossip 
    attr_accessor :content, :author #ne pas oublier le accessor pour pouvoir afficher et modifer des variables
    def initialize (author, content)
        @author = author
        @content = content
    end

    def save 
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author,@content]
        end
      end
      def self.all
        all_gossips = [] #j'initialise un array dans lequel je rangerai mes gossip :)
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end
end
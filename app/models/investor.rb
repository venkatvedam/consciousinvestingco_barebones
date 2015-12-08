class Investor < ActiveRecord::Base
  require 'csv'

  def self.import(file)

    CSV.foreach(file.path, headers: true) do |row|

      investor_hash = row.to_hash
      investor = Investor.where(ticker: investor_hash["ticker"])

      if investor.count >= 1
        investor.first.update_attributes!(investor_hash)
      else
        Investor.create!(investor_hash)
      end
    end
  end


 def div_name(x)
  x = x.gsub(/[^0-9A-Z a-z]/, '').strip
  x = x.gsub(' ', '_').downcase
 end

end



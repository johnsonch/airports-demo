class Airport < ActiveRecord::Base
  require 'csv'
def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |airport|
      csv << airport.attributes.values_at(*column_names)
    end
  end
end
end

require 'csv'
namespace :restaurants do

  def load_restaurants_from_csv
    opts = {:headers => true, :header_converters => :symbol}

    CSV.foreach("#{Rails.root}/support/restaurants.csv", opts) do |row|
      Restaurant.where(name: row[:name]).first_or_create!
      print '.'
    end
  end

  desc 'Load restaurants from support/restaurants.csv'
  task :load_from_csv => :environment do
    load_restaurants_from_csv
  end
end

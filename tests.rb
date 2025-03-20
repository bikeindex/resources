require "rspec"
require "csv"

# Download a copy from Bike Index to compare against the updates in the repo
system("bin/download_from_bike_index.sh tmp/manufacturers.csv", exception: true)

RSpec.describe "manufacturers.csv" do
  it "has at least as many manufacturers as are on bikeindex"
end

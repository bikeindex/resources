require "rspec"
require "csv"

# Set the application root directory
APP_ROOT = File.expand_path('..', __dir__)

# Download a copy from Bike Index to compare against the updates in the repo
system("bin/download_from_bike_index tmp/manufacturers.csv", exception: true)

BIKE_INDEX_CSV = CSV.read("tmp/manufacturers.csv", headers: true, header_converters: :symbol)
REPO_CSV =

RSpec.describe "manufacturers.csv" do
  let(:repo_csv) { CSV.read("manufacturers.csv", headers: true, header_converters: :symbol) }

  it "has at least as many manufacturers as are on bikeindex, and the same headers" do
    expect(repo_csv.count).to eq BIKE_INDEX_CSV.count
    expect(repo_csv.headers).to eq BIKE_INDEX_CSV.headers
  end
end

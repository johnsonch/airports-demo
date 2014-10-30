require 'spec_helper'

describe "airports/show" do
  before(:each) do
    @airport = assign(:airport, stub_model(Airport,
      :ident => "Ident",
      :type => "Type",
      :name => "Name",
      :latitude_deg => 1.5,
      :longitude_deg => 1.5,
      :elevation_ft => 1,
      :continent => "Continent",
      :iso_country => "Iso Country",
      :iso_region => "Iso Region",
      :municipality => "Municipality",
      :scheduled_service => "Scheduled Service",
      :gps_code => "Gps Code",
      :iata_code => "Iata Code",
      :local_code => "Local Code",
      :home_link => "Home Link",
      :wikipedia_link => "Wikipedia Link",
      :keywords => "Keywords"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ident/)
    rendered.should match(/Type/)
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/Continent/)
    rendered.should match(/Iso Country/)
    rendered.should match(/Iso Region/)
    rendered.should match(/Municipality/)
    rendered.should match(/Scheduled Service/)
    rendered.should match(/Gps Code/)
    rendered.should match(/Iata Code/)
    rendered.should match(/Local Code/)
    rendered.should match(/Home Link/)
    rendered.should match(/Wikipedia Link/)
    rendered.should match(/Keywords/)
  end
end

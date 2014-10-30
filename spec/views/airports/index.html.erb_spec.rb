require 'spec_helper'

describe "airports/index" do
  before(:each) do
    assign(:airports, [
      stub_model(Airport,
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
      ),
      stub_model(Airport,
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
      )
    ])
  end

  it "renders a list of airports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ident".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Continent".to_s, :count => 2
    assert_select "tr>td", :text => "Iso Country".to_s, :count => 2
    assert_select "tr>td", :text => "Iso Region".to_s, :count => 2
    assert_select "tr>td", :text => "Municipality".to_s, :count => 2
    assert_select "tr>td", :text => "Scheduled Service".to_s, :count => 2
    assert_select "tr>td", :text => "Gps Code".to_s, :count => 2
    assert_select "tr>td", :text => "Iata Code".to_s, :count => 2
    assert_select "tr>td", :text => "Local Code".to_s, :count => 2
    assert_select "tr>td", :text => "Home Link".to_s, :count => 2
    assert_select "tr>td", :text => "Wikipedia Link".to_s, :count => 2
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
  end
end

require 'spec_helper'

describe "airports/edit" do
  before(:each) do
    @airport = assign(:airport, stub_model(Airport,
      :ident => "MyString",
      :type => "",
      :name => "MyString",
      :latitude_deg => 1.5,
      :longitude_deg => 1.5,
      :elevation_ft => 1,
      :continent => "MyString",
      :iso_country => "MyString",
      :iso_region => "MyString",
      :municipality => "MyString",
      :scheduled_service => "MyString",
      :gps_code => "MyString",
      :iata_code => "MyString",
      :local_code => "MyString",
      :home_link => "MyString",
      :wikipedia_link => "MyString",
      :keywords => "MyString"
    ))
  end

  it "renders the edit airport form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", airport_path(@airport), "post" do
      assert_select "input#airport_ident[name=?]", "airport[ident]"
      assert_select "input#airport_type[name=?]", "airport[type]"
      assert_select "input#airport_name[name=?]", "airport[name]"
      assert_select "input#airport_latitude_deg[name=?]", "airport[latitude_deg]"
      assert_select "input#airport_longitude_deg[name=?]", "airport[longitude_deg]"
      assert_select "input#airport_elevation_ft[name=?]", "airport[elevation_ft]"
      assert_select "input#airport_continent[name=?]", "airport[continent]"
      assert_select "input#airport_iso_country[name=?]", "airport[iso_country]"
      assert_select "input#airport_iso_region[name=?]", "airport[iso_region]"
      assert_select "input#airport_municipality[name=?]", "airport[municipality]"
      assert_select "input#airport_scheduled_service[name=?]", "airport[scheduled_service]"
      assert_select "input#airport_gps_code[name=?]", "airport[gps_code]"
      assert_select "input#airport_iata_code[name=?]", "airport[iata_code]"
      assert_select "input#airport_local_code[name=?]", "airport[local_code]"
      assert_select "input#airport_home_link[name=?]", "airport[home_link]"
      assert_select "input#airport_wikipedia_link[name=?]", "airport[wikipedia_link]"
      assert_select "input#airport_keywords[name=?]", "airport[keywords]"
    end
  end
end

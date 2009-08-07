require File.dirname(__FILE__) + '/../spec_helper'

describe "Globalize2Paperclipped tags" do
  
  before(:each) do
    I18n.locale = "en"
    @page = Factory.create(:page)
    @asset = Factory.create(:asset)
    Factory.create(:page_attachment, :page_id => @page.id, :asset_id => @asset.id)
  end
  
  describe "<r:if_assets_with_globalize />" do
    it "expands if the page has translated assets" do
      @page.
        should render("<r:if_assets>test</r:if_assets>").
        as("test")
    end
    
    it "does not expand if the page does not have translated assets" do
      switch_locale("ro") do
        @page.
          should render("<r:if_assets>test</r:if_assets>").
          as("")
      end
    end
  end
  
  describe "<r:unless_assets_with_globalize />" do
    it "expands if the page does not have translated assets" do
      switch_locale("ro") do
        @page.
          should render("<r:unless_assets>test</r:unless_assets>").
          as("test")
      end
    end
    
    it "does not expand if the page has translated assets" do
      @page.
        should render("<r:unless_assets>test</r:unless_assets>").
        as("")
    end
  end
  
  describe "<r:assets:if_translation_asset />" do
    it "expands if the asset is translated" do
      @page.
        should render("<r:assets:each locale='false'><r:if_translation_asset><r:title /></r:if_translation_asset></r:assets:each>").
        as(/Picture \d/)
    end
    
    it "does not expand if the asset is not translated" do
      switch_locale("ro") do
        @page.
          should render("<r:assets:each locale='false'><r:if_translation_asset><r:title /></r:if_translation_asset></r:assets:each>").
          as("")
      end
    end
  end
  
  describe "<r:assets:unless_translation_asset" do
    it "expands if the asset is no translated" do
      switch_locale("ro") do
        @page.
          should render("<r:assets:each locale='false'><r:unless_translation_asset>test</r:unless_translation_asset></r:assets:each>").
          as("test")
      end
    end
    
    it "does not expand if the asset is translated" do
      @page.
        should render("<r:assets:each locale='false'><r:unless_translation_asset>test</r:unless_translation_asset></r:assets:each>").
        as("")
    end
  end
  
  describe "<r:assets:each_with_globalize />" do
    it "renders only the assets translated for the current locale if 'locale' attribute is not set to 'false'" do
      @page.
        should render("<r:assets:each><r:title /></r:assets:each>").
        as(/Picture\d/)
    end
    
    it "renders all the attached assets if 'locale' attribute is set to 'false'" do
      @page.
        should render("<r:assets:each locale='false'><r:title /></r:assets:each>").
        as(/Picture \d/)
    end
  end
  
end
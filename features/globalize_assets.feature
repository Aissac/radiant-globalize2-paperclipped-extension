Feature: Globalizing assets
  In order to take advantage of the many languages I speak
  As an admin
  I want to be able to globalize my assets
  
  Background:
    Given I am logged in as an admin
    
  Scenario: Translating an asset
    Given an asset "Picture 1" exists
      And I am on the assets index page
      And I follow "Picture 1"
      And I follow "RO"
      And I fill in "Title" with "Imaginea 1"
      And I fill in "Caption" with "Imaginea 1 caption"
      And I press "Save Changes"
     Then I should see "Imaginea 1"
     When I follow "EN"
     Then I should see "Picture 1"
     
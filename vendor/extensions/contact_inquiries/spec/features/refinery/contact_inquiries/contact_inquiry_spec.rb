# encoding: utf-8
require "spec_helper"

module Refinery
  module ContactInquiries
    describe "contact_inquiries", type: :feature do

      before(:each) do
        Refinery::ContactInquiries::Engine::load_seed
      end

      describe "Create contact_inquiry" do

        before do
          visit refinery.new_contact_inquiries_contact_inquiry_path
        end

        it "should create a new item" do
          fill_in "contact_inquiry_name", :with => "Test"
          fill_in "contact_inquiry_email", :with => "Test"
          fill_in "contact_inquiry_subject", :with => "Test"
          fill_in "contact_inquiry_message", :with => "Test"

          click_button ::I18n.t('.refinery.contact_inquiries.contact_inquiries.new.send')

          expect(page).to have_content("Thank You")
          expect(Refinery::ContactInquiries::ContactInquiry.count).to eq(1)
        end
      end
    end
  end
end


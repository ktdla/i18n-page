# encoding: utf-8
require "spec_helper"

module Refinery
  module ContactInquiries
    module Admin
      describe ContactInquiry, type: :feature do
        refinery_login_with :refinery_user

       describe "contact_inquiries list" do
          before do
            FactoryGirl.create(:contact_inquiry, :name => "UniqueTitleOne")
            FactoryGirl.create(:contact_inquiry, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.contact_inquiries_admin_contact_inquiries_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

       describe "show" do
         let!(:contact_inquiry) do
            FactoryGirl.create(:contact_inquiry, :name => "UniqueTitleOne")
          end

         it "has expected text and menu" do
           visit refinery.contact_inquiries_admin_contact_inquiries_path

           click_link "Read the contact_inquiry"

           expect(page).to have_content("UniqueTitleOne")
           expect(page).not_to have_content("UniqueTitleTwo")

           within "#actions" do
             expect(page).to have_content("Age")
             expect(page).to have_content("Back to all contact_inquiries")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/contact_inquiries']")
             expect(page).to have_content("Remove this contact_inquiry forever")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/contact_inquiries/#{contact_inquiry.id}']")
           end
         end
       end

       describe "when no " do
         before { Refinery::ContactInquiries::ContactInquiry.destroy_all }

         context "contact_inquiries" do
           it "shows expected message" do
            visit refinery.contact_inquiries_admin_contact_inquiries_path

            expect(page).to have_content("You have not received any contact_inquiries yet.")

            end
           end

     end

      describe "action links" do
        before { visit refinery.contact_inquiries_admin_contact_inquiries_path }

        specify "in the side pane" do
          within "#actions" do
            expect(page).to have_content("Inbox")
            expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/contact_inquiries']")

            expect(page).to have_content("Update who gets notified")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/contact_inquiries/settings/contact_inquiry_notification_recipients/edit']")
            expect(page).to have_content("Edit confirmation email")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/contact_inquiries/settings/contact_inquiry_confirmation_message/edit']")
          end
        end
      end



        describe "destroy" do
          before { FactoryGirl.create(:contact_inquiry, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contact_inquiries_admin_contact_inquiries_path

            click_link "Remove this contact inquiry forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::ContactInquiries::ContactInquiry.count).to eq 0
          end
        end

          describe "destroy from contact_inquiry show page" do
          before { FactoryGirl.create(:contact_inquiry, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contact_inquiries_admin_contact_inquiry_path( :id => '1')

            click_link "Remove this contact inquiry forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::ContactInquiries::ContactInquiry.count).to eq 0
          end
          end

      end
    end
  end
end

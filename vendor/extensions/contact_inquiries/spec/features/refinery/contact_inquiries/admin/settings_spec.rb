# encoding: utf-8
require "spec_helper"

module Refinery
  module ContactInquiries
  describe "Settings", type: :feature do
    refinery_login_with :refinery_user

    describe "update who gets notified" do
      before do
        Rails.cache.clear
        Refinery::ContactInquiries::Setting.notification_recipients
      end

      it "sets receiver", :js => true do
        visit refinery.contact_inquiries_admin_contact_inquiries_path

        click_link ::I18n.t('update_notified', scope: 'refinery.contact_inquiries.admin.contact_inquiries.submenu')

        within_frame "dialog_iframe" do
          fill_in ::I18n.t('contact_inquiry_settings_value_name', scope: 'refinery.contact_inquiries.admin.settings.notification_recipients_form'), :with => "phil@refinerycms.com"
          click_button "submit_button"
        end

        expect(page).to have_content("Notification Recipients was successfully updated.")
      end
    end

    describe "updating confirmation email copy" do
      before do
        Rails.cache.clear
        Refinery::ContactInquiries::Setting.confirmation_message
        Refinery::ContactInquiries::Setting.confirmation_subject
      end

      it "sets subject and message", :js => true do
        visit refinery.contact_inquiries_admin_contact_inquiries_path

        click_link ::I18n.t('edit_confirmation_email', scope: 'refinery.contact_inquiries.admin.contact_inquiries.submenu')

        within_frame "dialog_iframe" do
          fill_in ::I18n.t('subject', scope: 'refinery.contact_inquiries.admin.settings.confirmation_email_form'), :with => "subject"
          fill_in ::I18n.t('message', scope: 'refinery.contact_inquiries.admin.settings.confirmation_email_form'), :with => "message"

          click_button "submit_button"
        end

        expect(page).to have_content("Confirmation Message was successfully updated.")
      end
    end

  end
  end
end

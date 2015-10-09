module Refinery
  module ContactInquiries
    class ContactInquiriesController < ::ApplicationController

      before_action :find_page, :only => [:create, :new]

      def index
        redirect_to refinery.new_contact_inquiries_contact_inquiry_path
      end

      def thank_you
        @page = Refinery::Page.where(link_url: "/contact_inquiries/thank_you").first
      end

      def new
        @contact_inquiry = ContactInquiry.new
      end

      def create
        @contact_inquiry = ContactInquiry.new(contact_inquiry_params)

        if @contact_inquiry.save
          begin
            Mailer.notification(@contact_inquiry, request).deliver
          rescue => e
            logger.warn "There was an error delivering the contact_inquiry notification.\n#{e.message}\n"
          end

          if ContactInquiry.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@contact_inquiry, request).deliver
            rescue => e
              logger.warn "There was an error delivering the contact_inquiry confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to ContactInquiry if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_contact_inquiries_contact_inquiries_path
        else
          render :action => 'new'
        end
      end

      protected

      def find_page
        @page = Refinery::Page.where(link_url: "/contact_inquiries/new").first
      end

      private

    # Only allow a trusted parameter "white list" through.
      def contact_inquiry_params
        params.require(:contact_inquiry).permit(:name, :email, :subject, :message)
      end
    end
  end
end

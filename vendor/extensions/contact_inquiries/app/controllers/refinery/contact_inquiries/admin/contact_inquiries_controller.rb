module Refinery
  module ContactInquiries
    module Admin
      class ContactInquiriesController < Refinery::AdminController

        crudify :'refinery/contact_inquiries/contact_inquiry', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          if searching?
            search_all_contact_inquiries
          else
            find_all_contact_inquiries
          end

          @grouped_contact_inquiries = group_by_date(@contact_inquiries)
        end


        private

        # Only allow a trusted parameter "white list" through.
        def contact_inquiry_params
          params.require(:contact_inquiry).permit(:name, :email, :subject, :message)
        end
      end
    end
  end
end

require "spec_helper"

module Refinery
  module ContactInquiries
    describe ContactInquiriesController, type: :controller do

      before do
        @route = Refinery::ContactInquiries::Engine.routes
        Refinery::ContactInquiries::Engine::load_seed

        @new_page = Refinery::Page.new
        allow(Refinery::Page).to receive_messages(:where => [ @new_page ])
      end

      describe "GET new" do
        it "before_filter assigns a new contact_inquiry" do
          get :new
          expect(assigns(:contact_inquiry)).to be_a_new(ContactInquiry)
        end
        it "before_filter assigns page to contact_inquiries/new" do
          get :new
          expect(assigns(:page)).to eq @new_page
        end
      end

      describe "POST create" do

        before{
          allow_any_instance_of(ContactInquiry).to receive(:save).and_return( true )
        }


        it "before_filter assigns page to contact_inquiries/new" do
          post :create, contact_inquiry: {name: "foo", email: "foo", subject: "foo", }
          expect(assigns(:page)).to eq @new_page
        end

        it "before_filter assigns a new contact_inquiry" do
          post :create, contact_inquiry: {name: "foo", email: "foo", subject: "foo", }
          expect(assigns(:contact_inquiry)).to be_a_new(ContactInquiry)
        end

        it "redirects to thank_you" do
          post :create, contact_inquiry: {name: "foo", email: "foo", subject: "foo", }
          expect(response).to redirect_to "/contact_inquiries/thank_you"
        end

        describe "when it can't save the contact_inquiry" do

          before {
          allow_any_instance_of(ContactInquiry).to receive(:save).and_return( false )
          }

          it "redirects to new if it can't save" do
            post :create, contact_inquiry: {name: "foo", email: "foo", subject: "foo", }

            expect(response).to render_template(:new)
          end
        end

      end
    end
  end
end

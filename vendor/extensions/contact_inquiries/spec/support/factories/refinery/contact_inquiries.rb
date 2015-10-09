
FactoryGirl.define do
  factory :contact_inquiry, :class => Refinery::ContactInquiries::ContactInquiry do
    sequence(:name) { |n| "refinery#{n}" }
  end
end


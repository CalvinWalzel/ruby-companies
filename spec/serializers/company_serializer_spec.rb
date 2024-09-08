# frozen_string_literal: true

require "rails_helper"

RSpec.describe(CompanySerializer, type: :serializer) do
  require_factories

  let(:company) { create(:company) }
  subject { CompanySerializer.one(company) }

  describe "#logo_url" do
    context "when logo is attached" do
      let(:logo_url) { "/path/to/logo.png" }

      before do
        allow(company).to(receive_message_chain(:logo, :attached?).and_return(true))
        allow(company).to(receive_message_chain(:logo, :variant, :processed).and_return(
          instance_double(ActiveStorage::VariantWithRecord),
        ))
        allow_any_instance_of(CompanySerializer).to(receive(:rails_representation_url).and_return(logo_url))
      end

      it "returns the correct logo URL" do
        expect(subject[:logoUrl]).to(eq(logo_url))
      end
    end

    context "when logo is not attached" do
      before do
        allow(company).to(receive_message_chain(:logo, :attached?).and_return(false))
      end

      it "returns nil" do
        expect(subject[:logoUrl]).to(be_nil)
      end
    end
  end
end

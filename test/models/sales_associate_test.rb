require 'test_helper'

class SalesAssociateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add_language" do
    assert_difference('SalesAssociateLanguage.count') do
      sales_associate = create(:john)
      sales_associate.languages << create(:english)
      sales_associate.save
    end
  end
end

require 'test_helper'

class SalesAssociateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add_language" do
    assert_difference('SalesAssociateLanguage.count') do
      sales_associate = sales_associates(:john)
      sales_associate.languages << languages(:english)
      sales_associate.save
    end
  end
end

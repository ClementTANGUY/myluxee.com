require 'test_helper'

class RatingTest < ActiveSupport::TestCase

  setup do
    @account = create(:peter)
    @sales_associate = create(:john)
  end

  test "success inclusion" do
    assert_difference('Rating.count') do
      rating = Rating.create sales_associate: @sales_associate, account: @account, :welcome_score => 4,:appearance_score => 4,
                             :knowledge_score => 4, :listening_score => 4,
                             :global_score => 4
      assert_equal rating.sales_associate, @sales_associate
      assert_equal rating.account, @account
    end
  end

  test "failer out of scope inclusion" do
    assert_difference('Rating.count', 0) do
      rating = Rating.create sales_associate: @sales_associate, account: @account, :welcome_score => 4,:appearance_score => 4,
                             :knowledge_score => 10, :listening_score => 4,
                             :global_score => 9
    end
  end
end

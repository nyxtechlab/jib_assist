# ## Schema Information
#
# Table name: `bots`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `bigint`           | `not null, primary key`
# **`config_store`**  | `json`             |
# **`name`**          | `text`             |
# **`platform`**      | `text`             |
# **`created_at`**    | `datetime`         | `not null`
# **`updated_at`**    | `datetime`         | `not null`
#
require "test_helper"

class BotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

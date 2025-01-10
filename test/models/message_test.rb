# ## Schema Information
#
# Table name: `messages`
#
# ### Columns
#
# Name                    | Type               | Attributes
# ----------------------- | ------------------ | ---------------------------
# **`id`**                | `bigint`           | `not null, primary key`
# **`botname`**           | `text`             |
# **`content`**           | `text`             |
# **`extra_data_store`**  | `json`             |
# **`message_type`**      | `text`             |
# **`platform`**          | `text`             |
# **`raw_data_store`**    | `json`             |
# **`sent_at`**           | `datetime`         |
# **`created_at`**        | `datetime`         | `not null`
# **`updated_at`**        | `datetime`         | `not null`
# **`channel_id`**        | `text`             |
# **`message_id`**        | `text`             |
# **`user_id`**           | `text`             |
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

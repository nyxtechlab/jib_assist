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
# **`type`**          | `text`             |
# **`created_at`**    | `datetime`         | `not null`
# **`updated_at`**    | `datetime`         | `not null`
#
class Bot < ApplicationRecord
  store :config_store, accessors: %i[line_client_token telegram_client_token]
end

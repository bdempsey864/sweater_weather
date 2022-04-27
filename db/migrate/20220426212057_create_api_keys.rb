class CreateApiKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :api_keys, force: :cascade do |t|
      t.integer "bearer_id", null: false
      t.string "bearer_type", null: false
      t.string "token", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["bearer_id", "bearer_type"], name: "index_api_keys_on_bearer_id_and_bearer_type"
      t.index ["token"], name: "index_api_keys_on_token", unique: true
    end
  end
end

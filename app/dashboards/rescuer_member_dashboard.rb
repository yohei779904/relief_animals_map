require "administrate/base_dashboard"

class RescuerMemberDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    rescue_station_name: Field::String,
    rescue_station_name_kana: Field::String,
    representative: Field::String,
    representative_lastname_kana: Field::String,
    representative_firstname_kana: Field::String,
    email: Field::String,
    phone_number: Field::String,
    post_code: Field::String,
    home_address: Field::String,
    password_digest: Field::String,
    start_date: Field::Date,
    end_date: Field::Date,
    homepage: Field::String,
    comment: Field::Text,
    suspended: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
  id
  rescue_station_name
  rescue_station_name_kana
  representative
  representative_lastname_kana
  representative_firstname_kana
  email
  phone_number
  post_code
  home_address
  password_digest
  start_date
  end_date
  homepage
  comment
  suspended
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
  id
  rescue_station_name
  rescue_station_name_kana
  representative
  representative_lastname_kana
  representative_firstname_kana
  email
  phone_number
  post_code
  home_address
  password_digest
  start_date
  end_date
  homepage
  comment
  suspended
  created_at
  updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
  rescue_station_name
  rescue_station_name_kana
  representative
  representative_lastname_kana
  representative_firstname_kana
  email
  phone_number
  post_code
  home_address
  password_digest
  start_date
  end_date
  homepage
  comment
  suspended
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how rescuer members are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(rescuer_member)
  #   "RescuerMember ##{rescuer_member.id}"
  # end
end

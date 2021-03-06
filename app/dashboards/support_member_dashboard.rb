require "administrate/base_dashboard"

class SupportMemberDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    name_kana: Field::String,
    email: Field::String,
    password_digest: Field::String,
    suspended: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    name_kana
    email
    password_digest
    suspended
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    name_kana
    email
    password_digest
    suspended
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    name_kana
    email
    password_digest
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

  # Overwrite this method to customize how support members are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(support_member)
  #   "SupportMember ##{support_member.id}"
  # end
end

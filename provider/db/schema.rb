# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160824140645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "unaccent"

  create_table "airlines", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.string   "country",    limit: 255
    t.boolean  "active"
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
  end

  add_index "airlines", ["code"], name: "index_airlines_on_code", using: :btree

  create_table "airport_exts", force: :cascade do |t|
    t.string  "identity"
    t.string  "iata_code"
    t.string  "city_code"
    t.string  "airport_type"
    t.string  "name"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "elevation"
    t.string  "continent_code"
    t.string  "iso_country_code"
    t.string  "iso_region_code"
    t.string  "city"
    t.string  "country"
    t.boolean "scheduled_service"
    t.string  "gps_code"
    t.string  "local_code"
    t.string  "keywords"
    t.string  "region"
    t.string  "search_code"
    t.integer "hotel_count"
    t.string  "title"
  end

  create_table "airports", force: :cascade do |t|
    t.string   "city",           limit: 255
    t.string   "code",           limit: 255
    t.string   "country",        limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name",           limit: 255
    t.string   "gmt_offset",     limit: 255
    t.string   "dst_code",       limit: 255
    t.datetime "created_at",                 precision: 6
    t.datetime "updated_at",                 precision: 6
    t.integer  "property_count"
    t.string   "display_name"
  end

  add_index "airports", ["code"], name: "index_airports_on_code", using: :btree
  add_index "airports", ["property_count"], name: "index_airports_on_property_count", using: :btree

  create_table "booking_attachments", force: :cascade do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "booking_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "booking_flight_segments", force: :cascade do |t|
    t.integer  "booking_id"
    t.string   "origin_location_code",      limit: 255
    t.string   "destination_location_code", limit: 255
    t.integer  "air_miles_flown"
    t.datetime "arrival_date_time",                     precision: 6
    t.string   "day_of_week_ind",           limit: 255
    t.datetime "departure_date_time",                   precision: 6
    t.integer  "elapsed_time"
    t.string   "e_ticket",                  limit: 255
    t.string   "flight_number",             limit: 255
    t.integer  "number_in_party"
    t.string   "res_book_desig_code",       limit: 255
    t.integer  "segment_number"
    t.string   "special_meal",              limit: 255
    t.string   "status",                    limit: 255
    t.integer  "stop_quantity"
    t.string   "equipment",                 limit: 255
    t.string   "meal_code",                 limit: 255
    t.string   "marketing_airline",         limit: 255
    t.string   "operating_airline",         limit: 255
    t.datetime "updated_arrival_time",                  precision: 6
    t.datetime "updated_departure_time",                precision: 6
    t.datetime "created_at",                            precision: 6
    t.datetime "updated_at",                            precision: 6
    t.text     "xml"
  end

  add_index "booking_flight_segments", ["booking_id"], name: "index_booking_flight_segments_on_booking_id", using: :btree

  create_table "booking_travelers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "booking_id"
    t.string   "name_number",   limit: 255
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.date     "date_of_birth"
    t.string   "gender",        limit: 255
    t.datetime "created_at",                precision: 6
    t.datetime "updated_at",                precision: 6
    t.string   "email",         limit: 255
  end

  add_index "booking_travelers", ["booking_id"], name: "index_booking_travelers_on_booking_id", using: :btree
  add_index "booking_travelers", ["user_id"], name: "index_booking_travelers_on_user_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "record_locator",              limit: 255
    t.string   "origin_code",                 limit: 255
    t.string   "destination_code",            limit: 255
    t.datetime "departs_at",                              precision: 6
    t.datetime "returns_at",                              precision: 6
    t.string   "hotel_code",                  limit: 255
    t.integer  "passenger_count"
    t.integer  "room_count"
    t.datetime "created_at",                              precision: 6
    t.datetime "updated_at",                              precision: 6
    t.string   "status",                      limit: 255
    t.text     "notes"
    t.integer  "updated_by"
    t.text     "segment_key_string"
    t.date     "check_in_at"
    t.float    "quoted_price"
    t.float    "total_price"
    t.float    "total_paid"
    t.string   "destination_airport_code",    limit: 255
    t.string   "room_rate_code",              limit: 255
    t.string   "hotel_confirmation_code"
    t.float    "quoted_air_price"
    t.string   "passenger_type"
    t.string   "intent"
    t.string   "segment_booking_code_string"
    t.string   "title"
    t.string   "itinerary_pdf_file_name"
    t.string   "itinerary_pdf_content_type"
    t.integer  "itinerary_pdf_file_size"
    t.datetime "itinerary_pdf_updated_at"
    t.text     "description"
    t.string   "trip_type"
  end

  add_index "bookings", ["record_locator"], name: "index_bookings_on_record_locator", using: :btree
  add_index "bookings", ["status"], name: "index_bookings_on_status", using: :btree
  add_index "bookings", ["updated_by"], name: "index_bookings_on_updated_by", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "braintree_responses", force: :cascade do |t|
    t.json     "response"
    t.integer  "payment_id"
    t.integer  "payment_method_id"
    t.string   "response_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer  "chat_id"
    t.integer  "user_id"
    t.text     "body"
    t.text     "meta_data"
    t.string   "status",     limit: 255
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
  end

  add_index "chat_messages", ["chat_id"], name: "index_chat_messages_on_chat_id", using: :btree
  add_index "chat_messages", ["user_id"], name: "index_chat_messages_on_user_id", using: :btree

  create_table "chats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.string   "topic",                         limit: 255
    t.text     "meta_data"
    t.string   "status",                        limit: 255
    t.datetime "created_at",                                precision: 6
    t.datetime "updated_at",                                precision: 6
    t.string   "token",                         limit: 255
    t.integer  "booking_id"
    t.integer  "chat_messages_count",                                     default: 0
    t.integer  "last_opened_by"
    t.integer  "unread_messages_from_agent",                              default: 0
    t.integer  "unread_messages_from_traveler",                           default: 0
    t.boolean  "dormant",                                                 default: false
  end

  add_index "chats", ["booking_id"], name: "index_chats_on_booking_id", using: :btree
  add_index "chats", ["token"], name: "index_chats_on_token", using: :btree
  add_index "chats", ["trip_id"], name: "index_chats_on_trip_id", using: :btree
  add_index "chats", ["user_id"], name: "index_chats_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.string   "state",      limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
  end

  add_index "cities", ["code"], name: "index_cities_on_code", using: :btree

  create_table "collection_hotels", force: :cascade do |t|
    t.integer  "hotel_collection_id"
    t.integer  "hotel_id"
    t.text     "description"
    t.integer  "sequence"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "collection_images", force: :cascade do |t|
    t.string   "title"
    t.text     "caption"
    t.integer  "sequence"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "hotel_collection_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "destination_images", force: :cascade do |t|
    t.integer  "destination_id"
    t.string   "title"
    t.text     "caption"
    t.integer  "sequence"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "iata_code"
    t.string   "country_code"
    t.string   "region"
    t.string   "name"
    t.string   "subtitle"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "hotel_count"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "country"
    t.string   "city"
    t.string   "sub_region"
    t.integer  "image_offset_pct"
    t.string   "departure_time",          default: "11:00"
    t.integer  "min_date_shift",          default: 0
    t.integer  "max_date_shift",          default: 1
    t.integer  "average_flight_duration"
  end

  add_index "destinations", ["country_code"], name: "index_destinations_on_country_code", using: :btree
  add_index "destinations", ["iata_code"], name: "index_destinations_on_iata_code", using: :btree
  add_index "destinations", ["region", "country_code"], name: "index_destinations_on_region_and_country_code", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.string   "iata_code",  limit: 255
    t.string   "icao_code",  limit: 255
    t.string   "name",       limit: 255
    t.string   "type_code",  limit: 255
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
  end

  add_index "equipment", ["iata_code"], name: "index_equipment_on_iata_code", using: :btree

  create_table "flight_date_offsets", force: :cascade do |t|
    t.integer  "origin_airport_id"
    t.string   "origin"
    t.integer  "destination_airport_id"
    t.string   "destination"
    t.float    "minimum_offset"
    t.float    "maximum_offset"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "outbound_duration"
    t.integer  "return_duration"
    t.float    "average_offset"
    t.float    "mode_offset"
    t.integer  "force_offset_min"
    t.integer  "force_offset_max"
    t.boolean  "suppress",               default: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255,               null: false
    t.integer  "sluggable_id",                             null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at",                 precision: 6
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hod_availabilities", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.date     "check_in_at"
    t.date     "check_out_at"
    t.float    "min_rate"
    t.text     "rate_codes",      default: [],                 array: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "stale",           default: false
    t.float    "min_total"
    t.integer  "error_count",     default: 0
    t.integer  "passenger_count"
  end

  add_index "hod_availabilities", ["hotel_code", "check_in_at", "check_out_at"], name: "hod_availability_idx_hotel_code_and_dates", using: :btree
  add_index "hod_availabilities", ["hotel_code", "passenger_count", "check_in_at", "check_out_at"], name: "hod_availability_idx_hotel_code_pax_and_dates", using: :btree
  add_index "hod_availabilities", ["hotel_id", "check_in_at", "check_out_at"], name: "hod_availability_idx_hotel_id_and_dates", using: :btree
  add_index "hod_availabilities", ["hotel_id", "passenger_count", "check_in_at", "check_out_at"], name: "hod_availability_idx_hotel_id_pax_and_dates", using: :btree

  create_table "hod_availability_rates", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.integer  "hotel_product_id"
    t.string   "product_code"
    t.integer  "hotel_room_id"
    t.boolean  "available"
    t.float    "amount"
    t.string   "low_inventory"
    t.date     "check_in_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "check_out_at"
    t.float    "total_pricing"
    t.integer  "passenger_count"
  end

  add_index "hod_availability_rates", ["hotel_code", "check_in_at", "check_out_at"], name: "hod_availability_rates_idx_hotel_code_and_dates", using: :btree
  add_index "hod_availability_rates", ["hotel_code", "passenger_count", "check_in_at", "check_out_at"], name: "hod_availability_rates_idx_hotel_code_pax_and_dates", using: :btree
  add_index "hod_availability_rates", ["hotel_id", "check_in_at", "check_out_at"], name: "hod_availability_rates_idx_hotel_id_and_dates", using: :btree
  add_index "hod_availability_rates", ["hotel_id", "passenger_count", "check_in_at", "check_out_at"], name: "hod_availability_rates_idx_hotel_id_pax_and_dates", using: :btree
  add_index "hod_availability_rates", ["hotel_product_id", "check_in_at"], name: "index_availabilities_on_hotel_product_id_and_date", using: :btree
  add_index "hod_availability_rates", ["hotel_product_id"], name: "index_availabilities_on_hotel_product_id", using: :btree
  add_index "hod_availability_rates", ["hotel_room_id"], name: "index_availabilities_on_hotel_room_id", using: :btree

  create_table "hot_availabilities", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.integer  "month"
    t.integer  "day"
    t.integer  "duration"
    t.date     "check_in_at"
    t.date     "check_out_at"
    t.float    "min_rate"
    t.float    "max_rate"
    t.string   "rate_codes_string"
    t.string   "status"
    t.boolean  "active"
    t.datetime "last_run"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "passenger_count"
  end

  add_index "hot_availabilities", ["hotel_code", "check_in_at", "check_out_at"], name: "idx_hot_availabilities_code_check_in_check_out", using: :btree
  add_index "hot_availabilities", ["hotel_code", "passenger_count", "check_in_at", "check_out_at"], name: "idx_hot_availabilities_code_pax_check_in_check_out", using: :btree
  add_index "hot_availabilities", ["hotel_code"], name: "index_hot_availabilities_on_hotel_code", using: :btree
  add_index "hot_availabilities", ["hotel_id", "hotel_code", "month", "day", "duration"], name: "idx_hot_availabilities_id_code_month_day_duration", using: :btree
  add_index "hot_availabilities", ["hotel_id", "passenger_count", "hotel_code", "month", "day", "duration"], name: "idx_hot_availabilities_id_code_pax_month_day_duration", using: :btree

  create_table "hotel_closed_periods", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_collections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "slug"
    t.boolean  "homepage",    default: false
  end

  add_index "hotel_collections", ["slug"], name: "index_hotel_collections_on_slug", unique: true, using: :btree

  create_table "hotel_minimum_stays", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "minimum_night_stay"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "hotel_packages", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.string   "package_code"
    t.string   "sabre_name"
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "approved_at",  precision: 6
    t.integer  "approved_by"
    t.datetime "created_at",   precision: 6, null: false
    t.datetime "updated_at",   precision: 6, null: false
    t.string   "package_type"
    t.float    "commission"
    t.boolean  "net_rate"
  end

  add_index "hotel_packages", ["hotel_code"], name: "index_hotel_packages_on_hotel_code", using: :btree
  add_index "hotel_packages", ["hotel_id"], name: "index_hotel_packages_on_hotel_id", using: :btree
  add_index "hotel_packages", ["package_code"], name: "index_hotel_packages_on_package_code", using: :btree

  create_table "hotel_press_items", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "sequence",    limit: 255
    t.string   "url",         limit: 255
    t.datetime "created_at",              precision: 6
    t.datetime "updated_at",              precision: 6
  end

  create_table "hotel_products", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code",       limit: 255
    t.string   "name",             limit: 255
    t.string   "description",      limit: 255
    t.string   "identifier",       limit: 255
    t.boolean  "active"
    t.string   "package",          limit: 255
    t.datetime "created_at",                   precision: 6
    t.datetime "updated_at",                   precision: 6
    t.integer  "hotel_room_id"
    t.integer  "hotel_package_id"
    t.string   "room_code"
    t.string   "package_code"
    t.datetime "approved_at",                  precision: 6
    t.integer  "approved_by"
  end

  add_index "hotel_products", ["hotel_code"], name: "index_hotel_products_on_hotel_code", using: :btree
  add_index "hotel_products", ["hotel_id", "identifier", "package"], name: "index_hotel_products_on_hotel_id_and_identifier_and_package", using: :btree
  add_index "hotel_products", ["hotel_id"], name: "index_hotel_products_on_hotel_id", using: :btree
  add_index "hotel_products", ["id", "identifier"], name: "hotel_products_idx_id_and_identifier", using: :btree

  create_table "hotel_room_rates", force: :cascade do |t|
    t.integer  "hotel_product_id"
    t.integer  "hotel_id"
    t.string   "hotel_code",                    limit: 255
    t.date     "check_in_at"
    t.date     "check_out_at"
    t.boolean  "direct_connect"
    t.string   "guaranteed_surcharge_required", limit: 255
    t.boolean  "guaranteed_rate_program"
    t.boolean  "hrd_required"
    t.string   "iata_id",                       limit: 255
    t.string   "iata_product_name",             limit: 255
    t.boolean  "low_inventory"
    t.boolean  "rate_change"
    t.boolean  "rate_conversion"
    t.boolean  "special_offer"
    t.boolean  "non_commission"
    t.string   "commission",                    limit: 255
    t.text     "description"
    t.float    "amount"
    t.boolean  "has_changed"
    t.string   "currency",                      limit: 255
    t.boolean  "package"
    t.string   "room_location_code",            limit: 255
    t.string   "room_type_code",                limit: 255
    t.boolean  "room_on_request"
    t.float    "total_pricing"
    t.string   "pricing_disclaimer",            limit: 255
    t.float    "total_taxes"
    t.float    "total_surcharges"
    t.integer  "range_count"
    t.datetime "created_at",                                precision: 6
    t.datetime "updated_at",                                precision: 6
    t.integer  "cancellation_numeric"
    t.string   "cancellation_text",             limit: 255
    t.string   "cancellation_option"
    t.integer  "guest_count"
  end

  add_index "hotel_room_rates", ["hotel_id", "check_in_at", "check_out_at", "iata_id", "currency"], name: "idx_hotel_room_rates_on_dates_iata_id_and_currency", using: :btree
  add_index "hotel_room_rates", ["hotel_id", "iata_id"], name: "index_hotel_room_rates_on_hotel_id_and_iata_id", using: :btree

  create_table "hotel_rooms", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "hotel_code"
    t.string   "room_code"
    t.string   "sabre_name"
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "approved_at", precision: 6
    t.integer  "approved_by"
    t.datetime "created_at",  precision: 6, null: false
    t.datetime "updated_at",  precision: 6, null: false
    t.integer  "occupancy"
    t.text     "amenities"
    t.string   "category"
    t.string   "image_url"
  end

  add_index "hotel_rooms", ["hotel_code"], name: "index_hotel_rooms_on_hotel_code", using: :btree
  add_index "hotel_rooms", ["hotel_id"], name: "index_hotel_rooms_on_hotel_id", using: :btree
  add_index "hotel_rooms", ["room_code"], name: "index_hotel_rooms_on_room_code", using: :btree

  create_table "hotels", force: :cascade do |t|
    t.string   "hotel_code",              limit: 255
    t.boolean  "active"
    t.string   "chain_name",              limit: 255
    t.string   "name",                    limit: 255
    t.string   "city_code",               limit: 255
    t.string   "location_description",    limit: 255
    t.string   "subtitle",                limit: 255
    t.string   "address",                 limit: 255
    t.string   "city",                    limit: 255
    t.string   "state",                   limit: 255
    t.string   "postalcode",              limit: 255
    t.string   "country_code",            limit: 255
    t.string   "phone",                   limit: 255
    t.string   "fax",                     limit: 255
    t.string   "url",                     limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "reservations_phone",      limit: 255
    t.string   "reservations_email",      limit: 255
    t.text     "lark_amenities"
    t.text     "description"
    t.text     "selling_points"
    t.text     "insider_experience"
    t.text     "family_activities"
    t.text     "activities_detail"
    t.text     "service_and_vibe"
    t.text     "to_do_and_see"
    t.text     "great_for"
    t.boolean  "has_restaurant"
    t.text     "restaurant"
    t.text     "restaurant_nearby"
    t.text     "bar_lounge"
    t.integer  "rating_diamond"
    t.integer  "rating_star"
    t.integer  "ntm_rating"
    t.integer  "total_rooms"
    t.integer  "number_rooms"
    t.integer  "number_suites"
    t.integer  "number_villas"
    t.string   "hotel_group_affiliation", limit: 255
    t.string   "golf",                    limit: 255
    t.text     "golf_detail"
    t.text     "nightlife_detail"
    t.integer  "commision"
    t.text     "booking_instructions"
    t.text     "fitness_detail"
    t.text     "airport_details"
    t.text     "transfer_details"
    t.boolean  "all_inclusive"
    t.boolean  "non_smoking"
    t.datetime "created_at",                          precision: 6
    t.datetime "updated_at",                          precision: 6
    t.string   "slug",                    limit: 255
    t.string   "room_code_regex"
    t.string   "package_code_regex"
    t.boolean  "enabled",                                           default: false
    t.text     "editorial_it_is"
    t.text     "editorial_it_isnt"
    t.text     "editorial_review"
    t.text     "editorial_location"
    t.text     "editorial_because"
    t.text     "editorial_moment"
    t.text     "skylark_amenities"
    t.text     "selected_airports",                                 default: [],    array: true
    t.boolean  "disable_law",                                       default: false
  end

  add_index "hotels", ["city_code"], name: "index_hotels_on_city_code", using: :btree
  add_index "hotels", ["hotel_code"], name: "index_hotels_on_hotel_code", using: :btree
  add_index "hotels", ["slug"], name: "index_hotels_on_slug", unique: true, using: :btree

  create_table "invitation_campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "subject"
    t.string   "from"
    t.string   "reply_to"
    t.text     "message"
    t.integer  "invitation_template_id"
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "csv_upload_file_name"
    t.string   "csv_upload_content_type"
    t.integer  "csv_upload_file_size"
    t.datetime "csv_upload_updated_at"
  end

  create_table "invitation_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "default_subject"
    t.text     "description"
    t.text     "default_message"
    t.integer  "created_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "template_file_name"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "recipient_name"
    t.string   "token"
    t.datetime "sent_at",         precision: 6
    t.datetime "opened_at",       precision: 6
    t.datetime "created_at",      precision: 6, null: false
    t.datetime "updated_at",      precision: 6, null: false
    t.integer  "send_count"
    t.string   "template"
    t.text     "message"
    t.integer  "campaign_id"
    t.string   "sendgrid_status"
  end

  add_index "invitations", ["campaign_id"], name: "index_invitations_on_campaign_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.text     "notes"
    t.text     "terms"
    t.text     "air_terms"
    t.text     "hotel_terms"
    t.datetime "cancellation_date"
    t.float    "cancellation_fee"
    t.text     "description"
    t.datetime "change_by"
    t.float    "change_fee"
    t.float    "amount_due"
    t.integer  "booking_id"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "introduction"
    t.text     "payment_for"
    t.string   "status",            default: "new"
    t.integer  "payment_id"
    t.integer  "agent_id"
  end

  create_table "newsletter_images", force: :cascade do |t|
    t.integer  "newsletter_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.string   "last_four_digits"
    t.string   "nonce"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "card_type"
    t.string   "cardholder_name"
    t.string   "expiration_month"
    t.integer  "expiration_year"
    t.string   "postal_code"
    t.json     "response"
    t.boolean  "valid_card",       default: false
    t.boolean  "active",           default: true
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.integer  "booking_id"
    t.json     "response"
    t.boolean  "success"
    t.string   "status"
    t.string   "message"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "payment_method_id"
    t.string   "transaction_id"
    t.json     "settlement_response"
    t.datetime "settled_at"
    t.float    "cancellation_fee"
    t.datetime "cancel_by"
    t.text     "terms"
    t.datetime "voided_at"
    t.text     "notes"
  end

  add_index "payments", ["booking_id"], name: "index_payments_on_booking_id", using: :btree
  add_index "payments", ["payment_method_id"], name: "index_payments_on_payment_method_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "price_adjustments", force: :cascade do |t|
    t.integer  "booking_id"
    t.float    "previous_total"
    t.float    "adjusted_total"
    t.text     "reason"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "price_adjustments", ["booking_id"], name: "index_price_adjustments_on_booking_id", using: :btree

  create_table "promo_inquiries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "promotion_link_id"
    t.string   "depart_text"
    t.string   "travel_length"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "primary_phone"
    t.string   "email"
    t.integer  "passenger_count"
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "origin"
  end

  create_table "promotion_link_date_ranges", force: :cascade do |t|
    t.integer  "promotion_link_id"
    t.date     "departs_at"
    t.date     "returns_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "promotion_link_date_ranges", ["promotion_link_id"], name: "index_promotion_link_date_ranges_on_promotion_link_id", using: :btree

  create_table "promotion_links", force: :cascade do |t|
    t.string   "promo_code"
    t.string   "cabin"
    t.string   "destination"
    t.string   "origin"
    t.integer  "passenger_count"
    t.integer  "room_count"
    t.string   "property_id"
    t.date     "expiration_date"
    t.text     "expiration_message"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "title"
    t.text     "description"
    t.string   "subtitle"
    t.float    "starting_price"
    t.boolean  "disabled",           default: false
  end

  create_table "property_images", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "title",              limit: 255
    t.text     "description"
    t.string   "position",           limit: 255
    t.integer  "sequence"
    t.datetime "created_at",                     precision: 6
    t.datetime "updated_at",                     precision: 6
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at",               precision: 6
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.integer  "sequence"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "regions", ["lft"], name: "index_regions_on_lft", using: :btree
  add_index "regions", ["parent_id"], name: "index_regions_on_parent_id", using: :btree
  add_index "regions", ["rgt"], name: "index_regions_on_rgt", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  precision: 6, null: false
    t.datetime "updated_at",  precision: 6, null: false
  end

  create_table "sabre_amenities", force: :cascade do |t|
    t.string   "sabre_code", limit: 255
    t.string   "name",       limit: 255
    t.string   "input_type", limit: 255
    t.string   "category",   limit: 255
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
  end

  add_index "sabre_amenities", ["category"], name: "index_sabre_amenities_on_category", using: :btree
  add_index "sabre_amenities", ["sabre_code"], name: "index_sabre_amenities_on_sabre_code", using: :btree

  create_table "sabre_amenity_values", force: :cascade do |t|
    t.integer  "sabre_amenity_id"
    t.integer  "sabre_hotel_id"
    t.string   "value",            limit: 255
    t.datetime "created_at",                   precision: 6
    t.datetime "updated_at",                   precision: 6
  end

  add_index "sabre_amenity_values", ["sabre_amenity_id"], name: "index_sabre_amenity_values_on_sabre_amenity_id", using: :btree
  add_index "sabre_amenity_values", ["sabre_hotel_id"], name: "index_sabre_amenity_values_on_sabre_hotel_id", using: :btree

  create_table "sabre_booked_flight_segments", force: :cascade do |t|
    t.integer  "segment_number"
    t.datetime "arrival_date_time"
    t.datetime "departure_date_time"
    t.string   "flight_number"
    t.integer  "number_in_party"
    t.string   "special_meal"
    t.string   "origin_location"
    t.string   "destination_location"
    t.datetime "updated_arrival_time"
    t.datetime "updated_departure_time"
    t.string   "equipment"
    t.integer  "air_miles_flown"
    t.string   "marketing_airline"
    t.string   "operating_airline"
    t.integer  "elapsed_time"
    t.string   "e_ticket"
    t.integer  "stop_quantity"
    t.string   "status"
    t.string   "meal_code"
    t.integer  "sabre_booking_id"
    t.string   "operating_airline_record"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "airline_record_locator"
    t.string   "seat_numbers"
  end

  create_table "sabre_booked_hotel_segments", force: :cascade do |t|
    t.integer  "segment_number"
    t.string   "status"
    t.string   "hotel_code"
    t.string   "hotel_city_code"
    t.string   "hotel_name"
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer  "duration"
    t.string   "room_type_code"
    t.integer  "size_of_party"
    t.integer  "number_of_rooms"
    t.integer  "sabre_booking_id"
    t.string   "confirmation_number"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "phone"
  end

  create_table "sabre_bookings", force: :cascade do |t|
    t.string   "record_locator"
    t.datetime "departs_at"
    t.datetime "returns_at"
    t.text     "serialized_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "sabre_error_items", force: :cascade do |t|
    t.string   "type",          limit: 255
    t.string   "code",          limit: 255
    t.string   "severity",      limit: 255
    t.string   "message_class", limit: 255
    t.text     "message"
    t.text     "short_text"
    t.datetime "created_at",                precision: 6
    t.datetime "updated_at",                precision: 6
    t.string   "error_code",    limit: 255
  end

  create_table "sabre_exception_errors", force: :cascade do |t|
    t.integer  "sabre_response_exception_id"
    t.integer  "sabre_error_item_id"
    t.datetime "created_at",                              precision: 6
    t.datetime "updated_at",                              precision: 6
    t.datetime "timestamp",                               precision: 6
    t.string   "error_message",               limit: 255
  end

  add_index "sabre_exception_errors", ["sabre_error_item_id"], name: "index_sabre_exception_errors_on_sabre_error_item_id", using: :btree
  add_index "sabre_exception_errors", ["sabre_response_exception_id"], name: "index_sabre_exception_errors_on_sabre_response_exception_id", using: :btree

  create_table "sabre_hotels", force: :cascade do |t|
    t.string   "hotel_code",           limit: 255
    t.string   "hotel_name",           limit: 255
    t.string   "chain_code",           limit: 255
    t.string   "hotel_city_code",      limit: 255
    t.string   "geo_confidence_level", limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address",              limit: 255
    t.string   "fax",                  limit: 255
    t.string   "phone",                limit: 255
    t.string   "country_code",         limit: 255
    t.integer  "ntm_rating"
    t.text     "description"
    t.text     "directions"
    t.text     "dining"
    t.text     "facilities"
    t.text     "location"
    t.text     "policies"
    t.text     "recreation"
    t.text     "transportation"
    t.text     "room_descriptions"
    t.datetime "created_at",                       precision: 6
    t.datetime "updated_at",                       precision: 6
  end

  add_index "sabre_hotels", ["hotel_city_code"], name: "index_sabre_hotels_on_hotel_city_code", using: :btree
  add_index "sabre_hotels", ["hotel_code"], name: "index_sabre_hotels_on_hotel_code", using: :btree

  create_table "sabre_property_mappings", force: :cascade do |t|
    t.string   "source_model"
    t.string   "source_property"
    t.string   "source_value"
    t.string   "destination_model"
    t.string   "destination_property"
    t.string   "destination_value"
    t.string   "destination_value_type"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sabre_response_exceptions", force: :cascade do |t|
    t.text     "request_xml"
    t.text     "response_xml"
    t.text     "host_command"
    t.string   "action",       limit: 255
    t.datetime "created_at",               precision: 6
    t.datetime "updated_at",               precision: 6
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.string  "slug"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true, using: :btree

  create_table "templates", force: :cascade do |t|
    t.string   "name"
    t.string   "default_subject"
    t.text     "description"
    t.text     "default_message"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "theme_images", force: :cascade do |t|
    t.string   "title"
    t.text     "caption"
    t.integer  "sequence"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.string   "tags"
    t.integer  "sequence"
    t.string   "slug"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "image_offset_pct"
  end

  create_table "user_favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "deleted",    default: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   limit: 255,               default: "",      null: false
    t.string   "encrypted_password",      limit: 255,               default: "",      null: false
    t.string   "reset_password_token",    limit: 255
    t.datetime "reset_password_sent_at",              precision: 6
    t.datetime "remember_created_at",                 precision: 6
    t.integer  "sign_in_count",                                     default: 0,       null: false
    t.datetime "current_sign_in_at",                  precision: 6
    t.datetime "last_sign_in_at",                     precision: 6
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",      limit: 255
    t.datetime "confirmed_at",                        precision: 6
    t.datetime "confirmation_sent_at",                precision: 6
    t.string   "unconfirmed_email",       limit: 255
    t.datetime "created_at",                          precision: 6
    t.datetime "updated_at",                          precision: 6
    t.string   "prefix",                  limit: 255
    t.string   "first_name",              limit: 255
    t.string   "middle_name",             limit: 255
    t.string   "last_name",               limit: 255
    t.string   "suffix",                  limit: 255
    t.string   "gender",                  limit: 255
    t.date     "date_of_birth"
    t.string   "redress_number",          limit: 255
    t.string   "known_traveler_number",   limit: 255
    t.string   "home_airport",            limit: 255
    t.string   "seat_preference",         limit: 255
    t.string   "meal_preference",         limit: 255
    t.string   "role",                    limit: 255
    t.string   "avatar_file_name",        limit: 255
    t.string   "avatar_content_type",     limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at",                   precision: 6
    t.string   "address_1",               limit: 255
    t.string   "address_2",               limit: 255
    t.string   "city",                    limit: 255
    t.string   "state",                   limit: 255
    t.string   "zipcode",                 limit: 255
    t.string   "primary_phone",           limit: 255
    t.integer  "invitation_id"
    t.string   "provider",                                          default: "email", null: false
    t.string   "uid",                                               default: "",      null: false
    t.text     "tokens"
    t.string   "device_id"
    t.string   "device_token"
    t.boolean  "debug_enabled",                                     default: false,   null: false
    t.text     "notes"
    t.string   "welcome_token"
    t.string   "origin"
    t.string   "authentication_token"
    t.string   "referral_name_base"
    t.integer  "referral_name_increment"
    t.integer  "referrer_id"
    t.string   "status",                                            default: "guest"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,               null: false
    t.integer  "item_id",                              null: false
    t.string   "event",      limit: 255,               null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object"
    t.datetime "created_at",             precision: 6
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "payments", "bookings"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "payments", "users"
  add_foreign_key "price_adjustments", "bookings"
end

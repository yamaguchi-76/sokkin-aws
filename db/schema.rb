# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_26_144622) do

  create_table "admins", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", comment: "名字"
    t.string "first_name", comment: "名前"
    t.string "last_name_kana", comment: "名字カナ"
    t.string "first_name_kana", comment: "名前カナ"
    t.date "birthday", comment: "誕生日"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "affiliate_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "application_ad_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "application_production_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attendances", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_attendances_on_proposition_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "bank_accounts", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "bank_name", comment: "金融機関"
    t.string "branch_name", comment: "支店名"
    t.integer "account_kind", comment: "口座種別"
    t.string "account_number", comment: "口座番号"
    t.string "account_holder", comment: "口座名義"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "business_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_feed_backs", charset: "utf8mb3", force: :cascade do |t|
    t.integer "year", null: false, comment: "年"
    t.integer "month", null: false, comment: "月"
    t.integer "within_time", null: false, comment: "稼働時間内か"
    t.integer "achieved", null: false, comment: "業務遂行度"
    t.integer "communication", null: false, comment: "パートナーとのコミュニケーション"
    t.integer "partner_skills", null: false, comment: "パートナーのスキル"
    t.integer "interview", null: false, comment: "面談希望"
    t.text "request", null: false, comment: "要望・相談"
    t.bigint "attendance_id", null: false, comment: "勤怠ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_client_feed_backs_on_attendance_id"
  end

  create_table "companies", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", comment: "企業名"
    t.string "name_kana", comment: "企業名カナ"
    t.string "phone_number", comment: "電話番号"
    t.string "person_in_charge_first_name_kana", comment: "担当者名 名カナ"
    t.string "person_in_charge_last_name_kana", comment: "担当者名 性カナ"
    t.string "person_in_charge_first_name", comment: "担当者名 名"
    t.string "person_in_charge_last_name", comment: "担当者名 性"
    t.string "belonging_department", comment: "所属部署"
    t.string "address", comment: "住所"
    t.string "postal_code", comment: "郵便番号"
    t.text "homepage", comment: "ホームページ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "crm_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_journey_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "display_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "double_job_experiences", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "company_name", default: "", null: false, comment: "会社名"
    t.integer "monthly_income", default: 0, null: false, comment: "月収"
    t.integer "working_hours", comment: "稼働時間"
    t.date "employment_start_date", comment: "複業開始年月"
    t.date "employment_end_date", comment: "複業時の就業終了年月"
    t.text "business_experience", comment: "業務内容"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_kind_id", null: false, comment: "職種"
    t.index ["job_kind_id"], name: "index_double_job_experiences_on_job_kind_id"
    t.index ["user_id"], name: "index_double_job_experiences_on_user_id"
  end

  create_table "dsp_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ecsite_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educational_backgrounds", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.integer "recent_academic_history", default: 0, null: false, comment: "最終学歴"
    t.string "school_name", default: "", null: false, comment: "学校名"
    t.string "faculty_name", comment: "学部名"
    t.date "graduated_year", comment: "卒業年度"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "update_count", default: 0, null: false
    t.index ["user_id"], name: "index_educational_backgrounds_on_user_id"
  end

  create_table "employment_statuses", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.integer "status", default: 0, null: false, comment: "就業形態"
    t.string "company_name", default: "", null: false, comment: "会社名"
    t.string "industry_category", default: "", null: false, comment: "業種"
    t.string "job_title", comment: "役職"
    t.integer "yearly_income", default: 0, null: false, comment: "年収"
    t.integer "working_hours", default: 0, null: false, comment: "稼働日/週"
    t.integer "working_days_of_the_week", default: 0, null: false, comment: "稼働時間/日"
    t.text "business_experience", comment: "経験業務内容"
    t.date "employment_start_date", comment: "就業開始年月"
    t.date "employment_end_date", comment: "就業終了年月"
    t.boolean "in_employment", comment: "現在の就業状況"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_kind_id", comment: "職種"
    t.integer "update_count", default: 0, null: false
    t.index ["job_kind_id"], name: "index_employment_statuses_on_job_kind_id"
    t.index ["user_id"], name: "index_employment_statuses_on_user_id"
  end

  create_table "feed_backs", charset: "utf8mb3", force: :cascade do |t|
    t.integer "year", null: false, comment: "年"
    t.integer "month", null: false, comment: "月"
    t.integer "within_time", null: false, comment: "稼働時間内か"
    t.integer "achieved", null: false, comment: "業務遂行度"
    t.integer "communication", null: false, comment: "パートナーとのコミュニケーション"
    t.integer "partner_skills", null: false, comment: "パートナーのスキル"
    t.integer "interview", null: false, comment: "面談希望"
    t.text "request", null: false, comment: "要望・相談"
    t.bigint "attendance_id", null: false, comment: "勤怠ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_feed_backs_on_attendance_id"
  end

  create_table "feed_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "four_p_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "image_ad_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "industries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "industry_group_id", null: false
    t.string "name", null: false, comment: "業界名"
    t.integer "display_sort", null: false, comment: "表示順"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["industry_group_id"], name: "index_industries_on_industry_group_id"
  end

  create_table "industry_groups", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false, comment: "業界グループ名"
    t.integer "display_sort", null: false, comment: "表示順"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["display_sort"], name: "index_industry_groups_on_display_sort", unique: true
  end

  create_table "influencer_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_kinds", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false, comment: "職種名"
    t.integer "display_sort", null: false, comment: "表示順"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["display_sort"], name: "index_job_kinds_on_display_sort", unique: true
  end

  create_table "kpi_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "language_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ma_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monthly_unit_prices", charset: "utf8mb3", force: :cascade do |t|
    t.integer "unit_price", null: false, comment: "単価"
    t.integer "year", null: false, comment: "年"
    t.integer "month", null: false, comment: "月"
    t.boolean "active", null: false, comment: "アクティブステータス"
    t.bigint "attendance_id", null: false, comment: "勤怠ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_monthly_unit_prices_on_attendance_id"
  end

  create_table "movie_ad_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "new_business_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operating_times", charset: "utf8mb3", force: :cascade do |t|
    t.integer "working_month", null: false, comment: "稼働月"
    t.date "working_days", null: false, comment: "稼働日"
    t.integer "working_hours", null: false, comment: "稼働時間"
    t.string "job_description", comment: "業務内容"
    t.boolean "submitted", default: false, null: false, comment: "提出ステータス"
    t.bigint "attendance_id", null: false, comment: "勤怠ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_operating_times_on_attendance_id"
  end

  create_table "past_employment_statuses", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "company_name", default: "", null: false, comment: "会社名"
    t.string "previous_client_or_industry", default: "", null: false, comment: "担当顧客や業種"
    t.date "employment_start_date", comment: "就業開始年月"
    t.date "employment_end_date", comment: "就業終了年月"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_past_employment_statuses_on_user_id"
  end

  create_table "payment_statuses", charset: "utf8mb3", force: :cascade do |t|
    t.integer "year", null: false, comment: "年"
    t.integer "month", null: false, comment: "月"
    t.integer "paid", default: 2, null: false, comment: "支払いステータス"
    t.bigint "attendance_id", null: false, comment: "勤怠ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendance_id"], name: "index_payment_statuses_on_attendance_id"
  end

  create_table "persona_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pr_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proposition_contracts", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "user_id", null: false, comment: "成約したユーザーID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_proposition_contracts_on_proposition_id"
    t.index ["user_id"], name: "index_proposition_contracts_on_user_id"
  end

  create_table "proposition_entries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "user_id", null: false, comment: "応募したユーザーID"
    t.integer "status", default: 0, null: false, comment: "応募の状態"
    t.integer "estimated_work_time", comment: "月間希望労働時間(単位hour)"
    t.text "request", comment: "ご要望"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_proposition_entries_on_proposition_id"
    t.index ["user_id"], name: "index_proposition_entries_on_user_id"
  end

  create_table "proposition_job_kinds", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "job_kind_id", null: false, comment: "職種ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_kind_id"], name: "index_proposition_job_kinds_on_job_kind_id"
    t.index ["proposition_id"], name: "index_proposition_job_kinds_on_proposition_id"
  end

  create_table "proposition_work_conditions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "work_condition_id", null: false, comment: "勤務条件ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_proposition_work_conditions_on_proposition_id"
    t.index ["work_condition_id"], name: "index_proposition_work_conditions_on_work_condition_id"
  end

  create_table "proposition_work_ranges", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "work_range_id", null: false, comment: "職域ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_proposition_work_ranges_on_proposition_id"
    t.index ["work_range_id"], name: "index_proposition_work_ranges_on_work_range_id"
  end

  create_table "propositions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "company_id", null: false, comment: "会社、企業ID"
    t.string "title", comment: "案件名"
    t.integer "status", comment: "ステータス"
    t.integer "estimated_work_time_from", comment: "月間想定稼働時間From/単位hour"
    t.integer "estimated_work_time_to", comment: "月間想定稼働時間To/単位hour"
    t.datetime "operation_start_at", comment: "稼働開始時期"
    t.integer "contract_period", comment: "契約期間/単位month"
    t.text "background", comment: "背景・課題"
    t.string "required_skill", comment: "必須スキル"
    t.string "welcome_skill", comment: "歓迎スキル"
    t.text "work_order", comment: "依頼業務"
    t.text "ng_point", comment: "NG項目"
    t.text "note", comment: "備考"
    t.datetime "application_deadline", comment: "応募締切"
    t.integer "unit_price", comment: "単価/単位month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "industry_id", null: false, comment: "業界"
    t.integer "unit_price_per_hour", comment: "時給単価"
    t.string "image", comment: "画像"
    t.index ["company_id"], name: "index_propositions_on_company_id"
    t.index ["industry_id"], name: "index_propositions_on_industry_id"
  end

  create_table "scouts", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.integer "status", null: false, comment: "ステータス"
    t.integer "scout_from", null: false, comment: "スカウトを出したModel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_scouts_on_proposition_id"
    t.index ["user_id"], name: "index_scouts_on_user_id"
  end

  create_table "search_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "self_introductions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.text "self_pr", comment: "自己PR"
    t.integer "desired_unit_price", default: 0, null: false, comment: "希望単価"
    t.integer "desired_working_hours", default: 0, null: false, comment: "希望稼働時間"
    t.integer "desired_working_days", default: 0, null: false, comment: "希望勤務日数"
    t.integer "in_person_meeting", default: 0, null: false, comment: "対面ミーティング"
    t.integer "handle_status", default: 0, null: false, comment: "対応ステータス"
    t.integer "handle_conditions", default: 0, null: false, comment: "対応条件"
    t.string "portfolio", comment: "ポートフォリオ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "registered_invoice", default: false, comment: "インボイス登録有無"
    t.string "invoice_number", comment: "インボイス登録番号"
    t.integer "update_count", default: 0, null: false
    t.index ["user_id"], name: "index_self_introductions_on_user_id"
  end

  create_table "seo_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sight_access_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skill_affiliate_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "affiliate_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["affiliate_scope_id"], name: "index_skill_affiliate_scopes_on_affiliate_scope_id"
    t.index ["skill_id"], name: "index_skill_affiliate_scopes_on_skill_id"
  end

  create_table "skill_application_ad_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "application_ad_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_ad_scope_id"], name: "index_skill_application_ad_scopes_on_application_ad_scope_id"
    t.index ["skill_id"], name: "index_skill_application_ad_scopes_on_skill_id"
  end

  create_table "skill_application_production_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "application_production_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_production_scope_id"], name: "fk_rails_dda515e829"
    t.index ["skill_id", "application_production_scope_id"], name: "skill_on_application_production_scopes_index"
  end

  create_table "skill_business_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "business_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_scope_id"], name: "index_skill_business_scopes_on_business_scope_id"
    t.index ["skill_id"], name: "index_skill_business_scopes_on_skill_id"
  end

  create_table "skill_crm_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "crm_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crm_scope_id"], name: "index_skill_crm_scopes_on_crm_scope_id"
    t.index ["skill_id"], name: "index_skill_crm_scopes_on_skill_id"
  end

  create_table "skill_customer_journey_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "customer_journey_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_journey_scope_id"], name: "fk_rails_e7d1aea932"
    t.index ["skill_id", "customer_journey_scope_id"], name: "skill_on_customer_journey_scopes_index"
  end

  create_table "skill_customer_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "customer_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_scope_id"], name: "index_skill_customer_scopes_on_customer_scope_id"
    t.index ["skill_id"], name: "index_skill_customer_scopes_on_skill_id"
  end

  create_table "skill_display_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "display_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["display_scope_id"], name: "index_skill_display_scopes_on_display_scope_id"
    t.index ["skill_id"], name: "index_skill_display_scopes_on_skill_id"
  end

  create_table "skill_dsp_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "dsp_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dsp_scope_id"], name: "index_skill_dsp_scopes_on_dsp_scope_id"
    t.index ["skill_id"], name: "index_skill_dsp_scopes_on_skill_id"
  end

  create_table "skill_ecsite_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "ecsite_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ecsite_scope_id"], name: "index_skill_ecsite_scopes_on_ecsite_scope_id"
    t.index ["skill_id"], name: "index_skill_ecsite_scopes_on_skill_id"
  end

  create_table "skill_feed_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "feed_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feed_scope_id"], name: "index_skill_feed_scopes_on_feed_scope_id"
    t.index ["skill_id"], name: "index_skill_feed_scopes_on_skill_id"
  end

  create_table "skill_four_p_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "four_p_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["four_p_scope_id"], name: "index_skill_four_p_scopes_on_four_p_scope_id"
    t.index ["skill_id"], name: "index_skill_four_p_scopes_on_skill_id"
  end

  create_table "skill_image_ad_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "image_ad_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_ad_scope_id"], name: "index_skill_image_ad_scopes_on_image_ad_scope_id"
    t.index ["skill_id"], name: "index_skill_image_ad_scopes_on_skill_id"
  end

  create_table "skill_influencer_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "influencer_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["influencer_scope_id"], name: "index_skill_influencer_scopes_on_influencer_scope_id"
    t.index ["skill_id"], name: "index_skill_influencer_scopes_on_skill_id"
  end

  create_table "skill_kpi_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "kpi_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kpi_scope_id"], name: "index_skill_kpi_scopes_on_kpi_scope_id"
    t.index ["skill_id"], name: "index_skill_kpi_scopes_on_skill_id"
  end

  create_table "skill_language_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "language_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_scope_id"], name: "index_skill_language_scopes_on_language_scope_id"
    t.index ["skill_id"], name: "index_skill_language_scopes_on_skill_id"
  end

  create_table "skill_ma_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "ma_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ma_scope_id"], name: "index_skill_ma_scopes_on_ma_scope_id"
    t.index ["skill_id"], name: "index_skill_ma_scopes_on_skill_id"
  end

  create_table "skill_movie_ad_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "movie_ad_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_ad_scope_id"], name: "index_skill_movie_ad_scopes_on_movie_ad_scope_id"
    t.index ["skill_id"], name: "index_skill_movie_ad_scopes_on_skill_id"
  end

  create_table "skill_new_business_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "new_business_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["new_business_scope_id"], name: "index_skill_new_business_scopes_on_new_business_scope_id"
    t.index ["skill_id"], name: "index_skill_new_business_scopes_on_skill_id"
  end

  create_table "skill_persona_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "persona_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["persona_scope_id"], name: "index_skill_persona_scopes_on_persona_scope_id"
    t.index ["skill_id"], name: "index_skill_persona_scopes_on_skill_id"
  end

  create_table "skill_pr_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "pr_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pr_scope_id"], name: "index_skill_pr_scopes_on_pr_scope_id"
    t.index ["skill_id"], name: "index_skill_pr_scopes_on_skill_id"
  end

  create_table "skill_search_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "search_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["search_scope_id"], name: "index_skill_search_scopes_on_search_scope_id"
    t.index ["skill_id"], name: "index_skill_search_scopes_on_skill_id"
  end

  create_table "skill_seo_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "seo_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seo_scope_id"], name: "index_skill_seo_scopes_on_seo_scope_id"
    t.index ["skill_id"], name: "index_skill_seo_scopes_on_skill_id"
  end

  create_table "skill_sight_access_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "sight_access_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sight_access_scope_id"], name: "index_skill_sight_access_scopes_on_sight_access_scope_id"
    t.index ["skill_id"], name: "index_skill_sight_access_scopes_on_skill_id"
  end

  create_table "skill_sns_owned_media_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "sns_owned_media_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_sns_owned_media_scopes_on_skill_id"
    t.index ["sns_owned_media_scope_id"], name: "index_skill_sns_owned_media_scopes_on_sns_owned_media_scope_id"
  end

  create_table "skill_sns_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "sns_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_sns_scopes_on_skill_id"
    t.index ["sns_scope_id"], name: "index_skill_sns_scopes_on_sns_scope_id"
  end

  create_table "skill_tag_manager_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "tag_manager_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_tag_manager_scopes_on_skill_id"
    t.index ["tag_manager_scope_id"], name: "index_skill_tag_manager_scopes_on_tag_manager_scope_id"
  end

  create_table "skill_third_party_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "third_party_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_third_party_scopes_on_skill_id"
    t.index ["third_party_scope_id"], name: "index_skill_third_party_scopes_on_third_party_scope_id"
  end

  create_table "skill_three_c_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "three_c_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_three_c_scopes_on_skill_id"
    t.index ["three_c_scope_id"], name: "index_skill_three_c_scopes_on_three_c_scope_id"
  end

  create_table "skill_user_survey_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "user_survey_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_user_survey_scopes_on_skill_id"
    t.index ["user_survey_scope_id"], name: "index_skill_user_survey_scopes_on_user_survey_scope_id"
  end

  create_table "skill_video_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "video_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_video_scopes_on_skill_id"
    t.index ["video_scope_id"], name: "index_skill_video_scopes_on_video_scope_id"
  end

  create_table "skill_website_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "website_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_website_scopes_on_skill_id"
    t.index ["website_scope_id"], name: "index_skill_website_scopes_on_website_scope_id"
  end

  create_table "skill_writing_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "writing_scope_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_skill_writing_scopes_on_skill_id"
    t.index ["writing_scope_id"], name: "index_skill_writing_scopes_on_writing_scope_id"
  end

  create_table "skills", charset: "utf8mb3", force: :cascade do |t|
    t.boolean "planner", default: false, comment: "プランナー"
    t.boolean "media_consultant", default: false, comment: "メディアコンサルタント"
    t.boolean "operation_operator", default: false, comment: "運用オペレーター"
    t.boolean "designer", default: false, comment: "デザイナー"
    t.boolean "director", default: false, comment: "ディレクター"
    t.boolean "engineer", default: false, comment: "エンジニア"
    t.integer "search_experience", comment: "検索広告_実務経験"
    t.integer "display_experience", comment: "Display広告_実務経験"
    t.integer "sns_experience", comment: "SNS広告_実務経験"
    t.integer "application_ad_experience", comment: "アプリ広告_実務経験"
    t.integer "seo_experience", comment: "SEO・ASO_実務経験"
    t.integer "crm_experience", comment: "CRM_実務経験"
    t.integer "sns_owned_media_experience", comment: "SNSオウンドメディア運用_実務経験"
    t.integer "dsp_experience", comment: "DSP・ADNW_実務経験"
    t.integer "video_experience", comment: "動画広告_実務経験"
    t.integer "affiliate_experience", comment: "アフィリエイト_実務経験"
    t.integer "sight_access_experience", comment: "サイト・アクセス解析_実務経験"
    t.integer "ma_experience", comment: "MAツール_実務経験"
    t.integer "tag_manager_experience", comment: "タグマネージャー_実務経験"
    t.integer "feed_experience", comment: "フィード/フィードマネージャー_実務経験"
    t.integer "third_party_experience", comment: "3rdParty広告計測ツール_実務経験"
    t.integer "customer_experience", comment: "ToC向け広告戦略の立案_実務経験"
    t.integer "business_experience", comment: "ToB向け広告戦略の立案_実務経験"
    t.integer "three_c_experience", comment: "3C分析_実務経験"
    t.integer "four_p_experience", comment: "4P分析_実務経験"
    t.integer "persona_experience", comment: "ペルソナ分析_実務経験"
    t.integer "user_survey_experience", comment: "ユーザー調査_実務経験"
    t.integer "pr_experience", comment: "PR_実務経験"
    t.integer "customer_journey_experience", comment: "カスタマージャーニー作成_実務経験"
    t.integer "language_experience", comment: "語学力_実務経験"
    t.integer "kpi_experience", comment: "KPI・KGIの設計_実務経験"
    t.integer "influencer_experience", comment: "インフルエンサー施策_実務経験"
    t.integer "writing_experience", comment: "記事制作_実務経験"
    t.integer "website_experience", comment: "WEBサイト制作_実務経験"
    t.integer "ecsite_experience", comment: "ECサイト制作_実務経験"
    t.integer "application_production_experience", comment: "アプリ制作_実務経験"
    t.integer "image_ad_experience", comment: "静止画のAd制作_実務経験"
    t.integer "movie_ad_experience", comment: "動画のAd制作_実務経験"
    t.integer "new_business_experience", comment: "新規事業立ち上げ_実務経験"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "update_count", default: 0, null: false
    t.index ["user_id"], name: "index_skills_on_user_id", unique: true
  end

  create_table "sns_owned_media_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sns_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_manager_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "third_party_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "three_c_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_proposition_favorites", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "proposition_id", null: false, comment: "案件ID"
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposition_id"], name: "index_user_proposition_favorites_on_proposition_id"
    t.index ["user_id"], name: "index_user_proposition_favorites_on_user_id"
  end

  create_table "user_survey_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "last_name", comment: "名字"
    t.string "first_name", comment: "名前"
    t.string "last_name_kana", comment: "名字カナ"
    t.string "first_name_kana", comment: "名前カナ"
    t.date "birthday", comment: "誕生日"
    t.string "phone_number", comment: "電話番号"
    t.string "postal_code", comment: "郵便番号"
    t.string "address", comment: "住所"
    t.integer "gender", comment: "性別"
    t.boolean "second_job_experience", default: false, comment: "複業経験有無"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image", comment: "プロフィール画像"
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "website_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_conditions", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false, comment: "勤務条件名"
    t.integer "display_sort", null: false, comment: "表示順"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["display_sort"], name: "index_work_conditions_on_display_sort", unique: true
  end

  create_table "work_ranges", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false, comment: "職域名"
    t.integer "display_sort", null: false, comment: "表示順"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["display_sort"], name: "index_work_ranges_on_display_sort", unique: true
  end

  create_table "writing_scopes", charset: "utf8mb3", force: :cascade do |t|
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendances", "propositions"
  add_foreign_key "attendances", "users"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "client_feed_backs", "attendances"
  add_foreign_key "double_job_experiences", "job_kinds"
  add_foreign_key "double_job_experiences", "users"
  add_foreign_key "educational_backgrounds", "users"
  add_foreign_key "employment_statuses", "users"
  add_foreign_key "feed_backs", "attendances"
  add_foreign_key "monthly_unit_prices", "attendances"
  add_foreign_key "operating_times", "attendances"
  add_foreign_key "past_employment_statuses", "users"
  add_foreign_key "payment_statuses", "attendances"
  add_foreign_key "proposition_contracts", "propositions"
  add_foreign_key "proposition_contracts", "users"
  add_foreign_key "proposition_entries", "propositions"
  add_foreign_key "proposition_entries", "users"
  add_foreign_key "proposition_job_kinds", "job_kinds"
  add_foreign_key "proposition_job_kinds", "propositions"
  add_foreign_key "proposition_work_conditions", "propositions"
  add_foreign_key "proposition_work_conditions", "work_conditions"
  add_foreign_key "proposition_work_ranges", "propositions"
  add_foreign_key "proposition_work_ranges", "work_ranges"
  add_foreign_key "propositions", "companies"
  add_foreign_key "propositions", "industries"
  add_foreign_key "self_introductions", "users"
  add_foreign_key "skill_affiliate_scopes", "affiliate_scopes"
  add_foreign_key "skill_affiliate_scopes", "skills"
  add_foreign_key "skill_application_ad_scopes", "application_ad_scopes"
  add_foreign_key "skill_application_ad_scopes", "skills"
  add_foreign_key "skill_application_production_scopes", "application_production_scopes"
  add_foreign_key "skill_application_production_scopes", "skills"
  add_foreign_key "skill_business_scopes", "business_scopes"
  add_foreign_key "skill_business_scopes", "skills"
  add_foreign_key "skill_crm_scopes", "crm_scopes"
  add_foreign_key "skill_crm_scopes", "skills"
  add_foreign_key "skill_customer_journey_scopes", "customer_journey_scopes"
  add_foreign_key "skill_customer_journey_scopes", "skills"
  add_foreign_key "skill_customer_scopes", "customer_scopes"
  add_foreign_key "skill_customer_scopes", "skills"
  add_foreign_key "skill_display_scopes", "display_scopes"
  add_foreign_key "skill_display_scopes", "skills"
  add_foreign_key "skill_dsp_scopes", "dsp_scopes"
  add_foreign_key "skill_dsp_scopes", "skills"
  add_foreign_key "skill_ecsite_scopes", "ecsite_scopes"
  add_foreign_key "skill_ecsite_scopes", "skills"
  add_foreign_key "skill_feed_scopes", "feed_scopes"
  add_foreign_key "skill_feed_scopes", "skills"
  add_foreign_key "skill_four_p_scopes", "four_p_scopes"
  add_foreign_key "skill_four_p_scopes", "skills"
  add_foreign_key "skill_image_ad_scopes", "image_ad_scopes"
  add_foreign_key "skill_image_ad_scopes", "skills"
  add_foreign_key "skill_influencer_scopes", "influencer_scopes"
  add_foreign_key "skill_influencer_scopes", "skills"
  add_foreign_key "skill_kpi_scopes", "kpi_scopes"
  add_foreign_key "skill_kpi_scopes", "skills"
  add_foreign_key "skill_language_scopes", "language_scopes"
  add_foreign_key "skill_language_scopes", "skills"
  add_foreign_key "skill_ma_scopes", "ma_scopes"
  add_foreign_key "skill_ma_scopes", "skills"
  add_foreign_key "skill_movie_ad_scopes", "movie_ad_scopes"
  add_foreign_key "skill_movie_ad_scopes", "skills"
  add_foreign_key "skill_new_business_scopes", "new_business_scopes"
  add_foreign_key "skill_new_business_scopes", "skills"
  add_foreign_key "skill_persona_scopes", "persona_scopes"
  add_foreign_key "skill_persona_scopes", "skills"
  add_foreign_key "skill_pr_scopes", "pr_scopes"
  add_foreign_key "skill_pr_scopes", "skills"
  add_foreign_key "skill_search_scopes", "search_scopes"
  add_foreign_key "skill_search_scopes", "skills"
  add_foreign_key "skill_seo_scopes", "seo_scopes"
  add_foreign_key "skill_seo_scopes", "skills"
  add_foreign_key "skill_sight_access_scopes", "sight_access_scopes"
  add_foreign_key "skill_sight_access_scopes", "skills"
  add_foreign_key "skill_sns_owned_media_scopes", "skills"
  add_foreign_key "skill_sns_owned_media_scopes", "sns_owned_media_scopes"
  add_foreign_key "skill_sns_scopes", "skills"
  add_foreign_key "skill_sns_scopes", "sns_scopes"
  add_foreign_key "skill_tag_manager_scopes", "skills"
  add_foreign_key "skill_tag_manager_scopes", "tag_manager_scopes"
  add_foreign_key "skill_third_party_scopes", "skills"
  add_foreign_key "skill_third_party_scopes", "third_party_scopes"
  add_foreign_key "skill_three_c_scopes", "skills"
  add_foreign_key "skill_three_c_scopes", "three_c_scopes"
  add_foreign_key "skill_user_survey_scopes", "skills"
  add_foreign_key "skill_user_survey_scopes", "user_survey_scopes"
  add_foreign_key "skill_video_scopes", "skills"
  add_foreign_key "skill_video_scopes", "video_scopes"
  add_foreign_key "skill_website_scopes", "skills"
  add_foreign_key "skill_website_scopes", "website_scopes"
  add_foreign_key "skill_writing_scopes", "skills"
  add_foreign_key "skill_writing_scopes", "writing_scopes"
  add_foreign_key "skills", "users"
  add_foreign_key "user_proposition_favorites", "propositions"
  add_foreign_key "user_proposition_favorites", "users"
end

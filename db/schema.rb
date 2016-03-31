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

ActiveRecord::Schema.define(version: 20160330195955) do

  create_table "point_reperes", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "projection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "num_route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "troncon_routes", force: :cascade do |t|
    t.string   "vocation"
    t.string   "nb_chausse"
    t.string   "nb_voies"
    t.string   "etat"
    t.string   "acces"
    t.string   "res_vert"
    t.string   "sens"
    t.string   "res_europe"
    t.string   "num_route"
    t.string   "class_adm"
    t.float    "longueur"
    t.integer  "point_reperes_id"
    t.integer  "point_repere_final_id"
    t.integer  "point_repere_init_id"
    t.integer  "works_id"
    t.integer  "id_travaux_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.integer  "poste"
    t.string   "codeEmploye"
    t.string   "telephone"
    t.string   "username"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "verified_digest"
    t.boolean  "verified",        default: false
    t.datetime "verified_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_at"
    t.boolean  "administrateur",  default: false
  end

  create_table "works", force: :cascade do |t|
    t.string   "type"
    t.text     "description"
    t.datetime "debut",       default: '2016-03-31 14:56:10', null: false
    t.datetime "fin"
    t.string   "intervenant"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end

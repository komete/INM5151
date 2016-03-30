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

ActiveRecord::Schema.define(version: 20160330142034) do

  create_table "troncon_route", force: :cascade do |t|
    t.integer "id_rte500"
    t.string  "vocation"
    t.string  "nb_chausse"
    t.string  "nb_voies"
    t.string  "etat"
    t.string  "acces"
    t.string  "res_vert"
    t.string  "sens"
    t.string  "res_europe"
    t.string  "num_route"
    t.string  "class_adm"
    t.float   "longueur"
  end

  create_table "troncon_routes", force: :cascade do |t|
    t.integer  "id_rte500"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end

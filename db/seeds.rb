# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = User.create(name: "klaus", email: 'klaus@admin.com', password: '10168913', password_confirmation: '10168913')
editor = User.create(name: "akashi", email: 'akashi@editable.com', password: '10168913', password_confirmation: '10168913')
User.create(name: "Max", email: 'max@normal.com', password: '10168913', password_confirmation: '10168913')

admin_user_role = Role.create(name: 'Admin User', reference: "User", access: :createable)
admin_post_role = Role.create(name: 'Admin Post', reference: "Post", access: :createable)
editor_post_role = Role.create(name: 'Editor Post', reference: "Post", access: :editable)

admin.user_roles.create(role: admin_user_role)
admin.user_roles.create(role: admin_post_role)
editor.user_roles.create(role: editor_post_role)

FactoryBot.create_list(:post, 40)
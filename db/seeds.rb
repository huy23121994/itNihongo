# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
	{username:"admin", email:"admin@gmail.com", password:"password", password_confirmation:"password", role: 1},
	{username:"user", email:"user@gmail.com", password:"password", password_confirmation:"password"}
])

Category.create_category([
	{"category" => "Sách Đoạt Giải Thưởng"},
	{"category" => "Sách Văn Học - Tiểu Thuyết"},
	{"category" => "Sách Kinh Tế"},
	{"category" => "Sách Truyện Thiếu Nhi"},
	{"category" => "Sách Nuôi Dạy Con"},
	{"category" => "Sách Giáo Khoa - Tham Khảo"},
	{"category" => "Sách Học Ngoại Ngữ"},
	{"category" => "Sách Tiếng Anh"},
	{"category" => "Từ điển"},
	{"category" => "Truyện Tranh, Manga, Comic"},
	{"category" => "Sách Kỹ Năng"},
	{"category" => "Khoa Học - Kỹ Thuật"},
	{"category" => "Kiến Thức Tổng Hợp"},
	{"category" => "Chính Trị - Pháp Lý"},
	{"category" => "Giáo Trình Đại Học - Cao Đẳng"},
	{"category" => "Tạp Chí - Catalogue"},
	{"category" => "Thường Thức - Đời Sống"},
	{"category" => "Tâm lý - Giới tính"},
	{"category" => "Sách Cho Tuổi Mới Lớn"},
	{"category" => "Sách Tô Màu"}
])

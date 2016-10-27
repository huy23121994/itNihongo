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

Category.create([
	{category:"Sách Đoạt Giải Thưởng", slug:"giai-thuong"},
	{category:"Sách Văn Học - Tiểu Thuyết", slug:"van-hoc"},
	{category:"Sách Kinh Tế", slug:"kinh-te"},
	{category:"Sách Truyện Thiếu Nhi", slug:"thieu-nhi"},
	{category:"Sách Nuôi Dạy Con", slug:"nuoi-day-con"},
	{category:"Sách Giáo Khoa - Tham Khảo", slug:"giao-khoa"},
	{category:"Sách Học Ngoại Ngữ", slug:"ngoai-ngu"},
	{category:"Sách Tiếng Anh", slug:"tieng-anh"},
	{category:"Từ điển", slug:"tu-dien"},
	{category:"Truyện Tranh, Manga, Comic", slug:"truyen-tranh"},
	{category:"Sách Kỹ Năng", slug:"ky-nang"},
	{category:"Khoa Học - Kỹ Thuật", slug:"kh-kt"},
	{category:"Kiến Thức Tổng Hợp", slug:"tong-hop"},
	{category:"Chính Trị - Pháp Lý", slug:"chinh-tri"},
	{category:"Giáo Trình Đại Học - Cao Đẳng", slug:"giao-trinh"},
	{category:"Tạp Chí - Catalogue", slug:"tap-chi"},
	{category:"Thường Thức - Đời Sống", slug:"doi-song"},
	{category:"Tâm lý - Giới tính", slug:"gioi-tinh"},
	{category:"Sách Cho Tuổi Mới Lớn", slug:"tuoi-moi-lon"},
	{category:"Sách Tô Màu", slug:"to-mau"}
])

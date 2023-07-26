# Nhóm 8:
Chủ đề: Xây dựng web quản lý điểm sinh viên

I) Thành viên:
1) Trần Quang Minh: trưởng nhóm
- Module làm: 
+ Sinh viên
+ Môn học
+ Học kỳ
+ Giảng viên

2) Trịnh Minh Tuấn: 
- Module làm:
+ Nhập điểm sinh viên bằng file excel
+ Xem điểm của lớp học phần ở trang Admin
+ Xuất điểm ra file excel

3) Lại Ngọc Sơn: 
- Module làm:
+ Đăng nhập/Đăng xuất
+ Đổi mật khẩu
+ Quên mật khẩu xác thực email
+ Authen/Author

4) Nguyễn Minh Quân:
- Module làm: User
+ Trang chủ User
+ Xem điểm của user đó
+ Tính GPA tổng, GPA từng kì của user
+ Giao diện trang 404

5) Đào Xuân Đồng:
- Module làm:
+ Dashboard Admin
+ Danh sách khoa
+ Danh sách các lớp học phần của 1 khoa

II. Mô tả chức năng
1. Chức năng đăng nhập
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/82e403e7-e531-4675-bd55-7a85a33a7081)
`                                                 Giao diện trang đăng nhập
`   
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/65c8eff0-8f9d-4506-87ed-76c7bf56f05a)
`                                         Giao diện sau khi đăng nhập thành công
`                                         
3. Trang quản lý sinh viên
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/a69a4744-82b6-4722-825e-c8185c5a19de)
`Giao diện trang quản lý sinh viên
`
   ![image](https://github.com/looongtom/manage-students-grades/assets/94033356/6cdb61ac-1df5-45cb-b8c2-fbe9be661b1f)
`Giao diện khi bấm thêm sinh viên
`
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/d2682cc5-2588-48de-93cd-893f2ffc99ce)
`Giao diện khi bấm sửa sinh viên
`
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/7c91ed28-57ac-469f-8a47-a592d3b0113e)
`Giao diện khi bấm xoá sinh viên
`
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/bebdee79-1d1a-45e2-81e8-2ecc0888f284)
`Giao diện khi tìm kiếm sinh viên
`
5. Trang quản lý giảng viên
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/bac368fa-3b87-461d-937d-2ce05b657426)

7. Trang quản lý môn học
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/28b0974e-3de2-471d-b514-27ff10a1b5f2)

9. Trang quản lý học kỳ
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/e1156659-9d34-4bca-8616-937a6d3aa6fd)

10. Trang quản lý lớp học

Để xem danh sách lớp học đầu tiên cần ấn vào “Khoa chuyên môn” để hiển thị danh sách các khoa như hình dưới:

![image](https://github.com/looongtom/manage-students-grades/assets/94033356/07adb58a-ae9c-4d1b-a625-aec989204604)

Từ danh sách các khoa thì trong mỗi danh sách các khoa sẽ có danh sách của các lớp trong khoa đó. Ấn vào “Xem danh sách các lớp” để hiển thị danh sách các lớp

![image](https://github.com/looongtom/manage-students-grades/assets/94033356/3bd14e35-80a9-4662-973e-cbb2373db8f7)
`Giao diện hiển thị danh sách các lớp thuộc một khoa “Công nghệ thông tin”
`
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/7923ab3a-7277-44de-8a38-f592ae0c467c)

6. Trang quản lý điểm

![image](https://github.com/looongtom/manage-students-grades/assets/94033356/8afe2edb-c985-4827-924c-b77028e342f4)
`Giao diện khi bấm vào “Xem điểm”
`
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/c09b1dca-47ef-4009-b7b6-8e9a7f279fa2)
`Giao diện khi bấm vào “Xuất file Excel”
`
7. Trang nhập điểm
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/3ee23247-cd3e-49c6-aa54-92fa6cd2c4e1)

`_Giao diện trang nhập điểm_
`
Chọn các thông tin để có thể nhập điểm gồm: học kỳ, môn học, giảng viên, lớp, hệ số điểm chuyên cần, hệ số điểm thi, hệ số điểm bài tập, hệ số điểm kiểm tra, chọn file excel có danh sách điểm của các nhân viên

File excel bảng điểm sẽ có dạng:
![image](https://github.com/looongtom/manage-students-grades/assets/94033356/b75d86c9-8996-4c8d-acfa-74687855bbd7)

![image](https://github.com/looongtom/manage-students-grades/assets/94033356/5ba258bd-9a4a-4e4a-a6f6-6a9f9bfa44cb)

`Sau khi điền xong thông tin bấm “Nhập điểm”
`
Sau khi nhập điểm thành công, thông báo nhập điểm thành công hiện lên. Có thể bấm vào “Xem điểm vừa nhập” để xem danh sách bảng điểm vừa nhập

![image](https://github.com/looongtom/manage-students-grades/assets/94033356/1244bb55-311d-44e2-9710-4819485b8c3a)

`Giao diện khi nhập điểm thành công`


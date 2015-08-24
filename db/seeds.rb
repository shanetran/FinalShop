         
u = User.new(email: 'tranhiep92@gmail.com', 
             password: 'tranduchiep', 
             password_confirmation: 'tranduchiep',
             admin: true, status: "Active")
u.save!(:validate => false)
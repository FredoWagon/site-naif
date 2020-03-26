require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting SEED !"
puts "Desroy all START !"

Painting.destroy_all
puts "Paintings destroy DONE!"



########################################################################CREATION PAINTINGS#####################################################################


##
file = URI.open("https://images.squarespace-cdn.com/content/v1/5a74cc0f010027ddb53c0088/1584630162875-MHZYMACCDCNG4ZJ8QGA9/ke17ZwdGBToddI8pDm48kK60W-ob1oA2Fm-j4E_9NQB7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0kD6Ec8Uq9YczfrzwR7e2Mh5VMMOxnTbph8FXiclivDQnof69TlCeE0rAhj6HUpXkw/IMG_6040.JPG")

paint1 = Painting.new(name: "paint1")
paint1.photo.attach(io: file, filename: 'paint1.jpg', content_type: 'image/jpg')
##

##
file2 = URI.open("https://images.squarespace-cdn.com/content/v1/5a74cc0f010027ddb53c0088/1571667491798-GGHN61UPCKRX2OPQY5GI/ke17ZwdGBToddI8pDm48kLbAwh6vXuUiDSSVgIrzOKt7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmjw4y9jm25X_CplAKqpK2flVIQTlYlLUKqYcXu72nPC2xFVAxS8Gjlyugqb8hdVbQ/D23719EC-3839-4E98-9500-90740C7B14F0.JPG")

paint2 = Painting.new(name: "paint2")
paint2.photo.attach(io: file2, filename: 'paint2.jpg', content_type: 'image/jpg')
##

##
file3 = URI.open("https://images.squarespace-cdn.com/content/v1/5a74cc0f010027ddb53c0088/1523622565961-VTA8KU5KOEFVY1NCYK6C/ke17ZwdGBToddI8pDm48kD1P9BgemWsDRCMXjK6ZnXt7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfIyV69vqfmnVx3_oT3war8Q6J7oOyAO6KbulbzxVzq2-zH9hmAOn72jek5VDWPSVA/IMG_6156.JPG")

paint3 = Painting.new(name: "paint3")
paint3.photo.attach(io: file3, filename: 'paint3.jpg', content_type: 'image/jpg')
##

x = 4
10.times do
  paint =Painting.new(name: "paint#{x}")
  paint_photo = [paint1, paint2, paint3].sample
  paint.photo.attach(paint_photo.photo.blob)
  paint.save
  x += 1
end

paint1.save
paint2.save
paint3.save





#   paintings.each do |paint|
#      sample_arg = [
#     {
#       io: file, filename: 'test1.JPG', content_type: 'image/JPG'
#     },{
#       io: file2, filename: 'test2.JPG', content_type: 'image/JPG'
#     },{
#       io: file3, filename: 'test3.JPG', content_type: 'image/JPG'
#     }]
#     a = Painting.create!(paint)
#     a.photo.attach(sample_arg.sample)
#   end




puts "Paintings creation DONE !"


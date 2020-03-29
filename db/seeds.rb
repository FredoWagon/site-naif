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

#####################DESTRUCTION AREA#####################

Painting.destroy_all
puts "Paintings destroy DONE!"
##
Illustration.destroy_all
puts "Illustrations destroy DONE!"




puts "Paintings CREATION START"


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

#-----------------------------------------------------------------------PAINTINGS DONE--------------------------------------------------------------------------

puts "Paintings creation DONE !"
##
puts "Illustrations CREATION START"

########################################################################CREATION ILLUSTRATIONS#####################################################################

illu1 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu1.jpg'))
illu2 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu2.jpg'))
illu3 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu3.jpg'))
illu4 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu4.jpg'))
illu5 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu5.png'))
illu6 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu6.jpg'))
illu7 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu7.jpg'))
illu8 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu8.jpg'))
illu9 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu9.jpg'))
illu10 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu10.jpg'))
illu11 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu11.jpg'))
illu12 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu12.jpg'))
illu13 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu13.jpg'))
illu14 = File.open(Rails.root.join('app', 'assets', 'images', 'illus', 'illu14.jpg'))


illus1 = Illustration.new(name: "illu1")
illus1.photo.attach(io:illu1, filename: 'illu1.jpg', content_type: 'image/jpg')
illus1.save

illus2 = Illustration.new(name: "illu2")
illus2.photo.attach(io:illu2, filename: 'illu2.jpg', content_type: 'image/jpg')
illus2.save

illus3 = Illustration.new(name: "illu3")
illus3.photo.attach(io:illu3, filename: 'illu3.jpg', content_type: 'image/jpg')
illus3.save

illus4 = Illustration.new(name: "illu4")
illus4.photo.attach(io:illu4, filename: 'illu4.jpg', content_type: 'image/jpg')
illus4.save

illus5 = Illustration.new(name: "illu5")
illus5.photo.attach(io:illu5, filename: 'illu5.png', content_type: 'image/png')
illus5.save

illus6 = Illustration.new(name: "illu6")
illus6.photo.attach(io:illu6, filename: 'illu6.jpg', content_type: 'image/jpg')
illus6.save

illus7 = Illustration.new(name: "illu7")
illus7.photo.attach(io:illu7, filename: 'illu7.jpg', content_type: 'image/jpg')
illus7.save

illus8 = Illustration.new(name: "illu8")
illus8.photo.attach(io:illu8, filename: 'illu8.jpg', content_type: 'image/jpg')
illus8.save

illus9 = Illustration.new(name: "illu9")
illus9.photo.attach(io:illu9, filename: 'illu9.jpg', content_type: 'image/jpg')
illus9.save

illus10 = Illustration.new(name: "illu10")
illus10.photo.attach(io:illu10, filename: 'illu10.jpg', content_type: 'image/jpg')
illus10.save

illus11 = Illustration.new(name: "illu11")
illus11.photo.attach(io:illu11, filename: 'illu11.jpg', content_type: 'image/jpg')
illus11.save

illus12 = Illustration.new(name: "illu12")
illus12.photo.attach(io:illu12, filename: 'illu12.jpg', content_type: 'image/jpg')
illus12.save

illus13 = Illustration.new(name: "illu13")
illus13.photo.attach(io:illu13, filename: 'illu13.jpg', content_type: 'image/jpg')
illus13.save

illus14 = Illustration.new(name: "illu14")
illus14.photo.attach(io:illu14, filename: 'illu14.jpg', content_type: 'image/jpg')
illus14.save




#-----------------------------------------------------------------------PAINTINGS DONE--------------------------------------------------------------------------

puts "Illustrations creation DONE !"




####DONE####

puts "SEED DONE with SUCCESS!"

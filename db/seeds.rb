# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rida = User.create(name: 'Rida Arif', photo: 'https://avatarfiles.alphacoders.com/892/89214.gif', bio: 'I am Rida Arif, I am passionate about programming. In my free time, I like to play games, watch movies  and enjoy the sun.')

rida_post_one = Post.create(title: "How to start our own bussiness?", text: "This is description of post that i want to share with you!", user:rida)
rida_post_two = Post.create(title: "Why are vitamins importatnt for your body?", text: "This is description of post that i want to share with you!!", user:rida)
rida_post_three = Post.create(title: "Fashion!", text: "This is description of post that i want to share with you!", user:rida)
rida_post_four = Post.create(title: "Show the best of you!", text: "This is description of post that i want to share with you!", user:rida)

rida_comment_one =  Comment.create(text: "I really like this post", user:rida, post: rida_post_one)
rida_comment_two =  Comment.create(text: "I really like this post", user:rida, post: rida_post_two)
rida_comment_three =  Comment.create(text: "I really like this post", user:rida, post: rida_post_three)
rida_comment_four =  Comment.create(text: "I really like this post", user:rida, post: rida_post_four)

rida_like_one = Like.create(user: rida, post: rida_post_one)
rida_like_two = Like.create(user: rida, post: rida_post_two)

ali = User.create(name: 'Ali', photo: 'https://avatarfiles.alphacoders.com/892/89214.gif', bio: 'I am Ali, I am passionate about programming. In my free time, I like to play games, watch movies  and enjoy the sun.')

ali_post_one = Post.create(title: 'First post', text: 'Hello, This is my first post', user: ali)
ali_post_two = Post.create(title: 'Second post', text: 'Hello, This is my second post', user: ali)

ali_comment_one = Comment.create(text: 'It is my first comment.', user: ali, post: ali_post_one)

ali_like_one = Like.create(user: ali, post: ali_post_one)
ali_like_two = Like.create(user: ali, post: ali_post_two)

marina = User.create(name:"Marina", photo: "http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg", bio: "I am Marina, I am passionate about programming. In my free time, I like free-diving, climbing and enjoy the sun.")

marina_post_one = Post.create(title: "Fitness is important!", text: "This is description of post that i want to share with you!", user: marina)
marina_post_two = Post.create(title: "Do know how to cook?", text: "This is description of post that i want to share with you!!", user: marina)
marina_post_three = Post.create(title: "One day in Italy!", text: "This is description of post that i want to share with you!", user:marina)
marina_post_four = Post.create(title: "Think possitive to increase your healthiness", text: "This is description of post that i want to share with you!", user:marina)

marina_comment_one = Comment.create(text: "I find this topic very interessting", user:marina, post: marina_post_one)
marina_comment_two= Comment.create(text: "I love your post", user:marina, post: marina_post_two)
marina_comment_three = Comment.create(text:"Totally agree with you", user:marina, post: rida_post_one)


marina_like_one = Like.create(user:marina, post: marina_post_one)
marina_like_two = Like.create(user:marina, post: marina_post_two)


tom = User.create(name:"Tom", photo: "https://www.qttoyslondon.com/wp-content/uploads/2021/01/pokemon-45inch-battle-figure-gengar-150x150.jpg", bio: "I am Tom, I am passionate about programming. In my free time, I like free-diving, climbing and enjoy the sun.")

tom_post_one = Post.create(title: "The big secret!", text: "This is description of post that i want to share with you!", user: tom)
tom_post_two = Post.create(title: "Is smoking really bad for your body?", text: "This is description of post that i want to share with you!!", user: tom)

tom_comment_one = Comment.create(text: "This is my favourite post from you!", user:tom, post: tom_post_one)
tom_comment_two= Comment.create(text: "Good said! Keep writing!", user:tom, post: tom_post_two)

tom_like_one = Like.create(user:tom, post: tom_post_one)
tom_like_two = Like.create(user:tom, post: tom_post_two)
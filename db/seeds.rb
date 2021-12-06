# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rida = User.create(name: 'Rida', photo: 'https://avatarfiles.alphacoders.com/892/89214.gif', bio: 'I am Rida Arif, I am passionate about programming. In my free time, I like to play games, watch movies  and enjoy the sun.')

rida_post_one = Post.create(title: 'First post', text: 'Hello, This is my first post', user: rida)
rida_post_two = Post.create(title: 'Second post', text: 'Hello, This is my second post', user: rida)

rida_comment_one = Comment.create(text: 'It is my first comment.', user: rida, post: rida_post_one)

rida_like_one = Like.create(user: rida, post: rida_post_one)
rida_like_two = Like.create(user: rida, post: rida_post_two)

ali = User.create(name: 'Ali', photo: 'https://avatarfiles.alphacoders.com/892/89214.gif', bio: 'I am Ali, I am passionate about programming. In my free time, I like to play games, watch movies  and enjoy the sun.')

ali_post_one = Post.create(title: 'First post', text: 'Hello, This is my first post', user: ali)
ali_post_two = Post.create(title: 'Second post', text: 'Hello, This is my second post', user: ali)

ali_comment_one = Comment.create(text: 'It is my first comment.', user: ali, post: ali_post_one)

ali_like_one = Like.create(user: ali, post: ali_post_one)
ali_like_two = Like.create(user: ali, post: ali_post_two)
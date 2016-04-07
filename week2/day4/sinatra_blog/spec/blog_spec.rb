require_relative "../lib/post.rb"
require_relative "../lib/blog.rb"
require "rspec"


describe Blog do
	before(:each) do
		@blog = Blog.new
		@post3 = Post.new("title3","text3")
		@post1 = Post.new("title1","text1")
		@post2 = Post.new("title2","text2")
	end
	describe '#posts' do
	  it 'starts with an empty array' do
	  	expect(@blog.posts).to be_empty
	  	expect(@blog.posts).to eq([])
	  end
	  it 'after adding is not empty' do
	  	@blog.add_post @post1
	  	expect(@blog.posts).to_not be_empty
	  	expect(@blog.posts).to eq([@post1])
	  end
	end
	describe '#add_post' do
		it 'adds to empty posts array' do
	  	expect(@blog.posts).to be_empty
	  	@blog.add_post(@post1)
	  	expect(@blog.posts).to eq([@post1])
	  	expect(@blog.posts.length).to eq(1)
	  	@blog.add_post(@post2)
	  	expect(@blog.posts).to eq([@post1,@post2])
	  	expect(@blog.posts.length).to eq(2)
		end
	end
	describe '#latest_posts' do
	  it 'returns array of posts by creation time' do
	  	@blog.add_post @post1
	  	@blog.add_post @post3
	  	expect(@blog.latest_posts).to eq [@post3,@post1]
	  	post = Post.new("title","text")
	  	@blog.add_post post
	  	@blog.add_post @post2
	  	expect(@blog.latest_posts).to eq [@post3,@post1,@post2,post]
	  end
	end
  
end
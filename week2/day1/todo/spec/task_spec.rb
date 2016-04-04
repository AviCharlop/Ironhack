require_relative "../lib/task.rb"

RSpec.describe "Task class testing" do
	before :each do
		@task = Task.new("test content")
	end

	it "Returns false task incomplete" do
		expect(@task.complete?).to be false
	end

	it "Returns unique id for each task" do
		expect(@task.id).to eq(2)
	end

	it "returns true after task completed" do
		@task.complete!
		expect(@task.complete?).to be true
	end
	it "Task completion can be undone" do
		@task.complete!
		@task.undo_complete!
		expect(@task.complete?).to be false
	end
	it "Task details can be updated" do
		@task.update_content("ABC")
		expect(@task.content).to eq "ABC"
	end
	it "Task created_at to within 1 minute" do
		now = Time.now.strftime "%Y-%m-%d %H:%M %z"
		expect(@task.created_at.strftime "%Y-%m-%d %H:%M %z").to eq (now)
	end

end
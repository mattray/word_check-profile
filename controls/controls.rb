title "Check file for restricted words and duplicate lines"

file = input('file')

forbidden_words = %w[covid smelly dogfood]

# you can also use plain tests
describe file(file) do
  it { should exist }
  it { should be_file }
end

control "Restricted Words" do
  impact 0.7
  title "Check for Restricted Words"
  desc "These words should not be found in our files"
  describe file(file) do
    forbidden_words.each do |word|
      its('content') { should_not match word }
    end
  end
end

control "Duplicate Lines" do
  impact 0.7
  title "Check for Duplicated Lines"
  desc "There should not be duplicated lines in the file"
  describe command("uniq -d #{file}") do
    its('stdout') { should eq '' }
  end
end

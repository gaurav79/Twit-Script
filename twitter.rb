require 'rubygems'
require 'twitter'

hash_tag = ARGV.first

if hash_tag.nil?
  puts "Please provide a tag. Example 'a_hashtag', '#a_hashtag'"
  exit
end
puts 'fetching......'
links = []

Twitter.search(hash_tag,  :rpp => 100, :result_type => "recent").map do |status|
	links << status.text.match(/\bhttps?:\/\/\S+\b/)
end

links = links.uniq
puts links
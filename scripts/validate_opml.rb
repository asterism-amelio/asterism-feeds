#!/usr/bin/env ruby

require "rexml/document"
require "rexml/xpath"

path = ARGV.fetch(0, "feeds.opml")
document = REXML::Document.new(File.read(path))
root = document.root

abort "root must be <opml version=\"2.0\">" unless root&.name == "opml" && root.attributes["version"] == "2.0"

entries = REXML::XPath.match(root, "body//outline")
abort "at least one feed entry is required" if entries.empty?

urls = entries.map do |entry|
  abort "feed entries must have type=\"rss\"" unless entry.attributes["type"] == "rss"

  text = entry.attributes["text"].to_s.strip
  url = entry.attributes["xmlUrl"].to_s.strip
  abort "feed entries must have non-empty text" if text.empty?
  abort "feed entries must have non-empty xmlUrl" if url.empty?

  url
end

abort "xmlUrl values must be unique" unless urls.uniq.length == urls.length

puts "validated #{entries.length} feed entries"

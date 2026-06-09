# File I/O in Ruby
# Reading from and writing to files.

# ─── WRITING A FILE ───────────────────────────────────────────────────────────
puts "=== Writing ==="

# "w" mode: write (creates file, overwrites if it exists)
File.open("sample.txt", "w") do |file|
  file.puts "Line 1: Hello, Ruby!"
  file.puts "Line 2: File I/O is easy."
  file.puts "Line 3: This is the last line."
end
puts "File written."

# "a" mode: append (adds to existing file)
File.open("sample.txt", "a") do |file|
  file.puts "Line 4: Appended after the fact."
end
puts "Line appended."

# ─── READING A FILE ───────────────────────────────────────────────────────────
puts "\n=== Reading ==="

# Read entire file as one string
content = File.read("sample.txt")
puts "Full content:\n#{content}"

# Read into an array of lines
lines = File.readlines("sample.txt")
puts "Line count: #{lines.length}"
puts "First line: #{lines.first.chomp}"

# Read line by line (memory-efficient for large files)
puts "\nLine by line:"
File.foreach("sample.txt") do |line|
  puts "  >> #{line.chomp}"
end

# ─── FILE INFO ────────────────────────────────────────────────────────────────
puts "\n=== File Info ==="
puts "Exists? #{File.exist?("sample.txt")}"
puts "Size: #{File.size("sample.txt")} bytes"
puts "Absolute path: #{File.expand_path("sample.txt")}"
puts "Extension: #{File.extname("sample.txt")}"
puts "Basename: #{File.basename("sample.txt")}"
puts "Directory: #{File.dirname(File.expand_path("sample.txt"))}"

# ─── WORKING WITH DIRECTORIES ─────────────────────────────────────────────────
puts "\n=== Directories ==="

Dir.mkdir("test_dir") unless Dir.exist?("test_dir")
puts "Created test_dir"

# List files in current directory
puts "Files here: #{Dir.glob("*.rb").first(3).inspect}"

Dir.rmdir("test_dir")
puts "Removed test_dir"

# ─── CSV (BONUS) ─────────────────────────────────────────────────────────────
puts "\n=== CSV ==="
require "csv"

# Write a CSV
CSV.open("people.csv", "w") do |csv|
  csv << ["name", "age", "city"]
  csv << ["Alice", 30, "Cairo"]
  csv << ["Bob",   25, "London"]
  csv << ["Carol", 28, "Tokyo"]
end
puts "CSV written."

# Read a CSV
CSV.foreach("people.csv", headers: true) do |row|
  puts "#{row["name"]} is #{row["age"]} and lives in #{row["city"]}"
end

# Cleanup
File.delete("sample.txt") if File.exist?("sample.txt")
File.delete("people.csv") if File.exist?("people.csv")
puts "\nCleanup done."

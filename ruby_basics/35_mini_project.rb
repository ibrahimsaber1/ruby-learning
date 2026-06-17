# Mini Project: Personal Task Manager
# This ties together: classes, modules, enumerables, error handling,
# file I/O, blocks, symbols, hashes, and frozen strings.

require "json"
require "date"

# ─── MODULE: Displayable ─────────────────────────────────────────────────────
module Displayable
  def separator(char = "-", width = 40)
    puts char * width
  end

  def header(title)
    separator("=")
    puts title.center(40)
    separator("=")
  end
end

# ─── CUSTOM EXCEPTION ─────────────────────────────────────────────────────────
class TaskNotFoundError < StandardError
  def initialize(id)
    super("Task with ID #{id} not found.")
  end
end

# ─── TASK CLASS ───────────────────────────────────────────────────────────────
class Task
  include Comparable

  PRIORITIES = %i[low medium high critical].freeze

  attr_reader   :id, :created_at
  attr_accessor :title, :priority, :done, :tags

  @@next_id = 1

  def initialize(title, priority: :medium, tags: [])
    raise ArgumentError, "Invalid priority" unless PRIORITIES.include?(priority)

    @id         = @@next_id
    @@next_id  += 1
    @title      = title
    @priority   = priority
    @tags       = tags
    @done       = false
    @created_at = Date.today.to_s
  end

  def complete!
    @done = true
    self
  end

  def <=>(other)
    PRIORITIES.index(@priority) <=> PRIORITIES.index(other.priority)
  end

  def to_h
    {
      id:         @id,
      title:      @title,
      priority:   @priority.to_s,
      tags:       @tags,
      done:       @done,
      created_at: @created_at
    }
  end

  def to_s
    status = @done ? "✓" : "○"
    "[#{status}] ##{@id} (#{@priority.upcase.to_s.ljust(8)}) #{@title}"
  end
end

# ─── TASK MANAGER CLASS ───────────────────────────────────────────────────────
class TaskManager
  include Displayable

  FILE_PATH = "tasks.json".freeze

  def initialize
    @tasks = []
    load_from_file
  end

  def add(title, priority: :medium, tags: [])
    task = Task.new(title, priority: priority, tags: tags)
    @tasks << task
    save_to_file
    puts "Added: #{task}"
    task
  end

  def complete(id)
    task = find!(id)
    task.complete!
    save_to_file
    puts "Completed: #{task}"
  end

  def delete(id)
    task = find!(id)
    @tasks.delete(task)
    save_to_file
    puts "Deleted task ##{id}: #{task.title}"
  end

  def list(filter: :all)
    header("TASK MANAGER")
    tasks = case filter
            when :pending   then @tasks.reject(&:done)
            when :done      then @tasks.select(&:done)
            when :all       then @tasks
            else @tasks
            end

    if tasks.empty?
      puts "No tasks found."
    else
      tasks.sort.reverse.each { |t| puts t }
    end

    separator
    puts "Total: #{@tasks.size} | Done: #{@tasks.count(&:done)} | Pending: #{@tasks.reject(&:done).size}"
  end

  def stats
    header("STATS")

    by_priority = @tasks.group_by(&:priority)
    PRIORITIES = Task::PRIORITIES
    PRIORITIES.each do |p|
      count = (by_priority[p] || []).size
      bar = "█" * count
      puts "#{p.to_s.ljust(10)} #{bar} (#{count})"
    end

    separator
    tags = @tasks.flat_map(&:tags).tally.sort_by { |_, v| -v }
    puts "Top tags: #{tags.first(3).map { |t, c| "#{t}(#{c})" }.join(", ")}"
  end

  def find_by_tag(tag)
    @tasks.select { |t| t.tags.include?(tag) }
  end

  private

  def find!(id)
    @tasks.find { |t| t.id == id } || raise(TaskNotFoundError.new(id))
  end

  def save_to_file
    File.write(FILE_PATH, JSON.pretty_generate(@tasks.map(&:to_h)))
  rescue => e
    puts "Warning: could not save tasks: #{e.message}"
  end

  def load_from_file
    return unless File.exist?(FILE_PATH)

    data = JSON.parse(File.read(FILE_PATH), symbolize_names: true)
    @tasks = data.map do |h|
      t = Task.new(h[:title], priority: h[:priority].to_sym, tags: h[:tags])
      t.complete! if h[:done]
      t
    end
  rescue => e
    puts "Warning: could not load tasks: #{e.message}"
  end
end

# ─── DEMO ─────────────────────────────────────────────────────────────────────
manager = TaskManager.new

manager.add("Learn Ruby basics",        priority: :high,     tags: ["ruby", "learning"])
manager.add("Build a Rails app",        priority: :medium,   tags: ["rails", "learning"])
manager.add("Write unit tests",         priority: :high,     tags: ["testing", "ruby"])
manager.add("Read metaprogramming post",priority: :low,      tags: ["ruby", "reading"])
manager.add("Deploy to production",     priority: :critical, tags: ["devops"])

manager.complete(1)
manager.complete(4)

puts "\n"
manager.list
puts "\n"
manager.list(filter: :pending)
puts "\n"
manager.stats

puts "\nRuby-tagged tasks:"
manager.find_by_tag("ruby").each { |t| puts "  #{t}" }

# Error handling demo
begin
  manager.complete(999)
rescue TaskNotFoundError => e
  puts "\nError caught: #{e.message}"
end

# Cleanup
File.delete("tasks.json") if File.exist?("tasks.json")

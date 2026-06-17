# 🔴 Ruby Learning Roadmap

A structured, hands-on collection of Ruby scripts — from your very first `puts` to metaprogramming and OOP. Built by working through each concept step by step, with runnable code for every topic.

> **Who is this for?** Developers coming from another language (Python, JavaScript, C, etc.) who want to learn Ruby the right way before jumping into Rails.

---

## 🗺️ How to Use This Repo

Each file is numbered. Work through them **in order** — later files assume you understand the earlier ones. Every script is runnable on its own:

```bash
ruby 01_intro.rb
```

Ruby 3.x is recommended. Check your version with:

```bash
ruby --version
```

---

## 📚 Learning Roadmap

### 🟢 Stage 1 — The Foundations

| # | File | What You Learn |
|---|------|----------------|
| 01 | `01_intro.rb` | Your first Ruby program — `print` vs `puts` |
| 02 | `02_data_types.rb` | Integer, Float, String, Symbol, Array, Hash, Boolean, Nil |
| 03 | `03_inter.rb` | String interpolation `#{}`, single vs double quotes |
| 04 | `04_arth.rb` | Arithmetic operators: `+`, `-`, `*`, `/`, `%`, `**` |
| 05 | `05_casting.rb` | Type conversion: `to_i`, `to_f`, `to_s`, `to_sym`, `to_a` |

**Key takeaway:** Ruby is expressive. `"hello".upcase` feels natural because everything is an object.

---

### 🟡 Stage 2 — Strings Deep Dive

| # | File | What You Learn |
|---|------|----------------|
| 06 | `06_string.rb` | String methods: `upcase`, `reverse`, `gsub`, `split`, `chomp`, heredocs |
| 07 | `07_string_change.rb` | Bang methods (`upcase!`) — mutating vs returning a copy |
| 08 | `08_strings_as_arrays.rb` | Indexing, slicing, `include?`, `split`, `gsub` |
| 31 | `31_string_formatting.rb` | `sprintf`, `%` operator, padding, alignment, `tr`, `scan` |
| 32 | `32_regex.rb` | Regular expressions: patterns, `match`, `scan`, `gsub`, named captures |

**Key takeaway:** Strings in Ruby are mutable objects with a rich API. `!` methods modify in place; regular methods return a new string.

---

### 🟡 Stage 3 — Numbers, Math, and Operators

| # | File | What You Learn |
|---|------|----------------|
| 09 | `09_assigment_operators.rb` | `+=`, `-=`, `*=` — compound assignment |
| 10 | `10_math_methods.rb` | `abs`, `round`, `floor`, `ceil`, `Math.sqrt`, `Math.log10` |
| 12 | `12_comparison.rb` | `==`, `!=`, `>`, `<`, `<=>` (spaceship), `===` |
| 13 | `13_boolean_operatores.rb` | `&&`, `||`, `!`, and `and`/`or`/`not` |

---

### 🟡 Stage 4 — Control Flow

| # | File | What You Learn |
|---|------|----------------|
| 11 | `11_user_inputs.rb` | `gets.chomp`, `.to_i`, `.to_f` |
| 17 | `17_conditions.rb` | `if`/`elsif`/`else`, `unless`, `||=` |
| 18 | `18_switch_case.rb` | `case`/`when` with ranges |
| 30 | `30_ranges.rb` | `..` vs `...`, ranges in case/when, endless ranges |

**Key takeaway:** `unless` is Ruby's way of saying `if not`. Use it when it reads more naturally.

---

### 🟠 Stage 5 — Collections

| # | File | What You Learn |
|---|------|----------------|
| 14 | `14_arrays.rb` | Creating arrays, indexing, slicing with `..` and `...` |
| 15 | `15_n_dimantions.rb` | Multi-dimensional arrays (grids, matrices) |
| 16 | `16_array_method.rb` | `push`, `pop`, `shift`, `unshift`, `insert`, `<<` |
| 21 | `21_hash.rb` | Key-value pairs, `each_key`, `each_value`, hash methods |
| 22 | `22_symbols.rb` | Symbols vs strings, `object_id`, immutability |

---

### 🟠 Stage 6 — Loops and Iteration

| # | File | What You Learn |
|---|------|----------------|
| 19 | `19_loops.rb` | `for`, `while`, `until` |
| 20 | `20_other_loops.rb` | `each`, `next`, `break`, `upto`, `downto` |
| 26 | `26_enumerables.rb` | `map`, `select`, `reject`, `reduce`, `group_by`, `sort_by`, `tally`, `zip` |

**Key takeaway:** Prefer `each` and Enumerable methods over `for` loops. `map`/`select`/`reduce` are the backbone of idiomatic Ruby.

---

### 🔴 Stage 7 — Methods and Functions

| # | File | What You Learn |
|---|------|----------------|
| 23 | `23_functions.rb` | `def`, `return`, implicit return, splat `*args` |
| 24 | `24_predicte_and_bang.rb` | Predicate methods (`?`) and bang methods (`!`) conventions |
| 25 | `25_blocks_procs_lambdas.rb` | Blocks, `yield`, `Proc`, `lambda`, `->`, return behavior differences |

**Key takeaway:** In Ruby, the last evaluated expression is always returned. You rarely need an explicit `return`.

---

### 🔴 Stage 8 — Object-Oriented Ruby

| # | File | What You Learn |
|---|------|----------------|
| 27 | `27_oop.rb` | Classes, `initialize`, `attr_accessor`, inheritance, modules, `Comparable` |
| 34 | `34_object_internals.rb` | `object_id`, `freeze`, `dup` vs `clone`, `==` vs `eql?` vs `equal?`, introspection |

**Key takeaway:** Ruby is a pure OOP language — `1.class` returns `Integer`. Everything has methods.

---

### 🔴 Stage 9 — Practical Skills

| # | File | What You Learn |
|---|------|----------------|
| 28 | `28_error_handling.rb` | `begin`/`rescue`/`ensure`, `raise`, custom exceptions, `retry` |
| 29 | `29_file_io.rb` | Reading, writing, appending files, CSV, `Dir` |

---

### ⚫ Stage 10 — Advanced Ruby

| # | File | What You Learn |
|---|------|----------------|
| 33 | `33_metaprogramming.rb` | Open classes, `define_method`, `method_missing`, `send`, `respond_to?` |
| 35 | `35_mini_project.rb` | **Capstone** — Task manager using all concepts together |

---

## 🚀 What Comes Next — Rails

Once you're comfortable with all the above, you're ready for Rails. Ruby knowledge that matters most for Rails:

- **Blocks and enumerables** — used everywhere in ActiveRecord
- **Symbols and hashes** — the foundation of Rails' options/config patterns  
- **Modules** — how Rails concerns work
- **Metaprogramming** — how `has_many`, `belongs_to`, and `validates` are implemented
- **Bang methods** — `save!` vs `save`, `update!` vs `update`

---

## 📖 Resources

### 🟢 Start Here (Official Docs)
- [Ruby Official Quickstart](https://www.ruby-lang.org/en/documentation/quickstart) — interactive intro from the creators
- [Ruby Language Documentation](https://www.ruby-lang.org/en/documentation/) — full reference

### 🟡 Coming From Another Language
- [Ruby from Python](https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/to-ruby-from-python/) — direct comparisons for Python developers
- [Ruby Style Guide](https://rubystyle.guide/) — community-agreed conventions for idiomatic Ruby

### 🟠 Going Deeper
- [Blocks in Ruby — nashbridges.me](http://nashbridges.me/blocks-in-ruby) — blocks explained clearly with real examples
- [Ruby Metaprogramming — Toptal](https://www.toptal.com/developers/ruby/ruby-metaprogramming-cooler-than-it-sounds) — metaprogramming made approachable

### 🔴 Moving to Rails
- [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html) — the official Rails guide (**read this before writing a single line of Rails**)
- [From Developer to Rails Developer](https://supergood.software/from-developer-to-rails-developer-and-then-some/) ⭐ **Mandatory** — best guide for transitioning your existing developer skills into Rails

### ⚫ Production-Grade Ruby
- [Service Objects in Rails — Honeybadger](https://www.honeybadger.io/blog/refactor-ruby-rails-service-object/) — how to structure real Rails apps cleanly

---

## 🛠️ Running the Scripts

```bash
# Run any individual file
ruby 01_intro.rb

# Run all scripts in order (skip ones that need stdin)
for f in [0-9][0-9]_*.rb; do
  echo "--- $f ---"
  ruby "$f" 2>&1 | head -20
  echo
done
```

> ⚠️ Files `11_user_inputs.rb` and `17_conditions.rb` use `gets` and will wait for keyboard input. Skip them in batch runs or pipe in values.

---

## 📁 Repository Structure

```
.
├── 01_intro.rb
├── 02_data_types.rb
├── ...
├── 25_blocks_procs_lambdas.rb  ← new
├── 26_enumerables.rb           ← new
├── 27_oop.rb                   ← new
├── 28_error_handling.rb        ← new
├── 29_file_io.rb               ← new
├── 30_ranges.rb                ← new
├── 31_string_formatting.rb     ← new
├── 32_regex.rb                 ← new
├── 33_metaprogramming.rb       ← new
├── 34_object_internals.rb      ← new
├── 35_mini_project.rb          ← capstone project
└── README.md
```

---

## 💡 Tips for Learning Ruby

1. **Use IRB** — Ruby's interactive shell. Type `irb` in your terminal and experiment live.
2. **Read error messages** — Ruby's errors are descriptive. `NoMethodError`, `TypeError`, `ArgumentError` all tell you exactly what went wrong.
3. **`.class` is your friend** — when unsure what something is, call `.class` on it.
4. **Prefer readability** — Ruby has many ways to do the same thing. Pick the one that reads most like English.
5. **Run the scripts, then break them** — change things, add `puts`, experiment. That's how it sticks.

---

*Built while learning Ruby — the best way to learn is to write the code yourself.*

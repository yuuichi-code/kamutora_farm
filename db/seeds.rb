# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# キャラクターのデータ
Character.create!(name: 'マヒト', unit_element: 'fire', initial_rarity: 4)
Character.create!(name: 'コリキ', unit_element: 'aqua', initial_rarity: 4)
Character.create!(name: 'イツキ', unit_element: 'wind', initial_rarity: 4)
Character.create!(name: 'スイ', unit_element: 'earth', initial_rarity: 4)
Character.create!(name: 'チバリ', unit_element: 'master', initial_rarity: 4)
Character.create!(name: '[陽だまり]エニス', unit_element: 'master', initial_rarity: 4)
Character.create!(name: 'キイチ', unit_element: 'master', initial_rarity: 4)

# ターン数のデータ
number_of_turns = 1..8
number_of_turns.each do |turn|
  Turn.create!(turn_number: turn)
end

# チャプター数のデータ
number_of_chapters = 1..4
number_of_chapters.each do |chapter|
  Chapter.create!(chapter_number: chapter)
end

# チャプターとターンの組み合わせデータ
number_of_chapters.each do |chapter_id|
  number_of_turns.each do |turn_id|
    chapter = Chapter.find(chapter_id)
    turn = Turn.find(turn_id)
    ChapterTurn.create!(chapter: chapter, turn: turn)
  end
end

# 畑の番号のデータ
number_of_farms = 1..9
number_of_farms.each do |number|
  farm = FarmPlace.create!(farm_number: number)
end

# 花の種のデータ
FlowerSeed.create!(name: 'ミツボシバナ')
FlowerSeed.create!(name: 'ヒメサクラ')
FlowerSeed.create!(name: 'ワカレワタ')
FlowerSeed.create!(name: 'タテガミソウ')
FlowerSeed.create!(name: 'モモノハス')

# 行動のデータ
Action.create!(content: '種回収')
Action.create!(content: '収穫')
Action.create!(content: '師匠コマンド')
Action.create!(content: 'その他')
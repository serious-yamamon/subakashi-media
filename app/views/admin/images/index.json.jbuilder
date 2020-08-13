json.images @images do |image|
  json.id    image.id
  json.url   image.file_name.url
  json.thumb image.file_name.url(:thumb)
end

extends Resource

@export var photos: Array = []
@export var letters: Array = []

func add_photo(photo_name: String):
	if photos.size() < 2:
		photos.append(photo_name)

func add_letter(letter_name: String):
	if letters.size() < 4:
		letters.append(letter_name)


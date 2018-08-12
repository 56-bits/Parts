extends RichTextLabel

var queue = []
var message_limit = 4

func _ready():
	push_align(VALIGN_BOTTOM)

func refresh():
	if queue.size() > message_limit:
		queue.pop_front()
	
	#clear present text
	text = ""
	for message in queue:
		
		#choose message colour
		match message.status:
			"good":
				push_color(Color(0.1,0.9,0.1))
			"bad":
				push_color(Color(0.9,0.1,0.1))
			_:
				push_color(Color(0.8,0.8,0.8))
		
		add_text(message.txt)
		newline()

func new_message(message, type = ""):
	queue.push_back({txt = message, status = type})
	refresh()

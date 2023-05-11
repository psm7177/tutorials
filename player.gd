extends AnimatedSprite2D

@export var speed = 150
@onready var screensize = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(screensize.x / 2, screensize.y - 32);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.get_vector("left", "right", "up", "down")
	
	if input.x > 0:
		self.frame = 2
		$Booster.animation = "right"
	elif input.x < 0:
		self.frame = 0
		$Booster.animation = "left"
	else:
		self.frame = 1
		$Booster.animation = "forward"
		
	self.position += input * speed * delta
	self.position = position.clamp(Vector2(8,8), screensize - Vector2(8,8))

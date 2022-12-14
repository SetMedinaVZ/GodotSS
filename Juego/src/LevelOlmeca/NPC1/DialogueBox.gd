extends Control
var dialog = [
	"Hola jugador",
	"Mi nombre es Kukulcan, también soy conocido como Quetzalcoatl el dios serpiente.",
	"Soy el encargado de guiarte durante tu larga travesía a través de las distintas culturas del antiguo México.",
	"Durante tus misiones apareceré varias veces para contarte una historia o para guiarte. Así que cuando me veas, acercate a mí y presiona la tecla E",
	"Tu misión es llevar como ofrenda los jarrones a la cabeza grande de piedra, pero te encontrarás con un obstáculo…",
	"Te encontrarás con jaguares, por lo que tendrás que esquivarlos, no los puedes dañar ya que para tu gente son dioses y alabados por todos.",
	"Mucha suerte! y recuerda...", 
	"Los jaguares son muy importantes para la naturaleza y para ti."
]
var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _physics_process(delta):
	$"Indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

#Funcion que carga el dialogo linea por linea en el array
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible" , 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
		
	dialog_index += 1

#Verifica que el dialogo haya terminado para desaparecer la caja de dialogo
func _on_Tween_tween_completed(object, key):
	finished = true

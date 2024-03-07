extends Node

func _ready() -> void:
	pass

func loading_bar(progress_percent : int, steps : int) -> String:
	var bar : String
	var steps_filled : int = progress_percent / (100 / steps)
	
	bar += "["
	
	for n in steps_filled:
		bar += ":"
	for n in steps - steps_filled:
		bar += " "
	
	bar += "]"
	
	return bar

func graph_bar(amount : int) -> String:
	var bar : String
	
	for n in amount:
		bar += ":"
	
	return bar

func stacked_graph_bar(amounts : Array, descriptions : Array = []) -> String: # with labels
	# example format:
	# 1  2      3 4   5 6                  7
	# :::=======::====::===================:::::
	# 1: amount 1
	# 2: amount 2
	# ...
	
	var numbers : String
	var bar : String
	
	for index in amounts.size():
		var indicator_number := "%s" % index
		numbers += indicator_number
		
		var fill_character := ":"
		if index % 2 == 1:
			fill_character = "="
		
		for n in amounts[index]:
			bar += fill_character
			
			if n >= indicator_number.length(): 
				numbers += " "
	
	var output : String
	
	output += numbers
	output += "\n" + bar
	for index in descriptions.size():
		output += ("\n%s " % index) + descriptions[index]
	
	return output

func _stacked_graph_bar_indexed(amounts : Array) -> String:
	# example format:
	# 1  2      3 4   5 6                  7
	# :::=======::====::===================:::::

	var numbers : String
	var bar : String
	
	for index in amounts.size():
		var indicator_number := "%s" % index
		numbers += indicator_number
		
		var fill_character := ":"
		if index % 2 == 1:
			fill_character = "="
		
		for n in amounts[index]:
			bar += fill_character
			
			if n >= indicator_number.length(): 
				numbers += " "
	
	return numbers + "\n" + bar

func stacked_graph_bar_simple(amounts : Array) -> String: # no labels
	# example format:
	# :::=======::====::===================:::::
	
	var numbers : String
	var bar : String
	
	for index in amounts.size():
		var fill_character := ":"
		if index % 2 == 1:
			fill_character = "="
		
		for n in amounts[index]:
			bar += fill_character
	
	return bar

func percentage_bar(amounts : Array, descriptions : Array = []) -> String: # no labels
	
	var total := 0
	for item in amounts:
		total += item
	
	var amounts_as_percentages := amounts
	for index in amounts.size():
		var adjusted_amount : float = amounts[index] as float / total * 100
		amounts_as_percentages[index] = adjusted_amount
	
	var output : String
	
	output += _stacked_graph_bar_indexed(amounts_as_percentages)
	for index in descriptions.size():
		output += ("\n%s " % index) \
		+ "%0.1f" % amounts_as_percentages[index] + '% ' \
		+ descriptions[index]
	
	return output

func percentage_bar_simple(amounts : Array) -> String: # no labels
	var total := 0
	for item in amounts:
		total += item
	
	var amounts_as_percentages := amounts
	for index in amounts.size():
		var adjusted_amount : int = amounts[index] as float / total * 100
		amounts_as_percentages[index] = adjusted_amount
	
	return stacked_graph_bar_simple(amounts_as_percentages)

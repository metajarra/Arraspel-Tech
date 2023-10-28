# hi radio spraks
# it's me mail toss scallywag here to explain the code

# 2D - unit circle
func get_random_point_in_unit_circle(rng: RandomNumberGenerator, origin : Vector2, radius : float) -> Vector2:
	# this is weighted towards high values
	var random_radius := rng.randf_range(0.0, radius)
	random_radius += rng.randf_range(0.0, radius - random_radius)
	
	var x_offset : float
	var y_offset : float
	
	# if you want to optimize this you could move the rng.randi_range(0, 1) down to the next if statement
	# but I used this because I think it's more readable
	var is_x_first : bool = rng.randi_range(0, 1)
	
	# fun fact: I needed to add this because otherwise a trench formed around the equator. it looked like the death star
	# now alternating between generating x or y first ensures values are distributed equally
	if is_x_first:
		x_offset = rng.randf_range(0.0, random_radius)
		y_offset = sqrt( \
			(random_radius * random_radius) \
			- (x_offset * x_offset)) 
	
	else:
		y_offset = rng.randf_range(0.0, random_radius)
		x_offset = sqrt( \
			(random_radius * random_radius) \
			- y_offset * y_offset)
	
	if rng.randi_range(0, 1): x_offset *= -1
	if rng.randi_range(0, 1): y_offset *= -1
	
	return Vector2(x_offset, y_offset)

# 3D - unit sphere
func get_random_point_in_unit_sphere(rng : RandomNumberGenerator, origin : Vector3, radius : float) -> Vector3:
	var random_radius := rng.randf_range(0.0, radius)
	random_radius += rng.randf_range(0.0, radius - random_radius)
	
	var x_offset : float
	var y_offset : float
	var z_offset : float
	
	var first_vector : int = rng.randi_range(0, 2)
	
	match first_vector:
		0: # x first
			x_offset = rng.randf_range(0.0, random_radius)
			y_offset = rng.randf_range(0.0, random_radius - x_offset)
			z_offset = sqrt( \
				(random_radius * random_radius) \
				- (x_offset * x_offset) \
				- (y_offset * y_offset))
		1: # y first
			y_offset = rng.randf_range(0.0, random_radius)
			z_offset = rng.randf_range(0.0, random_radius - y_offset)
			x_offset = sqrt( \
				(random_radius * random_radius) \
				- (y_offset * y_offset) \
				- (z_offset * z_offset))
		2: # z first
			z_offset = rng.randf_range(0.0, random_radius)
			x_offset = rng.randf_range(0.0, random_radius - z_offset)
			y_offset = sqrt( \
				(random_radius * random_radius) \
				- (z_offset * z_offset) \
				- (x_offset * x_offset))
	
	if rng.randi_range(0, 1): x_offset *= -1
	if rng.randi_range(0, 1): y_offset *= -1
	if rng.randi_range(0, 1): z_offset *= -1
	
	return Vector3(x_offset, y_offset, z_offset)

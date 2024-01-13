/// @param {Struct.Vector2} position
/// @param {Asset.GMObject} object
function EncouterEnemy(position, object) constructor {
	self.position = position;
	self.object = object;
	
	/// @param {Id.Instance} encouter
	static create = function(encouter) {
		if (object_get_base_parent(object) != obj_encouter_enemy) {
			throw new ObjectIndentityException(object, obj_encouter_enemy);
		}
		
		return instance_create_depth(position.x, position.y, 0, object, { encouter: encouter });
	}
}
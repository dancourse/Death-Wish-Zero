
package  
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	


	/**
	 * ...
	 * @author giulio
	 */
	public class CameraPlatform extends Entity
	{
		var player:Player;
		
		var cameraOffsetX:Number;  
		var cameraOffsetY:Number;
		
		
		public function CameraPlatform(player:Player) 
		{
			this.player = player;
		}
		
		override public function update():void
		{
			FP.camera.x = (player.getPosition().x + player.halfWidth) - FP.width/2;
			FP.camera.y = (player.getPosition().y + player.halfHeight) - FP.height / 2;
			trace(player.width / 2 + " " + player.height / 2);
		}
		
		
		
		
	}

}
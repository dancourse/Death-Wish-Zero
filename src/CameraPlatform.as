
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
		
		var n:int = 7
		var cameraOffsetX:Number = FP.width/7; 
		
		var cameraOffsetY:Number;
		
		var cameraSpeed:Number = 5; //SAME AS PLAYER SPEED
		
		
		public function CameraPlatform(player:Player) 
		{
			this.player = player;
			//cameraSpeed = player.speed;
			
			
			
		}
		
		override public function update():void
		{
	
			
			if (Math.abs(player.x - FP.camera.x) > cameraOffsetX*(n-1) - player.width)
			{
				 FP.camera.x += cameraSpeed;
			}
			if (Math.abs( player.x - FP.camera.x) < cameraOffsetX )
			{
				FP.camera.x -= cameraSpeed;
			}
			
			
			
			FP.camera.y = (player.getPosition().y + player.halfHeight) - FP.height / 2;
			
		}
		
		
		
		
	}

}
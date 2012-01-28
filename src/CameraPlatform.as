
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
		
		var cameraOffsetY:Number = FP.height/2;
		
		var cameraSpeed:Number; //SAME AS PLAYER SPEED
		var cameraSpeedY = 8;
		
		public function CameraPlatform(player:Player) 
		{
			this.player = player;
			cameraSpeed = player.power;
			
			FP.camera.x = player.x -FP.halfWidth;
			FP.camera.y = player.y - FP.halfHeight/3*2;
			
			
		}
		
		override public function update():void
		{
			
			
			if (Math.abs(player.x - FP.camera.x) > cameraOffsetX*(n-1) - player.width)
			{
				 FP.camera.x += cameraSpeed;
			}
			if (Math.abs( player.x - FP.camera.x) <= cameraOffsetX )
			{
				FP.camera.x -= cameraSpeed;
			}
			
			
			
				if (Math.abs(player.y - FP.camera.y)  > cameraOffsetY) //&& player.getState() != 1)
				{
					 FP.camera.y += cameraSpeedY;
				}
				if (Math.abs( player.y - FP.camera.y) <= cameraOffsetY)  //&& player.getState() != 1)
				{
					FP.camera.y -= cameraSpeedY;
				}
			
			
			
			
			
		}
		
		
		
		
	}

}
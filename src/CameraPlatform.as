
package  
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	


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
		
		Input.define("Jump", Key.Z, Key.UP,Key.W);
			Input.define("Shoot", Key.SPACE, Key.X, Key.C);
			Input.define("moveLeft", Key.LEFT, Key.A);
			Input.define("moveRight", Key.RIGHT, Key.D);
		
		public function CameraPlatform(player:Player) 
		{
			this.player = player;
			cameraSpeed = player.power ;
			cameraSpeedY = player.power*3/2;
			
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
			
			if  (FP.camera.y < 500)
			{
			
				if (Math.abs(player.y - FP.camera.y)  > cameraOffsetY && player.getState() != 1)
					
				{
					 FP.camera.y += cameraSpeedY;
				}
				if (Math.abs( player.y - FP.camera.y) <= cameraOffsetY && player.getState() != 1) 
					
				{
					FP.camera.y -= cameraSpeedY;
				}
				
				/* Trying to center the camera when the player is in idle state
				 * if (player.getState() == 2) {
					var tol:int = 2;
					if (Math.abs(player.x - FP.camera.x) > Math.abs(player.x -FP.halfWidth)) FP.camera.x += cameraSpeed/tol;
					if (Math.abs(player.x - FP.camera.x) < Math.abs(player.x -FP.halfWidth)) FP.camera.x -= cameraSpeed/tol;
				}
				*/
			}
			else
			{
			 FP.camera.y = 0;
			}
			
		}
		
		
		
		
	}

}
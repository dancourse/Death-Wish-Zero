package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class World1 extends World 
	{
		var player:Player = new Player;
		var cameraPlatform:CameraPlatform = new CameraPlatform(player);
		
		public function World1() 
		{
			super();
			
			add(player);
			player.setPosition(150, 150);
			
			
			for (var i:int = 0; i < 10; i++)
			{
				var ent:MyEntity = new MyEntity;
				ent.setPosition(200 * Number(i), 0);
				add(ent);
				
			}
		}
		
		override public function update():void
		{
			super.update();
			cameraPlatform.update();
		}
	}

}
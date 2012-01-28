package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class World1 extends World 
	{
		var player:Player = new Player(150, 50);
		var cameraPlatform:CameraPlatform = new CameraPlatform(player);
		
		public function World1() 
		{
			super();
			
			add(player);
			
			
			
			for (var i:int = 0; i < 40;i++ )
			{
				add(new Wall(i * 32, 200));
			}
		}
		
		override public function update():void
		{
			super.update();
			cameraPlatform.update();
		}
	}

}
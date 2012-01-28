package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Lukas
	 */
	
	 
	public class Main extends Engine
	{
		private var _gameWorld:GameWorld;
		
		public function Main():void 
		{
			super(800, 600, 60, false);
			_gameWorld = new GameWorld;
		}
		
		override public function init():void 
		{
			FP.world = _gameWorld;
			// entry point
		}
		
	}
	
}
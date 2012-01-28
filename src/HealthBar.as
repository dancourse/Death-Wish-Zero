package  
{
	/**
	 * ...
	 * @author giulio
	 */
	public class HealthBar extends MyEntity 
	{
		[Embed(source = 'assets/healthvalues.png')] private const BAR:Class;
		public var sprMapBar:Spritemap = new Spritemap(BAR, 48, 32);
		
		public function HealthBar() 
		{
			
		sprMapBar.add("zero", [0], 1, false);
		sprMapBar.add("one", [1], 1, false);
		sprMapBar.add("two", [2], 1, false);
		sprMapBar.add("three", [3], 1, false);
		sprMapBar.add("four", [4], 1, false);
		sprMapBar.add("five", [5], 1, false);
		sprMapBar.add("six", [6], 1, false);
		sprMapBar.add("seven", [7], 1, false);
		sprMapBar.add("eight", [8], 1, false);
		
		graphic.scrollX = graphic.scrollY = 0;
		
		}
		
		override public function update(health:String):void {
			
					sprMapBar.pay(health);
				
			
		}
		
	}

}
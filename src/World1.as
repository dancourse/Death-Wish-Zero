package  
{
	import net.flashpunk.World;
	import flash.events.*; 
	import flash.net.*;
	import flash.xml.*;
		import net.flashpunk.graphics.Backdrop;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class World1 extends World 
	{
		var player:Player =new Player(700, 300); 
		var cameraPlatform:CameraPlatform; 
		
		// Block stuff
		var level_blockSize = 32; // the pixel size of a block
		var level_width:int = 40; // the level width from the .eol
		
		// Timing stuff
		// 0 = easy
		// 1 = medium
		// 2 = hard
		var timing_all:Array = new Array(30, 20, 10);
		
		
		private var backdrop:Backdrop;
		[Embed(source = "/../src/assets/backdrop.png")]
		private const BACKGROUNDSHEET:Class;
		
		public function World1(difficulty:int) 
		{
			super();
			
			backdrop = new Backdrop(BACKGROUNDSHEET, true, true);
			add(new MyBackground(backdrop));
		
			
			// draw the blocks
			level_init(1);
			
			add(player);
			
			// add the timer bar
			cameraPlatform = new CameraPlatform(player);
			add(player.healthBar);
			add(player.timerBar);
			
			player.setTime(this.timing_all[difficulty - 1]);

		}
		
		public function game_over (isWin:Boolean):void
		{
			trace('GAME OVER:: win = ' + isWin);
			
		}
		
		/**
		 * Score functions
		 */
		public function score_init (diff:int):void
		{
			// add the swf to the stage
			
			
			
			
		}
		 
		
		/*
		* Level functions
		* */
		public function level_init (level_int:int):void
		{
			// clear previuos
			level_clear();
			
			
			// load level as XML
			var myXML:XML;
			var myLoader:URLLoader = new URLLoader();
			myLoader.load(new URLRequest("levels/level"+level_int+".oel"));
			myLoader.addEventListener(Event.COMPLETE, level_processXML);
			
			
			
		}
		
		function level_processXML(e:Event):void 
		{
			var levelXML:XML = new XML(e.target.data);
			
			/*
			 * LEVEL SOLID TILES
			 * */
				var levelSolids_dirty:Array = new Array();
				
				// TURN BITSTRING INTO ARRAY
				levelSolids_dirty = String(levelXML.solids).split("");
				
				// clean out whitespace
				var l:int = levelSolids_dirty.length;
				var levelSolids:Array = new Array();
				for (var i:int = 0; i < l; i++)
				{
					var curLevel:String = levelSolids_dirty[i];
					
					// only accept slevel blocks
					if (curLevel=="0" || curLevel=="1" || curLevel=="2" || curLevel=="3" ) levelSolids.push(levelSolids_dirty[i]);
				}
				
				// put onto stage
				var i_row:int = 0; var i_col:int = 0;
				var l:int = levelSolids.length;
				
				for (var i:int = 0; i < l; i++)
				{
					// column reset && row inc
					if ((i / level_width) == Math.ceil(i / level_width)) 
					{
						i_row ++;
						i_col = 0;
					}
					
					// add a wall
					if (levelSolids[i] == 1) add(new Wall(i_col * level_blockSize, i_row * level_blockSize));
					
					
					
					// inc
					i_col++;
				}
			
			
				
			/*
			 * LEVEL OBJECTS
			 * */
				
				var levelObjects:Array = new Array();
				
				// get the OBJECTS
				
				// Splits the XML on newline
				var objectsList:Array = String(levelXML.objects.children()).split("\n");
				
				
				
				for (var s:String in objectsList)
				{
					
					var objectElement:XML = XML(String(objectsList[s]));
					
					
				}
				 
				
				
				
				for each(var start:XML in levelXML.objects.start)
				{
				player.setPosition(int(start.@x), int(start.@y));
				}
								
				
				
				for each(var helem:XML in levelXML.objects.health)
				{
					add(new HealthItem(int(helem.@x)*2,int(helem.@y)*2))
					
				}
			
				for each(var spikes:XML in levelXML.objects.spikes)
				{
					add(new Spikes(int(spikes.@x)* 2, int(spikes.@y)* 2, int(spikes.@spiketime)));
				}
				
				
		}
		
		public function level_clear ():void
		{
			
			
			
		}
		
		
		
		override public function update():void
		{
			super.update();
			cameraPlatform.update();
			
			// TIME OUT!?
			if (TimerBar(player.timerBar).countDownAt <= 0)
			{
				this.game_over(false);
				
				
			}
		}
	}

}
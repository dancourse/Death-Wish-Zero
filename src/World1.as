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
		var player:Player = new Player(700, 300);
		var cameraPlatform:CameraPlatform = new CameraPlatform(player);
		
		var level_blockSize = 60; // the pixel size of a block
		var level_width:int = 40; // the level width from the .eol
		
		private var backdrop:Backdrop;
		[Embed(source = "/../src/assets/backdrop.png")]
		private const BACKGROUNDSHEET:Class;
		
		public function World1(difficulty:int) 
		{
			super();
			
			backdrop = new Backdrop(BACKGROUNDSHEET, true, true);
			add(new MyBackground(backdrop));
			
			add(player);
			
			level_init(1)
			
			
			/*
			for (var i:int = 0; i < 40;i++ )
			{
				add(new Wall(i * 32, 200));
			}
			*/
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
					
					if (levelSolids[i] == 2) add(new HealthItem(i_col * level_blockSize, i_row * level_blockSize));
					if (levelSolids[i]==3) add(new Wall(i_col * level_blockSize, i_row * level_blockSize));
					
					// inc
					i_col++;
				}
			
			return;	
				
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
					trace(objectElement);
				}
				
				return;
				
				for each (var item:XML in myList) 
				{ 
					trace('*'+item+'*');
				}
				
				return;
				
				trace("XML Output");
				trace("------------------------");
				 
				for (var s:String in levelXML.objects.health) 
				{ 
					trace( levelXML.objects.health[s]); 
				}
								
				return;
				
				for each(var healthElement:XML in levelXML.objects.health)
				{
					
					add(new HealthItem(62, 62))
					
					trace('*'+healthElement)
				}
			
				
		}
		
		public function level_clear ():void
		{
			
			
			
		}
		
		
		
		override public function update():void
		{
			super.update();
			cameraPlatform.update();
		}
	}

}
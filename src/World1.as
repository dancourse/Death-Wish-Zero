package  
{
	import net.flashpunk.World;
	import flash.events.*; 
	import flash.net.*;
	import flash.xml.*;
	import net.flashpunk.graphics.Backdrop;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
		import net.flashpunk.utils.Input;
		import net.flashpunk.utils.Key;
		import net.flashpunk.FP;
		
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author giulio
	 */
	public class World1 extends World 
	{
		var player:Player; 
		var cameraPlatform:CameraPlatform; 
		
		var level_blockSize = 32; // the pixel size of a block
		var level_width:int = 40; // the level width from the .eol
		
		var difficulty:int;
		var lvlnumber:int
		var lifeUp:LifeUp = new LifeUp(0, 0);
		var theTimer:Timer = new Timer(3000,1);
		
		// Timing stuff
		// 0 = easy
		// 1 = medium
		// 2 = hard
		var timing_all:Array = new Array(20, 10, 5);
		
		private var backdrop:Backdrop;
		[Embed(source = "/../src/assets/backdrop.png")]
		private const BACKGROUNDSHEET:Class;
		
		private var deathSound:Sound = new Sound(new URLRequest("../src/assets/death.mp3"));
		private var music:Sound = new Sound(new URLRequest("../src/assets/main_music.mp3"));
		private var oneUpSound:Sound = new Sound(new URLRequest("../src/assets/1up.mp3"));
		private var musicChannel:SoundChannel = new SoundChannel();
		
		public function World1(difficulty:int, levelnumber:int = 1 ) 
		{
			super();
			
			backdrop = new Backdrop(BACKGROUNDSHEET, true, true);
			add(new MyBackground(backdrop));
		
			lvlnumber = levelnumber;
			
			
			//ONLY FOR MY LEVEL_1 !!!!! ---------
			if (levelnumber == 1) level_width = 55;
			
			level_init(levelnumber);
			
			 player = new Player(700, 300); 
			add(player);
			cameraPlatform = new CameraPlatform(player);
			add(player.healthBar); // healthbar disappears under ground tiles
			add(player.timerBar);
			
			this.difficulty = difficulty;

			player.setTime(this.timing_all[difficulty - 1]);

			
			playMusic();
		}
		
		public function timer_out ():void
		{				
			this.lifeUp = new LifeUp(0,0);

			add(lifeUp);
			this.lifeUp.x = this.player.x;
			this.lifeUp.y = this.player.y;

			if(this.theTimer) this.theTimer.stop();

			// hide me in a bit
			this.theTimer = new Timer(3000, 1);
			this.theTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timer_out_removePanel);
			this.theTimer.start();

			this.player.timerBar.startCounting(this.timing_all[difficulty - 1]+3);

		}

		public function timer_out_removePanel (e:TimerEvent):void
		{
			remove(lifeUp);
			this.theTimer.stop();
			FP.world = new World1(difficulty,lvlnumber);
		}
		
		
		private function playMusic():void
		{
			musicChannel = music.play();
			musicChannel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
		}
		
		private function loopMusic(e:Event):void
		{
			if (musicChannel != null)
			{
				musicChannel.removeEventListener(Event.SOUND_COMPLETE, loopMusic);
				playMusic();
				
			}
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
				var level_sticky:Array = new Array();
				
				// TURN BITSTRING INTO ARRAY
				levelSolids_dirty = String(levelXML.solids).split("");
				level_sticky = String(levelXML.stickyblock).split("");
				
				// clean out whitespace
				var l:int = levelSolids_dirty.length;
				var levelSolids:Array = new Array();
				var levelSticky:Array = new Array();
				for (var i:int = 0; i < l; i++)
				{
					var curLevel:String = levelSolids_dirty[i];
					var curSticky:String = level_sticky[i];
					
					// only accept slevel blocks
					if (curLevel == "0" || curLevel == "1" || curLevel == "2" || curLevel == "3" ) {
						levelSolids.push(levelSolids_dirty[i]);
						levelSticky.push(level_sticky[i]);
						}
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
					if (levelSolids[i] == 1 && (levelSolids[i - level_width] == 1 || levelSticky[i - level_width] == 1)) add(new Wall(i_col * level_blockSize, i_row * level_blockSize, 1));
					else  {if (levelSolids[i] == 1) add(new Wall(i_col * level_blockSize, i_row * level_blockSize, 0));}
					
					if (levelSticky[i] == 1 && (levelSolids[i - level_width] == 1 || levelSticky[i - level_width] == 1)) add(new Wall(i_col * level_blockSize, i_row * level_blockSize,1));
					else  {if (levelSticky[i] == 1) add(new StickyWall(i_col * level_blockSize, i_row * level_blockSize));}
					
					
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
				player.setPosition(int(start.@x)*2, int(start.@y)*2-1);
				}
								
				
				
				for each(var helem:XML in levelXML.objects.health)
				{
					add(new HealthItem(int(helem.@x)*2,int(helem.@y)*2))
					
				}
			
				for each(var spikes:XML in levelXML.objects.spikes)
				{
					var spike:Spikes = new Spikes(int(spikes.@x)* 2, int(spikes.@y)* 2, int(spikes.@spiketime))
					add(spike);
					
				}
				
				
		}
		
		public function level_clear ():void
		{
			
			
			
		}
		
		
		
		override public function update():void
		{
			if (Input.check(Key.ESCAPE)) FP.world = new GameWorld();
			
			super.update();
			cameraPlatform.update();
			
			// First, we will create an empty array.
			var spikesList:Array = [];

			// Then, we populate the array with all existing Enemy objects!
			this.getClass(Spikes, spikesList);

			// Finally, we can loop through the array and call each Enemy's die() function.
			for each (var e:Spikes in spikesList)
			{
				e.update();
			}
			
			
			player.timerBar.update2(theTimer.currentCount.toString());
			
			
			
			// TIME OUT!?
			if (TimerBar(player.timerBar).countDownAt <= 0)
			{
				this.timer_out();
				
				

			}
			
			
			if (player.getHealth() <= 0)
			{
				FP.world = new DeathScreen();
			}
			
			
		}
	}

}
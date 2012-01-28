package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	
	import net.flashpunk.FP;

	
	/**
	 * ...
	 * @author giulio
	 */
	public class Player extends Entity 
	{
		[Embed(source = 'assets/player.png')] private const PLAYER:Class;
		
		/*
		 * Privates Vars
		 */
	
		private var power:Number=0.6;
		private var jumpPower:Number=15;
		private var hFriction:Number=0.95;
		private var vFriction:Number=0.99;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var gravity:Number=0.9;
		
		public function Player() 
		{
			graphic = new Image(PLAYER);
			
			// sets starting point
			setHitbox(13, 26);
			
			x=305;
			y=225;			
		}
		
		override public function update():void
		{
			// record if any input
			var pressed:Boolean = false;
			
			if (Input.check(Key.LEFT)) {
				xSpeed-=power;
				pressed = true;
			}
			if (Input.check(Key.RIGHT)) {
				xSpeed+=power;
				pressed=true;
			}
			if (collide("wall",x,y+1)) {
				ySpeed=0;
				if (Input.check(Key.UP)) {
					ySpeed-=jumpPower;
				}
			} else {
				ySpeed+=gravity;
			}
			if (Math.abs(xSpeed)<1&&! pressed) {
				xSpeed=0;
			}
			
			// Friction 
			xSpeed*=hFriction;
			ySpeed *= vFriction;
			
			// Change Position
			setXPosition();
			setYPosition();
			
		}
		
		public function setPosition(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
		}
		
		public function getPosition():Point
		{
			return new Point(this.x, this.y);
		}
		
		private function setXPosition():void {
			for (var i:int=0; i<Math.abs(xSpeed); i++) {
				if (! collide("wall",x+FP.sign(xSpeed),y)) {
					x += FP.sign(xSpeed);
				} else {
					xSpeed=0;
					break;
				}
			}
		}
		private function setYPosition():void {
			for (var i:int=0; i<Math.abs(ySpeed); i++) {
				if (! collide("wall",x,y+FP.sign(ySpeed))) {
					y+=FP.sign(ySpeed);
				} else {
					ySpeed=0;
					break;
				}
			}
		}
	}

}
package
{
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;
	
	
 
    public class CreateText extends Entity
    {
		private var item:Text;
        public function CreateText(text:String)
        {
            item = new Text(text);
			item.color = 0x000000;
			graphic = item;
			

        }
 
    }
 
}
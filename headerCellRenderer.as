package 
{
    import fl.controls.dataGridClasses.HeaderRenderer;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    
    public class headerCellRenderer extends HeaderRenderer
    {
        private var tf:TextFormat;
        
        public function headerCellRenderer()
        {            
            init();
        }
        
        private function init():void
        {            
            tf = new TextFormat();
            tf.align = TextFormatAlign.CENTER;
            tf.bold = true;                        
        }
          
		override protected function drawLayout():void
        {
            super.drawLayout();
            textField.x = 0;
            textField.width = this.width;
            
            textField.setTextFormat(tf);            
        }
	}
}
package  {
	
public class normalizedArray {
    private var score: Number;
    private var index:int;
	private var product:int;

    public function normalizedArray(score:Number, index:int, product:int) {
        this.score = score;
        this.index = index;
		this.product = product;
    }

    public function toString():String {
        return " " + score + ":" + index + ":" product;
    }
}


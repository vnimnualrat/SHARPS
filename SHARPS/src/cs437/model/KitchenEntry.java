package cs437.model;

public class KitchenEntry {

	Integer quantity;

    String item;

    String exp;
    
    Integer percent;

    public KitchenEntry( Integer quantity, String item, String exp, Integer percent )
    {
        this.quantity = quantity;
        this.item = item;
        this.exp = exp;
        this.percent = percent;
    }

    public Integer getQuantity()
    {
        return quantity;
    }

    public void setQuantity( Integer quantity )
    {
        this.quantity = quantity;
    }

    public String getItem()
    {
        return item;
    }

    public void setItem( String item )
    {
        this.item = item;
    }

    public String getExp()
    {
        return exp;
    }

    public void setExp( String exp )
    {
        this.exp = exp;
    }
    
    public Integer getPercent()
    {
    	return percent;
    }
    
    public void setPercent(Integer percent){
    	
    	this.percent = percent;
    }
    
}

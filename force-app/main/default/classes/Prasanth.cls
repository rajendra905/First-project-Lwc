public class Prasanth implements Iterator <Account> {
    public List <Account> acc;
    public Integer i;
    public Prasanth( ) {
        acc = [SELECT name FROM Account];
        i = 0;
    }
    public boolean hasNext () {
        if(i>acc.size())
        return false;
        else
        return true;
    }
    Public Account next() {
        if(i==0)
        return null;
        i++;
        return acc[i-1];
    }
}
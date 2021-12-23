public class Datediffindays {
   
    public static Long datediff(DateTime rsd){//the parameter passed is a normal datetimefield type
        Long datediffindays =0;
        DateTime dT = System.now();
        Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());
        Date recurstartdate = date.newInstance(rsd.year(), rsd.month(), rsd.day());
        datediffindays = (recurstartdate.daysBetween(myDate));
        system.debug('9'+myDate+';;'+recurstartdate+';;'+datediffindays);
        return datediffindays;
    }

}
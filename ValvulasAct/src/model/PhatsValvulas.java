package model;

public class PhatsValvulas {

    /* Chinameca phats Upload ** */
    public static String phatChinameca(String mes) {
	//return "C:/Users/jose_l/Documents/servidorcsv/VALVULAS/CHINAMECA/"+mes+"/";
	return "/home/pemex/servidorcvs/VALVULAS/CHINAMECA/"+mes+"/";
    }

    public static String phatGuardarChinameca(String mes) {
	// recordemos que va ftp+ el phat + archivo
	return "CHINAMECA/" + mes + "/";
    }

    /* Chinameca phats view * */

    public static String viewChinamecaServidor() {
	//return "ftp://pemex:@192.168.1.69/";
	return   "ftp:pemex:Ductos@144.45.3.205/servidorcvs/VALVULAS/";
    }
    
 /* *************************ERM*****************************************************************************  */  
    
    /* ERM phats Upload ** */
    public static String phatErm(String mes) {
	//return "C:/Users/jose_l/Documents/servidorcsv/VALVULAS/ERMS/"+mes+"/";
	return "/home/pemex/servidorcvs/VALVULAS/ERMS/"+mes+"/";
    }

    public static String phatGuardarErm(String mes) {
	
	// recordemos que va ftp+ el phat + archivo
	return "ERMS/" + mes + "/";
    }

    /* ERMphats view * */

    public static String viewErmServidor() {
	//return "ftp://pemex:@192.168.1.69/";
	return   "ftp:pemex:Ductos@144.45.3.205/servidorcvs/VALVULAS/";
    }
    
    
    

}

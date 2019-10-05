/*
 * Test driver for DAPJava class
 */

public class SimpleDemo {
    public static void main(String[] args) {
	DAPJava.initJavaKeyStore(
				System.getenv("JAVA_KEY_STORE_FILE"),
				System.getenv("JAVA_KEY_STORE_PASSWORD")
				);
	DAPJava.initConnection(
				System.getenv("CONJUR_APPLIANCE_URL"),
				System.getenv("CONJUR_ACCOUNT")
				);
	DAPJava.authenticate(
				System.getenv("CONJUR_AUTHN_LOGIN"),
				System.getenv("CONJUR_AUTHN_API_KEY")
				);
  	System.out.println("Secret value: " 
			+ DAPJava.variableValue(System.getenv("CONJUR_VAR_ID")) );

    } // main()
} // SimpleDemo

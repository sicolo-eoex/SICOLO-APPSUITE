package dojo.apps;


/**
 * Primary Class: AppSuite
*/
/**
* Summary: AppSuite Class
*
* @author  (Sosthene Grosset-Janin & Juninho Loungila)
* @version (1.0)
* @since   Novmeber 2023
*/
public class AppSuite 
{
    // Constants
        // Static Constants
        // Non-Static Constants
    // Variables    
        // Declarations
            // Primitives
            // Objects
        // Intialisations    
    // Logic
        // Constructors
            public AppSuite()
            {
                // Constants
                    // Static Constants
                        String welcomeMessage = "WELCOME TO THIS APP";
                        String farewellMessage = "THANK YOU FOR USING THIS APP";
                        String menuAgrs[] = {""};
                    // Non-Static Constants
                // Variables    
                    // Declarations
                        // Primitives
                        // Objects
                    // Intialisations    
                // Logic
                    // Welcome
                    spalshScreen(welcomeMessage);
                    // Show User Interface
                    // Show Menu
                    showMenu(menuAgrs);
                    // Show User Interface
                    // Farewell
                    spalshScreen(farewellMessage);
            }
        // Getters & Setters
        // Helpers
        // Utilities
            public void spalshScreen(String someMessage)
            {
                System.out.println(someMessage);
            }
            public void showMenu(String[] menuArgs)
            {
                // Prepare structure
            }
            public void showUserIterface()
            {
                
            }
}


// #### Utility Classes

/**
 * Utility Class #1: 
*/
package fr.tduf.tducp.scripts.common

/**
 * Class to run TDUF tools from command line scripts.
 */
class TDUFRunner {
    static String getDotNetInterpreter() {
        if (System.getProperty("os.name").toUpperCase().contains("WINDOWS")) {
            return ""
        }

        return "mono"
    }
}

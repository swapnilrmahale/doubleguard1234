package com.action.ids;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * <b>Description : </b></br>This will detect if any intrusion happen
 * and record,report and throw error
 *
 * @author swapper
 *
 */
public class JSAttack {

    //private static final Logger LOGGER = Logger.getLogger(JSAttack.class);

    private static Pattern[] patterns = new Pattern[] {
            // pattern for <script></script> tags
            Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
            // pattern for lonely tags
            Pattern.compile("(.*?)</script>", Pattern.CASE_INSENSITIVE),
            Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE
                    | Pattern.MULTILINE | Pattern.DOTALL),
            // pattern for javascript..
            Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
            // src='...'
            Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE
                            | Pattern.DOTALL),

            // onload(...)=...
            Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE
                    | Pattern.MULTILINE | Pattern.DOTALL),
            // Pattern for sql injeection
            Pattern.compile("(.*?)[=](.*?)", Pattern.CASE_INSENSITIVE) };

    public JSAttack() {

    }

    /**
     *
     * check for attack.
     *
     * @param inputs
     * @param loggedInUserName
     * @return true/false
     */

    public static boolean checkAttacks(String... inputs) {
        // LOGGER.info("\n LOGGED IN USERNAME:=====> " + loggedInUserName);
        for (String value : inputs) {
            if (value != null && !"".equalsIgnoreCase(value)) {
                for (Pattern checkpattern : patterns) {
                    Matcher matcher = checkpattern.matcher(value.trim());
                    if (matcher.matches()) {
                        StackTraceElement[] stacktrace = Thread.currentThread()
                                .getStackTrace();
                        StackTraceElement e = stacktrace[2];
                        String _className = e.getClassName();
                        String _mehodName = e.getMethodName();
                        System.err.println("\n INTRUSION Details:>>>>\n [CLASS]: "
                                + _className + " [METHOD]: " + _mehodName
                                + " [INPUT]: "
                                + value);
                        return true;

                    }
                }
            }
        }
        return false;
    }

}


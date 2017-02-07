package com.service;

public class RenameService {
    public static String replace(String bugDescribe) {
        if (bugDescribe.contains(".")) {
            bugDescribe = bugDescribe.replace(".", "");
        }

        if (bugDescribe.contains(",")) {
            bugDescribe = bugDescribe.replace(",", "");
        }

        if (bugDescribe.contains("_")) {
            bugDescribe = bugDescribe.replace("_", " ");
        }

        if (bugDescribe.contains("-")) {
            bugDescribe = bugDescribe.replace("-", " ");
        }

        if (bugDescribe.contains("'")) {
            bugDescribe = bugDescribe.replace("'", "");
        }

        if (bugDescribe.contains("\"")) {
            bugDescribe = bugDescribe.replace("\"", "");
        }

        return bugDescribe;
    }

    public static String reName(String bugDescribe) {
        String targetName = "";
        if (bugDescribe == null || bugDescribe.length() == 0) {
            return targetName;
        }

        bugDescribe = replace(bugDescribe);
        StringBuffer sBuffer = new StringBuffer();
        String[] split = bugDescribe.split("\\s+");
        for (String part : split) {
            part = part.substring(0, 1).toUpperCase() + part.substring(1);
            sBuffer.append(part);
        }
        targetName = sBuffer.toString();
        return targetName;
    }

}

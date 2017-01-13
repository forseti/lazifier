/*
 * Copyright 2010 Donny A. Wijaya
 *  
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License. 
 */
package com.googlecode.lazifier.generate;

/**
 * The PatternConstants class. This class holds a number of regex patterns used by lazifier
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class PatternConstants {		
	// The package input with wildcard.
	public static final String VALID_PACKAGE_INPUT_WITH_WILDCARD = "^(_([a-z0-9]+)_)(\\.[a-z0-9]+)*$";

	// The package input without wildcard. 
	public static final String VALID_PACKAGE_INPUT_WITHOUT_WILDCARD = "^[a-z0-9]+(\\.[a-z0-9]+)*$";
	
	// The valid package property with wildcard.
	public static final String VALID_PACKAGE_PROPERTY_WITH_WILDCARD = "^(_[a-z0-9]+_|[a-z0-9]+)(\\.[a-z0-9]+)*$";
	
	// The valid name.
	public static final String VALID_NAME = "^[A-Za-z0-9]+$";
	
	// The valid package.
	public static final String VALID_PACKAGE = VALID_PACKAGE_INPUT_WITHOUT_WILDCARD;
	
	// The valid class name
	public static final String VALID_CLASS_NAME = "([A-Z][a-z0-9]+)";

	// The valid qualified class name
	public static final String VALID_QUALIFIED_CLASS_NAME = "^([a-z0-9]+((\\.[a-z0-9]+)*))\\." + VALID_CLASS_NAME;
	
	// The valid prefix.
	public static final String VALID_PREFIX = VALID_NAME;
	
	// The valid suffix.
	public static final String VALID_SUFFIX = VALID_NAME;
	
	// The valid package pattern.
	public static final String VALID_PACKAGE_PATTERN = "^(#package#|[a-z0-9]+)(\\.[a-z0-9]+)*$";
	
	// The valid file extension.
	public static final String VALID_FILE_EXTENSION = "^(\\.)?[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*$";
	
	// The valid directory.
	public static final String VALID_DIRECTORY = "^(\\.|([A-Za-z]:/|/)?((\\.)?[A-Za-z0-9_-]+)(/[A-Za-z0-9_-]+)*)$";

	// The space. 
	public static final String SPACE = "[ \\t\\n\\r\\f]";
	
	// The comma.
	public static final String COMMA = SPACE + "*" + "," + SPACE + "*";
	
	// The valid object type
	public static final String OBJECT_TYPE = "java.lang.Object";
	
	// The valid primitive type
	public static final String PRIMITIVE_TYPE = "(boolean|byte|char|double|float|int|long|short)";
	
	// The valid wrapper type
	public static final String WRAPPER_TYPE = "java\\.(lang\\.(Boolean|Byte|Character|Double|Float|Integer|Long|Short|String)|math\\.Big(Decimal|Integer)|util\\.(Calendar|Date|GregorianCalendar|Time|Timestamp))";
	
	// The valid collection type
	public static final String COLLECTION_TYPE = "java\\.util\\.(ArrayList|Collection|Hash(Set|Map|table)|Linked(List|Hashed(Set|Map))|List|Map|Set)";
	
	// The valid standard type
	public static final String STANDARD_TYPE = "^(" + PRIMITIVE_TYPE + "|" + WRAPPER_TYPE + ")$";
	
	// The valid boolean type
	public static final String BOOLEAN_TYPE = "^(boolean|java\\.lang\\.Boolean)$";
	
	// The valid byte type
	public static final String BYTE_TYPE = "^(byte|java\\.lang\\.Byte)$";
	
	// The valid string type
	public static final String STRING_TYPE = "^java.lang.String$";
	
	// The valid string type
	public static final String DATE_TYPE = "^java.util.Date$";
}
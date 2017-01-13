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
package com.googlecode.lazifier.scaffold;

import java.io.File;
import java.util.List;

import com.thoughtworks.qdox.JavaDocBuilder;

/**
 * The JavaUtils class. This class is a helper class for creating QDox builder.
 *
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 *
 */
public class JavaUtils {
	public static final JavaDocBuilder createBuilder(String sourceDir) {
		JavaDocBuilder builder = new JavaDocBuilder();
		builder.addSourceTree(new File(sourceDir));
		
		return builder;
	}
	
	public static final JavaDocBuilder createBuilder(List<String> sourceDirs) {
		JavaDocBuilder builder = new JavaDocBuilder();
		
		for (String sourceDir: sourceDirs)
			builder.addSourceTree(new File(sourceDir));
		
		return builder;
	}
}
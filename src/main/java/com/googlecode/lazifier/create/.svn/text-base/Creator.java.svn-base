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
package com.googlecode.lazifier.create;

import java.util.HashMap;
import java.util.Map;

import com.googlecode.lazifier.generate.AbstractGenerator;
import com.googlecode.lazifier.generate.Source;

/**
 * The Creator class. This is class is a generator to create components of an application.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Creator extends AbstractGenerator<CreateOptions> {	
	/* (non-Javadoc)
	 * @see com.googlecode.lazifier.generate.Generator#execute(java.lang.Object)
	 */
	public void execute(CreateOptions options) throws Exception {
		final String key = options.getKey().toLowerCase();
		final String type = options.getType().toLowerCase();
		final String _package = processPackage(options.getPackage());
		final String name = options.getName();
		
		final Map<String, Object> models = new HashMap<String, Object>();

		Source source = null;
		
		for (String setting: retrieveSettings(key, type)) {
			// Create the source.
			source = createSource(name, _package, setting, true);
			
			// Add the setting/source as key/value to FreeMarker object map.
			addKeyValuePairToModels(models, setting, source);
		}
		
		// Generate the component.
		bulkWrite(models);
	}
}
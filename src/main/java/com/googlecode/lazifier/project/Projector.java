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
package com.googlecode.lazifier.project;

import java.util.HashMap;
import java.util.Map;

import com.googlecode.lazifier.generate.AbstractGenerator;
import com.googlecode.lazifier.generate.Source;

/**
 * The Projector class. A generator class to initialize a project by creating a number of resources.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Projector extends AbstractGenerator<ProjectOptions>{
	/* (non-Javadoc)
	 * @see com.googlecode.lazifier.generate.Generator#execute(java.lang.Object)
	 */
	public void execute(ProjectOptions options) throws Exception {
		final String key = options.getKey().toLowerCase();
		final String name = options.getName().toLowerCase();
		final String type = options.getType().toLowerCase();
		final String _package = options.getPackage();
		final Map<String, Object> models = new HashMap<String, Object>();

		addKeyValuePairToModels(models, key, options);

		Source source = null;

		for (String setting: retrieveSettings(key, type)) {
			source = createSource(_package, setting, false);
			source.setRootPackage(_package);
			
			// Add setting/source as key/value to Freemarker objects map
			addKeyValuePairToModels(models, setting, source);
		}
		
		// Write files using models
		bulkWrite(models, name);
	}
}
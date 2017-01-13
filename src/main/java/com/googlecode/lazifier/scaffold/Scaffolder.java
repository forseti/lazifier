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

import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.googlecode.lazifier.generate.AbstractGenerator;
import com.googlecode.lazifier.generate.Source;
import com.googlecode.lazifier.scaffold.form.Form;
import com.googlecode.lazifier.scaffold.form.MultipleSelect;
import com.googlecode.lazifier.scaffold.form.SingleSelect;
import com.googlecode.lazifier.scaffold.script.Constraint;

// TODO: Auto-generated Javadoc
/**
 * The Scaffolder class. The generator class to scaffold CRUD using an entity.
 * 
 *  @author Donny A. Wijaya
 *  @version 0.0.9
 *  @since April 2010
 */
public class Scaffolder extends AbstractGenerator<ScaffoldOptions> {
	// The Constant logger
	private static final Logger logger = LoggerFactory.getLogger(Scaffolder.class);
	
	// The forms available for scaffolding.
	private Map<String, Class<Form>> forms;
	
	// The constraints available for scaffolding.
	private Map<String, Class<Constraint>> constraints;
	
	// Set the forms.
	public void setForms(Map<String, Class<Form>> forms) {
		this.forms = forms;
	}
	
	// Set the constraints.
	public void setConstraints(Map<String, Class<Constraint>> constraints) {
		this.constraints = constraints;
	}

	/* (non-Javadoc)
	 * @see com.googlecode.lazifier.generate.Generator#execute(java.lang.Object)
	 */
	public final void execute(ScaffoldOptions options) throws Exception {
		try {
			final String key = options.getKey().toLowerCase();
			final String type = options.getType().toLowerCase();
			final String name = options.getName();
			final String _package = processPackage(options.getPackage());
			final Map<String, Object> models = new HashMap<String, Object>();

			// Get settings from properties
			String[] settings = retrieveSettings(key, type);
			
			// Create Scaffolding object and assign the first setting to it.
			Scaffolding scaffolding = new Scaffolding(name, _package);
			copyFromPropertiesToObject(scaffolding, settings[0], false);

			// Copy all entity informations to Scaffolding object.
			String entity = scaffolding.getEntity();
			copyFromPropertiesToObject((Source) scaffolding, entity);

			Constructor<Form> constructor = null;
			Form form = null;
			
			// Get source directory and qualified class name of the entity for scaffolding.
			String sourceDir = scaffolding.getSourceDir();
			String qualifiedClassName = scaffolding.getQualifiedClassName();
			
			// Get the list other source directories related to the entity
			List<String> sourceDirs = scaffolding.getSourceDirs();

			// Add the entity source directory to the list.
			sourceDirs.add(sourceDir);
			
			// Get the form class.
			Class<Form> formClass = forms.get(scaffolding.getForm());
			
			// Get the constraint class.
			Class<Constraint> constraintClass = constraints.get(scaffolding.getScript());
			
			if (formClass == null)
				throw new Exception("Form '" + scaffolding.getForm() + "' doesn't exist");
			if (constraintClass == null) {
				// Instantiate Form object without constraint
				constructor = formClass.getDeclaredConstructor(List.class, String.class);
				form = constructor.newInstance(sourceDirs, qualifiedClassName);
			} else {
				// Instantiate Form object with constraint.
				constructor = formClass.getDeclaredConstructor(List.class, String.class, Class.class);
				form = constructor.newInstance(sourceDirs, qualifiedClassName, constraintClass);
			}

			// If form has an ID
			if (form.getId() != null) {
				// Process single/multiple select fields
				processSingleSelectsInForm(form, scaffolding);
				processMultipleSelectsInForm(form, scaffolding);
				
				logger.info("" + form);
	
				// Set the script type to be included
				form.getInclude().setName(scaffolding.getScript());
				
				// Add form to FreeMarker objects map.
				addKeyValuePairToModels(models, "form", form);
				
				// Add scaffolding to FreeMarker objects map
				addScaffoldingToModel(models, scaffolding);
				
				// Write the files using models
				bulkWrite(models);
			} else
				throw new Exception("Form doesn't have ID");
			
		} catch (Exception e) {e.printStackTrace();}
	}

	/**
	 * Add Scaffolding object to FreeMarker objects map.
	 * 
	 * @param models
	 * @param scaffolding
	 * @throws Exception
	 */
	private final void addScaffoldingToModel(Map<String, Object> models, Scaffolding scaffolding) throws Exception {
		String name = scaffolding.getName();
		String _package = scaffolding.getPackage();
		
		Source source = null;

		// Add scaffolding object to models with entity name as the key.
		addKeyValuePairToModels(models, scaffolding.getEntity(), scaffolding);
		
		// Add all base classes required for scaffolding
		for (String key: scaffolding.getBases()) {
			source = createSource(retrieveRootPackage(), key, true);
			source.setCreate(false);
			addKeyValuePairToModels(models, key, source);
		}
		
		// Add other sources required for scaffolding
		for (String key: scaffolding.getSources()) {
			source = createSource(name, _package, key, true);
			addKeyValuePairToModels(models, key, source);
		}
	}
	
	/**
	 * Process single select field in the form.
	 * 
	 * @param form
	 * @param scaffolding
	 * @throws Exception
	 */
	private void processSingleSelectsInForm(Form form, Scaffolding scaffolding) throws Exception {	
		// Get the editor and repository/service names
		String referenceEditor = scaffolding.getReferenceEditor();
		String referenceRepository = scaffolding.getReferenceRepository();
		String referenceService = scaffolding.getReferenceService();
		
		Source source = null;
		
		for (SingleSelect singleSelect: form.getSingleSelects()) {
			String className = singleSelect.getTypeClassName();
			String packageName = singleSelect.getTypePackageName();

			// Create reference editor source.
			source = createSource(className, packageName, referenceEditor);
			source.setTailPackageWithName(false);
			
			if (form.classExists(source.getQualifiedClassName()))
				singleSelect.setReferenceEditor(source);

			// Create reference service source
			source = createSource(className, packageName, referenceService);
			source.setTailPackageWithName(false);
			
			if (form.classExists(source.getQualifiedClassName()))
				singleSelect.setReferenceService(source);
			else {
				// Create reference repository source
				source = createSource(className, packageName, referenceRepository);
				source.setTailPackageWithName(false);
	
				if (form.classExists(source.getQualifiedClassName()))
					singleSelect.setReferenceRepository(source);
			}
		}
	}
	
	/**
	 * Process multiple select fields in the form.
	 * 
	 * @param form
	 * @param scaffolding
	 * @throws Exception
	 */
	private void processMultipleSelectsInForm(Form form, Scaffolding scaffolding) throws Exception {
		// Get the collection editor and repository/service names
		String referenceCollectionEditor = scaffolding.getReferenceCollectionEditor();
		String referenceRepository = scaffolding.getReferenceRepository();
		String referenceService = scaffolding.getReferenceService();
		
		Source source = null;
		
		for (MultipleSelect multipleSelect: form.getMultipleSelects()) {
			String className = multipleSelect.getTypeParameterClassName();
			String packageName = multipleSelect.getTypeParameterPackageName();
			
			// Create reference collection editor source
			source = createSource(className, packageName, referenceCollectionEditor);
			source.setTailPackageWithName(false);
			
			if (form.classExists(source.getQualifiedClassName()))
				multipleSelect.setReferenceCollectionEditor(source);
			
			// Create reference service source
			source = createSource(className, packageName, referenceService);
			source.setTailPackageWithName(false);
			
			if (form.classExists(source.getQualifiedClassName()))
				multipleSelect.setReferenceService(source);
			else {
				// Create reference repository source
				source = createSource(className, packageName, referenceRepository);
				source.setTailPackageWithName(false);
				
				if (form.classExists(source.getQualifiedClassName()))
					multipleSelect.setReferenceRepository(source);
			}
		}		
	}
}
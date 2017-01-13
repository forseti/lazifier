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

import static com.googlecode.lazifier.generate.PatternConstants.COMMA;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.CollectionUtils;

import com.googlecode.lazifier.generate.Source;

/**
 * The Scaffolding class. This class extends Source class and adds more properties required for scaffolding process. 
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Scaffolding extends Source {
	// The form.
	private String form;
	
	// The script.
	private String script;
	
	// The entity.
	private String entity;
	
	// The reference editor.
	private String referenceEditor;
	
	// The reference collection editor
	private String referenceCollectionEditor;
	
	// The reference repository
	private String referenceRepository;
	
	// The reference service
	private String referenceService;
	
	// The related source directories.
	private String[] sourceDirs;
	
	// The base components.
	private String[] bases;
	
	// The related sources.
	private String[] sources;

	/**
	 * Instantiate new Scaffolding object.
	 * 
	 * @param name
	 * @param _package
	 */
	public Scaffolding(String name, String _package) {
		super(name, _package);
	}
	
	/**
	 * Get the form.
	 * 
	 * @return form
	 * @throws Exception
	 */
	public String getForm() throws Exception {
		if (form == null)
			throw new Exception("Please configure form for scaffolding.");
		
		return form;
	}
	
	/**
	 * Set the form.
	 * 
	 * @param form
	 */
	public void setForm(String form) {
		this.form = form;
	}
	
	/**
	 * Get the script
	 * 
	 * @return script
	 */
	public String getScript() {
		return script;
	}
	
	/**
	 * Set the script
	 * 
	 * @param script
	 */
	public void setScript(String script) {
		this.script = script;
	}

	/**
	 * Get the entity
	 * 
	 * @return
	 */
	public String getEntity() {
		return entity;
	}
	
	/**
	 * Set the entity
	 * 
	 * @param entity
	 */
	public void setEntity(String entity) {
		this.entity = entity;
	}
	
	/**
	 * Get the reference editor
	 * 
	 * @return reference editor
	 */
	public String getReferenceEditor() {
		return referenceEditor;
	}

	/**
	 * Set the reference editor.
	 * 
	 * @param referenceEditor
	 */
	public void setReferenceEditor(String referenceEditor) {
		this.referenceEditor = referenceEditor;
	}

	/**
	 * Get the reference collection editor
	 * 
	 * @return reference collection editor
	 */
	public String getReferenceCollectionEditor() {
		return referenceCollectionEditor;
	}

	/**
	 * Set the reference collection editor
	 * 
	 * @param referenceCollectionEditor
	 */
	public void setReferenceCollectionEditor(String referenceCollectionEditor) {
		this.referenceCollectionEditor = referenceCollectionEditor;
	}

	/**
	 * Get the reference repository
	 * 
	 * @return reference repository
	 */
	public String getReferenceRepository() {
		return referenceRepository;
	}

	/**
	 * Set the reference repository
	 * 
	 * @param referenceRepository
	 */
	public void setReferenceRepository(String referenceRepository) {
		this.referenceRepository = referenceRepository;
	}

	/**
	 * Get the reference service
	 * 
	 * @return reference service
	 */
	public String getReferenceService() {
		return referenceService;
	}

	/**
	 * Set the reference service
	 * 
	 * @param referenceService
	 */
	public void setReferenceService(String referenceService) {
		this.referenceService = referenceService;
	}

	/**
	 * Get the source directories
	 * 
	 * @return source directories
	 */
	@SuppressWarnings("unchecked")
	public List<String> getSourceDirs() {
		if (sourceDirs == null)
			return new ArrayList<String>();
		
		return (List<String>) CollectionUtils.arrayToList(sourceDirs);
	}

	/**
	 * Set the source directories.
	 * 
	 * @param sourceDirs
	 */
	public void setSourceDirs(String sourceDirs) {
		this.sourceDirs = (sourceDirs != null)? sourceDirs.split(COMMA) :  null;
	}
	
	/**
	 * Get the bases.
	 * 
	 * @return bases
	 */
	public String[] getBases() {
		return bases;
	}
	
	/**
	 * Set the bases
	 * 
	 * @param bases
	 */
	public void setBases(String bases) {
		this.bases = (bases != null)? bases.split(COMMA) :  null;
	}
	
	/**
	 * Get the sources
	 *  
	 * @return sources
	 */
	public String[] getSources() {
		return sources;
	}
	
	/**
	 * Set the sources
	 * 
	 * @param sources
	 */
	public void setSources(String sources) {
		this.sources = (sources != null)? sources.split(COMMA) :  null;
	}
	
	/**
	 * Get source directory of the entity.
	 * 
	 * @return entity
	 * @throws Exception
	 */
	public String getSourceDir() throws Exception {
		String classDir = getPackageName().replace(".", "/");
		String sourceDir = getDirName().replace(("/" + classDir), "");
		return sourceDir;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString()
	{
	    final String TAB = "    ";
	
	    StringBuilder retValue = new StringBuilder();
	    
	    retValue.append("Scaffolding ( ")
	        .append(super.toString()).append(TAB)
	        .append("bases = ").append(this.bases).append(TAB)
	        .append("entity = ").append(this.entity).append(TAB)
	        .append("components = ").append(this.sources).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}


	
	
}
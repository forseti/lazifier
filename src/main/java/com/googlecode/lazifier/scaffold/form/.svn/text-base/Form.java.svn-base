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
package com.googlecode.lazifier.scaffold.form;

import static com.googlecode.lazifier.generate.PatternConstants.OBJECT_TYPE;
import static com.googlecode.lazifier.scaffold.JavaUtils.createBuilder;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.validateEntityClass;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.validateSuperClass;
import static org.springframework.util.StringUtils.capitalize;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.ReflectionUtils;

import com.googlecode.lazifier.scaffold.script.Constraint;
import com.googlecode.lazifier.scaffold.script.Include;
import com.thoughtworks.qdox.JavaDocBuilder;
import com.thoughtworks.qdox.model.Annotation;
import com.thoughtworks.qdox.model.JavaClass;
import com.thoughtworks.qdox.model.JavaField;
import com.thoughtworks.qdox.model.JavaMethod;

/**
 * The Form class. The class holds informations required for scaffolding process
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Form {
	// The constraint.
	private final Class<Constraint> constraintClass;
	
	// The include.
	private final Include include;
	
	/** The builder. */
	private JavaDocBuilder builder;
	
	// The input for Id
	private Input id;
	
	// The version
	private Version version;
	
	// The list of inputs
	private List<Input> inputs = new ArrayList<Input>();
	
	// The list of embedded inputs
	private List<Input> embeddedInputs = new ArrayList<Input>();
	
	// The list of file inputs
	private List<Input> fileInputs = new ArrayList<Input>();
	
	// The list of checkboxes
	private List<Checkbox> checkboxes = new ArrayList<Checkbox>();
	
	// The list of single selects
	private List<SingleSelect> singleSelects = new ArrayList<SingleSelect>();
	
	// The list of multiple selects
	private List<MultipleSelect> multipleSelects = new ArrayList<MultipleSelect>();
	
	// The list of constraints
	private List<Constraint> constraints = new ArrayList<Constraint>();

	/**
	 * Instantiate new Form object.
	 * 
	 * @param sourceDirs
	 * @param qualifiedClassName
	 * @throws Exception
	 */
	public Form(List<String> sourceDirs, String qualifiedClassName) throws Exception {
		this(sourceDirs, qualifiedClassName, null);
	}
	
	/**
	 * Instantiate new Form object.
	 * 
	 * @param sourceDirs
	 * @param qualifiedClassName
	 * @throws Exception
	 */
	public Form(List<String> sourceDirs, String qualifiedClassName, 
				Class<Constraint> constraintClass) throws Exception {
		this.constraintClass = constraintClass;
		include = new Include();		
		
		// Create QDox builder
		initBuilder(sourceDirs);
		
		// Get the entity class
		JavaClass entityClass = retrieveClass(qualifiedClassName);
		
		// Process the entity class
		processEntityClass(entityClass);
	}
	
	/**
	 * Get the Id.
	 * 
	 * @return id
	 */
	public Input getId() {		
		return id;
	}

	/**
	 * Set the Id
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void setId(Input id) throws Exception {
		if (this.id != null)
			throw new Exception("Form can only have one ID.");
		
		if (!id.isId())
			throw new Exception("'".concat(id.getName()).concat("' is not an ID."));
		
		this.id = id;
	}
	
	/**
	 * Get the version.
	 * 
	 * @return the version.
	 */
	public Input getVersion() {
		return version;
	}

	/**
	 * Set the version
	 * 
	 * @param version
	 * @throws Exception
	 */
	public void setVersion(Version version) throws Exception {
		if (this.version != null)
			throw new Exception("Form can only have one version.");
		
		this.version = version;
	}

	/**
	 * Get the include
	 * 
	 * @return include
	 */
	public Include getInclude() {
		return include;
	}
	
	/**
	 * Get the inputs
	 * 
	 * @return inputs
	 */
	public List<Input> getInputs() {
		return inputs;
	}
	
	/**
	 * Get the embedded inputs
	 * 
	 * @return embedded inputs
	 */
	public List<Input> getEmbeddedInputs() {
		return embeddedInputs;
	}
	
	/**
	 * Get the file inputs
	 * 
	 * @return file inputs
	 */
	public List<Input> getFileInputs() {
		return fileInputs;
	}
	
	/**
	 * Get the checkboxes
	 * 
	 * @return
	 */
	public List<Checkbox> getCheckboxes() {
		return checkboxes;
	}
	
	/**
	 * Get the single selects
	 * 
	 * @return single selects
	 */
	public List<SingleSelect> getSingleSelects() {
		return singleSelects;
	}

	/**
	 * Get the multiple selects
	 * 
	 * @return multiple selects
	 */
	public List<MultipleSelect> getMultipleSelects() {
		return multipleSelects;
	}
	
	/** 
	 * Get the constraints
	 * 
	 * @return
	 */
	public List<Constraint> getConstraints() {
		return constraints;
	}
	
	/** 
	 * Process the entity class.
	 * 
	 * @param entityClass
	 * @throws Exception
	 */
	private void processEntityClass(JavaClass entityClass) throws Exception {
		// TODO Auto-generated method stub
		validateEntityClass(entityClass, true);
		addFieldsFromClass(entityClass);
		JavaClass currentClass = entityClass;
		
		while (!currentClass.getSuperClass().getValue().equals(OBJECT_TYPE)) {
			currentClass = currentClass.getSuperJavaClass();
			
			if (validateEntityClass(currentClass) || validateSuperClass(currentClass))
				addFieldsFromClass(currentClass);
		}
	}
	
	/**
	 * Add fields from the entity class
	 * 
	 * @param entityClass
	 * @throws Exception
	 */
	private final void addFieldsFromClass(JavaClass entityClass) throws Exception {
		for (JavaField entityClassField: entityClass.getFields()) {
			String entityClassMethodName = "get" + capitalize(entityClassField.getName());
			JavaMethod entityClassMethod = entityClass.getMethodBySignature(entityClassMethodName, null);

			for (Method method: this.getClass().getDeclaredMethods()) {
				if (method.getName().startsWith("addFieldOrMethodAs")) {
					method.setAccessible(true);
					ReflectionUtils.invokeMethod(method, this, new Object[] { entityClassField, entityClassMethod });
					method.setAccessible(false);
				}
			}
		}		
	}
	
	/**
	 * Create constraint
	 * 
	 * @param name
	 * @return
	 * @throws Exception
	 */
	private final Constraint createConstraint(String name) throws Exception {
		Constructor<Constraint> constructor = null;
		Constraint constraint = null;
		
		if (constraintClass != null) {
			constructor = constraintClass.getDeclaredConstructor(String.class);
			constraint = constructor.newInstance(name);
		}
		
		return constraint;
	}

	/**
	 * Add input
	 * 
	 * @param input
	 */
	protected void addInput(Input input) {
		if (input != null) {
			inputs.add(input);
			
			if (input.getTypeQualifiedClassName().equals("java.util.Date"))
				include.setDate(true);
		}
	}
	
	/**
	 * Add embedded input
	 * 
	 * @param embeddedInput
	 */
	protected void addEmbeddedInput(Input embeddedInput) {
		if (embeddedInput != null) {
			embeddedInputs.add(embeddedInput);

			if (embeddedInput.getTypeQualifiedClassName().equals("java.util.Date"))
				include.setDate(true);
		}
	}
	
	/**
	 * Add file input
	 * 
	 * @param fileInput
	 */
	protected void addFileInput(Input fileInput) {
		if (fileInput != null)
			fileInputs.add(fileInput);
	}
	
	/**
	 * Add checkbox
	 * 
	 * @param checkbox
	 */
	protected void addCheckbox(Checkbox checkbox) {
		if (checkbox != null)
			checkboxes.add(checkbox);
	}
	
	/**
	 * Add single select
	 * 
	 * @param singleSelect
	 */
	protected void addSingleSelect(SingleSelect singleSelect) {
		if (singleSelect != null)
			singleSelects.add(singleSelect);
	}
	
	/**
	 * Add multiple select
	 * 
	 * @param multipleSelect
	 */
	protected void addMultipleSelect(MultipleSelect multipleSelect) {
		if (multipleSelect != null)
			multipleSelects.add(multipleSelect);
	}
	
	/**
	 * Add constraint
	 * 
	 * @param constraint
	 */
	protected void addConstraint(Constraint constraint) {
		if (constraint != null) {
			constraints.add(constraint);
			include.setValidation(true);
		}
	}
	
	/**
	 * Create constraint
	 * 
	 * @param name
	 * @param field
	 * @param method
	 * @return
	 * @throws Exception
	 */
	protected Constraint createConstraint(String name, JavaField field, JavaMethod method) throws Exception {
		Annotation[] annotations = field.getAnnotations();
		Constraint constraint = createConstraint(name);
		
		if (constraint != null) {
			constraint.scanField(field);
			
			if (annotations != null)
				constraint.scanAnnotations(annotations);	

			if (method != null)
				annotations = method.getAnnotations();

			if (annotations != null)
				constraint.scanAnnotations(annotations);

			if (constraint.getAttributes().size() == 0)
				constraint = null;
		}
		
		return constraint;
	}
	
	/**
	 * Add builder
	 * 
	 * @param sourceDirs
	 */
	protected final void initBuilder(List<String> sourceDirs) {
		if (builder == null)
			builder = createBuilder(sourceDirs);
	}
	
	/**
	 * Retrieve a class using a qualified class name
	 * 
	 * @param qualifiedClassName
	 * @return class
	 * @throws Exception
	 */
	protected final JavaClass retrieveClass(String qualifiedClassName) throws Exception {
		JavaClass javaClass = builder.getClassByName(qualifiedClassName);	
		
		if (!javaClass.isPublic())
			throw new Exception("Class '" + javaClass.getFullyQualifiedName() + "' doesn't exists " +
								"(or perhaps not visible?)");
		
		return javaClass;
	}
	
	/**
	 * Check if class with qualified class name provided exists 
	 * 
	 * @param qualifiedClassName
	 * @return
	 */
	public boolean classExists(String qualifiedClassName) {
		try { 
			JavaClass javaClass = retrieveClass(qualifiedClassName);
			
			if (javaClass != null)
				javaClass = null;
		} catch (Exception e) {
			return false;
		}
		
		return true;
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
	    
	    retValue.append("Form ( ")
	        .append(super.toString()).append(TAB)
	        .append("id = ").append(this.id).append(TAB)
	        .append("inputs = ").append(this.inputs).append(TAB)
	        .append("embeddedInputs = ").append(this.embeddedInputs).append(TAB)
	        .append("fileInputs = ").append(this.fileInputs).append(TAB)
	        .append("checkboxes = ").append(this.checkboxes).append(TAB)
	        .append("singleSelects = ").append(this.singleSelects).append(TAB)
	        .append("multipleSelects = ").append(this.multipleSelects).append(TAB)
	        .append("version = ").append(this.version).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}
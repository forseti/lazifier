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

import static com.googlecode.lazifier.generate.PatternConstants.BOOLEAN_TYPE;
import static com.googlecode.lazifier.generate.PatternConstants.BYTE_TYPE;
import static com.googlecode.lazifier.generate.PatternConstants.COLLECTION_TYPE;
import static com.googlecode.lazifier.generate.PatternConstants.STANDARD_TYPE;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfEmbedded;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfGeneratedValue;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfId;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfLob;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfManyToMany;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfManyToOne;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfOwnerOfManyToMany;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.checkIfVersion;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceUtils.validateEntityClass;
import static org.springframework.util.StringUtils.capitalize;

import java.util.List;

import com.googlecode.lazifier.scaffold.script.Constraint;
import com.thoughtworks.qdox.model.JavaClass;
import com.thoughtworks.qdox.model.JavaField;
import com.thoughtworks.qdox.model.JavaMethod;

/**
 * The SimpleForm class. This class to hold information required for scaffolding simple CRUD forms.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class SimpleForm extends Form {
	/**
	 * Instantiate new SimpleForm object
	 * 
	 * @param sourceDirs
	 * @param qualifiedClassName
	 * @throws Exception
	 */
	public SimpleForm(List<String> sourceDirs, String qualifiedClassName) throws Exception {
		super(sourceDirs, qualifiedClassName);
	}
	
	/**
	 * Instantiate new SimpleForm object
	 * 
	 * @param sourceDirs
	 * @param qualifiedClassName
	 * @param constraintClass
	 * @throws Exception
	 */
	public SimpleForm(List<String> sourceDirs, String qualifiedClassName, 
					  Class<Constraint> constraintClass) throws Exception {
		super(sourceDirs, qualifiedClassName, constraintClass);
	}

	/**
	 * Add field as Input or Checkbox
	 * 
	 * @param field
	 * @param method
	 * @param form
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private final void addFieldOrMethodAsInputOrCheckbox(JavaField field, JavaMethod method) throws Exception {
		String fieldName = field.getName();
		String fieldType = field.getType().getValue();
		Integer fieldDimensions = field.getType().getDimensions();
		
		if (!fieldType.matches(STANDARD_TYPE) || !(fieldDimensions == 0))
			return;

		// If the field is a Standard type and not an array.
		boolean isAnnotationInField = checkIfId(field);
		boolean isAnnotationInMethod = (method != null && checkIfId(method));

		if (isAnnotationInField || isAnnotationInMethod) {
			// If field is an Id
			isAnnotationInField = checkIfGeneratedValue(field);
			isAnnotationInMethod = (method != null && checkIfGeneratedValue(method));
			
			if (isAnnotationInField || isAnnotationInMethod) {
				// If the Id field is a Generated Value, add the field as Hidden input.
				setId(new Input(fieldName, field.getType(), true, true));
			} else {
				// If Id field is not a Generated Value, add it as Input field
				Input input = new Input(fieldName, field.getType(), true);
				
				// Create constraint for the field, treat it as 'required'. 
				Constraint constraint = createConstraint(fieldName, field, method);
				input.setConstraint(constraint);
				addConstraint(constraint);
				
				setId(input);
			}
		} else {
			isAnnotationInField = checkIfVersion(field);
			isAnnotationInMethod = (method != null && checkIfVersion(method));

			// If the field is a Version, add it as a Version which is a Hidden input.
			if (isAnnotationInField || isAnnotationInMethod)
				setVersion(new Version(fieldName, field.getType()));
			else {
				// If the field is not a Version
				Constraint constraint = createConstraint(fieldName, field, method);
				// If the field is Boolean, it will be a Checkbox
				if (field.getType().getValue().matches(BOOLEAN_TYPE)) {
					Checkbox checkbox = new Checkbox(fieldName, field.getType());
					checkbox.setConstraint(constraint);
					addCheckbox(checkbox);
					addConstraint(constraint);
				} else {
					// Anything else will be treated as a normal Input field.
					Input input = new Input(fieldName, field.getType());
					input.setConstraint(constraint);
					addInput(input);
					addConstraint(constraint);
				}
			}
		}
	}

	/**
	 * Add field or method as File Input 
	 * 
	 * @param field
	 * @param method
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private final void addFieldOrMethodAsFileInput(JavaField field, JavaMethod method) throws Exception {
		String fieldName = field.getName();
		String fieldType = field.getType().getValue();
		Integer fieldDimensions = field.getType().getDimensions();
		
		if (!fieldType.matches(BYTE_TYPE) && !(fieldDimensions > 0))
			return;
		
		// If the field is a Byte and an array.
		boolean isAnnotationInField = checkIfLob(field);
		boolean isAnnotationInMethod = (method != null && checkIfLob(method));
		
		if (isAnnotationInMethod || isAnnotationInField) {
			Constraint constraint = createConstraint(fieldName, field, method);
			Input fileInput = new Input(fieldName, field.getType());
			fileInput.setConstraint(constraint);
			addFileInput(fileInput);
			addConstraint(constraint);
		}
	}

	/**
	 * Add field or method as Embedded Input
	 * 
	 * @param field
	 * @param method
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private final void addFieldOrMethodAsEmbeddedInput(JavaField field, JavaMethod method) throws Exception {
		createEmbeddedInput(field, method, field.getName());
	}
	
	/**
	 * Add field or method as Embedded Input
	 * 
	 * @param field
	 * @param method
	 * @param prefix
	 * @throws Exception
	 */
	private final void createEmbeddedInput(JavaField field, JavaMethod method, String prefix) throws Exception {
		String fieldType = field.getType().getValue();
		
		if (fieldType.matches(STANDARD_TYPE) || fieldType.matches(COLLECTION_TYPE))
			return;

		boolean isAnnotationInField = checkIfEmbedded(field);
		boolean isAnnotationInMethod = (method != null && checkIfEmbedded(method));

		if (isAnnotationInMethod || isAnnotationInField) {
			JavaClass embeddedClass = field.getType().getJavaClass();

			for (JavaField embeddedClassField: embeddedClass.getFields()) {
				String embeddedClassFieldName = embeddedClassField.getName();
				String embeddedClassMethodName = "get" + capitalize(embeddedClassFieldName);
				JavaMethod embeddedClassMethod = embeddedClass.getMethodBySignature(embeddedClassMethodName, null);
				
				// If class is an Embedded, add it as an embedded input
				if (embeddedClassField.getType().getValue().matches(STANDARD_TYPE)) {
					// Concat the prefix with the field name
					String fieldName = prefix + "." + embeddedClassFieldName;
					Constraint constraint = createConstraint(fieldName, embeddedClassField, embeddedClassMethod);
					Input embeddedInput = new Input(fieldName, embeddedClassField.getType());
					embeddedInput.setConstraint(constraint);
					addEmbeddedInput(embeddedInput);
					addConstraint(constraint);
				} else if (!embeddedClassField.getType().getValue().matches(COLLECTION_TYPE)) {
					// If class is not an Embedded, and not a collection, concat the prefix with the field name.
					String embeddedPrefix = prefix + "." + embeddedClassFieldName;	

					// Recursively call this method again.
					createEmbeddedInput(embeddedClassField, embeddedClassMethod, embeddedPrefix);
				}
			}
		}			
	}

	/**
	 * Add field or method as Single Select
	 * 
	 * @param field
	 * @param method
	 * @param form
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private final void addFieldOrMethodAsSingleSelect(JavaField field, JavaMethod method) throws Exception {
		String fieldName = field.getName();
		String fieldType = field.getType().getValue();
		
		if (fieldType.matches(STANDARD_TYPE) || fieldType.matches(COLLECTION_TYPE))
			return;

		// If the field is not a Standard or Collection type
		boolean isAnnotationInField = checkIfManyToOne(field);
		boolean isAnnotationInMethod = (method != null && checkIfManyToOne(method));
		
		if (isAnnotationInMethod || isAnnotationInField) {
			// If the field is a many-to-one associative, add as a single select
			JavaClass associatedClass = field.getType().getJavaClass();
			validateEntityClass(associatedClass, true);

			SingleSelect singleSelect = null;
			
			for (JavaField associatedClassField: associatedClass.getFields()) {
				// Find the Id and add it to the single select field during the its creation.
				if (checkIfId(associatedClassField)) {
					singleSelect = new SingleSelect(fieldName, field.getType(), 
												  	associatedClassField.getName(), associatedClassField.getType());
					
					break;
				}
			}
			
			if (singleSelect == null)
				throw new Exception("'" + associatedClass + "' doesn't have ID.");
			
			Constraint constraint = createConstraint(fieldName, field, method);
			addSingleSelect(singleSelect);
			addConstraint(constraint);
		}
	}
	
	/**
	 * Add field or method as Multiple Select
	 * 
	 * @param field
	 * @param method
	 * @param form
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private final void addFieldOrMethodAsMultipleSelect(JavaField field, JavaMethod method) throws Exception {
		String fieldName = field.getName();
		String fieldType = field.getType().getValue();

		if (!fieldType.matches(COLLECTION_TYPE))
			return;

		boolean manyToMany = checkIfManyToMany(field);
		
		if (!manyToMany && method != null)
			manyToMany = checkIfManyToMany(method);
		
		if (manyToMany && 
			(checkIfOwnerOfManyToMany(field) || 
			(method != null && checkIfOwnerOfManyToMany(method)))) {
			// If it's a many-to-many associative and an owner of many-to-many, process the field as a multiple select
			String typeParameter = field.getType().getGenericValue()
												   .replace(fieldType, "").replace("<", "").replace(">", "");
			
			JavaClass associatedClass = retrieveClass(typeParameter);
			validateEntityClass(associatedClass, true);
			
			MultipleSelect multipleSelect = null;
			
			for (JavaField associatedClassField: associatedClass.getFields()) {
				// Find the Id and add it to the multiple select field during the its creation.
				if (checkIfId(associatedClassField)) {
					multipleSelect = new MultipleSelect(fieldName, field.getType(), associatedClass.asType(),
												  associatedClassField.getName(), associatedClassField.getType());

					break;
				}
			}

			if (multipleSelect == null)
				throw new Exception("'" + associatedClass + "' doesn't have ID.");

			Constraint constraint = createConstraint(fieldName, field, method);
			addMultipleSelect(multipleSelect);
			addConstraint(constraint);
		}

	}
}
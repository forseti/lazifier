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
package com.googlecode.lazifier.scaffold.annotation;

import static com.googlecode.lazifier.scaffold.annotation.AnnotationUtils.checkIfAnnotationExists;
import static com.googlecode.lazifier.scaffold.annotation.AnnotationUtils.checkIfAnnotationHasAttributes;
import static com.googlecode.lazifier.scaffold.annotation.AnnotationUtils.retrieveAnnotation;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.EMBEDDABLE;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.EMBEDDED;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.ENTITY;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.GENERATED_VALUE;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.ID;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.LOB;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.MANY_TO_MANY;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.MANY_TO_ONE;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.MAPPED_BY;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.MAPPED_SUPERCLASS;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.VERSION;

import com.thoughtworks.qdox.model.Annotation;
import com.thoughtworks.qdox.model.JavaClass;
import com.thoughtworks.qdox.model.JavaField;
import com.thoughtworks.qdox.model.JavaMethod;

/**
 * The PersistenceUtils class. The helper class for scanning and validating an entity.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class PersistenceUtils {
	/**
	 * Validate the entity class
	 * 
	 * @param entityClass
	 * @return
	 * @throws Exception
	 */
	public static final boolean validateEntityClass(JavaClass entityClass) throws Exception {
		return validateEntityClass(entityClass, false);
	}
	
	/**
	 * Validate the entity class. Throwing exception if the 'throwsExceptionIfInvalid' is true.
	 * 
	 * @param entityClass
	 * @param throwsExceptionIfInvalid
	 * @return
	 * @throws Exception
	 */
	public static final boolean validateEntityClass(JavaClass entityClass, boolean throwsExceptionIfInvalid) throws Exception {
		if (!entityClass.isAbstract() && !entityClass.isInterface() && checkIfEntity(entityClass))
			return true;
		
		if (throwsExceptionIfInvalid)
			throw new Exception("The entity class '" + entityClass.getName() + "' is invalid");
		else
			return false;
	}

	/**
	 * Validate the superclass.
	 * 
	 * @param superClass
	 * @return
	 * @throws Exception
	 */
	public static final boolean validateSuperClass(JavaClass superClass) throws Exception {
		return validateSuperClass(superClass, false);
	}
	
	/**
	 * Validate the superclass. Throwing exception if the 'throwsExceptionIfInvalid' is true.
	 * 
	 * @param superClass
	 * @param throwsExceptionIfInvalid
	 * @return
	 * @throws Exception
	 */
	public static final boolean validateSuperClass(JavaClass superClass, boolean throwsExceptionIfInvalid) throws Exception {
		if ((superClass.isAbstract() && checkIfMappedSuperClass(superClass)) || 
			(!superClass.isAbstract() && !checkIfMappedSuperClass(superClass)))			
			return true;
		
		if (throwsExceptionIfInvalid)
			throw new Exception("The super class '" + superClass.getName() + "' is invalid");
		else
			return false;
	}
	
	/**
	 * Check if the class is an entity.
	 * 
	 * @param javaClass
	 * @return
	 */
	public static final boolean checkIfEntity(JavaClass javaClass) {
		return checkIfAnnotationExists(javaClass, ENTITY);
	}
	
	/**
	 * Check if the class is a superclass
	 * 
	 * @param javaClass
	 * @return
	 */
	public static final boolean checkIfMappedSuperClass(JavaClass javaClass) {
		return checkIfAnnotationExists(javaClass, MAPPED_SUPERCLASS);
	}	
	
	/**
	 * Check if the class is embeddable
	 * 
	 * @param javaClass
	 * @return
	 */
	public static final boolean checkIfEmbeddable(JavaClass javaClass) {
		return checkIfAnnotationExists(javaClass, EMBEDDABLE);
	}
	
	/**
	 * Check if the field is an ID
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfId(JavaField javaField) {
		return checkIfAnnotationExists(javaField, ID);
	}

	/**
	 * Check if the property is an ID
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfId(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, ID);
	}
	
	/**
	 * Check if the field contains generated value
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfGeneratedValue(JavaField javaField) {
		return checkIfAnnotationExists(javaField, GENERATED_VALUE);
	}
	
	/**
	 * Check if the property contains generated value
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfGeneratedValue(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, GENERATED_VALUE);
	}
	
	/**
	 * Check if the field is a version.
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfVersion(JavaField javaField) {
		return checkIfAnnotationExists(javaField, VERSION);
	}

	/**
	 * Check if the property is a version.
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfVersion(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, VERSION);
	}
	
	/**
	 * Check if the field is a large object
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfLob(JavaField javaField) {
		return checkIfAnnotationExists(javaField, LOB);
	}
	
	/**
	 * Check if the property is a large object.
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfLob(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, LOB);
	}
	
	/**
	 * Check if the field is an embedded type
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfEmbedded(JavaField javaField) {
		return checkIfAnnotationExists(javaField, EMBEDDED);
	}
	
	/**
	 * Check if the property is an embedded type
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfEmbedded(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, EMBEDDED);
	}
	
	/**
	 * Check if the field is a many-to-many associative.
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfManyToMany(JavaField javaField) {
		return checkIfAnnotationExists(javaField, MANY_TO_MANY);
	}
	
	/**
	 * Check if the property is a many-to-many associative
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfManyToMany(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, MANY_TO_MANY);
	}
	
	/**
	 * Check if the field is the owner of many-to-many
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfOwnerOfManyToMany(JavaField javaField) {
		Annotation annotation = retrieveAnnotation(javaField, MANY_TO_MANY);
		
		return checkIfAnnotationHasAttributes(annotation, new String[] {MAPPED_BY}) == false;
	}
	
	/**
	 * Check if the property is the owner of many-to-many
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfOwnerOfManyToMany(JavaMethod javaMethod) {
		Annotation annotation = retrieveAnnotation(javaMethod, MANY_TO_MANY);
		
		return checkIfAnnotationHasAttributes(annotation, new String[] {MAPPED_BY}) == false;
	}
	
	/**
	 * Check if the field is a many-to-one associative.
	 * 
	 * @param javaField
	 * @return
	 */
	public static final boolean checkIfManyToOne(JavaField javaField) {
		return checkIfAnnotationExists(javaField, MANY_TO_ONE);
	}
	
	/**
	 * Check if the property is a many-to-one associative.
	 * 
	 * @param javaMethod
	 * @return
	 */
	public static final boolean checkIfManyToOne(JavaMethod javaMethod) {
		return checkIfAnnotationExists(javaMethod, MANY_TO_ONE);
	}
}
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

import com.thoughtworks.qdox.model.Annotation;
import com.thoughtworks.qdox.model.JavaClass;
import com.thoughtworks.qdox.model.JavaField;
import com.thoughtworks.qdox.model.JavaMethod;

/**
 * The AnnotationUtils class. The helper class for scanning annotations using QDox
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class AnnotationUtils {
	/**
	 * Retrieve annotations from a class
	 * 
	 * @param javaClass
	 * @param annotationClass
	 * @return
	 */
	public static final Annotation retrieveAnnotation(JavaClass javaClass, String annotationClass) {
		for (Annotation annotation: javaClass.getAnnotations())
			if (checkIfAnnotationIsValid(annotation, annotationClass))
				return annotation;

		return null;
	}
	
	/**
	 * Retrieve annotations from a field
	 * 
	 * @param javaField
	 * @param annotationClass
	 * @return
	 */
	public static final Annotation retrieveAnnotation(JavaField javaField, String annotationClass) {
		for (Annotation annotation: javaField.getAnnotations())
			if (checkIfAnnotationIsValid(annotation, annotationClass))
				return annotation;
		
		return null;
	}
	
	/**
	 * Retrieve annotations from a method.
	 * 
	 * @param javaMethod
	 * @param annotationClass
	 * @return
	 */
	public static final Annotation retrieveAnnotation(JavaMethod javaMethod, String annotationClass) {
		for (Annotation annotation: javaMethod.getAnnotations())
			if (checkIfAnnotationIsValid(annotation, annotationClass))
				return annotation;
		
		return null;
	}

	/**
	 * Check if annotation exists in a class
	 * 
	 * @param javaClass
	 * @param annotationClass
	 * @return
	 */
	public static final boolean checkIfAnnotationExists(JavaClass javaClass, String annotationClass) {
		return retrieveAnnotation(javaClass, annotationClass) != null;
	}

	/**
	 * Check if annotation exists in a field
	 * 
	 * @param javaField
	 * @param annotationClass
	 * @return
	 */
	public static final boolean checkIfAnnotationExists(JavaField javaField, String annotationClass) {
		return retrieveAnnotation(javaField, annotationClass) != null;
	}
	
	/**
	 * Check if annotation exists in a method
	 * 
	 * @param javaMethod
	 * @param annotationClass
	 * @return
	 */
	public static final boolean checkIfAnnotationExists(JavaMethod javaMethod, String annotationClass) {
		return retrieveAnnotation(javaMethod, annotationClass) != null;
	}
	
	/**
	 * Check if annotation is valid by comparing a qualified class name of an annotation
	 * 
	 * @param annotation
	 * @param annotationClass
	 * @return
	 */
	public static final boolean checkIfAnnotationIsValid(Annotation annotation, String annotationClass) {
		return annotation.getType().getValue().contains(annotationClass);
	}
	
	/**
	 * Check if an annotation has attributes provided
	 * 
	 * @param annotation
	 * @param attributes
	 * @return
	 */
	public static final boolean checkIfAnnotationHasAttributes(Annotation annotation, String[] attributes) {
		boolean valid = true;
		
		if (annotation != null && attributes != null)
			for (String attribute: attributes) {
				valid = valid && annotation.getNamedParameter(attribute) != null;
				
				if (!valid)
					break;
			}
		
		return valid;
	}
}
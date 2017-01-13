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

import com.googlecode.lazifier.generate.Source;
import com.thoughtworks.qdox.model.Type;

/**
 * The MultipleSelect class.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class MultipleSelect extends Select {
	private final Type typeParameter;
	private Source referenceCollectionEditor;
	
	/**
	 * Instantiate MultipleSelect object.
	 * 
	 * @param name
	 * @param type
	 * @param typeParameter
	 * @param key
	 * @param keyType
	 * @throws Exception
	 */
	public MultipleSelect(String name, Type type, Type typeParameter, String key, Type keyType) throws Exception {
		// TODO Auto-generated constructor stub
		super(name, type, key, keyType);
		this.typeParameter = typeParameter;
	}
	
	/**
	 * Get type parameter
	 * 
	 * @return type parameter
	 */
	public Type getTypeParameter() {
		return typeParameter;
	}
	
	/**
	 * Get type parameter class name
	 * 
	 * @return type parameter class name
	 */
	public String getTypeParameterClassName() {
		return typeParameter.getJavaClass().getName();
	}
	
	/**
	 * Get type parameter qualified class name
	 * 
	 * @return type parameter qualifed class name
	 */
	public String getTypeParameterQualifiedClassName() {
		return typeParameter.getJavaClass().getFullyQualifiedName();
	}
	
	/**
	 * Get type parameter package name
	 * 
	 * @return type parameter package name
	 */
	public String getTypeParameterPackageName() {
		return typeParameter.getJavaClass().getPackage().getName();
	}

	/**
	 * Get reference collection editor
	 * 
	 * @return reference collection editor
	 */
	public Source getReferenceCollectionEditor() {
		return referenceCollectionEditor;
	}

	/**
	 * Set reference collection editor
	 * 
	 * @param referenceCollectionEditor
	 */
	public void setReferenceCollectionEditor(Source referenceCollectionEditor) {
		this.referenceCollectionEditor = referenceCollectionEditor;
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
	    
	    retValue.append("MultipleSelect ( ")
	        .append(super.toString()).append(TAB)
	        .append("typeParameter = ").append(this.typeParameter).append(TAB)
	        .append("referenceCollectionEditor = ").append(this.referenceCollectionEditor).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}
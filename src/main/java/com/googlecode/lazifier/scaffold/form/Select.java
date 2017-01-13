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
 * The Select class.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public abstract class Select extends Input {
	// The key
	private final String key;
	
	// The key type
	private final Type keyType;
	
	// The reference repository
	private Source referenceRepository;
	
	// The reference service
	private Source referenceService;
	
	/**
	 * Instantiate new Select object.
	 * 
	 * @param name
	 * @param type
	 * @param key
	 * @param keyType
	 * @throws Exception
	 */
	public Select(String name, Type type, String key, Type keyType) throws Exception {
		// TODO Auto-generated constructor stub
		super(name, type);
		isIdType(keyType);
		this.key = key;
		this.keyType = keyType;
	}
	
	/**
	 * Get key
	 * 
	 * @return key
	 */
	public String getKey() {
		return key;
	}
	
	/**
	 * Get key type
	 * 
	 * @return key type 
	 */
	public Type getKeyType() {
		return keyType;
	}
	
	/**
	 * Get key type class name
	 * 
	 * @return key type class name
	 */
	public String getKeyTypeClassName() {
		return keyType.getJavaClass().getName();
	}
	
	/**
	 * Get key type qualified class name
	 * 
	 * @return key type qualified class name
	 */
	public String getKeyTypeQualifiedClassName() {
		return keyType.getJavaClass().getFullyQualifiedName();
	}
	
	/**
	 * Get key type package name
	 * 
	 * @return key type package name
	 */
	public String getKeyTypePackageName() {
		return keyType.getJavaClass().getPackage().getName();
	}

	/**
	 * Get reference repository
	 * 
	 * @return reference repository
	 */
	public Source getReferenceRepository() {
		return referenceRepository;
	}

	/**
	 * Set reference repository
	 * 
	 * @param referenceRepository
	 */
	public void setReferenceRepository(Source referenceRepository) {
		this.referenceRepository = referenceRepository;
	}

	/**
	 * Get reference service
	 * 
	 * @return reference service
	 */
	public Source getReferenceService() {
		return referenceService;
	}

	/**
	 * Set reference service
	 * 
	 * @param referenceService
	 */
	public void setReferenceService(Source referenceService) {
		this.referenceService = referenceService;
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
	    
	    retValue.append("SingleSelect ( ")
	        .append(super.toString()).append(TAB)
	        .append("key = ").append(this.key).append(TAB)
	        .append("keyType = ").append(this.keyType).append(TAB)
	        .append("referenceRepository = ").append(this.referenceRepository).append(TAB)
	        .append("referenceService = ").append(this.referenceService).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}
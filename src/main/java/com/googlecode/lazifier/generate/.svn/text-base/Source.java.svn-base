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
package com.googlecode.lazifier.generate;

import static com.googlecode.lazifier.generate.PatternConstants.VALID_DIRECTORY;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_FILE_EXTENSION;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_NAME;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_PACKAGE;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_PACKAGE_PATTERN;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_PREFIX;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_SUFFIX;

import org.springframework.util.StringUtils;

/**
 * The Source class. This class holds the informations required by generator to write a file.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Source {
	/** The name. */
	private String name;
	
	/** The package. */
	private String _package;
	
	/** The root package. */
	private String rootPackage;
	
	/** The prefix. */
	private String prefix;

	/** The suffix. */
	private String suffix;
	
	/** The package pattern. */
	private String packagePattern;
	
	/** Remove root package name */
	private boolean removeRootPackage = false; 
	
	/** Append name as package suffix */
	private boolean tailPackageWithName = false;
	
	/** The extension. */
	private String fileExtension;
	
	/** The target dir. */
	private String targetDir;
	
	/** The template file. */
	private String templateFile;
	
	/** Use suffix as the name */
	private boolean useSuffixAsFileName = false;
	
	/** The flag for capitalizing file name. */
	private boolean capitalizeFileName = true;
	
	/** The flag to create the file */
	private boolean create = true;

	/**
	 * Instantiates a new source.
	 */
	public Source() {
		// TODO Auto-generated constructor stub
		this(null);
	}
	
	/**
	 * Instantiates a new source.
	 * 
	 * @param _package the _package
	 */
	public Source(String _package) {
		// TODO Auto-generated constructor stub
		this(null, _package);
	}
	
	/**
	 * Instantiates a new source.
	 * 
	 * @param name the name
	 * @param _package the _package
	 */
	public Source(String name, String _package) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this._package = _package;
	}
	
	/**
	 * Gets the name.
	 * 
	 * @return the name
	 */
	public final String getName() {
		return name;
	}

	/**
	 * Sets the name.
	 * 
	 * @param name the new name
	 * 
	 * @throws Exception the generator exception
	 */
	public void setName(String name) throws Exception  {
		if (!name.matches(VALID_NAME))
			throw new Exception("Name '" + name + "' contains non-alphanumeric characters.");
		
		this.name = name;
	}
	
	/**
	 * Gets the package.
	 * 
	 * @return the package
	 */
	public final String getPackage() {		
		return _package;
	}
	
	/**
	 * Sets the package.
	 * 
	 * @param _package the new package
	 * 
	 * @throws Exception the generator exception
	 */
	public void setPackage(String _package) throws Exception  {
		if (!_package.matches(VALID_PACKAGE))
			throw new Exception("Package '" + _package + "' has invalid format.");

		this._package = _package;
	}
	
	/**
	 * Sets the root package.
	 * 
	 * @param rootPackage the new root package
	 * 
	 * @throws Exception the generator exception
	 */
	public void setRootPackage(String rootPackage) throws Exception {
		if (!rootPackage.matches(VALID_PACKAGE))
			throw new Exception("Package '" + rootPackage + "' has invalid format.");
		
		this.rootPackage = rootPackage;
	}
	
	/**
	 * 
	 * @param tailPackageWithName
	 */
	public void setTailPackageWithName(boolean tailPackageWithName) {
		this.tailPackageWithName = tailPackageWithName;
	}
	
	/**
	 * Gets the template file.
	 * 
	 * @return the template file
	 */
	public String getTemplateFile() {
		return templateFile;
	}
	
	/**
	 * Sets the template file.
	 * 
	 * @param templateFile the new template file
	 */
	public void setTemplateFile(String templateFile) {
		this.templateFile = templateFile;
	}
	
	/**
	 * Sets the prefix.
	 * 
	 * @param prefix the new prefix
	 * 
	 * @throws Exception the generator exception
	 */
	public void setPrefix(String prefix) throws Exception  {
		if (!prefix.matches(VALID_PREFIX))
			throw new Exception("Prefix '" + prefix + "' is invalid.");
		
		this.prefix = prefix;
	}
	
	public String getSuffix() {
		return suffix;
	}
	
	/**
	 * Sets the suffix.
	 * 
	 * @param suffix the new suffix
	 * 
	 * @throws Exception the generator exception
	 */
	public void setSuffix(String suffix) throws Exception {
		
		if (!suffix.matches(VALID_SUFFIX))
			throw new Exception("Prefix '" + prefix + "' is invalid.");
		
		this.suffix = suffix;
	}

	/**
	 * Sets the package format.
	 * 
	 * @param packageFormat the new package format
	 * 
	 * @throws Exception the generator exception
	 */
	public void setPackagePattern(String packageFormat) throws Exception {
		if (packageFormat != null && !packageFormat.matches(VALID_PACKAGE_PATTERN))
			throw new Exception("Package pattern '" + packageFormat + "' is invalid.");
			
		this.packagePattern = packageFormat;
	}

	/**
	 * Sets the ignore root package.
	 * 
	 * @param removeRootPackage to remove root package
	 */
	public void setRemoveRootPackage(boolean removeRootPackage) {
		this.removeRootPackage = removeRootPackage;
	}
	
	/**
	 * Sets the extension.
	 * 
	 * @param fileExtension the file extension
	 * 
	 * @throws Exception the generator exception
	 */
	public void setFileExtension(String fileExtension) throws Exception {
		if (!fileExtension.matches(VALID_FILE_EXTENSION))
			throw new Exception("File extension '" + fileExtension + "' is invalid.");
		
		if (!fileExtension.startsWith("."))
			fileExtension = "." + fileExtension;
		
		this.fileExtension = fileExtension;
	}
	
	/**
	 * Sets the target dir.
	 * 
	 * @param targetDir the new target dir
	 * 
	 * @throws Exception the generator exception
	 */
	public void setTargetDir(String targetDir) throws Exception {
		if (!targetDir.matches(VALID_DIRECTORY))
			throw new Exception("Directory '" + targetDir + "' is invalid.");
		
		this.targetDir = targetDir;
	}
	
	/**
	 * Sets use suffix as the name
	 * 
	 * @param useSuffixAsName
	 */
	public void setUseSuffixAsFileName(boolean useSuffixAsFileName) {
		this.useSuffixAsFileName = useSuffixAsFileName;
	}

	/**
	 * Sets the capitalize file name.
	 * 
	 * @param capitalizeFileName the new capitalize file name
	 */
	public void setCapitalizeFileName(boolean capitalizeFileName) {
		this.capitalizeFileName = capitalizeFileName;
	}
	
	/**
	 * Get create.
	 * 
	 * @return
	 */
	public boolean isCreate() {
		return create;
	}
	
	/**
	 * Set the create
	 * 
	 * @param create
	 */
	public void setCreate(boolean create) {
		this.create = create;
	}

	/**
	 * Gets the package name.
	 * 
	 * @return the package name
	 * 
	 * @throws Exception the exception
	 */
	public final String getPackageName() throws Exception {
		String packageName = _package;
		
		if (packageName != null) {
			if (tailPackageWithName && name != null)
				packageName = packageName + "." + name;
			
			if (packagePattern != null) 
				packageName = packagePattern.replace("#package#", packageName);
			else
				packageName = null;
		}
		
		if (removeRootPackage && rootPackage != null && packageName != null)
			packageName = packageName.replace((rootPackage + "."), "");
		
		return packageName;
	}
	
	/**
	 * Gets the class name.
	 * 
	 * @return the class name
	 * 
	 * @throws Exception the exception
	 */
	public final String getClassName() throws Exception {
		String className = StringUtils.capitalize(name);
	
		if (suffix != null)
			className = className + suffix;
		
		if (prefix != null) {
			className = prefix + className;
			className = StringUtils.capitalize(className);
		}
		
		return className;
	}
	
	/**
	 * Gets the qualified class name.
	 * 
	 * @return the qualified class name
	 * 
	 * @throws Exception the exception
	 */
	public final String getQualifiedClassName() throws Exception {
		String qualifiedClassName = getClassName();
		
		String packageName = getPackageName();
		
		if (packageName != null)
			qualifiedClassName = packageName + "." + qualifiedClassName;
		
		return qualifiedClassName;
	}
	
	/**
	 * Gets the default name.
	 * 
	 * @return the default name
	 * 
	 * @throws Exception the exception
	 */
	public final String getDefaultName() throws Exception {
		String defaultName = getClassName();
		
		return StringUtils.uncapitalize(defaultName);
	}

	/**
	 * Gets the dir name.
	 * 
	 * @return the dir name
	 * 
	 * @throws Exception the exception
	 */
	public final String getDirName() throws Exception {
		String dirName = targetDir;
		String packageName = getPackageName();
		
		if (packageName != null) {
			packageName = packageName.replace(".", "/");
			dirName = dirName + "/" + packageName;
		}
		
		dirName = dirName.trim();
		
		if (dirName.startsWith("/"))
			dirName = dirName.replaceFirst("/", "");
		else if (dirName.startsWith("./"))
			dirName = dirName.replaceFirst("\\./", "");
		else if (dirName.length() == 1 && dirName.startsWith("."))
			dirName = dirName.replaceFirst("\\.", "");
		
		return dirName;
	}
	
	/**
	 * Gets the file name.
	 * 
	 * @return the file name
	 * 
	 * @throws Exception the exception
	 */
	public final String getFileName() throws Exception {
		String fileName = (useSuffixAsFileName)? suffix : getClassName();
		
		if (fileExtension != null)
			fileName = fileName + fileExtension;
		
		if (!capitalizeFileName)
			fileName = StringUtils.uncapitalize(fileName);
		
		return fileName;
	}
	
	/**
	 * Gets the qualified file name.
	 * 
	 * @return the qualified file name
	 * 
	 * @throws Exception the exception
	 */
	public final String getQualifiedFileName() throws Exception {
		String fileName = getFileName();	
		String dirName = getDirName();
		
		if (dirName != null && dirName.trim().length() > 0)
			fileName = dirName + "/" + fileName;
		
		return fileName;
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
	    
	    retValue.append("Source ( ")
	        .append(super.toString()).append(TAB)
	        .append("name = ").append(this.name).append(TAB)
	        .append("_package = ").append(this._package).append(TAB)
	        .append("rootPackage = ").append(this.rootPackage).append(TAB)
	        .append("prefix = ").append(this.prefix).append(TAB)
	        .append("suffix = ").append(this.suffix).append(TAB)
	        .append("packagePattern = ").append(this.packagePattern).append(TAB)
	        .append("removeRootPackage = ").append(this.removeRootPackage).append(TAB)
	        .append("fileExtension = ").append(this.fileExtension).append(TAB)
	        .append("targetDir = ").append(this.targetDir).append(TAB)
	        .append("templateFile = ").append(this.templateFile).append(TAB)
	        .append("capitalizeFileName = ").append(this.capitalizeFileName).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}
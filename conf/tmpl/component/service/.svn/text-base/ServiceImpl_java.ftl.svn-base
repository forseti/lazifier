package ${serviceImpl_java.packageName};
[#if entity_java??]

import java.util.List;
[/#if]

[#if repository_java??]
import org.springframework.beans.factory.annotation.Autowired;
[/#if]
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

[#if entity_java?? && entity_java.packageName != serviceImpl_java.packageName]
	[#assign import=true /]
import ${entity_java.qualifiedClassName};
[/#if]
[#if repository_java?? && repository_java.packageName != serviceImpl_java.packageName]
	[#assign import=true /]
import ${repository_java.qualifiedClassName};
[/#if]
[#if service_java?? && service_java.packageName != serviceImpl_java.packageName]
	[#assign import=true /]
import ${service_java.qualifiedClassName};
[/#if]
[#if import??]

[/#if]
@Transactional
@Service("${service_java.defaultName}")
public class ${serviceImpl_java.className} implements ${service_java.className} {
[#if repository_java??]
	private ${repository_java.className} ${repository_java.defaultName};
	
	@Autowired(required=true)
	public void set${repository_java.className}(${repository_java.className} ${repository_java.defaultName}) {
		this.${repository_java.defaultName} = ${repository_java.defaultName};
	}
[/#if]
[#if entity_java??]
	
	/**
	 * Finds items.
	 *
	 * @param currentPage the ${entity_java.defaultName}'s currentPage
	 * @param maxResults the ${entity_java.defaultName}'s maxResults
	 *
	 * @return the list of ${entity_java.defaultName}
	 */
	public List<${entity_java.className}> find(int currentPage, int maxResults) {
[#if repository_java??]
		return ${repository_java.defaultName}.find(currentPage, maxResults);
[#else]
		return null;
[/#if]	
	}
	
	/**
	 * Finds all items available.
	 *
	 * @return the list of ${entity_java.className}
	 */
	public List<${entity_java.className}> findAll() {
[#if repository_java??]
		return ${repository_java.defaultName}.findAll();
[#else]
		return null;
[/#if]
	}
	
	/**
	 * Find max pages.
	 *
	 * @param maxResults the max results
	 *
	 * @return the Integer
	 */
	public Integer findMaxPages(Integer maxResults) {
		// TODO Auto-generated method stub
[#if repository_java??]
		return ${repository_java.defaultName}.findMaxPages(maxResults);
[#else]
		return null;
[/#if]
	}

	/**
	 * Find total results.
	 *
	 * @return the Integer
	 */
	public Integer findTotalResults() {
[#if repository_java??]
		return ${repository_java.defaultName}.findTotalResults();
[#else]
		return null;
[/#if]
	}

	/**
	 * Loads a data of ${entity_java.defaultName}.
	 *
	 * @param ${form.id.name} the ${entity_java.defaultName}'s ${form.id.name}
	 *
	 * @return the ${entity_java.defaultName}
	 */
	public ${entity_java.className} load(${form.id.typeClassName} ${form.id.name}) {
[#if repository_java??]
		return ${repository_java.defaultName}.load(${form.id.name});
[#else]
		return null;
[/#if]
	}
	
	/**
	 * Loads a data of ${entity_java.defaultName} with all properties and relations.
	 *
	 * @param ${form.id.name} the ${entity_java.defaultName}'s ${form.id.name}
	 *
	 * @return the ${entity_java.defaultName}
	 */
	public ${entity_java.className} loadAll(${form.id.typeClassName} ${form.id.name}) {
[#if repository_java??]
		return ${repository_java.defaultName}.loadAll(${form.id.name});
[#else]
		return null;
[/#if]
	}

	/**
	 * Removes ${entity_java.defaultName}.
	 *
	 * @param ${form.id.name} the ${entity_java.defaultName}'s ${form.id.name}
	 */
	public void remove(${form.id.typeClassName} ${form.id.name}) {
[#if repository_java??]
		${repository_java.defaultName}.remove(${form.id.name});
[/#if]
	}

	/**
	 * Save ${entity_java.defaultName}.
	 *
	 * @param ${entity_java.defaultName} the ${entity_java.defaultName}
	 *
	 * @return the ${entity_java.defaultName}
	 */
	public ${entity_java.className} save(${entity_java.className} ${entity_java.defaultName}) {
[#if repository_java??]
		${entity_java.defaultName} = ${repository_java.defaultName}.save(${entity_java.defaultName});
		
		return ${entity_java.defaultName};
[#else]
		return null;
[/#if]
	}
[/#if]
}
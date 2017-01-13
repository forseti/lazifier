package ${service_java.packageName};
[#if entity_java??]

import java.util.List;
[/#if]
[#if entity_java?? && entity_java.packageName != service_java.packageName]

import ${entity_java.qualifiedClassName};
[/#if]

public interface ${service_java.className} {
[#if entity_java??]
	/**
	 * Finds items.
	 *
	 * @param currentPage the ${entity_java.defaultName}'s currentPage
	 * @param maxResults the ${entity_java.defaultName}'s maxResults
	 *
	 * @return the list of ${entity_java.defaultName}
	 */
	List<${entity_java.className}> find(int currentPage, int maxResults);

	/**
	 * Finds all items available.
	 *
	 * @return the list of ${entity_java.defaultName}
	 */
	List<${entity_java.className}> findAll();
	
	/**
	 * Find max pages.
	 *
	 * @param maxResults the max results
	 *
	 * @return the Integer
	 */
	Integer findMaxPages(Integer maxResults);

	/**
	 * Find total results.
	 *
	 * @return the Integer
	 */
	Integer findTotalResults();

	/**
	 * Loads a data of ${entity_java.defaultName}.
	 *
	 * @param ${form.id.name} the ${entity_java.defaultName}'s ${form.id.name}
	 *
	 * @return the ${entity_java.defaultName}
	 */
	${entity_java.className} load(${form.id.typeClassName} ${form.id.name});	
	
	/**
	 * Loads a data of ${entity_java.defaultName} with all properties and relations.
	 *
	 * @param ${form.id.name} the ${entity_java.defaultName}'s ${form.id.name}
	 *
	 * @return the ${entity_java.defaultName}
	 */
	${entity_java.className} loadAll(${form.id.typeClassName} ${form.id.name});

	/**
	 * Deletes ${entity_java.defaultName}.
	 *
	 * @param ${form.id.name} the ${entity_java.defaultName}'s ${form.id.name}
	 */
	void remove(${form.id.typeClassName} ${form.id.name});

	/**
	 * Saves ${entity_java.defaultName}.
	 *
	 * @param ${entity_java.defaultName} the ${entity_java.defaultName}
	 *
	 * @return the ${entity_java.defaultName}
	 */
	${entity_java.className} save(${entity_java.className} ${entity_java.defaultName});
[/#if]
}
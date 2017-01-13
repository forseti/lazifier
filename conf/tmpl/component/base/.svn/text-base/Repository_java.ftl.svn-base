package ${baseRepository_java.packageName};

import java.io.Serializable;
import java.util.List;

/**
 * ${baseRepository_java.className} is a generic DAO interface for CRUD
 *
 * @author 
 * @since  
 * @version 
 */
public interface ${baseRepository_java.className}<E, ID extends Serializable> {	
	/**
	 * Checks if an entity with id exists.
	 *
	 * @param id the id
	 *
	 * @return true, if successful
	 */
	boolean exists(ID id);
	
	/**
	 * Finds all entities available in the current page.
	 *
	 * @param currentPage the current page
	 * @param maxResults the max results per page
	 *
	 * @return the list of items
	 */
	List<E> find(Integer currentPage, Integer maxResults);

	/**
	 * Finds all entities available.
	 *
	 * @return the list of all items
	 */
	List<E> findAll();
	
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
	 * Loads an entity by id.
	 *
	 * @param id the id
	 *
	 * @return the e
	 */
	E load(ID id);
	
	/**
	 * Loads an entity with all properties and relations by id.
	 *
	 * @param id the id
	 *
	 * @return the e
	 */
	E loadAll(ID id);

	/**
	 * Removes an entity by id.
	 *
	 * @param id the id
	 */
	void remove(ID id);
	
	/**
	 * Removes an entity.
	 *
	 * @param entity the entity
	 */
	void remove(E model);

	/**
	 * Save an entity.
	 *
	 * @param entity the entity
	 *
	 * @return the entity
	 */
	E save(E model);
}
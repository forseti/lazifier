package ${baseRepositoryImpl_java.packageName};

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class GenericRepositoryImpl.
 */
public abstract class ${baseRepositoryImpl_java.className}<E, ID extends Serializable> implements ${baseRepository_java.className}<E, ID> {
	/** The clazz. */
	private final Class<E> clazz;

	/** The query to retrieve an item with all properties. */
	protected final String getAnItemWithAllMembersQuery;
	
	/** The query to retrieve all items. */
	protected final String getAllItemsQuery;

	/** The query to count all items. */
	protected final String getCountOfItemsQuery;

	/** The Session Factory. */
	private SessionFactory sessionFactory;

	/**
	 * Instantiates a new base repository impl.
	 *
	 * @param clazz the clazz
	 */
	@SuppressWarnings("unchecked")
	public ${baseRepositoryImpl_java.className}() {
		// TODO Auto-generated constructor stub
		clazz = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		getAnItemWithAllMembersQuery = clazz.getSimpleName() + ".loadAll";
		getAllItemsQuery = "select e from " + clazz.getSimpleName() + " e";
		getCountOfItemsQuery = "select count(e) from " + clazz.getSimpleName() + " e";
	}
	
	/**
	 * Gets the clazz.
	 *
	 * @return the clazz
	 */
	protected final Class<E> getClazz() {
		return clazz;
	}

	/**
	 * Gets the session.
	 *
	 * @return the session
	 */
	protected final Session getSession() {
		if (getSessionFactory() == null)
			throw new IllegalStateException("SessionFactory has not been set on Repository before usage");

		return getSessionFactory().getCurrentSession();
	}

	/**
	 * Gets the session factory.
	 *
	 * @return the session factory
	 */
	protected final SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * Sets the session factory.
	 *
	 * @param sessionFactory the session factory
	 */
	protected void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * Cast an object to the entity type.
	 *
	 * @param sessionFactory the session factory
	 */
	protected E cast(Object object) {
		return getClazz().cast(object);
	}
	
	/**
	 * Prepare query.
	 *
	 * @param query the query
	 * @param currentPage the current page
	 * @param maxResults the max results
	 *
	 * @return the object
	 */
	protected final Query pagedQuery(Query query, int currentPage, int maxResults) {
		/**
		 * The row number for the first result of the page 1 is 0. So the row number for
		 * the first result of page 6 with the maximum of 5 items per page will be: 25.
		 * The formula is (currentPage - 1) * maxResults.
		 *
		 * Sets the first result with the correct row number and finally sets the maximum
		 * results per page.
		 */
		if (currentPage <= 0)
			throw new IllegalArgumentException("currentPage cannot be less than or equal to 0!!");

		if (maxResults <= 0)
			throw new IllegalArgumentException("maxResults cannot be less than or equal to 0!!");
	
		return query.setFirstResult((currentPage - 1) * maxResults)
			    	.setMaxResults(maxResults);
	}

	/**
	 * Creates the query.
	 *
	 * @param query the query
	 *
	 * @return the query
	 */
	protected final Query query(String query) {
		return getSession().createQuery(query);
	}

	/**
	 * Creates the query.
	 *
	 * @param query the query
	 * @param currentPage the current page
	 * @param maxResults the max results
	 *
	 * @return the query
	 */
	protected final Query query(String query, int currentPage, int maxResults) {
		return pagedQuery(query(query), currentPage, maxResults);
	}

	/**
	 * Creates the named query.
	 *
	 * @param namedQuery the named query
	 *
	 * @return the query
	 */
	protected final Query namedQuery(String namedQuery) {
		return getSession().getNamedQuery(namedQuery);
	}

	/**
	 * Creates the named query.
	 *
	 * @param namedQuery the named query
	 * @param currentPage the current page
	 * @param maxResults the max results
	 *
	 * @return the query
	 */
	protected final Query namedQuery(String namedQuery, int currentPage, int maxResults) {
		return pagedQuery(namedQuery(namedQuery), currentPage, maxResults);
	}

	/**
	 * Creates the native query.
	 *
	 * @param sqlQuery the sql query
	 *
	 * @return the query
	 */
	protected final Query nativeQuery(String sqlQuery) {
		return getSession().createSQLQuery(sqlQuery);
	}

	/**
	 * Creates the native query.
	 *
	 * @param sqlQuery the SQL query
	 * @param currentPage the current page
	 * @param maxResults the max results
	 *
	 * @return the query
	 */
	protected final Query nativeQuery(String sqlQuery, int currentPage, int maxResults) {
		return pagedQuery(nativeQuery(sqlQuery), currentPage, maxResults);
	}

	/**
	 * Find for single item with type clazz.
	 * 
	 * @param <O>
	 * @param query
	 * @param clazz
	 * @return
	 */
	protected final <O> O queryForItem(Query query, Class<O> clazz) {
		if (clazz.isAssignableFrom(List.class))
			throw new IllegalArgumentException("Argument clazz cannot be an instance of java.util.List<?>");
		
		return clazz.cast(query.uniqueResult());
	}

	/**
	 * Find for items list with type clazz.
	 * 
	 * @param <O>
	 * @param query
	 * @param clazz
	 * @return
	 */
	protected final <O extends List<?>> O queryForItems(Query query, Class<O> clazz) {
		if (!clazz.isAssignableFrom(List.class))
			throw new IllegalArgumentException("Argument clazz must be an instance of java.util.List<?>");
		
		return clazz.cast(query.list());
	}
	
	protected final E validateEntity(Object object, ID id) {
		if (object == null)
			throw new EntityNotFoundException("Cannot find object " + getClazz() + " with id " + id);
		else
			return cast(object);
	}
		
	/**
	 * Flush.
	 */
	protected final void flush() {
		getSession().flush();
	}
	
	/**
	 * Disable filter.
	 * 
	 * @param filter
	 */
	protected final void disableFilter(String filter) {
		getSession().disableFilter(filter);
	}
	
	/**
	 * Enable filter.
	 * 
	 * @param filter
	 */
	protected final void enableFilter(String filter) {
		getSession().enableFilter(filter);
	}

	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#exists(java.io.Serializable)
	 */
	public final boolean exists(ID id) {
		Object object = getSession().get(getClazz(), id);
	
		return object != null;
	}
	
	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#find(Integer, Integer)
	 */
	@SuppressWarnings("unchecked")
	public final List<E> find(Integer currentPage, Integer maxResults) {
		return (List<E>) query(getAllItemsQuery, 
							   currentPage.intValue(), maxResults.intValue()).list();
	}

	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#findAll()
	 */
	@SuppressWarnings("unchecked")
	public final List<E> findAll() {
		return (List<E>) query(getAllItemsQuery).list();
	}
	
	/**
	 * Find max pages.
	 *
	 * @param maxResults the max results
	 *
	 * @return the Integer
	 */
	public final Integer findMaxPages(Integer maxResults) {
		// TODO Auto-generated method stub
		int maxPages = findTotalResults().intValue() / maxResults.intValue();
		return Integer.valueOf(maxPages);
	}

	/**
	 * Find total results.
	 *
	 * @return the Integer
	 */
	public final Integer findTotalResults() {
		int totalResults = queryForItem(query(getCountOfItemsQuery), Long.class).intValue();
		return Integer.valueOf(totalResults);
	}
		
	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#load(java.io.Serializable)
	 */
	public final E load(ID id) {
		Object object = getSession().get(getClazz(), id);

		return validateEntity(object, id);
	}

	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#loadAll(java.io.Serializable)
	 */
	public final E loadAll(ID id) {
		Object object = namedQuery(getAnItemWithAllMembersQuery)
						.setParameter(0, id)
						.uniqueResult();
		
		return validateEntity(object, id);
	}

	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#remove(java.io.Serializable)
	 */
	public final void remove(ID id) {
		E entity = load(id);

		remove(entity);
	}
	
	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#remove(java.lang.Object)
	 */
	public final void remove(E entity) {
		getSession().delete(entity);
	}
	
	/* (non-Javadoc)
	 * @see ${baseRepository_java.qualifiedClassName}#save(java.lang.Object)
	 */
	public final E save(E entity) {
		return cast(getSession().merge(entity));
	}
}
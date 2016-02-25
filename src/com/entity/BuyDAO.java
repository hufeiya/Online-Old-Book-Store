package com.entity;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

/**
 * A data access object (DAO) providing persistence and search support for Buy
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.entity.Buy
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class BuyDAO {
	private static final Logger log = LoggerFactory.getLogger(BuyDAO.class);
	// property constants
	public static final String BSTATE = "bstate";
	public static final String BDATE = "bdate";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Buy transientInstance) {
		log.debug("saving Buy instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Buy persistentInstance) {
		log.debug("deleting Buy instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Buy findById(java.lang.String id) {
		log.debug("getting Buy instance with id: " + id);
		try {
			Buy instance = (Buy) getCurrentSession().get("com.entity.Buy", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Buy instance) {
		log.debug("finding Buy instance by example");
		try {
			List results = getCurrentSession().createCriteria("com.entity.Buy")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Buy instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Buy as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBstate(Object bstate) {
		return findByProperty(BSTATE, bstate);
	}

	public List findByBdate(Object bdate) {
		return findByProperty(BDATE, bdate);
	}

	public List findAll() {
		log.debug("finding all Buy instances");
		try {
			String queryString = "from Buy";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Buy merge(Buy detachedInstance) {
		log.debug("merging Buy instance");
		try {
			Buy result = (Buy) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Buy instance) {
		log.debug("attaching dirty Buy instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Buy instance) {
		log.debug("attaching clean Buy instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	public int getCount(){
		int count = -1;
		try {
			String hql = "select count(buy.id) as count from Buy buy";
		       Query query = getCurrentSession().createQuery(hql);
		       count = ((Number) query.iterate().next())
		         .intValue();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return count;
	}

	public static BuyDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BuyDAO) ctx.getBean("BuyDAO");
	}
}
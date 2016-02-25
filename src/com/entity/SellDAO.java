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
 * A data access object (DAO) providing persistence and search support for Sell
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.entity.Sell
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class SellDAO {
	private static final Logger log = LoggerFactory.getLogger(SellDAO.class);
	// property constants
	public static final String SSTATE = "sstate";
	public static final String SDATE = "sdate";

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

	public void save(Sell transientInstance) {
		log.debug("saving Sell instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sell persistentInstance) {
		log.debug("deleting Sell instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sell findById(java.lang.String id) {
		log.debug("getting Sell instance with id: " + id);
		try {
			Sell instance = (Sell) getCurrentSession().get("com.entity.Sell",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sell instance) {
		log.debug("finding Sell instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.entity.Sell")
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
		log.debug("finding Sell instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sell as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySstate(Object sstate) {
		return findByProperty(SSTATE, sstate);
	}

	public List findBySdate(Object sdate) {
		return findByProperty(SDATE, sdate);
	}

	public List findAll() {
		log.debug("finding all Sell instances");
		try {
			String queryString = "from Sell";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sell merge(Sell detachedInstance) {
		log.debug("merging Sell instance");
		try {
			Sell result = (Sell) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sell instance) {
		log.debug("attaching dirty Sell instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sell instance) {
		log.debug("attaching clean Sell instance");
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
			String hql = "select count(sell.id) as count from Sell sell";
		       Query query = getCurrentSession().createQuery(hql);
		       count = ((Number) query.iterate().next())
		         .intValue();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return count;
	}

	public static SellDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SellDAO) ctx.getBean("SellDAO");
	}
}
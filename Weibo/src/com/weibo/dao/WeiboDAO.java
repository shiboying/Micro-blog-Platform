package com.weibo.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.weibo.domain.Weibo;

/**
 * A data access object (DAO) providing persistence and search support for Weibo
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.weibo.domain.Weibo
 * @author MyEclipse Persistence Tools
 */

public class WeiboDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(WeiboDAO.class);
	// property constants
	public static final String CONTENT = "content";
	public static final String REFERCOUNTS = "refercounts";
	public static final String CMTTCONTS = "cmttconts";
	public static final String REFID = "refid";

	protected void initDao() {
		// do nothing
	}

	public void save(Weibo transientInstance) {
		log.debug("saving Weibo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Weibo persistentInstance) {
		log.debug("deleting Weibo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Weibo findById(java.lang.Integer id) {
		log.debug("getting Weibo instance with id: " + id);
		try {
			Weibo instance = (Weibo) getHibernateTemplate().get(
					"com.weibo.domain.Weibo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Weibo instance) {
		log.debug("finding Weibo instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	
	
	public List findByAuthorid(int userid){
		try{
			String queryString = "from Weibo as w where w.user.userid="+userid;
			return getHibernateTemplate().getSessionFactory().openSession().createQuery(queryString).list();
		}catch (RuntimeException re) {
			log.error("find by Authorid failed", re);
			throw re;
		}
	}

	
	
	
		
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Weibo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Weibo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByRefercounts(Object refercounts) {
		return findByProperty(REFERCOUNTS, refercounts);
	}

	public List findByCmttconts(Object cmttconts) {
		return findByProperty(CMTTCONTS, cmttconts);
	}

	public List findByRefid(Object refid) {
		return findByProperty(REFID, refid);
	}

	public List findAll() {
		log.debug("finding all Weibo instances");
		try {
			String queryString = "from Weibo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Weibo merge(Weibo detachedInstance) {
		log.debug("merging Weibo instance");
		try {
			Weibo result = (Weibo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Weibo instance) {
		log.debug("attaching dirty Weibo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Weibo instance) {
		log.debug("attaching clean Weibo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static WeiboDAO getFromApplicationContext(ApplicationContext ctx) {
		return (WeiboDAO) ctx.getBean("WeiboDAO");
	}
}
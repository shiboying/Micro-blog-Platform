package com.weibo.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.weibo.domain.Fans;

/**
 * A data access object (DAO) providing persistence and search support for Fans
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.weibo.domain.Fans
 * @author MyEclipse Persistence Tools
 */

public class FansDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(FansDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(Fans transientInstance) {
		log.debug("saving Fans instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Fans persistentInstance) {
		log.debug("deleting Fans instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Fans findById(java.lang.Integer id) {
		log.debug("getting Fans instance with id: " + id);
		try {
			Fans instance = (Fans) getHibernateTemplate().get(
					"com.weibo.domain.Fans", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Fans instance) {
		log.debug("finding Fans instance by example");
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

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Fans instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Fans as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFlwid(int flwid){
		try{
			String queryString = "from Fans as f where f.userByFlwid.userid="+flwid;
			return getHibernateTemplate().getSessionFactory().openSession().createQuery(queryString).list();
		}catch (RuntimeException re) {
			log.error("find by Flwid failed", re);
			throw re;
		}
	}
	public List findByFlwedid(int flwid){
		try{
			String queryString = "from Fans as f where f.userByFlwedid.userid="+flwid;
			return getHibernateTemplate().getSessionFactory().openSession().createQuery(queryString).list();
		}catch (RuntimeException re) {
			log.error("find by Flwid failed", re);
			throw re;
		}
	}
	public List findAll() {
		log.debug("finding all Fans instances");
		try {
			String queryString = "from Fans";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Fans merge(Fans detachedInstance) {
		log.debug("merging Fans instance");
		try {
			Fans result = (Fans) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Fans instance) {
		log.debug("attaching dirty Fans instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Fans instance) {
		log.debug("attaching clean Fans instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static FansDAO getFromApplicationContext(ApplicationContext ctx) {
		return (FansDAO) ctx.getBean("FansDAO");
	}
}
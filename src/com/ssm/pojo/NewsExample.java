package com.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

public class NewsExample {
	protected String orderByClause;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public NewsExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	public boolean isDistinct() {
		return distinct;
	}

	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(Integer value) {
			addCriterion("id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(Integer value) {
			addCriterion("id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(Integer value) {
			addCriterion("id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(Integer value) {
			addCriterion("id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(Integer value) {
			addCriterion("id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<Integer> values) {
			addCriterion("id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<Integer> values) {
			addCriterion("id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(Integer value1, Integer value2) {
			addCriterion("id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(Integer value1, Integer value2) {
			addCriterion("id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idIsNull() {
			addCriterion("newstype_id is null");
			return (Criteria) this;
		}

		public Criteria andNewstype_idIsNotNull() {
			addCriterion("newstype_id is not null");
			return (Criteria) this;
		}

		public Criteria andNewstype_idEqualTo(Integer value) {
			addCriterion("newstype_id =", value, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idNotEqualTo(Integer value) {
			addCriterion("newstype_id <>", value, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idGreaterThan(Integer value) {
			addCriterion("newstype_id >", value, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idGreaterThanOrEqualTo(Integer value) {
			addCriterion("newstype_id >=", value, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idLessThan(Integer value) {
			addCriterion("newstype_id <", value, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idLessThanOrEqualTo(Integer value) {
			addCriterion("newstype_id <=", value, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idIn(List<Integer> values) {
			addCriterion("newstype_id in", values, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idNotIn(List<Integer> values) {
			addCriterion("newstype_id not in", values, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idBetween(Integer value1, Integer value2) {
			addCriterion("newstype_id between", value1, value2, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andNewstype_idNotBetween(Integer value1, Integer value2) {
			addCriterion("newstype_id not between", value1, value2, "newstype_id");
			return (Criteria) this;
		}

		public Criteria andTitleIsNull() {
			addCriterion("title is null");
			return (Criteria) this;
		}

		public Criteria andTitleIsNotNull() {
			addCriterion("title is not null");
			return (Criteria) this;
		}

		public Criteria andTitleEqualTo(String value) {
			addCriterion("title =", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotEqualTo(String value) {
			addCriterion("title <>", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleGreaterThan(String value) {
			addCriterion("title >", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleGreaterThanOrEqualTo(String value) {
			addCriterion("title >=", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleLessThan(String value) {
			addCriterion("title <", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleLessThanOrEqualTo(String value) {
			addCriterion("title <=", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleLike(String value) {
			addCriterion("title like", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotLike(String value) {
			addCriterion("title not like", value, "title");
			return (Criteria) this;
		}

		public Criteria andTitleIn(List<String> values) {
			addCriterion("title in", values, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotIn(List<String> values) {
			addCriterion("title not in", values, "title");
			return (Criteria) this;
		}

		public Criteria andTitleBetween(String value1, String value2) {
			addCriterion("title between", value1, value2, "title");
			return (Criteria) this;
		}

		public Criteria andTitleNotBetween(String value1, String value2) {
			addCriterion("title not between", value1, value2, "title");
			return (Criteria) this;
		}

		public Criteria andTpic_urlIsNull() {
			addCriterion("tpic_url is null");
			return (Criteria) this;
		}

		public Criteria andTpic_urlIsNotNull() {
			addCriterion("tpic_url is not null");
			return (Criteria) this;
		}

		public Criteria andTpic_urlEqualTo(String value) {
			addCriterion("tpic_url =", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlNotEqualTo(String value) {
			addCriterion("tpic_url <>", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlGreaterThan(String value) {
			addCriterion("tpic_url >", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlGreaterThanOrEqualTo(String value) {
			addCriterion("tpic_url >=", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlLessThan(String value) {
			addCriterion("tpic_url <", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlLessThanOrEqualTo(String value) {
			addCriterion("tpic_url <=", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlLike(String value) {
			addCriterion("tpic_url like", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlNotLike(String value) {
			addCriterion("tpic_url not like", value, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlIn(List<String> values) {
			addCriterion("tpic_url in", values, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlNotIn(List<String> values) {
			addCriterion("tpic_url not in", values, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlBetween(String value1, String value2) {
			addCriterion("tpic_url between", value1, value2, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andTpic_urlNotBetween(String value1, String value2) {
			addCriterion("tpic_url not between", value1, value2, "tpic_url");
			return (Criteria) this;
		}

		public Criteria andNewsabstractIsNull() {
			addCriterion("newsabstract is null");
			return (Criteria) this;
		}

		public Criteria andNewsabstractIsNotNull() {
			addCriterion("newsabstract is not null");
			return (Criteria) this;
		}

		public Criteria andNewsabstractEqualTo(String value) {
			addCriterion("newsabstract =", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractNotEqualTo(String value) {
			addCriterion("newsabstract <>", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractGreaterThan(String value) {
			addCriterion("newsabstract >", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractGreaterThanOrEqualTo(String value) {
			addCriterion("newsabstract >=", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractLessThan(String value) {
			addCriterion("newsabstract <", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractLessThanOrEqualTo(String value) {
			addCriterion("newsabstract <=", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractLike(String value) {
			addCriterion("newsabstract like", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractNotLike(String value) {
			addCriterion("newsabstract not like", value, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractIn(List<String> values) {
			addCriterion("newsabstract in", values, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractNotIn(List<String> values) {
			addCriterion("newsabstract not in", values, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractBetween(String value1, String value2) {
			addCriterion("newsabstract between", value1, value2, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andNewsabstractNotBetween(String value1, String value2) {
			addCriterion("newsabstract not between", value1, value2, "newsabstract");
			return (Criteria) this;
		}

		public Criteria andUser_idIsNull() {
			addCriterion("user_id is null");
			return (Criteria) this;
		}

		public Criteria andUser_idIsNotNull() {
			addCriterion("user_id is not null");
			return (Criteria) this;
		}

		public Criteria andUser_idEqualTo(Long value) {
			addCriterion("user_id =", value, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idNotEqualTo(Long value) {
			addCriterion("user_id <>", value, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idGreaterThan(Long value) {
			addCriterion("user_id >", value, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idGreaterThanOrEqualTo(Long value) {
			addCriterion("user_id >=", value, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idLessThan(Long value) {
			addCriterion("user_id <", value, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idLessThanOrEqualTo(Long value) {
			addCriterion("user_id <=", value, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idIn(List<Long> values) {
			addCriterion("user_id in", values, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idNotIn(List<Long> values) {
			addCriterion("user_id not in", values, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idBetween(Long value1, Long value2) {
			addCriterion("user_id between", value1, value2, "user_id");
			return (Criteria) this;
		}

		public Criteria andUser_idNotBetween(Long value1, Long value2) {
			addCriterion("user_id not between", value1, value2, "user_id");
			return (Criteria) this;
		}

		public Criteria andReadingIsNull() {
			addCriterion("reading is null");
			return (Criteria) this;
		}

		public Criteria andReadingIsNotNull() {
			addCriterion("reading is not null");
			return (Criteria) this;
		}

		public Criteria andReadingEqualTo(Integer value) {
			addCriterion("reading =", value, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingNotEqualTo(Integer value) {
			addCriterion("reading <>", value, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingGreaterThan(Integer value) {
			addCriterion("reading >", value, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingGreaterThanOrEqualTo(Integer value) {
			addCriterion("reading >=", value, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingLessThan(Integer value) {
			addCriterion("reading <", value, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingLessThanOrEqualTo(Integer value) {
			addCriterion("reading <=", value, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingIn(List<Integer> values) {
			addCriterion("reading in", values, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingNotIn(List<Integer> values) {
			addCriterion("reading not in", values, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingBetween(Integer value1, Integer value2) {
			addCriterion("reading between", value1, value2, "reading");
			return (Criteria) this;
		}

		public Criteria andReadingNotBetween(Integer value1, Integer value2) {
			addCriterion("reading not between", value1, value2, "reading");
			return (Criteria) this;
		}

		public Criteria andStatusIsNull() {
			addCriterion("status is null");
			return (Criteria) this;
		}

		public Criteria andStatusIsNotNull() {
			addCriterion("status is not null");
			return (Criteria) this;
		}

		public Criteria andStatusEqualTo(Integer value) {
			addCriterion("status =", value, "status");
			return (Criteria) this;
		}

		public Criteria andStatusNotEqualTo(Integer value) {
			addCriterion("status <>", value, "status");
			return (Criteria) this;
		}

		public Criteria andStatusGreaterThan(Integer value) {
			addCriterion("status >", value, "status");
			return (Criteria) this;
		}

		public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
			addCriterion("status >=", value, "status");
			return (Criteria) this;
		}

		public Criteria andStatusLessThan(Integer value) {
			addCriterion("status <", value, "status");
			return (Criteria) this;
		}

		public Criteria andStatusLessThanOrEqualTo(Integer value) {
			addCriterion("status <=", value, "status");
			return (Criteria) this;
		}

		public Criteria andStatusIn(List<Integer> values) {
			addCriterion("status in", values, "status");
			return (Criteria) this;
		}

		public Criteria andStatusNotIn(List<Integer> values) {
			addCriterion("status not in", values, "status");
			return (Criteria) this;
		}

		public Criteria andStatusBetween(Integer value1, Integer value2) {
			addCriterion("status between", value1, value2, "status");
			return (Criteria) this;
		}

		public Criteria andStatusNotBetween(Integer value1, Integer value2) {
			addCriterion("status not between", value1, value2, "status");
			return (Criteria) this;
		}

		public Criteria andCreatetimeIsNull() {
			addCriterion("createtime is null");
			return (Criteria) this;
		}

		public Criteria andCreatetimeIsNotNull() {
			addCriterion("createtime is not null");
			return (Criteria) this;
		}

		public Criteria andCreatetimeEqualTo(String value) {
			addCriterion("createtime =", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeNotEqualTo(String value) {
			addCriterion("createtime <>", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeGreaterThan(String value) {
			addCriterion("createtime >", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeGreaterThanOrEqualTo(String value) {
			addCriterion("createtime >=", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeLessThan(String value) {
			addCriterion("createtime <", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeLessThanOrEqualTo(String value) {
			addCriterion("createtime <=", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeLike(String value) {
			addCriterion("createtime like", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeNotLike(String value) {
			addCriterion("createtime not like", value, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeIn(List<String> values) {
			addCriterion("createtime in", values, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeNotIn(List<String> values) {
			addCriterion("createtime not in", values, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeBetween(String value1, String value2) {
			addCriterion("createtime between", value1, value2, "createtime");
			return (Criteria) this;
		}

		public Criteria andCreatetimeNotBetween(String value1, String value2) {
			addCriterion("createtime not between", value1, value2, "createtime");
			return (Criteria) this;
		}

		public Criteria andCpic_urlIsNull() {
			addCriterion("cpic_url is null");
			return (Criteria) this;
		}

		public Criteria andCpic_urlIsNotNull() {
			addCriterion("cpic_url is not null");
			return (Criteria) this;
		}

		public Criteria andCpic_urlEqualTo(String value) {
			addCriterion("cpic_url =", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlNotEqualTo(String value) {
			addCriterion("cpic_url <>", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlGreaterThan(String value) {
			addCriterion("cpic_url >", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlGreaterThanOrEqualTo(String value) {
			addCriterion("cpic_url >=", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlLessThan(String value) {
			addCriterion("cpic_url <", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlLessThanOrEqualTo(String value) {
			addCriterion("cpic_url <=", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlLike(String value) {
			addCriterion("cpic_url like", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlNotLike(String value) {
			addCriterion("cpic_url not like", value, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlIn(List<String> values) {
			addCriterion("cpic_url in", values, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlNotIn(List<String> values) {
			addCriterion("cpic_url not in", values, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlBetween(String value1, String value2) {
			addCriterion("cpic_url between", value1, value2, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andCpic_urlNotBetween(String value1, String value2) {
			addCriterion("cpic_url not between", value1, value2, "cpic_url");
			return (Criteria) this;
		}

		public Criteria andStickIsNull() {
			addCriterion("stick is null");
			return (Criteria) this;
		}

		public Criteria andStickIsNotNull() {
			addCriterion("stick is not null");
			return (Criteria) this;
		}

		public Criteria andStickEqualTo(Integer value) {
			addCriterion("stick =", value, "stick");
			return (Criteria) this;
		}

		public Criteria andStickNotEqualTo(Integer value) {
			addCriterion("stick <>", value, "stick");
			return (Criteria) this;
		}

		public Criteria andStickGreaterThan(Integer value) {
			addCriterion("stick >", value, "stick");
			return (Criteria) this;
		}

		public Criteria andStickGreaterThanOrEqualTo(Integer value) {
			addCriterion("stick >=", value, "stick");
			return (Criteria) this;
		}

		public Criteria andStickLessThan(Integer value) {
			addCriterion("stick <", value, "stick");
			return (Criteria) this;
		}

		public Criteria andStickLessThanOrEqualTo(Integer value) {
			addCriterion("stick <=", value, "stick");
			return (Criteria) this;
		}

		public Criteria andStickIn(List<Integer> values) {
			addCriterion("stick in", values, "stick");
			return (Criteria) this;
		}

		public Criteria andStickNotIn(List<Integer> values) {
			addCriterion("stick not in", values, "stick");
			return (Criteria) this;
		}

		public Criteria andStickBetween(Integer value1, Integer value2) {
			addCriterion("stick between", value1, value2, "stick");
			return (Criteria) this;
		}

		public Criteria andStickNotBetween(Integer value1, Integer value2) {
			addCriterion("stick not between", value1, value2, "stick");
			return (Criteria) this;
		}

		public Criteria andAuditIsNull() {
			addCriterion("audit is null");
			return (Criteria) this;
		}

		public Criteria andAuditIsNotNull() {
			addCriterion("audit is not null");
			return (Criteria) this;
		}

		public Criteria andAuditEqualTo(Integer value) {
			addCriterion("audit =", value, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditNotEqualTo(Integer value) {
			addCriterion("audit <>", value, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditGreaterThan(Integer value) {
			addCriterion("audit >", value, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditGreaterThanOrEqualTo(Integer value) {
			addCriterion("audit >=", value, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditLessThan(Integer value) {
			addCriterion("audit <", value, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditLessThanOrEqualTo(Integer value) {
			addCriterion("audit <=", value, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditIn(List<Integer> values) {
			addCriterion("audit in", values, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditNotIn(List<Integer> values) {
			addCriterion("audit not in", values, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditBetween(Integer value1, Integer value2) {
			addCriterion("audit between", value1, value2, "audit");
			return (Criteria) this;
		}

		public Criteria andAuditNotBetween(Integer value1, Integer value2) {
			addCriterion("audit not between", value1, value2, "audit");
			return (Criteria) this;
		}
	}

	public static class Criteria extends GeneratedCriteria {

		protected Criteria() {
			super();
		}
	}

	public static class Criterion {
		private String condition;

		private Object value;

		private Object secondValue;

		private boolean noValue;

		private boolean singleValue;

		private boolean betweenValue;

		private boolean listValue;

		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}
}
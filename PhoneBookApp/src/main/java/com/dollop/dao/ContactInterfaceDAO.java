package com.dollop.dao;

import java.util.List;

import com.dollop.model.Contact;

public interface ContactInterfaceDAO {
	public boolean createContact(Contact contact);
	public List<Contact> viewAllContact(Integer integer);
	public Contact viewContactById(Integer id);
	public boolean deleteContact(Integer id);
	public boolean updateContact(Contact contact);
}

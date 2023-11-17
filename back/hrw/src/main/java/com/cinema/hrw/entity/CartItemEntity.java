package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table (name = "CartItem")
public class CartItemEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idx;
	
	@Column
	private String userId;
	
	@Column
	private Long productId;
	
	@Column
	private String productName;
	
	@Column
	private double productPrice;
	
	@Column
	private int productCount;
	
	@Column
	private String productImageUrl;
	

}
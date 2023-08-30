// product_details.spec.js

describe('Product Details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('should navigate to product detail page by clicking on a product', () => {
    cy.get('.products article a').first().click()
  
    cy.url().should('include', '/products/')
  })
  
})

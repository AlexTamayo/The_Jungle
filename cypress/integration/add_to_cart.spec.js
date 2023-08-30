// add_to_cart.spec.js

describe('Add to Cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')

  })

  it('should add a product to cart and cart count should increase by one', () => {
    cy.get('.nav-item.end-0 .nav-link').invoke('text').then((text) => {
      const initialCartCount = parseInt(text.match(/\((\d+)\)/)[1]);
  
      cy.contains('Add').first().click({ force: true });
  
      cy.get('.nav-item.end-0 .nav-link').invoke('text').should((newText) => {
        const newCartCount = parseInt(newText.match(/\((\d+)\)/)[1]);
        expect(newCartCount).to.eq(initialCartCount + 1);
      });
    });
  })
  
  
  
})

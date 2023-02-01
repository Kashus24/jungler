describe('Home', () => {
 

  it('displays the home page', () => {
    cy.visit('/')
  })

  it("checks if there is products on the page", () => {
    cy.get(".products article").should("be.visible")
  })

  it("There is 4 products on the page", () => {
    cy.get(".products article").should("have.length", 4)
  })

  it("adds item to cart when clicking on add button", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true});
    cy.contains("My Cart").should('contain', 'My Cart (1)');
  });
});
   
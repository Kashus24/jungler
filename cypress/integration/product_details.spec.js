describe('Product', () => {
 

  it('displays the home page', () => {
    cy.visit('/')
  })

  it("checks if there is products on the page", () => {
    cy.get(".products article").should("be.visible")
  })

  it("renders products after clicking on products", () => {
    cy.get('.me-auto > .nav-item > .nav-link').click()
    
  })
})
   
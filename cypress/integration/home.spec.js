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
})
   
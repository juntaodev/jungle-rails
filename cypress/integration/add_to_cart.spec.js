describe('visit products page', () => {
  it('visit base url', () => {
    cy.visit('http://localhost:3000/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("should navigate to products/id page", () => {
    cy.contains("Scented Blade").click();
  });

  it("Users can navigate from the home page to a product page", () => {
    cy.visit('/');
    cy.get(".products article")
      .first()
      .click();
    cy.get(".product-detail").should("be.visible");
  });

  it("should add a product to cart and cart increases by 1", () => {
    cy.get(".button_to")
      .first()
      .click();
    cy.contains("Add").click()
    cy.get(".nav-link").contains("My Cart (1)");
  });

});
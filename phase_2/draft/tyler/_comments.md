# Phase 2 Comments

## Updated EER Diagram
 
Some changes were made to the diagram to better support some of the points we have discussed in previous meetings.  I've tried to point out a few below.  Compare the Phase 1 diagram with the updated phase 2 diagram to get a sense of the changes that were made.

    1. Several of the relationships where updates to be 1 to N, especially around Reservations, Sales Orders and Service Orders.  See the relationships between tools, clerks, customers and the classes to check for updates
    2. (version a) Biggest change is to the tools area.  We had an incorrect subclassing of DC_CORDLESS to POWER_TOOL.  The 'power-source' attribute is now represented by their own classes, which are disjoint for GAS, A/C, D/C, then a union back to the individual subtypes in POWER_TOOL.  __Take a look and let me know what you think.__
    3. (version b) The tools area is simplified.  No mention of the D/C requirement is mentioned in the diagram and will instead become a business requirement. Rule is not enforced by the schema.

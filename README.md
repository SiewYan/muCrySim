# muCRYsim

muSRSim with CRY generator

## Modification

- manual modification is required to assign path to cosmic data on ```musrSim-upgrade-public/src/musrPrimaryGeneratorAction.cc``` line 781, line 812.

- addition of material is possible at ```musrSim-upgrade-public/src/musrDetectorConstruction.cc```,
existing materials:

```
// Add rock and concrete, Y. ZENG 27 Apr 2024                                                                                                                                             
  G4Material* Rock = new G4Material("Rock", density = 2.8 * CLHEP::g/CLHEP::cm3, ncomponents=8);
  Rock->AddElement(O, 0.469 );
  Rock->AddElement(Si, 0.282 );
  Rock->AddElement(Al, 0.082 );
  Rock->AddElement(Fe, 0.056 );
  Rock->AddElement(Ca, 0.036 );
  Rock->AddElement(Na, 0.028 );
  Rock->AddElement(K, 0.026 );
  Rock->AddElement(Mg, 0.021 );

  G4Material *Concrete = new G4Material("Concrete", density = 2.5 * CLHEP::g/CLHEP::cm3, ncomponents=6);
  Concrete->AddElement(O, 0.52);
  Concrete->AddElement(Si, 0.325);
  Concrete->AddElement(Ca, 0.06);
  Concrete->AddElement(Na, 0.015);
  Concrete->AddElement(Fe, 0.04);
  Concrete->AddElement(Al, 0.04);

  G4Material* mud = new G4Material("Mud", density = 1.8 * CLHEP::g/CLHEP::cm3, ncomponents=5);
  mud->AddElement(H, 0.02);
  mud->AddElement(O, 0.50);
  mud->AddElement(Si, 0.28);
  mud->AddElement(Al, 0.10);
  mud->AddElement(Fe, 0.10);
  
```
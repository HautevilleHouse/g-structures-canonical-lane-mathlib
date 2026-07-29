import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure CanonicalFormPackage {R : ReductionSystemPackage} (G : GStructureReduction) where
  dualGroup : Type
  parabolicSubgroup : Type
  leviDecomposition : Prop
  canonicalBruhatOrder : Prop
  canonicalFormDerived : Prop

structure CanonicalFormEvidence {R : ReductionSystemPackage} {G : GStructureReduction} (C : CanonicalFormPackage G) where
  leviDecompositionClosed : C.leviDecomposition
  canonicalBruhatOrderClosed : C.canonicalBruhatOrder
  canonicalFormDerivedClosed : C.canonicalFormDerived

def CanonicalFormClosed {R : ReductionSystemPackage} {G : GStructureReduction} (C : CanonicalFormPackage G) : Prop :=
  C.leviDecomposition ∧ C.canonicalBruhatOrder ∧ C.canonicalFormDerived

theorem canonical_form_closed_from_evidence {R : ReductionSystemPackage} {G : GStructureReduction} (C : CanonicalFormPackage G) (E : CanonicalFormEvidence C) : CanonicalFormClosed C := by
  exact And.intro E.leviDecompositionClosed (And.intro E.canonicalBruhatOrderClosed E.canonicalFormDerivedClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
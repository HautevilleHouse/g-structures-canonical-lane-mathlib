import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure ReductionSystemPackage where
  rootSystem : Type
  weylGroup : Type
  simpleReflections : List (RootSystem → RootSystem)
  dynkinDiagram : Prop
  isCrystallographic : Prop
  isReduced : Prop

structure ReductionSystemEvidence (R : ReductionSystemPackage) where
  rootSystemClosed : Prop
  weylGroupClosed : Prop
  simpleReflectionsClosed : Prop
  dynkinDiagramClosed : R.dynkinDiagram
  crystallographicClosed : R.isCrystallographic
  reducedClosed : R.isReduced

def ReductionSystemClosed (R : ReductionSystemPackage) : Prop :=
  R.dynkinDiagram ∧ R.isCrystallographic ∧ R.isReduced

theorem reduction_system_closed_from_evidence (R : ReductionSystemPackage) (E : ReductionSystemEvidence R) : ReductionSystemClosed R := by
  exact And.intro E.dynkinDiagramClosed (And.intro E.crystallographicClosed E.reducedClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
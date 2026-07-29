import canonicalLaneMathlib.AdmissibleClass

/-!
# G-Structure Package
-/

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure GStructurePackage where
  reductionOfStructureGroup : Prop
  integrabilityConditions : Prop
  torsionFreeCondition : Prop
  holonomyReduction : Prop
  existenceOfCompatibleConnection : Prop
  maximalConsistency : Prop

def GStructureClosed (G : GStructurePackage) : Prop :=
  G.reductionOfStructureGroup ∧ G.integrabilityConditions ∧
  G.torsionFreeCondition ∧ G.holonomyReduction ∧
  G.existenceOfCompatibleConnection ∧ G.maximalConsistency

end GStructuresCanonicalLaneLean
end HautevilleHouse

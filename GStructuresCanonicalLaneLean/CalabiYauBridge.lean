import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GStructuresCanonicalLaneLean.GStructurePackage

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure CalabiYauEvidence where
  complexStructure : Prop
  kahlerMetric : Prop
  ricciFlatness : Prop
  suHolonomy : Prop
  yauTheoremApplied : Prop
  complexStructureClosed : complexStructure
  kahlerMetricClosed : kahlerMetric
  ricciFlatnessClosed : ricciFlatness
  suHolonomyClosed : suHolonomy
  yauTheoremAppliedClosed : yauTheoremApplied

def CalabiYauBridge (G : GStructurePackage) : Prop :=
  G.existenceOfCompatibleConnection ∧ G.holonomyReduction

theorem calabi_yau_bridge_from_evidence (G : GStructurePackage)
    (E : CalabiYauEvidence) : CalabiYauBridge G := by
  exact And.intro E.yauTheoremAppliedClosed E.suHolonomyClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse

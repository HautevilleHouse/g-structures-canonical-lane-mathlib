import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure StructureClassifierPackage {R : ReductionSystemPackage} {G : GStructureReduction} {C : CanonicalFormPackage G} where
  classificationMap : Prop
  irreducibilityCondition : Prop
  classificationComplete : Prop

structure StructureClassifierEvidence {R : ReductionSystemPackage} {G : GStructureReduction} {C : CanonicalFormPackage G} (S : StructureClassifierPackage) where
  classificationMapClosed : S.classificationMap
  irreducibilityConditionClosed : S.irreducibilityCondition
  classificationCompleteClosed : S.classificationComplete

def StructureClassifierClosed {R : ReductionSystemPackage} {G : GStructureReduction} {C : CanonicalFormPackage G} (S : StructureClassifierPackage) : Prop :=
  S.classificationMap ∧ S.irreducibilityCondition ∧ S.classificationComplete

theorem structure_classifier_closed_from_evidence {R : ReductionSystemPackage} {G : GStructureReduction} {C : CanonicalFormPackage G} (S : StructureClassifierPackage) (E : StructureClassifierEvidence S) : StructureClassifierClosed S := by
  exact And.intro E.classificationMapClosed (And.intro E.irreducibilityConditionClosed E.classificationCompleteClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
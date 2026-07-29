import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure ClassificationPackage {G : GStructurePackage}
    (I : IntegrabilityPackage G) where
  integrableModels : Type u
  classificationComplete : Prop
  endpointModel : Prop

structure ClassificationEvidence {G : GStructurePackage}
    {I : IntegrabilityPackage G} (C : ClassificationPackage I) where
  classificationCompleteClosed : C.classificationComplete
  endpointModelClosed : C.endpointModel

def ClassificationClosed {G : GStructurePackage}
    {I : IntegrabilityPackage G} (C : ClassificationPackage I) : Prop :=
  C.classificationComplete ∧ C.endpointModel

theorem classification_closed_from_evidence
    {G : GStructurePackage} {I : IntegrabilityPackage G}
    (C : ClassificationPackage I) (E : ClassificationEvidence C) :
    ClassificationClosed C :=
  And.intro E.classificationCompleteClosed E.endpointModelClosed

end GStructuresCanonicalLaneLean
end HautevilleHouse
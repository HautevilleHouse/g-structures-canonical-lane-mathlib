import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure IntegrabilityPackage {G : GStructurePackage} where
  reductionGroupAction : Prop
  torsionVanishes : Prop
  integrabilityCondition : Prop

structure IntegrabilityEvidence {G : GStructurePackage}
    (I : IntegrabilityPackage G) where
  reductionGroupActionClosed : I.reductionGroupAction
  torsionVanishesClosed : I.torsionVanishes
  integrabilityConditionClosed : I.integrabilityCondition

def IntegrabilityClosed {G : GStructurePackage}
    (I : IntegrabilityPackage G) : Prop :=
  I.reductionGroupAction ∧ I.torsionVanishes ∧ I.integrabilityCondition

theorem integrability_closed_from_evidence
    {G : GStructurePackage} (I : IntegrabilityPackage G)
    (E : IntegrabilityEvidence I) : IntegrabilityClosed I :=
  And.intro E.reductionGroupActionClosed
    (And.intro E.torsionVanishesClosed E.integrabilityConditionClosed)

end GStructuresCanonicalLaneLean
end HautevilleHouse
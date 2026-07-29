import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure AdmissibleClass where
  object : GStructurePackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GStructureClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GStructuresCanonicalLaneLean
end HautevilleHouse
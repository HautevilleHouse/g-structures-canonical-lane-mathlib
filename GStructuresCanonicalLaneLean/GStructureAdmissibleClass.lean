import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure GStructureSpace where
  carrier : Type
  gStructure : Type
  reductionToGStructure : Prop

structure GStructureAdmittedObject where
  space : GStructureSpace
  gClosed : Prop
  torsionFree : Prop
  integrable : Prop
  conclusion : integrable

def GStructureWitnessClosed (O : GStructureAdmittedObject) : Prop :=
  O.integrable

end GStructuresCanonicalLaneLean
end HautevilleHouse
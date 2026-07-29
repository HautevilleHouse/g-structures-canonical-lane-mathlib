import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure GStructureReduction where
  carrier : Type
  isReductive : Prop
  isAlmostSimple : Prop

structure GStructureAdmittedObject where
  reduction : GStructureReduction
  gStructure : Prop
  canonicalForm : Prop
  conclusion : canonicalForm

structure GStructureEndgameState where
  object : GStructureAdmittedObject

def GStructureWitnessClosed (O : GStructureAdmittedObject) : Prop :=
  O.canonicalForm

end GStructuresCanonicalLaneLean
end HautevilleHouse
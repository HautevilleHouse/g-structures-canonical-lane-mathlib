import GStructuresCanonicalLaneLean.GStructureGateLemmas

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

def ConstrainedGStructureClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_g_structure_endgame (A : AdmissibleClass) :
    ConstrainedGStructureClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GStructuresCanonicalLaneLean
end HautevilleHouse
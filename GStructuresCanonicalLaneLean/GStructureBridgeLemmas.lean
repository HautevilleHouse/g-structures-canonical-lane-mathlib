import GStructuresCanonicalLaneLean.GStructureAdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GStructureWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GStructuresCanonicalLaneLean
end HautevilleHouse
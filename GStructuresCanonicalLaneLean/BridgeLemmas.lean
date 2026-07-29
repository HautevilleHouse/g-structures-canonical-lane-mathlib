import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GStructureClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  g_structure_closed_from_evidence A.object (by
    -- The object carries its own evidence; we assume it is admissible
    exact A.object.evidence)

end GStructuresCanonicalLaneLean
end HautevilleHouse
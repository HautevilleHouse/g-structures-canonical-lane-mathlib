import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GStructuresCanonicalLaneLean

structure SatakeDiagramPackage {R : ReductionSystemPackage} {G : GStructureReduction} where
  diagramNodes : Type
  diagramEdges : Prop
  involution : Prop
  paintedNodes : Prop
  satakeClassifies : Prop

structure SatakeDiagramEvidence {R : ReductionSystemPackage} {G : GStructureReduction} (S : SatakeDiagramPackage) where
  diagramEdgesClosed : S.diagramEdges
  involutionClosed : S.involution
  paintedNodesClosed : S.paintedNodes
  satakeClassifiesClosed : S.satakeClassifies

def SatakeDiagramClosed {R : ReductionSystemPackage} {G : GStructureReduction} (S : SatakeDiagramPackage) : Prop :=
  S.diagramEdges ∧ S.involution ∧ S.paintedNodes ∧ S.satakeClassifies

theorem satake_diagram_closed_from_evidence {R : ReductionSystemPackage} {G : GStructureReduction} (S : SatakeDiagramPackage) (E : SatakeDiagramEvidence S) : SatakeDiagramClosed S := by
  exact And.intro E.diagramEdgesClosed (And.intro E.involutionClosed (And.intro E.paintedNodesClosed E.satakeClassifiesClosed))

end GStructuresCanonicalLaneLean
end HautevilleHouse
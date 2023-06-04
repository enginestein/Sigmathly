#include <algorithm>
#include <vector>
#include <iterator> // Added include directive for <iterator>

namespace Sigmath
{
    class Sets
    {
    public:
        template<typename T>
        static std::vector<T> Union(const std::vector<T>& set1, const std::vector<T>& set2)
        {
            std::vector<T> unionSet(set1);
            unionSet.insert(unionSet.end(), set2.begin(), set2.end());
            std::sort(unionSet.begin(), unionSet.end());
            unionSet.erase(std::unique(unionSet.begin(), unionSet.end()), unionSet.end());
            return unionSet;
        }

        template<typename T>
        static std::vector<T> Intersection(const std::vector<T>& set1, const std::vector<T>& set2)
        {
            std::vector<T> intersectionSet;
            std::set_intersection(set1.begin(), set1.end(), set2.begin(), set2.end(), std::back_inserter(intersectionSet));
            return intersectionSet;
        }

        template<typename T>
        static std::vector<T> Difference(const std::vector<T>& set1, const std::vector<T>& set2)
        {
            std::vector<T> differenceSet;
            std::set_difference(set1.begin(), set1.end(), set2.begin(), set2.end(), std::back_inserter(differenceSet));
            return differenceSet;
        }

        template<typename T>
        static std::vector<T> SymmetricDifference(const std::vector<T>& set1, const std::vector<T>& set2)
        {
            std::vector<T> symmetricDifferenceSet;
            std::set_symmetric_difference(set1.begin(), set1.end(), set2.begin(), set2.end(), std::back_inserter(symmetricDifferenceSet));
            return symmetricDifferenceSet;
        }

        template<typename T>
        static bool IsSubset(const std::vector<T>& subset, const std::vector<T>& set)
        {
            return std::includes(set.begin(), set.end(), subset.begin(), subset.end());
        }

        template<typename T>
        static bool IsSuperset(const std::vector<T>& superset, const std::vector<T>& set)
        {
            return std::includes(superset.begin(), superset.end(), set.begin(), set.end());
        }
    };
}

#ifndef SETS_IMPL_H
#define SETS_IMPL_H

#include <algorithm>
#include <vector>

namespace Sigmath {
    template<typename T>
    std::vector<T> Sets::Union(const std::vector<T>& set1, const std::vector<T>& set2) {
        std::vector<T> unionSet(set1);
        unionSet.insert(unionSet.end(), set2.begin(), set2.end());
        std::sort(unionSet.begin(), unionSet.end());
        unionSet.erase(std::unique(unionSet.begin(), unionSet.end()), unionSet.end());
        return unionSet;
    }

    template<typename T>
    std::vector<T> Sets::Intersection(const std::vector<T>& set1, const std::vector<T>& set2) {
        std::vector<T> intersectionSet;
        std::set_intersection(set1.begin(), set1.end(), set2.begin(), set2.end(), std::back_inserter(intersectionSet));
        return intersectionSet;
    }

    template<typename T>
    std::vector<T> Sets::Difference(const std::vector<T>& set1, const std::vector<T>& set2) {
        std::vector<T> differenceSet;
        std::set_difference(set1.begin(), set1.end(), set2.begin(), set2.end(), std::back_inserter(differenceSet));
        return differenceSet;
    }

    template<typename T>
    std::vector<T> Sets::SymmetricDifference(const std::vector<T>& set1, const std::vector<T>& set2) {
        std::vector<T> symmetricDifferenceSet;
        std::set_symmetric_difference(set1.begin(), set1.end(), set2.begin(), set2.end(), std::back_inserter(symmetricDifferenceSet));
        return symmetricDifferenceSet;
    }

    template<typename T>
    bool Sets::IsSubset(const std::vector<T>& subset, const std::vector<T>& set) {
        return std::includes(set.begin(), set.end(), subset.begin(), subset.end());
    }

    template<typename T>
    bool Sets::IsSuperset(const std::vector<T>& superset, const std::vector<T>& set) {
        return std::includes(superset.begin(), superset.end(), set.begin(), set.end());
    }
}

#endif // SETS_IMPL_H

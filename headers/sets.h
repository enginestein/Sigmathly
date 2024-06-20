#ifndef SETS_H
#define SETS_H

#include <algorithm>
#include <vector>

namespace Sigmath {
    class Sets {
    public:
        template<typename T>
        static std::vector<T> Union(const std::vector<T>& set1, const std::vector<T>& set2);

        template<typename T>
        static std::vector<T> Intersection(const std::vector<T>& set1, const std::vector<T>& set2);

        template<typename T>
        static std::vector<T> Difference(const std::vector<T>& set1, const std::vector<T>& set2);

        template<typename T>
        static std::vector<T> SymmetricDifference(const std::vector<T>& set1, const std::vector<T>& set2);

        template<typename T>
        static bool IsSubset(const std::vector<T>& subset, const std::vector<T>& set);

        template<typename T>
        static bool IsSuperset(const std::vector<T>& superset, const std::vector<T>& set);
    };
}


#endif // SETS_H

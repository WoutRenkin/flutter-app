//
//  TrackingPluginModule.hpp
//  WikitudeUniversalSDK
//
//  Created by Andreas Schacherbauer on 17.03.18.
//  Copyright © 2018 Wikitude. All rights reserved.
//

#ifndef TrackingPluginModule_hpp
#define TrackingPluginModule_hpp

#ifdef __cplusplus

#include <string>

#include "PluginModule.hpp"
#include "CompilerAttributes.hpp"


namespace wikitude {
    namespace universal_sdk {
        namespace impl {
            class BaseTracker;
        }
        using impl::BaseTracker;
    }
}

namespace wikitude { namespace sdk {

    namespace impl {


        class WT_EXPORT_API TrackingPluginModule : public PluginModule {
        public:
            virtual ~TrackingPluginModule() = default;

            virtual std::string getIdentifier() const = 0;

            virtual bool canAddActiveTracker() const;
            virtual void setActiveTracker(universal_sdk::BaseTracker& /* tracker_ */) {}
            virtual void resetActiveTracker(universal_sdk::BaseTracker& /* tracker_ */) {};
            virtual void addTracker(universal_sdk::BaseTracker& tracker_) = 0;
            virtual void removeTracker(universal_sdk::BaseTracker& tracker_) = 0;
        };
    }
    using impl::TrackingPluginModule;
}}

#endif /* __cplusplus */

#endif /* TrackingPluginModule_hpp */

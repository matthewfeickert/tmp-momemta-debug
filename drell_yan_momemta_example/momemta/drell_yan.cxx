// Based on https://github.com/MoMEMta/MoMEMta/blob/v1.0.1/examples/WW_fullyleptonic.cc
#include <momemta/ConfigurationReader.h>
#include <momemta/MoMEMta.h>
#include <momemta/Unused.h>

#include <TH1D.h>

#include <chrono>

using namespace std::chrono;
using namespace momemta;

int main(int argc, char** argv) {

    UNUSED(argc);
    UNUSED(argv);

    logging::set_level(logging::level::debug);


    // Run from example directory above build
    // Need to make this configurable
    ConfigurationReader configuration("momemta/drell_yan.lua");

    MoMEMta weight(configuration.freeze());

    // Electron
    Particle electron { "electron", LorentzVector(16.171895980835, -13.7919054031372, -3.42997527122497, 21.5293197631836), -11 };
    // Muon
    Particle muon { "muon", LorentzVector(-18.9018573760986, 10.0896110534668, -0.602926552295686, 21.4346446990967), +13 };

    auto start_time = system_clock::now();
    std::vector<std::pair<double, double>> weights = weight.computeWeights({electron, muon});
    auto end_time = system_clock::now();

    LOG(debug) << "Result:";
    for (const auto& r: weights) {
        LOG(debug) << r.first << " +- " << r.second;
    }

    LOG(info) << "Weight computed in " << std::chrono::duration_cast<milliseconds>(end_time - start_time).count() << "ms";

    return 0;
}

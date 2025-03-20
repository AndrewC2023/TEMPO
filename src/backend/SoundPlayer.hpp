/*
 * Author: Andrew Campbell
 * Date: 03-19-2025
 */

#ifndef SOUNDPLAYER_H
#define SOUNDPLAYER_H

// STL
#include <thread>
#include <vector>
#include <string>

namespace TEMPO::Sound
{
    class SoundPlayer
    {
    public:
        SoundPlayer();
        ~SoundPlayer();
        void playSound(std::string path); // needs go be fed a file path I think
        void stopAllSounds();
    private:
        // threads on which each sound will play
        std::vector<std::thread> playThreads;

    };
}

#endif // SOUNDPLAYER_H
// src/components/VideoPlayer.tsx
import React from 'react';

const VideoPlayer: React.FC = () => {
  return (
    <div>
      <video width="100%" height="auto" controls>
        <source src="/video-desktop1.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
    </div>
  );
};

export default VideoPlayer;

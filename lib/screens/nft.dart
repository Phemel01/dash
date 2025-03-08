import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isUploading = false;
  int uploadProgress = 0;
  String? _videoPath;
  VideoPlayerController? _videoPlayerController;
  bool uploadComplete = false;
   final List<String> videoIds = [
    'NZO76i8MWWc', // Video ID 1
    'dytOXdEYxt0', // Video ID 2
    'bUlxjCmb40I', // Video ID 3 (Add more as needed)
  ];
 final List<String> descriptions = [
  'Rear-end collision at a red light. No injuries, minor damage to the rear bumper.',
  'Side-impact crash at an intersection. The vehicle ran a stop sign, causing damage to the driver\'s side.',
  'Pedestrian accident on a busy intersection. Pedestrian injured, car sustained minor front-end damage.',
];

final List<String> locations = [
  'Main St & 5th Ave, Downtown City',
  'Park Ave & 7th St, Central Park',
  'Broadway & 8th Blvd, Midtown',
];

final List<String> values = [
  '\$120 USD for repairs and towing services',
  '\$150 USD for bodywork and windshield replacement',
  '\$200 USD for medical expenses and vehicle repairs',
];

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> handleUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      setState(() {
        _videoPath = result.files.single.path;
        _videoPlayerController = VideoPlayerController.file(File(_videoPath!))
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController!.play();
          });
      });

      simulateUpload();
    }
  }
  @override
Widget buildAccidentCard(BuildContext context, int index) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoIds[index], // Dynamically set video ID
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accident #A-${index + 1}',  // Dynamically update accident number
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Recorded on May 15, 2023',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            // Youtube Player
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                ),
                builder: (context, player) {
                  return GestureDetector(
                    onTap: () {
                      // Trigger the video to play when the container is tapped
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    },
                    child: player,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Dynamically display value
            Text('Value: ${values[index]}'),
            // Dynamically display location
            Text('Location: ${locations[index]}'),
            SizedBox(height: 16),
            // Display description for each video
            Text(
              descriptions[index], // Dynamically display the description
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Chip(
                  label: Text('30% Off Towing'),
                  backgroundColor: Colors.blue[50],
                ),
                SizedBox(width: 8),
                Chip(
                  label: Text('15% Off Repairs'),
                  backgroundColor: Colors.blue[50],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                // View Details Button
                OutlinedButton(
                  onPressed: () {
                    _showDetailsDialog(context, index);
                  },
                  child: Text('View Details'),
                ),
                SizedBox(width: 8),
                // Trade NFT Button
                ElevatedButton(
                  onPressed: () {
                    _showTradeNFTDialog(context, index);
                  },
                  child: Text('Trade NFT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
void _showTradeNFTDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Trade NFT for Accident #A-${index + 1}'),
          content: Text('You can now trade the NFT associated with this accident.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                // Implement the trading logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
void _showDetailsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Accident #A-${index + 1} Details'),
          content: Text('Details of the accident and other information go here.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  
  void simulateUpload() {
    setState(() {
      isUploading = true;
      uploadProgress = 0;
      uploadComplete = false;
    });

    // Simulate upload progress
    const interval = Duration(milliseconds: 300);
    Future.doWhile(() async {
      await Future.delayed(interval);
      bool continueUploading = true;
      setState(() {
        if (uploadProgress >= 100) {
          isUploading = false;
          uploadComplete = true;
          continueUploading = false;
        } else {
          uploadProgress += 5;
          continueUploading = true;
        }
      });
      return continueUploading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(Icons.circle, color: Colors.white, size: 24),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'SafeDash',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.phone, size: 16),
                            SizedBox(width: 4),
                            Text('Emergency'),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                        Stack(
                        children: [
                          IconButton(
                          icon: Icon(Icons.notifications, size: 20, color: Colors.grey[600]),
                          onPressed: () {
                            showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                              title: Text('Notifications'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                ListTile(
                                  leading: Icon(Icons.notification_important, color: Colors.blue),
                                  title: Text('Notification 1'),
                                  subtitle: Text("An accident was detected near your location. Upload your dash cam footage to help investigators and earn an NFT reward!"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.notification_important, color: Colors.blue),
                                  title: Text('Notification 2'),
                                  subtitle: Text("You were near an accident! Share your dash cam video to assist in the investigation and receive an exclusive NFT as a reward."),
                                ),
                                ListTile(
                                  leading: Icon(Icons.notification_important, color: Colors.blue),
                                  title: Text('Notification 3'),
                                  subtitle: Text("Safety Alert: An accident was reported near you. Contribute to the investigation by uploading your dash cam video and claim your NFT reward."),
                                ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                ),
                              ],
                              );
                            },
                            );
                          },
                          ),
                          Positioned(
                          top: -1,
                          right: -1,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                            color: Colors.red[500],
                            shape: BoxShape.circle,
                            ),
                            child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            ),
                          ),
                          ),
                        ],
                        ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage('https://www.profilebakery.com/wp-content/uploads/2023/04/LINKEDIN-Profile-Picture-AI-400x400.jpg'),
                            child: Text('JD'),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Main Content
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sidebar
                  Container(
                    width: 240,
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.card_giftcard, color: Colors.blue[600]),
                                  title: Text('My NFTs', style: TextStyle(fontWeight: FontWeight.bold)),
                                  tileColor: Colors.blue[50],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.repeat, color: Colors.grey[600]),
                                  title: Text('Trade Center'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.location_on, color: Colors.grey[600]),
                                  title: Text('Local Traffic'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.warning, color: Colors.grey[600]),
                                  title: Text('Report Accident'),
                                ),
                                Divider(),
                                Text('Account', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                                ListTile(
                                  leading: Icon(Icons.person, color: Colors.grey[600]),
                                  title: Text('Profile'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.settings, color: Colors.grey[600]),
                                  title: Text('Settings'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.logout, color: Colors.grey[600]),
                                  title: Text('Logout'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Card(
                          color: Colors.red[50],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.warning, color: Colors.red[700]),
                                    SizedBox(width: 8),
                                    Text(
                                      'Emergency Services',
                                      style: TextStyle(
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Need immediate assistance? Contact emergency services.',
                                  style: TextStyle(color: Colors.red[700], fontSize: 14),
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.red[600],
                                    minimumSize: Size(double.infinity, 40),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.phone, size: 16),
                                      SizedBox(width: 8),
                                      Text('Call Emergency'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Dashboard
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16),
                          DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                TabBar(
                                  tabs: [
                                    Tab(text: 'My NFTs'),
                                    Tab(text: 'Upload Video'),
                                    Tab(text: 'Local Traffic'),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Container(
                                  height: 600, // Adjust height as needed
                                  child: TabBarView(
                                    children: [
                                      // My NFTs Tab
                                      GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(videoIds.length, (index) {
              return buildAccidentCard(context,index);
            }),
          ),
                                      

                                      // Upload Video Tab
                                     SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(16),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Upload Accident Footage',
                                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        'Upload your dash cam footage to create a new NFT and unlock discounts',
                                                        style: TextStyle(color: Colors.grey[600]),
                                                      ),
                                                      SizedBox(height: 16),
                                                      if (_videoPath != null)
                                                        Column(
                                                          children: [
                                                            _videoPlayerController != null &&
                                                                    _videoPlayerController!.value.isInitialized
                                                                ? AspectRatio(
                                                                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                                                                    child: VideoPlayer(_videoPlayerController!),
                                                                  )
                                                                : Container(),
                                                            SizedBox(height: 8),
                                                            LinearProgressIndicator(
                                                              value: uploadProgress / 100,
                                                              backgroundColor: Colors.grey[200],
                                                              color: Colors.blue[600],
                                                            ),
                                                            SizedBox(height: 8),
                                                            Text(
                                                              uploadProgress < 100
                                                                  ? 'Please don\'t close this window while your video is being uploaded.'
                                                                  : 'Upload complete! Your video is now being processed into an NFT.',
                                                              style: TextStyle(color: Colors.grey[600], fontSize: 14),
                                                            ),
                                                          ],
                                                        )
                                                      else
                                                        Column(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.all(32),
                                                              decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.grey[300]!),
                                                                borderRadius: BorderRadius.circular(8),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Icon(Icons.upload, size: 40, color: Colors.grey[400]),
                                                                  SizedBox(height: 8),
                                                                  Text(
                                                                    'Drag and drop your video file',
                                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                  ),
                                                                  SizedBox(height: 8),
                                                                  Text(
                                                                    'Or click the button below to browse your files',
                                                                    style: TextStyle(color: Colors.grey[600]),
                                                                  ),
                                                                  SizedBox(height: 16),
                                                                  ElevatedButton(
                                                                    onPressed: handleUpload,
                                                                    child: Text('Select Video File'),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 16),
                                                            Container(
                                                              padding: EdgeInsets.all(16),
                                                              decoration: BoxDecoration(
                                                                color: Colors.blue[50],
                                                                borderRadius: BorderRadius.circular(8),
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Video Requirements:',
                                                                    style: TextStyle(
                                                                      color: Colors.blue[800],
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 8),
                                                                  Text(
                                                                    '• Maximum file size: 500MB\n'
                                                                    '• Supported formats: MP4, MOV, AVI\n'
                                                                    '• Minimum resolution: 720p\n'
                                                                    '• Video must clearly show the accident scene\n'
                                                                    '• Include date and time stamp if available',
                                                                    style: TextStyle(color: Colors.blue[700], fontSize: 14),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      // Local Traffic Tab
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Card(
                                              child: Padding(
                                                padding: EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Local Traffic & Accident Map',
                                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(
                                                      'View real-time traffic conditions and recent accidents in your area',
                                                      style: TextStyle(color: Colors.grey[600]),
                                                    ),
                                                    SizedBox(height: 16),
                                                    Container(
                                                      height: 400,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        border: Border.all(color: Colors.grey),
                                                        image: DecorationImage(
                                                          image: NetworkImage("https://www.researchgate.net/profile/Pandurang-Pisal/publication/313797973/figure/fig2/AS:462650434953217@1487315867419/Google-map-image-of-study-area-showing-identified-Black-Spots-In-the-present-study-a.png"),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '',
                                                          style: TextStyle(
                                                            backgroundColor: Colors.white.withOpacity(0.8),
                                                            
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
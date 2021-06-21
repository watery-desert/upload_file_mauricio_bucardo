import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadButton extends StatefulWidget {
  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _uploadButtonScale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _uploadButtonScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.05, curve: Curves.easeInCubic),
      ),
    );

    //   _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, 6)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: deviceWidth,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  // top: 0.0,
                  // bottom: 0.0,
                  child: ScaleTransition(
                    scale: _uploadButtonScale,
                    child: GestureDetector(
                      onTap: () {
                        _animationController.forward(from: 0.0);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: Tween<double>(begin: 100, end: deviceWidth)
                            .animate(CurvedAnimation(
                                parent: _animationController,
                                curve: Interval(0.08, 0.2,
                                    curve: Curves.easeInQuad)))
                            .value,
                        decoration: BoxDecoration(
                          color: Color(0xFFF79C70),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset.zero, end: Offset(0, -1))
                          .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.08, 0.14),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.08, 0.14),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.attach_file_rounded,
                            size: 28,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        Text(
                          'Document.pdf',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SlideTransition(
                  position: Tween<Offset>(end: Offset.zero, begin: Offset(0, 1))
                      .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.16, 0.2),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.16, 0.2),
                      ),
                    ),
                    child: Text(
                      'Uploading...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, 0.9), end: Offset.zero)
                            .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.5,
                          0.6,
                          curve: Curves.easeInCubic,
                        ),
                      ),
                    ),
                    child: Container(
                      // width: 10,
                      width: Tween<double>(begin: 0.0, end: deviceWidth)
                          .animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve:
                                  Interval(0.2, 0.5, curve: Curves.easeInCubic),
                            ),
                          )
                          .value,
                      height: 70,
                      color: Color(0xFF343A56),
                      child: Center(
                        child: FadeTransition(
                          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Interval(0.4, 0.5),
                            ),
                          ),
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                 Visibility(
                  visible: _animationController.value >= 0.6 ? true : false,
                  child: Container(
                      width: double.infinity, height: 70, color: Colors.white),
                ),
                Visibility(
                  visible: _animationController.value >= 0.6 ? true : false,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset.zero, end: Offset(0, 1.0))
                            .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(0.7, 0.8, curve: Curves.easeInQuart),
                      ),
                    ),
                    child: Container(
                      width: deviceWidth,
                      height: 70,
                      color: Color(0xFF343A56),
                      child: Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
               
                SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(0, -1.0), end: Offset.zero)
                          .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.7, 0.8, curve: Curves.easeInQuart),
                    ),
                  ),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.8,
                          1.0,
                          curve: Curves.elasticOut,
                        ),
                      ),
                    ),
                    child: Container(
                      width: deviceWidth,
                      height: 70,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.attach_file_rounded,
                              size: 28,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            'Document.pdf',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          Expanded(child: Container()),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Container(
                                  // margin: const EdgeInsets.all(6.0),
                                  alignment: Alignment.center,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF79C70),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Text(
                                'Upload',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

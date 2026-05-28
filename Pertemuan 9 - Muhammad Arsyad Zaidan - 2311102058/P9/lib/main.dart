import 'package:flutter/material.dart';

void main() {
  runApp(const SecurityCenterApp());
}

class SecurityCenterApp extends StatelessWidget {
  const SecurityCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InfoSec Operational Center',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<String> logsKeamanan = const [
    'Brute Force Detected on SSH Port 22',
    'SQL Injection Threat Blocked by WAF',
    'File Integrity Monitor (Wazuh) Alert',
    'Malware Signature Database Updated',
    'SSL Certificate Verification Success',
  ];

  final List<Map<String, dynamic>> fungsiSecurity = const [
    {
      'title': 'Firewall Node',
      'icon': Icons.local_fire_department,
      'color': Colors.redAccent,
    },
    {'title': 'Wazuh FIM', 'icon': Icons.security, 'color': Colors.teal},
    {
      'title': 'Cloud Cluster',
      'icon': Icons.cloud_done,
      'color': Colors.blueAccent,
    },
    {'title': 'Secure DB', 'icon': Icons.storage, 'color': Colors.amber},
    {
      'title': 'Network Node',
      'icon': Icons.settings_ethernet,
      'color': Colors.deepPurpleAccent,
    },
    {
      'title': 'Audit System',
      'icon': Icons.assignment_late,
      'color': Colors.orangeAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d1117),
      appBar: AppBar(
        title: const Text(
          'SOC Operational - Arsyad Zaidan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff161b22),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subJudulSection('01. Core Node Identity (Container)'),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff1f2937), Color(0xff111827)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueGrey.shade700, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(
                        Icons.terminal,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Muhammad Arsyad Zaidan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'NIM: 2311102058',
                            style: TextStyle(
                              color: Colors.blueGrey.shade300,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Node Status: Active Monitoring',
                            style: TextStyle(
                              color: Colors.green.shade400,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            subJudulSection('02. Infrastructure Matrix (GridView)'),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: fungsiSecurity.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                final elemen = fungsiSecurity[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff161b22),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: elemen['color'].withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(elemen['icon'], size: 32, color: elemen['color']),
                      const SizedBox(height: 8),
                      Text(
                        elemen['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            subJudulSection('03. Operational Severity Check (ListView)'),
            SizedBox(
              height: 190,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  KartuManualSecurity(
                    'Emergency Threat Isolation',
                    Icons.gpp_bad,
                    Colors.red,
                  ),
                  KartuManualSecurity(
                    'Standard System Remediation',
                    Icons.gpp_maybe,
                    Colors.orange,
                  ),
                  KartuManualSecurity(
                    'Routine Perimeter Verification',
                    Icons.gpp_good,
                    Colors.green,
                  ),
                ],
              ),
            ),
            subJudulSection('04. Real-time Threat Logs (ListView.builder)'),
            SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: logsKeamanan.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xff161b22),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Text(
                        '#0${index + 1}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        logsKeamanan[index],
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                    ),
                  );
                },
              ),
            ),
            subJudulSection(
              '05. Network Node Segregation (ListView.separated)',
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: logsKeamanan.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, color: Color(0xff30363d)),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.radio_button_checked,
                      color: Colors.redAccent,
                      size: 14,
                    ),
                    title: Text(
                      'Interception Point: ${logsKeamanan[index]}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    subtitle: const Text(
                      'Gateway Security Perimeter Inspected',
                      style: TextStyle(fontSize: 11),
                    ),
                  );
                },
              ),
            ),
            subJudulSection('06. System Risk Assessment (Stack)'),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff161b22),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.withOpacity(0.2)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -20,
                    right: -20,
                    child: Icon(
                      Icons.shield,
                      size: 160,
                      color: Colors.blueGrey.withOpacity(0.03),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.withOpacity(0.4)),
                      ),
                      child: const Icon(
                        Icons.bug_report,
                        color: Colors.redAccent,
                        size: 32,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SYSTEM RISK LEVEL: CRITICAL',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Mitigation scripts standby on local instance',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget subJudulSection(String judul) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        judul,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class KartuManualSecurity extends StatelessWidget {
  final String label;
  final IconData ikon;
  final Color warnaIkon;

  const KartuManualSecurity(this.label, this.ikon, this.warnaIkon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff161b22),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(ikon, color: warnaIkon),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          'Secured Incident Framework Protocol',
          style: TextStyle(fontSize: 11),
        ),
      ),
    );
  }
}

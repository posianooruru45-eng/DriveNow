import 'package:flutter/material.dart';

import '../data/car_data.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

/// Profile screen ï¿½ shows and edits the simulated user's account details.
///
/// Logging out shows a confirmation dialog but does not clear any session
/// (as documented in the project limitations).
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  bool _notificationsOn = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: currentUser.name);
    _emailController = TextEditingController(text: currentUser.email);
    _phoneController = TextEditingController(text: currentUser.phone);
    _notificationsOn = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      _isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully.'),
        backgroundColor: AppTheme.success,
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Language'),
        content: const Text('Select your preferred language:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Language set to English (Uganda).'),
                ),
              );
            },
            child: const Text('English (Uganda)'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Help & Support'),
        content: const Text(
          'Need help? Contact DriveNow support at support@drivenow.ug '
          'or call +256 700 000 000.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out (simulated).'),
                ),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: _toggleEdit,
              tooltip: 'Edit profile',
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Avatar + name
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xFFEEEEEE),
                          backgroundImage: currentUser.image.isNotEmpty
                              ? AssetImage(currentUser.image)
                              : const AssetImage('assets/images/avatar.png')
                                  as ImageProvider,
                        ),
                        if (_isEditing)
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_isEditing)
                      SizedBox(
                        width: 280,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full name',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    else
                      Text(
                        _nameController.text,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      _emailController.text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textMuted,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              // Account section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ProfileTile(
                      icon: Icons.person_outline,
                      label: 'Full name',
                      value: _nameController.text,
                      editable: _isEditing,
                      controller: _nameController,
                    ),
                    _ProfileTile(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: _emailController.text,
                      editable: _isEditing,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _ProfileTile(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: _phoneController.text,
                      editable: _isEditing,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              const Divider(height: 32),
              // Settings section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _SettingsTile(
                      icon: Icons.language_outlined,
                      label: 'Language',
                      value: 'English (Uganda)',
                      onTap: _showLanguageDialog,
                    ),
                    _SettingsTile(
                      icon: Icons.notifications_outlined,
                      label: 'Notifications',
                      value: _notificationsOn ? 'On' : 'Off',
                      onTap: () {
                        setState(() {
                          _notificationsOn = !_notificationsOn;
                        });
                      },
                    ),
                    _SettingsTile(
                      icon: Icons.help_outline,
                      label: 'Help & support',
                      value: '',
                      onTap: _showHelpDialog,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Save or Edit button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: _isEditing
                      ? PrimaryButton(
                          onPressed: _saveChanges,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.save),
                              SizedBox(width: 8),
                              Text('Save Changes'),
                            ],
                          ),
                        )
                      : OutlinedButton(
                          onPressed: _toggleEdit,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.primary,
                            side: const BorderSide(
                              color: AppTheme.primary,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 8),
                              Text('Edit Profile'),
                            ],
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 24),
              // Logout button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: PrimaryButton(
                    onPressed: _showLogoutDialog,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: AppTheme.error),
                        SizedBox(width: 8),
                        Text('Logout', style: TextStyle(color: AppTheme.error)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Logout shows a confirmation dialog but does not clear any '
                'session (simulated).',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.textMuted,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Editable profile tile.
class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.value,
    this.editable = false,
    this.controller,
    this.keyboardType,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool editable;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    if (editable && controller != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFDEE2E6)),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      );
    }
    return ListTile(
      leading: Icon(icon, color: AppTheme.textMuted),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: AppTheme.textMuted,
        ),
      ),
      subtitle: value.isNotEmpty
          ? Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          : null,
      contentPadding: EdgeInsets.zero,
    );
  }
}

/// Settings tile with working actions.
class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.textMuted),
      title: Text(
        label,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: value.isNotEmpty
          ? Text(
              value,
              style: const TextStyle(fontSize: 12, color: AppTheme.textMuted),
            )
          : null,
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}

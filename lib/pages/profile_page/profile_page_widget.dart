import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/geral/icon_button.dart';
import '/geral/theme.dart';
import '/geral/no_internet.dart';
import '/geral/util.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with ConnectivityMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: colors.get("background", Colors.black),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingFour(
                  color: AppTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UsersRow> profilePageUsersRowList = snapshot.data!;
        final profilePageUsersRow = profilePageUsersRowList.isNotEmpty
            ? profilePageUsersRowList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: colors.get("background", Colors.black),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color(0x4B1A1F24),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [Color(0xFF214DB8), Color(0xFFE4EFE9)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, 1.0),
                      end: AlignmentDirectional(0, -1.0),
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FutureBuilder<List<ProfilePicRow>>(
                                future: ProfilePicTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'user_id',
                                    profilePageUsersRow?.id,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitFadingFour(
                                          color: AppTheme.of(context).primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ProfilePicRow>
                                      avatarBorderProfilePicRowList =
                                      snapshot.data!;
                                  final avatarBorderProfilePicRow =
                                      avatarBorderProfilePicRowList.isNotEmpty
                                          ? avatarBorderProfilePicRowList.first
                                          : null;
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: AppTheme.of(context).primary,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            avatarBorderProfilePicRow?.fileName,
                                            'https://edhxculkccbyptgfhwds.supabase.co/storage/v1/object/public/profile_pic/pics/uploads/default.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 44.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x40000000),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: CustomIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          buttonSize: 46.0,
                                          icon: Icon(
                                            Icons.login_rounded,
                                            color: AppTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                'loginPage', context.mounted);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  profilePageUsersRow?.name,
                                  'Utilizador',
                                ),
                                style: AppTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: AppTheme.of(context).primaryText,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  profilePageUsersRow?.email,
                                  'Email',
                                ),
                                style: AppTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xB3FFFFFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              CustomLocalizations.lang
                                  .get("profile_account", 'Minha Conta'),
                              style: AppTheme.of(context).headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('editarPerfil');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: AppTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppTheme.of(context).alternate,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 4.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  CustomLocalizations.lang.get(
                                      "profile_account_edit", 'Editar Perfil'),
                                  style: AppTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                                CustomIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 46.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color(0xFF95A1AC),
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('editarPerfil');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('mudarPassword');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('mudarPassword');
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: AppTheme.of(context).primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: AppTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 4.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      CustomLocalizations.lang.get(
                                          "profile_accout_change_password",
                                          "Mudar Password"),
                                      style: AppTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 13.0,
                                          ),
                                    ),
                                    CustomIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 46.0,
                                      icon: Icon(
                                        Icons.chevron_right_rounded,
                                        color: Color(0xFF95A1AC),
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('mudarPassword');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setAppLanguage(context, 'pt');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'pt');
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: AppTheme.of(context).primaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: AppTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 4.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Português',
                                        style: AppTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 13.0,
                                            ),
                                      ),
                                      CustomIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        buttonSize: 46.0,
                                        icon: Icon(
                                          Icons.chevron_right_rounded,
                                          color: Color(0xFF95A1AC),
                                          size: 20.0,
                                        ),
                                        onPressed: () {
                                          print_('IconButton pressed ...');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setAppLanguage(context, 'en');
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color:
                                        AppTheme.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: AppTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 4.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Inglês',
                                          style: AppTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 13.0,
                                              ),
                                        ),
                                        CustomIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          buttonSize: 46.0,
                                          icon: Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color(0xFF95A1AC),
                                            size: 20.0,
                                          ),
                                          onPressed: () {
                                            print_('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 35.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

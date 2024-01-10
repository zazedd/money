import '/backend/supabase/supabase.dart';
import '/geral/theme.dart';
import '/geral/util.dart';
import '/geral/widgets.dart';
import '/geral/internationalization.dart';
import '/geral/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'visualizar_tarefa_model.dart';
export 'visualizar_tarefa_model.dart';

class VisualizarTarefaWidget extends StatefulWidget {
  const VisualizarTarefaWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskRow? task;

  @override
  _VisualizarTarefaWidgetState createState() => _VisualizarTarefaWidgetState();
}

class _VisualizarTarefaWidgetState extends State<VisualizarTarefaWidget> {
  late VisualizarTarefaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisualizarTarefaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.task?.userId,
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
        List<UsersRow> bottomSheetUsersRowList = snapshot.data!;
        final bottomSheetUsersRow = bottomSheetUsersRowList.isNotEmpty
            ? bottomSheetUsersRowList.first
            : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.get("secondary_background", Color(0xFF2B2B2B)),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).secondaryText,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 0.0, 0.0),
                      child: Text(
                        CustomLocalizations.lang.get("work_tasks", "Tarefas"),
                        style: AppTheme.of(context).headlineSmall,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          if (widget.task?.status == 1)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            CustomLocalizations.lang.get("completed", "Completa"),
                                            style: AppTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(context)
                                                      .success,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.done,
                                      color: AppTheme.of(context).success,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (widget.task?.status == 0)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            CustomLocalizations.lang.get("pendent", "Pendente"),
                                            style: AppTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(context)
                                                      .warning,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_control_sharp,
                                      color: AppTheme.of(context).warning,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (widget.task?.status == 2)
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            CustomLocalizations.lang.get("canceled", "Cancelada"),
                                            style: AppTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: AppTheme.of(context)
                                                      .error,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: AppTheme.of(context).error,
                                      size: 20.0,
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              CustomLocalizations.lang.get("visualize_task_assigned", "Atribuída a:"),
                              style: AppTheme.of(context).titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                bottomSheetUsersRow?.name,
                                CustomLocalizations.lang.get("person", "Pessoa"),
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              CustomLocalizations.lang.get("name_dots", "Nome:"),
                              style: AppTheme.of(context).titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.task?.name,
                                CustomLocalizations.lang.get("name", "Nome"),
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 5.0),
                            child: Text(
                              CustomLocalizations.lang.get("description_dots", "Descrição:"),
                              style: AppTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.task?.description,
                                CustomLocalizations.lang.get("description", "Descrição"),
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Color(0x8C353535)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(-1.0, 0.0),
                        end: AlignmentDirectional(1.0, 0),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 5.0),
                            child: Text(
                              CustomLocalizations.lang.get("date_end_dots", "Data de Fim:"),
                              style: AppTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'yMd',
                                  widget.task?.endsAt,
                                  locale:
                                      CustomLocalizations.of(context).languageCode,
                                ),
                                'Data',
                              ),
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.task?.status == 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await TaskTable().update(
                                    data: {
                                      'status': 1,
                                      'ends_at': supaSerialize<DateTime>(
                                          dateTimeFromSecondsSinceEpoch(
                                              getCurrentTimestamp
                                                  .secondsSinceEpoch)),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.task?.id,
                                    ),
                                  );
                                  print_("Task Table atualizada");
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        CustomLocalizations.lang.get("thanks_for_finishing", "Obrigado por concluír a sua tarefa."),
                                        style: TextStyle(
                                          color:
                                              AppTheme.of(context).primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          AppTheme.of(context).success,
                                    ),
                                  );
                                },
                                text: CustomLocalizations.lang.get("visualize_task_btn", "Marcar como Concluída"),
                                icon: Icon(
                                  Icons.done,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: AppTheme.of(context).success,
                                  textStyle:
                                      AppTheme.of(context).titleSmall.override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                          ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

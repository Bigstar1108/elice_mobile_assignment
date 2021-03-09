import 'package:elice_mobile_assignment/bloc/subject_event.dart';
import 'package:elice_mobile_assignment/bloc/subject_state.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:elice_mobile_assignment/repository/subject_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

// Recommend = Rec으로 정의합니다.

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final SubjectRepository _subjectRepository = SubjectRepository();

  @override
  SubjectState get initialState => SubjectInitialState();

  @override
  Stream<SubjectState> mapEventToState(SubjectEvent event) async* {
    if (event is SubjectGetFreeSubjectEvent) {
      final currentState = state;

      if (currentState is SubjectInitialState) {
        yield SubjectLoadingState();

        try {
          List<SubjectCardModel> subjectDataList =
              await _subjectRepository.getFreeSubjectData(0, event.count);

          yield SubjectSuccessState(
            freeSubjectData: subjectDataList,
            recommendSubjectData: [],
          );
        } catch (e) {
          yield SubjectErrorState(error: e);
        }
      } else if (currentState is SubjectSuccessState) {
        yield SubjectLoadingState();

        try {
          List<SubjectCardModel> subjectDataList =
              await _subjectRepository.getFreeSubjectData(
                  event.offset ?? currentState.freeSubjectData.length,
                  event.count);

          List<SubjectCardModel> allFreeSubject = [
            ...currentState.freeSubjectData,
            ...subjectDataList
          ];

          yield SubjectSuccessState(
            freeSubjectData: allFreeSubject,
            recommendSubjectData: currentState.recommendSubjectData,
          );
        } catch (e) {
          yield SubjectErrorState(error: e);
        }
      }
    } else if (event is SubjectGetRecommendedSubjectEvent) {
      final currentState = state;

      if (currentState is SubjectInitialState) {
        yield SubjectLoadingState();

        try {
          List<SubjectCardModel> subjectDataList =
              await _subjectRepository.getRecSubjectData(0, event.count);

          yield SubjectSuccessState(
            freeSubjectData: [],
            recommendSubjectData: subjectDataList,
          );
        } catch (e) {
          yield SubjectErrorState(error: e);
        }
      } else if (currentState is SubjectSuccessState) {
        yield SubjectLoadingState();

        try {
          List<SubjectCardModel> subjectDataList =
              await _subjectRepository.getRecSubjectData(
                  event.offset ?? currentState.recommendSubjectData.length,
                  event.count);

          List<SubjectCardModel> allFreeSubject = [
            ...currentState.recommendSubjectData,
            ...subjectDataList
          ];

          yield SubjectSuccessState(
            freeSubjectData: currentState.freeSubjectData,
            recommendSubjectData: allFreeSubject,
          );
        } catch (e) {
          yield SubjectErrorState(error: e);
        }
      }
    }
  }
}

// class SubjectBloc {
//   final _subjectRepository = SubjectRepository();
//   final _subjectFreeCardData = PublishSubject<List<SubjectCardModel>>();
//   final _subjectRecCardData = PublishSubject<List<SubjectCardModel>>();

//   Stream<List<SubjectCardModel>> get subjectFreeCardData =>
//       _subjectFreeCardData.stream;
//   Stream<List<SubjectCardModel>> get subjectRecCardData =>
//       _subjectRecCardData.stream;
//   List<SubjectCardModel> allFreeSubjectData = [];
//   List<SubjectCardModel> allRecSubjectData = [];

//   Future<void> getFreeSubjectData(int offset, int count) async {
//     List<SubjectCardModel> subjectDataList =
//         await _subjectRepository.getFreeSubjectData(offset, count);

//     allFreeSubjectData.addAll(subjectDataList);

//     _subjectFreeCardData.sink.add(allFreeSubjectData);
//   }

//   getRecSubjectData(int offset, int count) async {
//     List<SubjectCardModel> subjectDataList =
//         await _subjectRepository.getRecSubjectData(offset, count);

//     allRecSubjectData.addAll(subjectDataList);

//     _subjectRecCardData.sink.add(allRecSubjectData);
//   }

//   clearSubjectData(bool isFilter) async {
//     if (isFilter) {
//       _subjectFreeCardData.sink.add([]);
//     } else {
//       _subjectRecCardData.sink.add([]);
//     }
//   }

//   dispose() {
//     _subjectFreeCardData.close();
//     _subjectRecCardData.close();
//   }
// }

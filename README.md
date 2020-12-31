This code can test approximate measurement invariance(Alignment).

See here for more detail on "Alignment"(in Mplus).

https://www.statmodel.com/Alignment.shtml

----------------------------------------------------------------------------------------------------------------------------------------

Analysis using this code yields the same results as Mplus with the same input data.

The differences between Mplus alignment and my code are,
1) In Mplus, some of the details of the alignment algorithm are not shown. (ex. sample weight, variable standardization)
2) Mplus alignment can only use raw data as input data (not summary data).
   But, my code can analyze summary data as input.
3) Mplus alignment can only analysis simple structure model(without cross-loading).
   But, my code can analysis alignment in second-order factor structure.

I have implemented this while studying my master's thesis.

See here for more detail.

http://www.riss.kr/link?id=T15073557

E-mail : perfection8@naver.com

----------------------------------------------------------------------------------------------------------------------------------------

- Multilingual Abstract

Measurement invariance between comparative groups should be met to properly interpret the differences of latent variables. It is difficult to conclude whether the differences in test scores are due to level differences in the actual latent variable or because the items function differentially according to the group. Therefore, before comparing latent variables among groups, measurement invariance is a prerequisite.
If measurement invariance is violated, the existing approach suggests alternatives to ensure partial measure invariance. Partial measurement invariance is modified posteriorly in order of increasing modification index. It releases the constraint that certain estimates are the same across groups until the change of the model fit reaches a value that satisfies the measurement invariance. This procedure has the possibility that the model may be based on the data, and even if the partial measurement invariance is satisfied it is not enough to compare the factor mean.
Another alternative is the alignment method recently presented. In particular measurement ivariance is difficult to meet when the number of comparative groups is large. In fact, it was confirmed that no measurement invariance was reported when the number of comparative groups was large. The existing traditional measurement invariance validation procedure constrains the estimation parameter (factor load, intercept) between comparison groups to be the same. However, the alignment , on the other hand, estimates are obtained through the constraints that minimize the difference between the estimates of the comparison groups and the approximate measurement invariance is satisfied. In the previous study, it was confirmed that the alignment method in the simulation study was more accurate than the traditional measurement invariance and partial measurement invariance when the non-invariance was within 20%.
However, the disadvantage of the alignment is that there is no cross-load in the factor model and it is not applicable to the second-order model or the bi-factor model. In this study, I show the application method and case of alignment for the first time using WISC-V data which is a typical case of the second order model. In the second order model, the analysis was performed by dividing the first order factor, the indicator of first order factor, the second order factor, and the first order factor into two steps. In this process, the first order factor alignment was analyzed with Mplus. However, in order to analyze the alignment in the second order part, summary data which is the result of alignment of the first order factor should be used as input. Currently, even the latest version of Mplus, version 8.2, alignment can only be analyzed as raw data. Especially, in this study, we analyzed the second order factor alignment by inputting the summary data which is the result of alignment analysis of the first order factor part using the analysis tool which I implemented by myself using R. Also, it is confirmed that the alignment implemented in R is reliable and reproducible by confirming that the same data is used as the input, and the result is consistent with Mplus. In addition, some options that are not provided by Mplus are also implemented for analysis.
The results of the analysis showed that the factor mean of WISC-V estimated by alignment tended to increase gradually with increasing age. In addition, in the result of the alignment analysis of the first order factor of Mplus, the invariance set was presented for each estimate, so that the group with approximate measurement invariance was found and the group which violated it. Therefore, it was possible to confirm which items functioned differently among the group.

- 국문 초록

 잠재변수의 차이를 타당하게 해석하기 위해서는 비교 집단 간 측정 동일성이 충족되어야 한다. 측정 동일성이 위배될 경우 검사점수의 차이가 실제 잠재변수에서 수준 차이로 인한 것인지, 혹은 문항이 집단에 따라 차별적으로 기능했기 때문인지 결론을 내리기 어렵다. 따라서 집단 간 잠재변수를 비교하기 이전에, 측정 동일성은 선결되어야 할 조건이라 할 수 있다.
측정 동일성이 위배 되었을 경우, 기존의 접근 방법은 부분 측정 동일성을 확보하는 대안을 제시하고 있다. 부분 측정 동일성은 수정지수가 큰 부분부터 모형을 사후적으로 수정하게 된다. 모형적합도의 변화량이 측정 동일성을 충족하는 값에 이를 때까지 특정 추정치가 집단 간 동일하다는 제약을 풀어준다. 이 절차는 모형이 자료에 기반하게 될 우려가 있으며, 또한 부분 측정 동일성을 확보했다 하더라도 집단 간 요인 평균을 비교하는 것이 타당하다는 근거가 부족한 실정이다.
이에 다른 대안으로 최근에 제시된 것이 정렬법(alignment)이다. 특히, 측정 동일성은 비교 집단의 수가 많을 때 충족되기 힘들며, 실제로 비교 집단의 수가 많을 때 측정 동일성을 충족했다고 보고한 경우가 거의 없다는 것을 확인하였다. 기존의 전통적인 측정 동일성 검증 절차는 비교 집단 간 추정 모수를 동일하게 제약한다. 하지만 정렬법은 이와 달리, 비교 집단 간 추정 모수들(요인 계수, 절편)의 차이를 가장 작게 만드는 제약을 통해 추정치를 산출하고 근사 측정 동일성을 확보한다. 선행 연구에서 비 동일성(non-invariance)이 20% 이내일 때, 가상실험에서 정렬법이 기존의 측정 동일성, 부분 측정 동일성보다 정확한 모수를 산출한다고 보고하였다.
하지만, 정렬법의 단점은 요인 모형에 교차 부하(cross-loading)가 없어야 하며, 단순 구조가 아닌 2차 요인 모형이나 2인자 모형(Bi-factor model)은 적용이 불가능하다는 한계점이 있다. 본 연구에서는 2차 요인 모형의 전형적인 사례라 할 수 있는 WISC-V 규준 자료를 사용하여 정렬법의 적용 방법과 사례를 처음으로 소개한다. 분석절차는 2차 요인 모형에서 1차 요인과 문항의 1층 부분, 2차 요인과 1차 요인의 2층 부분을 나누어 2단계로 구분하여 정렬법을 수행하였다. 1차 요인의 정렬법은 Mplus로 분석하였다. 하지만 2층 부분에 정렬법을 분석하기 위해서는 1차 요인의 정렬법 분석결과인 요약자료를 입력으로 사용할 수 있어야 한다. 현재 Mplus 최신버전인 8.2 버전 까지도 정렬법은 원자료로만 분석이 가능하다. 특히 본 연구에서는 정렬법을 R로 직접 구현한 분석 도구를 사용하여, 1층의 정렬법 분석결과인 요약자료를 입력으로 2차 요인의 정렬법을 분석하였다. R에서 직접 구현한 정렬법은 동일한 자료를 입력으로 사용하였을 때, Mplus와 일치하는 결과를 산출하는 것을 확인하였다.
분석 결과에서 정렬법으로 추정한 WISC-V의 요인 평균은 연령이 증가할수록 점진적으로 상승하는 경향을 확인할 수 있었다. Mplus를 사용하여 1차 요인들을 정렬법으로 분석한 결과에서 동일성 세트(invariance set)를 추정치별로 제시하여 근사 측정 동일성이 6~8세의 몇몇 소검사에서 위배되는 것을 확인하였다. 따라서 어떤 문항이 어느 집단에 차별적으로 기능하는지 확인할 수 있었다.

※. 주제어(Keyword) : 2차 요인 모형(second order factor model), 근사 측정 동일성(approximate measurement invariance), 다집단 확인적 요인분석(multi-group confirmatory factor analysis), 측정 동일성(measurement invariance), 정렬법(alignment)

----------------------------------------------------------------------------------------------------------------------------------------

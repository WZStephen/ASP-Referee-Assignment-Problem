%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Search space %
%%%%%%%%%%%%%%%%%%%%%%%%%

1 {assign(Cid,Rid) : referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment)} 1  :- case(Cid,Ctype, Effort, Damage, Postc, Payment).

%%%%%%%%%%%%%%%%%%%%
% Hard Constraints %
%%%%%%%%%%%%%%%%%%%%

% The maximum number of working minutes of a referee must not be exceeded by the actual workload.
:- Sum_work = #sum{Effort,Rid ,Cid : assign(Cid,Rid),case(Cid,Ctype, Effort, Damage, Postc, Payment)},referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment), Sum_work > Max_workload.

% A case must not be assigned to a referee who is not in charge of the region at all.
:- assign(Cid,Rid),referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment),case(Cid,Ctype, Effort, Damage, Postc, Payment), prefRegion(Rid,Postc,0).

% A case must not be assigned to a referee who is not in charge of the type of the case at all.
:- assign(Cid,Rid),referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment),case(Cid,Ctype, Effort, Damage, Postc, Payment), prefType(Rid,Ctype,0).

% Cases with an amount of damage that exceeds a certain threshold can only be assigned to internal referees.
:- assign(Cid,Rid),referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment),case(Cid,Ctype, Effort, Damage, Postc, Payment), Rtype==e , externalMaxDamage(Max_D), Damage > Max_D.

%%%%%%%%%%%%%%%%%%%%
% Weak Constraints %
%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Internal referees are preferred in order to minimize the costs of external ones.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

intnum(N) :- N=#count{ 1 , Rid : assign(Cid,Rid),referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment) , Rtype==i }.
#maximize{N: intnum(N)}.
%#show intnum/1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The assignment of cases to external referees should be fair in the sense that their overall payment should be balanced.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.Calculate the difference between maximum external pay and minimum external pay.
payment(Rid , Pay) :- Pay=  #sum{Payment, Rid, Cid:assign(Cid, Rid) , case(Cid, Ctype, Effort, Damage, Postc, Payment)}, referee(Rid, Rtype, Max_workload, Prev_workload, Prev_payment), Rtype == e.
total_payment(Rid ,Pay_Money) :- Pay_Money=Prev_payment+Pay, referee(Rid, Rtype, Max_workload, Prev_workload, Prev_payment), payment(Rid , Pay), Rtype == e.
min_pay(Pay_Money1) :- total_payment(Rid1,Pay_Money1), 0==#count{1,Rid2 : Pay_Money1>Pay_Money2,total_payment(Rid2,Pay_Money2) },total_payment(Rid1,Pay_Money1).
max_pay(Pay_Money1) :- total_payment(Rid1,Pay_Money1), 0==#count{1,Rid2 : Pay_Money1<Pay_Money2,total_payment(Rid2,Pay_Money2) },total_payment(Rid1,Pay_Money1).

pay_diff(D) :- D = (MAX-MIN), max_pay(MAX), min_pay(MIN).

% 2.Minimize such difference.
#minimize{D,Cid,Rid:pay_diff(D), assign(Cid,Rid), referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment), case(Cid,Ctype, Effort, Damage, Postc, Payment) }.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The assignment of cases to (internal and external) referees should be fair in the sense that their overall workload should be balanced.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.Calculate the difference between maximum workload and minimum workload.
work(Rid,Case_Work) :-  Case_Work =  #sum{Effort , Rid , Cid :assign(Cid, Rid) , case(Cid, Ctype, Effort, Damage, Postc, Payment)}, referee(Rid, Rtype, Max_workload, Prev_workload, Prev_payment).
total_workload(Rid, TWork) :- TWork = Prev_workload + Case_Work, referee(Rid, Rtype, Max_workload, Prev_workload, Prev_payment), work(Rid,Case_Work).
min_work(TWork1) :- total_workload(Rid1, TWork1), 0==#count{1, Rid2 : TWork1>TWork2,total_workload(Rid2, TWork2) },total_workload(Rid1, TWork1).
max_work(TWork1) :- total_workload(Rid1, TWork1), 0==#count{1, Rid2 : TWork1<TWork2,total_workload(Rid2, TWork2) },total_workload(Rid1, TWork1).
work_diff(D) :- D = (MAX-MIN), max_work(MAX), min_work(MIN).
%#show min_work/1.
%#show max_work/1.
%#show work_diff/1.

% 2.Minimize such difference.
#minimize{D,Cid ,Rid : work_diff(D), assign(Cid,Rid), referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment), case(Cid,Ctype, Effort, Damage, Postc, Payment) }.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Referees should handle types of cases and regions with higher preference.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#maximize{Case_Pre+Region_Pre,Rid: assign(Cid,Rid),referee(Rid,Rtype, Max_workload, Prev_workload, Prev_payment),case(Cid,Ctype, Effort, Damage, Postc, Payment) , prefRegion(Rid,Postc,Region_Pre),prefType(Rid,Ctype,Case_Pre)}.

%%%%%%%%%%%%%%%%%%%
% Show Assignment %
%%%%%%%%%%%%%%%%%%%
#show assign/2.
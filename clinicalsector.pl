:- dynamic yes/1,no/1.

% ---------- START ----------
start :-
    welcome,
    findall(Disease, diagnose(Disease), Diseases),
    show_results(Diseases),
    undo.

% ---------- WELCOME ----------
welcome :-
    nl,
    write('====================================='), nl,
    write('   AI MEDICAL EXPERT SYSTEM (PROLOG)'), nl,
    write('====================================='), nl,
    nl,
    write('Answer with yes. or no.'), nl,
    nl.

% ---------- DISEASE RULES ----------

% Existing
diagnose(flu) :-
    symptom(fever),
    symptom(headache),
    symptom(body_pain),
    symptom(fatigue).

diagnose(cold) :-
    symptom(sneezing),
    symptom(runny_nose),
    symptom(sore_throat).

diagnose(malaria) :-
    symptom(fever),
    symptom(chills),
    symptom(sweating),
    symptom(nausea).

diagnose(covid19) :-
    symptom(fever),
    symptom(dry_cough),
    symptom(loss_of_taste),
    symptom(breathing_difficulty).

% ---------- NEW DISEASES ----------

diagnose(dengue) :-
    symptom(high_fever),
    symptom(severe_headache),
    symptom(pain_behind_eyes),
    symptom(joint_pain).

diagnose(typhoid) :-
    symptom(prolonged_fever),
    symptom(weakness),
    symptom(abdominal_pain),
    symptom(loss_of_appetite).

diagnose(diabetes) :-
    symptom(frequent_urination),
    symptom(increased_thirst),
    symptom(weight_loss),
    symptom(fatigue).

diagnose(asthma) :-
    symptom(breathing_difficulty),
    symptom(chest_tightness),
    symptom(wheezing),
    symptom(coughing).

diagnose(pneumonia) :-
    symptom(chest_pain),
    symptom(fever),
    symptom(cough_with_phlegm),
    symptom(breathing_difficulty).

diagnose(migraine) :-
    symptom(severe_headache),
    symptom(nausea),
    symptom(light_sensitivity),
    symptom(blurred_vision).

% ---------- SYMPTOM CHECK ----------
symptom(S) :-
    (yes(S) -> true ;
     (no(S) -> fail ;
      ask(S))).

ask(S) :-
    write('Do you have '), write(S), write('? (yes/no): '),
    read(Response),
    nl,
    process_response(S, Response).

process_response(S, yes) :- assert(yes(S)).
process_response(S, y)   :- assert(yes(S)).
process_response(S, no)  :- assert(no(S)), fail.
process_response(S, n)   :- assert(no(S)), fail.

% ---------- RESULTS ----------
show_results([]) :-
    nl,
    write('No matching disease found.'), nl.

show_results(Diseases) :-
    nl,
    write('====== DIAGNOSIS RESULT ======'), nl,
    display_diseases(Diseases).

display_diseases([]).
display_diseases([H|T]) :-
    write('Possible Disease: '), write(H), nl,
    advice(H),
    nl, nl,
    display_diseases(T).

% ---------- ADVICE ----------
advice(flu) :-
    write('Advice: Rest, hydration, and paracetamol.').

advice(cold) :-
    write('Advice: Steam inhalation and warm fluids.').

advice(malaria) :-
    write('Advice: Immediate blood test and doctor consultation.').

advice(covid19) :-
    write('Advice: Isolate and consult doctor.').

advice(dengue) :-
    write('Advice: Drink fluids and seek medical care urgently.').

advice(typhoid) :-
    write('Advice: Antibiotics required, consult doctor.').

advice(diabetes) :-
    write('Advice: Check blood sugar and manage diet.').

advice(asthma) :-
    write('Advice: Use inhaler and avoid triggers.').

advice(pneumonia) :-
    write('Advice: Medical treatment and antibiotics needed.').

advice(migraine) :-
    write('Advice: Rest in dark room and take prescribed medication.').

% ---------- RESET ----------
undo :-
    retract(yes(_)), fail.
undo :-
    retract(no(_)), fail.
undo.
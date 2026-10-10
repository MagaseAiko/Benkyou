-- n2-grammar-16 — 〜どころではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-16',
    'grammar',
    'N2',
    $$〜どころではない$$,
    $$dokoro de wa nai$$,
    $$Não é hora para / Não dá nem para pensar em / Longe de$$,
    $$どころではない é usado para dizer que, por causa de uma situação difícil, não há condições de fazer algo. Equivale a "não é hora para", "não dá nem para pensar em" ou "longe de".

A primeira parte da frase costuma explicar o problema (estar ocupado, doente, sem dinheiro), e どころではない mostra o que fica impossível ou fora de questão por causa disso.

Por exemplo, "estou tão ocupado que viajar está fora de questão" ou "estava com febre, então estudar não dava nem para pensar".

Ele vem depois de substantivos e de verbos na forma de dicionário.

Na fala, どころではない costuma virar どころじゃない.$$,
    $$どころではない é diferente de どころか. どころではない indica que algo é impossível na situação; どころか indica que a realidade é o oposto ou muito mais extrema.

O tom costuma ser de estresse ou urgência.

É muito usado em conversas sobre trabalho e problemas pessoais.$$,
    $$Substantivo + どころではない
Verbo na forma de dicionário + どころではない

Educado: どころではありません
Passado: どころではなかった
Fala: どころじゃない$$,
    $$どころではない$$,
    $$どころではない|どころじゃない|どころではありません|どころではなかった|どころじゃなかった$$,
    ARRAY['どころ', 'では', 'ない']::text[],
    ARRAY['どころではない', 'どころじゃない', 'どころではありません', 'どころではなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-16', $$忙しくて、旅行どころではない。$$, $$いそがしくて、りょこうどころではない。$$, $$Estou tão ocupado que viajar está fora de questão.$$),
    ('n2-grammar-16', $$明日は試験だから、遊ぶどころではない。$$, $$あしたはしけんだから、あそぶどころではない。$$, $$Amanhã tem prova, então não é hora para se divertir.$$),
    ('n2-grammar-16', $$熱があって、勉強どころではなかった。$$, $$ねつがあって、べんきょうどころではなかった。$$, $$Estava com febre, então estudar não dava nem para pensar.$$),
    ('n2-grammar-16', $$お金がなくて、結婚どころじゃない。$$, $$おかねがなくて、けっこんどころじゃない。$$, $$Estou sem dinheiro, então casamento nem pensar.$$),
    ('n2-grammar-16', $$歯が痛くて、食事どころではありません。$$, $$はがいたくて、しょくじどころではありません。$$, $$Estou com tanta dor de dente que comer está fora de questão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仕事が山ほどあって、休み____。$$, $$Tenho uma montanha de trabalho, então nem dá para pensar em folga.$$),
        (2, $$子供が泣いていて、テレビを見る____。$$, $$A criança está chorando, então não é hora de ver TV.$$),
        (3, $$事故があって、パーティー____。$$, $$Houve um acidente, então a festa ficou fora de questão.$$),
        (4, $$借金があって、旅行____。$$, $$Tenho dívidas, então viajar nem pensar.$$),
        (5, $$外は寒すぎて、散歩____。$$, $$Lá fora está frio demais, então passear está fora de questão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どころではない$$),
        (1, $$どころじゃない$$),
        (2, $$どころではない$$),
        (2, $$どころじゃない$$),
        (3, $$どころではなかった$$),
        (3, $$どころじゃなかった$$),
        (4, $$どころじゃない$$),
        (4, $$どころではない$$),
        (5, $$どころではない$$),
        (5, $$どころじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

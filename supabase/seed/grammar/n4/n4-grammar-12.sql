-- n4-grammar-12 — 〜ではないか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-12',
    'grammar',
    'N4',
    $$〜ではないか$$,
    $$dewa nai ka$$,
    $$Não é...? / Não seria...? / Será que não...$$,
    $$ではないか é usado para expressar uma suposição, uma opinião com cautela ou uma surpresa. Equivale a "não é...?", "não seria...?" ou "será que não é...?".

Embora tenha forma de pergunta negativa, o sentido é positivo: quem fala acha que aquilo provavelmente é verdade. Dizer "não seria difícil?" é uma forma suave de dizer "acho que é difícil".

É muito comum com と思う, formando ではないかと思う, que é uma forma educada e cautelosa de dar uma opinião. A versão ではないでしょうか soa ainda mais polida.

Também pode expressar surpresa ao perceber algo, ou repreensão, quando se aponta algo que o outro deveria saber.

ではないか é mais formal e mais usado na escrita. Na fala casual, o equivalente é じゃないか.$$,
    $$Com verbos e adjetivos い, o natural é usar のではないか, como em 高いのではないか. Sem の, a frase ganha um tom de reclamação ou repreensão.

ではないでしょうか é uma das formas favoritas dos japoneses para dar opinião em reuniões e textos, porque não soa impositiva.

A entonação muda o sentido: descendo, é uma suposição; com ênfase, pode ser surpresa ou crítica.$$,
    $$Substantivo + ではないか
Adjetivo な (sem な) + ではないか
Frase + のではないか (com verbos e adjetivos い)

Educado: ではないでしょうか / ではありませんか
Opinião: 〜ではないかと思う
Forma falada: じゃないか$$,
    $$ではないか$$,
    $$ではないか|ではないでしょうか|ではありませんか$$,
    ARRAY['では', 'ない', 'か']::text[],
    ARRAY['ではないか', 'ではないでしょうか', 'ではありませんか', 'のではないか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-12', $$あの人は田中さんではないか。$$, $$あのひとはたなかさんではないか。$$, $$Aquele ali não é o Tanaka?$$),
    ('n4-grammar-12', $$この計画は少し無理ではないでしょうか。$$, $$このけいかくはすこしむりではないでしょうか。$$, $$Este plano não seria um pouco impossível?$$),
    ('n4-grammar-12', $$彼の話は本当ではないかと思う。$$, $$かれのはなしはほんとうではないかとおもう。$$, $$Acho que a história dele pode ser verdade.$$),
    ('n4-grammar-12', $$明日は雨ではないかと心配です。$$, $$あしたはあめではないかとしんぱいです。$$, $$Estou preocupado que amanhã chova.$$),
    ('n4-grammar-12', $$それは君の責任ではありませんか。$$, $$それはきみのせきにんではありませんか。$$, $$Isso não é responsabilidade sua?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この仕事は彼には無理____と思います。$$, $$Acho que este trabalho talvez seja impossível para ele.$$),
        (2, $$あそこにいるのは山田さん____。$$, $$Quem está ali não é o Yamada?$$),
        (3, $$警察は、犯人はあの男____と考えている。$$, $$A polícia acha que o culpado pode ser aquele homem.$$),
        (4, $$今の説明は少し複雑____でしょうか。$$, $$A explicação de agora não seria um pouco complicada?$$),
        (5, $$それでは約束が違う____。$$, $$Assim não é o que tínhamos combinado!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではないか$$),
        (2, $$ではないか$$),
        (2, $$ではありませんか$$),
        (3, $$ではないか$$),
        (4, $$ではない$$),
        (5, $$ではないか$$),
        (5, $$ではありませんか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

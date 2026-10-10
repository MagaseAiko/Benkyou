-- n3-grammar-124 — 〜てばかりいる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-124',
    'grammar',
    'N3',
    $$〜てばかりいる$$,
    $$te bakari iru$$,
    $$Só fica fazendo / Não faz outra coisa a não ser$$,
    $$てばかりいる é usado para criticar alguém que faz sempre a mesma coisa, de forma excessiva. Equivale a "só fica fazendo..." ou "não faz outra coisa a não ser...".

Ele junta a forma て do verbo com ばかり (só) e いる (estar). A ideia é que a pessoa passa o tempo todo naquela ação, deixando de lado o que deveria fazer.

O tom é quase sempre de reclamação ou de preocupação, como pais falando dos filhos: "ele só fica jogando videogame".

Na forma てばかりいないで, vira um pedido para que a pessoa pare: "pare de só dormir e ajude um pouco".$$,
    $$Compare: ゲームばかりしている (só joga videogame, foco no objeto) e ゲームをしてばかりいる (só fica jogando, foco na ação). Os dois são comuns.

てばかりいる é diferente de たばかり (acabou de), que usa a forma た.

Com verbos de sentimento, como 泣く e 怒る, a estrutura mostra que a pessoa está sempre naquele estado.$$,
    $$Verbo na forma て + ばかりいる
Verbo na forma て + ばかりいて、 + Frase
Verbo na forma て + ばかりいないで、 + Pedido$$,
    $$てばかりいる$$,
    $$てばかり|でばかり$$,
    ARRAY['て', 'ばかり', 'いる']::text[],
    ARRAY['てばかりいる', 'でばかりいる', 'てばかりいないで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-124', $$弟は毎日ゲームをしてばかりいる。$$, $$おとうとはまいにちゲームをしてばかりいる。$$, $$Meu irmão mais novo só fica jogando videogame todo dia.$$),
    ('n3-grammar-124', $$彼女は泣いてばかりいて、何も話さない。$$, $$かのじょはないてばかりいて、なにもはなさない。$$, $$Ela só fica chorando e não diz nada.$$),
    ('n3-grammar-124', $$寝てばかりいないで、少しは手伝って。$$, $$ねてばかりいないで、すこしはてつだって。$$, $$Pare de só dormir e ajude um pouco.$$),
    ('n3-grammar-124', $$父は休みの日、テレビを見てばかりいる。$$, $$ちちはやすみのひ、テレビをみてばかりいる。$$, $$Nos dias de folga, meu pai só fica vendo TV.$$),
    ('n3-grammar-124', $$遊んでばかりいると、試験に落ちるよ。$$, $$あそんでばかりいると、しけんにおちるよ。$$, $$Se ficar só brincando, vai ser reprovado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は文句を言っ____いる。$$, $$Ele só fica reclamando.$$),
        (2, $$子供は漫画を読ん____いる。$$, $$A criança só fica lendo mangá.$$),
        (3, $$食べ____いると、太りますよ。$$, $$Se ficar só comendo, vai engordar.$$),
        (4, $$寝____いないで、勉強しなさい。$$, $$Pare de só dormir e vá estudar.$$),
        (5, $$最近、仕事で失敗し____いる。$$, $$Ultimamente, só tenho errado no trabalho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てばかり$$),
        (2, $$でばかり$$),
        (3, $$てばかり$$),
        (4, $$てばかり$$),
        (5, $$てばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

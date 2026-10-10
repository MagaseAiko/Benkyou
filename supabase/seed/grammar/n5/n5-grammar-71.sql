-- n5-grammar-71 — と
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-71',
    'grammar',
    'N5',
    $$と$$,
    $$to$$,
    $$E / Com$$,
    $$と é uma partícula com dois usos principais no N5.

O primeiro é ligar substantivos, com o sentido de "e". Quando se usa と, a lista é completa: são exatamente aquelas coisas, e nada mais. Isso é diferente de や, que dá apenas exemplos.

O segundo é indicar com quem uma ação é feita, com o sentido de "com". A pessoa vem antes de と. Para reforçar a ideia de "junto", pode-se acrescentar 一緒に.

Alguns verbos pedem と porque a ação precisa de duas pessoas, como casar, encontrar-se, conversar e brigar. Nesses casos, と indica a outra parte da ação.

Para comparar duas coisas em perguntas como "A ou B, qual é...?", também se usa と entre as opções.$$,
    $$と só liga substantivos. Para ligar verbos e adjetivos, usa-se a forma て, e não と.

と também é usada para citar o que alguém disse ou pensou, como em と言う e と思う. Esse uso aparece bastante e tem uma função diferente.

Em listas, o último と antes da partícula é opcional e geralmente omitido.$$,
    $$Substantivo A + と + Substantivo B (lista completa)
Pessoa + と + Verbo (com alguém)
Pessoa + と + 一緒に + Verbo
Pessoa + と + 結婚する / 会う / 話す / けんかする
A + と + B + と + どちらが + Adjetivo + ですか$$,
    $$と$$,
    $$と$$,
    ARRAY['と']::text[],
    ARRAY['と']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-71', $$パンと牛乳を買いました。$$, $$パンとぎゅうにゅうをかいました。$$, $$Comprei pão e leite.$$),
    ('n5-grammar-71', $$友達と映画を見ました。$$, $$ともだちとえいがをみました。$$, $$Vi um filme com um amigo.$$),
    ('n5-grammar-71', $$私の家族は父と母と弟です。$$, $$わたしのかぞくはちちとははとおとうとです。$$, $$Minha família é meu pai, minha mãe e meu irmão mais novo.$$),
    ('n5-grammar-71', $$昨日、先生と話しました。$$, $$きのう、せんせいとはなしました。$$, $$Ontem conversei com o professor.$$),
    ('n5-grammar-71', $$姉は去年、アメリカ人と結婚しました。$$, $$あねはきょねん、アメリカじんとけっこんしました。$$, $$Minha irmã mais velha se casou com um americano no ano passado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$かばんの中には財布____かぎがあります。それだけです。$$, $$Na bolsa tem a carteira e a chave. Só isso.$$),
        (2, $$昨日、母____買い物に行きました。$$, $$Ontem fui fazer compras com a minha mãe.$$),
        (3, $$日曜日、田中さん____テニスをしました。$$, $$No domingo, joguei tênis com o Tanaka.$$),
        (4, $$犬____猫と、どちらが好きですか。$$, $$Cachorro ou gato, de qual você gosta mais?$$),
        (5, $$来月、彼女____結婚します。$$, $$Mês que vem, vou me casar com a minha namorada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と$$),
        (2, $$と$$),
        (3, $$と$$),
        (4, $$と$$),
        (5, $$と$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n3-grammar-84 — 〜に対して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-84',
    'grammar',
    'N3',
    $$〜に対して$$,
    $$ni taishite$$,
    $$Para com / Em relação a / Em contraste com$$,
    $$に対して tem três usos principais.

O primeiro é indicar o alvo de uma ação ou atitude: "para com", "em relação a". Por exemplo, a forma de falar com um professor, a resposta a uma pergunta ou o tratamento dado aos clientes.

O segundo é indicar contraste entre duas coisas: "enquanto A é..., B é...". Nesse caso, usa-se のに対して depois de uma frase. Por exemplo, "enquanto o irmão mais velho é alto, o mais novo é baixo".

O terceiro, com に対する, vem antes de um substantivo para dizer o objeto de um sentimento ou interesse: 環境問題に対する関心 (o interesse pelos problemas ambientais).

É uma expressão um pouco formal, muito usada na escrita e em situações sérias.$$,
    $$Para falar do assunto de algo (sobre), usa-se について. に対して é para o alvo de uma ação ou atitude.

No uso de contraste, のに対して é comum em textos que comparam dados, como estatísticas.

A expressão 〜に対して失礼だ (ser mal-educado com alguém) é bem frequente.$$,
    $$Substantivo (pessoa / coisa) + に対して + Verbo / Atitude
Frase + のに対して、 + Frase contrastante
Substantivo + に対する + Substantivo
Substantivo + に対しては + … (no caso de...)

Formal: に対し$$,
    $$に対して$$,
    $$に対して|に対する|に対し|にたいして$$,
    ARRAY['に', '対して']::text[],
    ARRAY['に対して', 'に対する', 'に対し', 'のに対して']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-84', $$先生に対して、失礼なことを言ってはいけない。$$, $$せんせいにたいして、しつれいなことをいってはいけない。$$, $$Não se deve dizer coisas mal-educadas ao professor.$$),
    ('n3-grammar-84', $$彼は質問に対して、丁寧に答えた。$$, $$かれはしつもんにたいして、ていねいにこたえた。$$, $$Ele respondeu à pergunta com cuidado.$$),
    ('n3-grammar-84', $$兄は背が高いのに対して、弟は低い。$$, $$あにはせがたかいのにたいして、おとうとはひくい。$$, $$Enquanto o irmão mais velho é alto, o mais novo é baixo.$$),
    ('n3-grammar-84', $$最近、環境問題に対する関心が高まっている。$$, $$さいきん、かんきょうもんだいにたいするかんしんがたかまっている。$$, $$Ultimamente, o interesse pelos problemas ambientais tem aumentado.$$),
    ('n3-grammar-84', $$お客様に対しては、いつも笑顔で接してください。$$, $$おきゃくさまにたいしては、いつもえがおでせっしてください。$$, $$Com os clientes, trate sempre com um sorriso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本では、目上の人____、敬語を使う。$$, $$No Japão, usa-se linguagem honorífica com pessoas mais velhas ou superiores.$$),
        (2, $$彼の意見____、反対する人が多い。$$, $$Muitas pessoas são contra a opinião dele.$$),
        (3, $$子供____教育は大切だ。$$, $$A educação das crianças é importante.$$),
        (4, $$東京は人が多いの____、田舎は少ない。$$, $$Enquanto Tóquio tem muita gente, o interior tem pouca.$$),
        (5, $$親切にしてもらったこと____、お礼を言った。$$, $$Agradeci pela gentileza que recebi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に対して$$),
        (2, $$に対して$$),
        (3, $$に対する$$),
        (4, $$に対して$$),
        (5, $$に対して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

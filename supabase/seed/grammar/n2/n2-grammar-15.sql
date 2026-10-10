-- n2-grammar-15 — 〜でしかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-15',
    'grammar',
    'N2',
    $$〜でしかない$$,
    $$de shika nai$$,
    $$Não passa de / É apenas / Não é mais do que$$,
    $$でしかない é usado para dizer que algo não passa de uma coisa simples ou de pouco valor. Equivale a "não passa de", "é apenas" ou "não é mais do que".

Ele vem diretamente depois de substantivos. A ideia é diminuir a importância daquilo, mostrando que é só aquilo e nada mais.

Por exemplo, "isso não passa de uma desculpa" ou "eu sou apenas um estudante".

O tom pode ser de crítica ("é só um boato"), de modéstia ("sou apenas um funcionário") ou de avaliação realista ("dinheiro é apenas uma ferramenta").

O sentido é parecido com にすぎない, que também aparece no N2.$$,
    $$でしかない é um pouco mais forte e expressivo que にすぎない.

É comum em reflexões e opiniões, como em ensaios e discursos.

Também aparece em frases de modéstia sobre a própria posição: 私は一社員でしかない.$$,
    $$Substantivo + でしかない
Substantivo + でしかありません (educado)
Passado: でしかなかった$$,
    $$でしかない$$,
    $$でしかない|でしかありません|でしかなかった$$,
    ARRAY['で', 'しか', 'ない']::text[],
    ARRAY['でしかない', 'でしかありません', 'でしかなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-15', $$それは言い訳でしかない。$$, $$それはいいわけでしかない。$$, $$Isso não passa de uma desculpa.$$),
    ('n2-grammar-15', $$私はただの学生でしかない。$$, $$わたしはただのがくせいでしかない。$$, $$Eu sou apenas um estudante.$$),
    ('n2-grammar-15', $$彼の話は噂でしかない。$$, $$かれのはなしはうわさでしかない。$$, $$O que ele diz não passa de boato.$$),
    ('n2-grammar-15', $$あの頃、この計画は夢でしかなかった。$$, $$あのころ、このけいかくはゆめでしかなかった。$$, $$Naquela época, este plano não passava de um sonho.$$),
    ('n2-grammar-15', $$お金は道具でしかない。$$, $$おかねはどうぐでしかない。$$, $$O dinheiro não é mais do que uma ferramenta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$証拠がないなら、それは君の想像____。$$, $$Se não há provas, isso não passa de imaginação sua.$$),
        (2, $$私は一社員____から、決める権利はない。$$, $$Sou apenas um funcionário, então não tenho o direito de decidir.$$),
        (3, $$彼にとって、仕事はお金を稼ぐ手段____。$$, $$Para ele, o trabalho não passa de um meio para ganhar dinheiro.$$),
        (4, $$その考えはすばらしいが、理想____。$$, $$Essa ideia é maravilhosa, mas não passa de um ideal.$$),
        (5, $$子供のころ、優勝は夢____と思っていた。$$, $$Quando criança, eu achava que ser campeão não passava de um sonho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でしかない$$),
        (2, $$でしかない$$),
        (3, $$でしかない$$),
        (4, $$でしかない$$),
        (5, $$でしかない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

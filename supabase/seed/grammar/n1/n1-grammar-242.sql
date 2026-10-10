-- n1-grammar-242 — 〜ようが / 〜ようと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-242',
    'grammar',
    'N1',
    $$〜ようが / 〜ようと$$,
    $$you ga / you to$$,
    $$Mesmo que / Não importa se / Por mais que$$,
    $$ようが e ようと indicam que, mesmo que algo aconteça, a decisão ou o resultado não muda. Equivalem a "mesmo que" ou "não importa se".

Vêm depois da forma volitiva do verbo e costumam aparecer junto com palavras interrogativas, como 何, 誰 e どんなに. Por exemplo, "digam o que disserem, não vou mudar de ideia".

É uma expressão enfática e um pouco formal.$$,
    $$É parecido com ても, mas ようが é mais forte e enfático.

A segunda parte costuma mostrar uma decisão firme ou indiferença.$$,
    $$Verbo (forma volitiva) + が / と
Adjetivo い (sem い) + かろうが / かろうと
Substantivo / Adjetivo な + だろうが / であろうと$$,
    $$ようが$$,
    $$ようが|ようと|うが|うと$$,
    ARRAY['よう', 'が']::text[],
    ARRAY['ようが', 'ようと', 'うが', 'うと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-242', $$誰が何と言おうが、私の気持ちは変わらない。$$, $$だれがなんといおうが、わたしのきもちはかわらない。$$, $$Digam o que disserem, meu sentimento não vai mudar.$$),
    ('n1-grammar-242', $$雨が降ろうと、試合は行われる。$$, $$あめがふろうと、しあいはおこなわれる。$$, $$Mesmo que chova, a partida será realizada.$$),
    ('n1-grammar-242', $$どんなに反対されようが、彼と結婚する。$$, $$どんなにはんたいされようが、かれとけっこんする。$$, $$Por mais que sejam contra, vou me casar com ele.$$),
    ('n1-grammar-242', $$何を食べようと、太らない体質だ。$$, $$なにをたべようと、ふとらないたいしつだ。$$, $$Não importa o que eu coma, sou do tipo que não engorda.$$),
    ('n1-grammar-242', $$どこに住もうが、私の自由だ。$$, $$どこにすもうが、わたしのじゆうだ。$$, $$Onde quer que eu more, é escolha minha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いくら頼まれ____、その仕事は引き受けない。$$, $$Por mais que me peçam, não vou aceitar esse trabalho.$$),
        (2, $$他人が何をし____、気にしない。$$, $$Não importa o que os outros façam, não ligo.$$),
        (3, $$どんなに疲れてい____、毎日運動している。$$, $$Por mais cansado que esteja, me exercito todos os dias.$$),
        (4, $$誰が来____、ドアを開けてはいけない。$$, $$Não importa quem venha, não se deve abrir a porta.$$),
        (5, $$失敗し____、もう一度挑戦する。$$, $$Mesmo que eu falhe, vou tentar de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-242', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようが$$),
        (1, $$ようと$$),
        (2, $$ようが$$),
        (2, $$ようと$$),
        (3, $$ようが$$),
        (3, $$ようと$$),
        (4, $$ようが$$),
        (4, $$ようと$$),
        (5, $$ようが$$),
        (5, $$ようと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

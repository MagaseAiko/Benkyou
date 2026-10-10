-- n4-grammar-35 — 〜ことがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-35',
    'grammar',
    'N4',
    $$〜ことがある$$,
    $$koto ga aru$$,
    $$Às vezes acontece de / Há vezes em que$$,
    $$Quando vem depois do verbo na forma de dicionário ou na forma ない, ことがある significa que algo acontece de vez em quando. Equivale a "às vezes" ou "há vezes em que".

A ideia é que a situação não é frequente nem habitual, mas acontece em algumas ocasiões.

É muito comum junto com 時々, たまに ou com a partícula も, formando こともある, que suaviza ainda mais: "também acontece de...".

Não confunda com たことがある, que usa o verbo no passado e fala de experiências de vida: "já fiz isso alguma vez".$$,
    $$A diferença é só a forma do verbo: forma de dicionário = "às vezes acontece"; forma た = "já aconteceu (experiência)".

こともある soa natural quando se quer admitir algo, como "às vezes eu também erro".

Para hábitos regulares, o japonês prefere outras formas, como ことにしている ou simplesmente o verbo com いつも ou よく.$$,
    $$Verbo na forma de dicionário + ことがある
Verbo na forma ない + ことがある
Adjetivo + ことがある

Educado: ことがあります
Mais suave: こともある / こともあります$$,
    $$ことがある$$,
    $$ことがある|ことがあります|こともある|こともあります$$,
    ARRAY['こと', 'が', 'ある']::text[],
    ARRAY['ことがある', 'ことがあります', 'こともある', 'こともあります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-35', $$時々、朝ご飯を食べないことがあります。$$, $$ときどき、あさごはんをたべないことがあります。$$, $$Às vezes acontece de eu não tomar café da manhã.$$),
    ('n4-grammar-35', $$この電車は遅れることがある。$$, $$このでんしゃはおくれることがある。$$, $$Este trem às vezes atrasa.$$),
    ('n4-grammar-35', $$忙しいときは、夜遅くまで働くこともあります。$$, $$いそがしいときは、よるおそくまではたらくこともあります。$$, $$Quando estou ocupado, às vezes trabalho até tarde da noite.$$),
    ('n4-grammar-35', $$父は休みの日に料理を作ることがあります。$$, $$ちちはやすみのひにりょうりをつくることがあります。$$, $$Meu pai às vezes cozinha nos dias de folga.$$),
    ('n4-grammar-35', $$彼はたまに約束を忘れることがある。$$, $$かれはたまにやくそくをわすれることがある。$$, $$Ele de vez em quando esquece os compromissos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れていると、電車で寝てしまう____。$$, $$Quando estou cansado, às vezes acabo dormindo no trem.$$),
        (2, $$この道は夜、暗くて危ない____。$$, $$Esta rua às vezes fica escura e perigosa à noite.$$),
        (3, $$母は時々、一人で映画を見に行く____。$$, $$Minha mãe às vezes vai ao cinema sozinha.$$),
        (4, $$雪が多い年は、学校が休みになる____。$$, $$Nos anos com muita neve, às vezes as aulas são canceladas.$$),
        (5, $$私も、たまに失敗する____。$$, $$Eu também às vezes erro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことがあります$$),
        (1, $$ことがある$$),
        (2, $$ことがある$$),
        (2, $$ことがあります$$),
        (3, $$ことがあります$$),
        (3, $$ことがある$$),
        (4, $$ことがあります$$),
        (4, $$ことがある$$),
        (5, $$こともあります$$),
        (5, $$こともある$$),
        (5, $$ことがあります$$),
        (5, $$ことがある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

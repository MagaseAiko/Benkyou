-- n2-grammar-104 — 〜にしたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-104',
    'grammar',
    'N2',
    $$〜にしたら$$,
    $$ni shitara$$,
    $$Para / Do ponto de vista de / Na posição de$$,
    $$にしたら indica o ponto de vista de uma pessoa ou grupo. Equivale a "para" ou "do ponto de vista de".

A pessoa que fala imagina como o outro se sente ou pensa em determinada situação. Por exemplo, "para os pais, o filho é sempre criança".

As formas にすれば e にしてみれば têm o mesmo sentido.$$,
    $$Só se usa com pessoas ou grupos de pessoas, não com coisas.

Não se usa para falar do próprio ponto de vista. Para isso, usa-se 私としては.

É parecido com の立場からすると.$$,
    $$Substantivo (pessoa / grupo) + にしたら
Substantivo + にすれば / にしてみれば$$,
    $$にしたら$$,
    $$にしたら|にすれば|にしてみれば|にしてみたら$$,
    ARRAY['に', 'したら']::text[],
    ARRAY['にしたら', 'にすれば', 'にしてみれば', 'にしてみたら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-104', $$親にしたら、子供はいくつになっても子供だ。$$, $$おやにしたら、こどもはいくつになってもこどもだ。$$, $$Para os pais, o filho é sempre criança, não importa a idade.$$),
    ('n2-grammar-104', $$彼にすれば、それは当然のことだったのだろう。$$, $$かれにすれば、それはとうぜんのことだったのだろう。$$, $$Para ele, isso provavelmente era algo natural.$$),
    ('n2-grammar-104', $$客にしてみれば、待たされるのは迷惑だ。$$, $$きゃくにしてみれば、またされるのはめいわくだ。$$, $$Para o cliente, ter que esperar é um incômodo.$$),
    ('n2-grammar-104', $$先生にしたら、静かな学生のほうが楽だろう。$$, $$せんせいにしたら、しずかながくせいのほうがらくだろう。$$, $$Para o professor, alunos quietos devem ser mais fáceis.$$),
    ('n2-grammar-104', $$子供にしたら、毎日の塾はつらいはずだ。$$, $$こどもにしたら、まいにちのじゅくはつらいはずだ。$$, $$Para uma criança, cursinho todo dia deve ser difícil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$犬____、散歩は一番楽しい時間なのだろう。$$, $$Para um cachorro, o passeio deve ser o momento mais divertido.$$),
        (2, $$社長____、社員の気持ちはわからないかもしれない。$$, $$Para o presidente, talvez seja difícil entender o sentimento dos funcionários.$$),
        (3, $$近所の人____、夜の騒音は困るだろう。$$, $$Para os vizinhos, o barulho à noite deve ser um problema.$$),
        (4, $$学生____、この宿題は多すぎる。$$, $$Para os alunos, esta lição de casa é demais.$$),
        (5, $$彼女____、あの言葉はショックだったはずだ。$$, $$Para ela, aquelas palavras devem ter sido um choque.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしたら$$),
        (1, $$にすれば$$),
        (1, $$にしてみれば$$),
        (2, $$にしたら$$),
        (2, $$にすれば$$),
        (2, $$にしてみれば$$),
        (3, $$にしたら$$),
        (3, $$にすれば$$),
        (3, $$にしてみれば$$),
        (4, $$にしたら$$),
        (4, $$にすれば$$),
        (4, $$にしてみれば$$),
        (5, $$にしたら$$),
        (5, $$にすれば$$),
        (5, $$にしてみれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

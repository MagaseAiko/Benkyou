-- n3-grammar-67 — なかなか（肯定）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-67',
    'grammar',
    'N3',
    $$なかなか（肯定）$$,
    $$nakanaka (koutei)$$,
    $$Bastante / Bem / Muito (positivo)$$,
    $$Em frases afirmativas, なかなか significa "bastante", "bem" ou "muito". Ele indica que algo é melhor ou maior do que se esperava.

O tom costuma ser de elogio ou de avaliação positiva, às vezes com um pouco de surpresa. Por exemplo, "esta comida é bem gostosa" ou "o japonês dele é bastante bom".

Também pode descrever algo desafiador de forma objetiva, como "o novo trabalho é bem puxado".

Esse uso é diferente de なかなか〜ない (N4), que significa "custa a", "não... de jeito nenhum". A diferença está na frase: afirmativa = "bastante"; negativa = "custa a".

Um detalhe cultural: dizer なかなか a um superior pode soar como se você estivesse avaliando a pessoa de cima. Com superiores, é melhor usar elogios mais respeitosos.$$,
    $$A expressão なかなかやるね significa "você manda bem, hein" e é um elogio informal.

なかなかの + substantivo, como なかなかの腕前, significa "uma habilidade considerável".

Comparado a とても, なかなか soa um pouco mais reservado, como "melhor do que eu esperava".$$,
    $$なかなか + Adjetivo (afirmativo)
なかなか + Substantivo / Adjetivo な + だ
なかなかの + Substantivo (algo notável)
なかなか + Verbo (やる / できる)$$,
    $$なかなか$$,
    $$なかなか$$,
    ARRAY['なかなか']::text[],
    ARRAY['なかなか', 'なかなかの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-67', $$この料理はなかなかおいしいですね。$$, $$このりょうりはなかなかおいしいですね。$$, $$Esta comida é bem gostosa, hein.$$),
    ('n3-grammar-67', $$彼の日本語はなかなか上手だ。$$, $$かれのにほんごはなかなかじょうずだ。$$, $$O japonês dele é bastante bom.$$),
    ('n3-grammar-67', $$昨日の映画はなかなかおもしろかった。$$, $$きのうのえいがはなかなかおもしろかった。$$, $$O filme de ontem foi bem interessante.$$),
    ('n3-grammar-67', $$新しい仕事はなかなか大変です。$$, $$あたらしいしごとはなかなかたいへんです。$$, $$O novo trabalho é bem puxado.$$),
    ('n3-grammar-67', $$一人で全部作ったの？君もなかなかやるね。$$, $$ひとりでぜんぶつくったの？きみもなかなかやるね。$$, $$Você fez tudo sozinho? Você manda bem, hein.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この本は____おもしろい。$$, $$Este livro é bem interessante.$$),
        (2, $$初めてにしては、____上手ですね。$$, $$Para a primeira vez, está bem bom, hein.$$),
        (3, $$この問題は____難しいですね。$$, $$Esta questão é bem difícil, né?$$),
        (4, $$会議で、彼女は____いいアイデアを出した。$$, $$Na reunião, ela deu uma ideia bem boa.$$),
        (5, $$あの店のラーメンは____のものだ。$$, $$O ramen daquela loja é algo notável.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なかなか$$),
        (2, $$なかなか$$),
        (3, $$なかなか$$),
        (4, $$なかなか$$),
        (5, $$なかなか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

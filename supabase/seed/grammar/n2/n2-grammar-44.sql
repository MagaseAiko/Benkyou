-- n2-grammar-44 — 〜甲斐がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-44',
    'grammar',
    'N2',
    $$〜甲斐がある$$,
    $$kai ga aru$$,
    $$Valer a pena / Ter valido o esforço$$,
    $$甲斐がある é usado para dizer que um esforço valeu a pena, porque trouxe o resultado esperado. Equivale a "valer a pena" ou "ter valido o esforço".

甲斐 (かい) significa "valor", "resultado do esforço". Assim, a estrutura indica que a ação feita teve um retorno positivo.

Ela vem depois do verbo na forma た e de substantivos com の. Na forma て (甲斐があって), liga-se ao resultado positivo: "estudei muito e valeu a pena: passei na prova".

Na forma negativa, 甲斐がない ou 甲斐もなく significa "não valeu a pena" ou "em vão".

Combinada com verbos, かい também forma palavras como 生きがい (razão de viver) e やりがい (motivação, algo que vale a pena fazer). Nesses casos, a leitura vira がい.$$,
    $$やりがいがある (ser gratificante) é muito usado para falar de trabalhos e atividades.

O kanji 甲斐 é difícil e muitas vezes é escrito em hiragana: かい.

甲斐もなく (N1) aparece em frases como 努力の甲斐もなく ("apesar de todo o esforço, em vão").$$,
    $$Verbo na forma た + 甲斐がある / 甲斐があった
Verbo た + 甲斐があって、 + Resultado positivo
Substantivo + の + 甲斐がある
Negativo: 甲斐がない / 甲斐もなく

Escrita: 甲斐 / かい$$,
    $$甲斐がある$$,
    $$甲斐があ|かいがあ|甲斐もな|かいもな|甲斐がな|かいがな$$,
    ARRAY['甲斐', 'が', 'ある']::text[],
    ARRAY['甲斐がある', '甲斐があった', '甲斐があって', 'かいがある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-44', $$一生懸命勉強した甲斐があって、合格できた。$$, $$いっしょうけんめいべんきょうしたかいがあって、ごうかくできた。$$, $$Estudei muito e valeu a pena: consegui passar.$$),
    ('n2-grammar-44', $$早起きした甲斐があって、きれいな日の出が見られた。$$, $$はやおきしたかいがあって、きれいなひのでがみられた。$$, $$Valeu a pena acordar cedo: vi um nascer do sol lindo.$$),
    ('n2-grammar-44', $$ついに完成した。苦労した甲斐があった。$$, $$ついにかんせいした。くろうしたかいがあった。$$, $$Finalmente ficou pronto. Todo o sofrimento valeu a pena.$$),
    ('n2-grammar-44', $$長い時間待った甲斐がなかった。$$, $$ながいじかんまったかいがなかった。$$, $$Não valeu a pena esperar tanto tempo.$$),
    ('n2-grammar-44', $$毎日練習した甲斐があって、試合に勝った。$$, $$まいにちれんしゅうしたかいがあって、しあいにかった。$$, $$Treinar todo dia valeu a pena: vencemos a partida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一年間準備した____、イベントは成功した。$$, $$Um ano de preparação valeu a pena: o evento foi um sucesso.$$),
        (2, $$遠くまで来た____た。景色が最高だ。$$, $$Valeu a pena vir até aqui. A paisagem é incrível.$$),
        (3, $$頑張った____、昇進できた。$$, $$Me esforcei e valeu a pena: fui promovido.$$),
        (4, $$毎日ピアノを練習した____、上手になった。$$, $$Praticar piano todo dia valeu a pena: melhorei bastante.$$),
        (5, $$せっかく作ったのに、誰も食べなかった。作った____なかった。$$, $$Fiz com tanto cuidado, mas ninguém comeu. Não valeu a pena ter feito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$甲斐があって$$),
        (1, $$かいがあって$$),
        (2, $$甲斐があっ$$),
        (2, $$かいがあっ$$),
        (3, $$甲斐があって$$),
        (3, $$かいがあって$$),
        (4, $$甲斐があって$$),
        (4, $$かいがあって$$),
        (5, $$甲斐が$$),
        (5, $$かいが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

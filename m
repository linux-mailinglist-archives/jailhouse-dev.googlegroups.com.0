Return-Path: <jailhouse-dev+bncBCQMBAXW7MPBBKESRSMQMGQEHIPW7JA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EEF5B9968
	for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Sep 2022 13:14:50 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id o21-20020a056512053500b0049c6aae1c40sf2074285lfc.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Sep 2022 04:14:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663240490; cv=pass;
        d=google.com; s=arc-20160816;
        b=S50F/zb0tQ9uTlvEaOB68mlCzJXT6Gh5+BqBHavzqlGAPB39bOsbiqsE5l02gyJlMz
         Q8qReAQMcrGBBuutYHqgr7LWNgnf5heeqwqEOE7GCIy4ibIfH8wKlE2cga6nqfh4pfjT
         zrsEchDkjcluAOAOM+Di3hzbjbsUL+Pj3izzEOTXn3U0XknGJ356pFJ+wPZz0pRedSq6
         0syretMY0/xWYhuXqyc7rV9X/MGy2Crk8yuF4xIpbKokzrWhhbaBh1MJS5VcwqMXj72m
         atW08XX1hpyoDR67lbxEUuPwQo2MOa2TLYXbpxwNrXfmMQDGMwgmnhSISTyjNfWHpo/J
         dgWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=ZyMoPgG2390zzpyJKlidElz9mGJrfEY8QlAEnQ+pkxA=;
        b=mzakW+GNSrM1ohZLgGka0fxKiclT4G10X/fOKadxSWkphnnRTi4ETsquVKqDVbNo8p
         jvE1CMvv3FNmg6krzHMumZC6cVIMvPQLvBpgIqoR5g4CGqGGWEIvYJXI+PmTGcsjHreX
         yqtuLwIX9u3RFcac5NsDoGEaspDoHXmLFgqm0MKkyk//hz2kxus/ja6KZ8jvlmv8hfOq
         LUJcjrI7hltJnMdGlKn/dhNnpv+YJ8ynaOshe86ybFzcOersO4DpCMcPK25TYAI/JtM+
         lLhnue08y2S/fCrnyz+JdNenW6vJpK0SoonwMhIoKAAjcMKo3Z2A0/dyXF3AufDmLDQH
         rl5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SBfynKKh;
       spf=pass (google.com: domain of info.michiganfinance@gmail.com designates 2a00:1450:4864:20::12c as permitted sender) smtp.mailfrom=info.michiganfinance@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:sender:from:to:cc:subject:date;
        bh=ZyMoPgG2390zzpyJKlidElz9mGJrfEY8QlAEnQ+pkxA=;
        b=JnW0gaGBTOiTmHo2tU9UWK3LEA9gUAvFAItMJasZPKlfoOClzZofGVNkJ/Jurc2Q80
         SLfPb00gyJ2gzOiAcJHMiKwx7SI3Mbn7kutshhg5y6JoEgR1mhmdUW+/E+9A3Pxf+tHn
         wZb/yKxwbebyVeKhy/eZRU6T0+KmsggB2kxv3/JXshgImZ+C4eYZF6k6l0XdP4wCE+Rs
         +dp5okxSgc/1rGodADec6GvcfYQ6MHI9wACpwsRYfrf8LUbEks0NSpGMvncExYL/vBhb
         5aprhgUKcBPjTYOEyn3j/E4BzpdE6TUdfzBBaIpUrj/la42zNm7o+BzgqLUYHvSMEfDC
         3Mug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=ZyMoPgG2390zzpyJKlidElz9mGJrfEY8QlAEnQ+pkxA=;
        b=TMeIDlbdlxt3M+6xQwUSutpDfPacUGcz7lhSUC98JhSvLTbLFnRSjcLzSh2UfMzNeD
         Rg9iAPpsSHzM5MOKx+LIW+zFuXblfyECXQX+Pq5X46aqZLlCc+8gDpfbaHsoCzzLLLgF
         vvBWESrf8JgWI2cg5JoA7E8zVxQVTXGxPH2jmBXcqrcjN5MBx9P8Eo4C2WoypdxIqd6n
         jd7DBT/Pmbp/XGui/USUmzBT5B4ImS6Ninw3vLzIXp83X5a5vPjOFFbTk4/f/onSHGoE
         U0NiGaweVW3w8dZNA75znzHPPJYgatczeXNRPRLhJ2rztvPupSNMiacE8hB5kUlbstFh
         ousQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:reply-to:mime-version:x-gm-message-state
         :sender:from:to:cc:subject:date;
        bh=ZyMoPgG2390zzpyJKlidElz9mGJrfEY8QlAEnQ+pkxA=;
        b=z/jFiJGVmzuxcJ8PB/A730k7eixt/yzluAnFpmAmsDXSpX1QRRBPoneVArC3D55xO+
         oODtf5snGbFdOvdfoomgcOmC9EP9R7Dv9JrTUqFx1CqPcLfafKggyhmBtzddag9VHZRk
         OJLmd/mIGoBh+lMiOYV2NJhJUp7Ck5do9s/S8yW+8bbyKAhBEy32NoA+GzfoJp0ojICn
         UtW+ipuPSfAAPp4uwrWZgTTqrhTwUp4/LneCH3Gsd8OXP5GpMx6YtZfgOWvRXJpjGy+S
         YGfTm7uWiP9j+VILxWhzZuneT/u5NLPaQij5tGSNKywh9FIKvoEZK5q9kjC6Iv3PMUgl
         msdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf3reLFQIyVu6BOLdgdsDqn7aKEhx7OZPKflYFfT5F5UityKsWd9
	jbMkvzbrRFrnLhY1U/QaAyw=
X-Google-Smtp-Source: AMsMyM4uXnZaIjwUWR6EpxE7q6h/QrTonlVcVHCOuJPWANwUppK9j/Mh9U+I3DyDVTk9OQN8z1rLow==
X-Received: by 2002:a05:6512:a8c:b0:49e:359f:5563 with SMTP id m12-20020a0565120a8c00b0049e359f5563mr1676299lfu.563.1663240490140;
        Thu, 15 Sep 2022 04:14:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:36c9:b0:49b:8c05:71a5 with SMTP id
 e9-20020a05651236c900b0049b8c0571a5ls794369lfs.0.-pod-prod-gmail; Thu, 15 Sep
 2022 04:14:47 -0700 (PDT)
X-Received: by 2002:a05:6512:2384:b0:497:ad1c:799 with SMTP id c4-20020a056512238400b00497ad1c0799mr12139279lfv.294.1663240487698;
        Thu, 15 Sep 2022 04:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663240487; cv=none;
        d=google.com; s=arc-20160816;
        b=eD1uRcBoqvwOH9zfBjUbhh7kF9NFDWbf8hbOZvPGKWTmEM9Ykm0j7OeHLf68D7Jl6N
         Zh4VcxTgxWOt58CXCfhR4CidENK4WPlPUYiIwM8+3w5Iwdf13DkZobxG11WtgVyBAyl+
         D6NZ7wJN6vix76SZpwUhGRNEr+a+Ft7pvpOdfVSR3nMXjAZ2tvSgwARc2fyEoPIiNHz3
         6oeiyJHEJV5TQ3cZ/XYqeCTJ89f8GjZdBS2KP1NJVBeN+iHmDAnfZYcZQz4ecg+4Y8re
         Iu9SKpLM3QgXNRWI1Dz5Z8omVgxzGM6H+eqqwcvzs9p/UkGemTgENH+IvHA7Z4w09OqP
         IF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=ZMjCLejUoKvXlS5mhkrrxI3HnyFiYBTy2exD9jwf+e8=;
        b=r5KcNQ0tCmb/iJfxHClAnFWIHls1TUm4qHiiczkQ6i0Oqcmke+7CDrgu4jBd9/s0Mp
         9a/UoqA07Z3G/P6dd+JMfP+J3AbB0BVCByDABd6iJMtXyDcrEWjqxdqe0mXsJX87TX6W
         8cKnDICLdKpfqvkCobg1r9exFiClDwVtUgm5Eaud6cVfFTYABjEh7yAwL/NXVh277dNC
         XuuDTYXEIero9sdhEo7PRrc0LUYbBMFOjrGofhcsCrPALapVNnrwCbn/XYegKqsZm6YK
         GUI+jr1P/ebCowF6Te2vP9dirQQiiPcdSdAMXn62gLiSqFn0V0zbbQ4pTOKjMFxdoZkm
         F5Bw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SBfynKKh;
       spf=pass (google.com: domain of info.michiganfinance@gmail.com designates 2a00:1450:4864:20::12c as permitted sender) smtp.mailfrom=info.michiganfinance@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com. [2a00:1450:4864:20::12c])
        by gmr-mx.google.com with ESMTPS id o16-20020a05651205d000b00499b6fc70ecsi441811lfo.1.2022.09.15.04.14.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 04:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of info.michiganfinance@gmail.com designates 2a00:1450:4864:20::12c as permitted sender) client-ip=2a00:1450:4864:20::12c;
Received: by mail-lf1-x12c.google.com with SMTP id f14so28850668lfg.5
        for <jailhouse-dev@googlegroups.com>; Thu, 15 Sep 2022 04:14:47 -0700 (PDT)
X-Received: by 2002:a05:6512:4024:b0:497:4db:6ad0 with SMTP id
 br36-20020a056512402400b0049704db6ad0mr14182046lfb.637.1663240487470; Thu, 15
 Sep 2022 04:14:47 -0700 (PDT)
MIME-Version: 1.0
Reply-To: contact.creamfinance@gmail.com
From: Cream finance <info.michiganfinance@gmail.com>
Date: Thu, 15 Sep 2022 12:14:36 +0100
Message-ID: <CA+ymumKEiBa9RCREz5fvTaPUmGoq-cWk2H66bC0DhLwCAnufSQ@mail.gmail.com>
Subject: Kreditangebot(e)
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000006e8b5b05e8b55a5d"
X-Original-Sender: info.michiganfinance@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=SBfynKKh;       spf=pass
 (google.com: domain of info.michiganfinance@gmail.com designates
 2a00:1450:4864:20::12c as permitted sender) smtp.mailfrom=info.michiganfinance@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

--0000000000006e8b5b05e8b55a5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
Wie war dein Tag und wie geht es dir jetzt?
Ich habe Ihre Anzeigen mit der Bitte um einen Kredit gesehen.
Ich bin Aleksander Jakub von der Cream Finance Corporation.

Wir bieten Darlehen mit einem Zinssatz von 4 % f=C3=BCr Laufzeiten zwischen=
 1
und 30 Jahren an.
Unser Darlehenslimit liegt zwischen 1.000 =E2=82=AC und 10.000.000 =E2=82=
=AC und wir k=C3=B6nnen
Ihnen jedes gew=C3=BCnschte Darlehen geben, wenn es in unserer Kapazit=C3=
=A4t liegt.
Ich freue mich darauf, mit Ihnen zu arbeiten.
Ich warte auf Ihre Antwort.

Gr=C3=BC=C3=9Fe
Herr Aleksander Jakub

cream finances
www.creamfinance.com
contact.creamfinance@gmail.com
16, Dompl. 2, 2700 Wiener Neustadt, Austria

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2BymumKEiBa9RCREz5fvTaPUmGoq-cWk2H66bC0DhLwCAnufSQ%40mail.=
gmail.com.

--0000000000006e8b5b05e8b55a5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Hi</div><d=
iv>Wie war dein Tag und wie geht es dir jetzt?</div><div>Ich habe Ihre Anze=
igen mit der Bitte um einen Kredit gesehen.</div><div>Ich bin Aleksander Ja=
kub von der Cream Finance Corporation.</div><div><br></div><div>Wir bieten =
Darlehen mit einem Zinssatz von 4 % f=C3=BCr Laufzeiten zwischen 1 und 30 J=
ahren an.</div><div>Unser Darlehenslimit liegt zwischen 1.000 =E2=82=AC und=
 10.000.000 =E2=82=AC und wir k=C3=B6nnen Ihnen jedes gew=C3=BCnschte Darle=
hen geben, wenn es in unserer Kapazit=C3=A4t liegt.</div><div>Ich freue mic=
h darauf, mit Ihnen zu arbeiten.</div><div>Ich warte auf Ihre Antwort.</div=
><div><br></div><div>Gr=C3=BC=C3=9Fe</div><div>Herr Aleksander Jakub</div><=
div><br></div><div><div>cream finances</div><div><a href=3D"http://www.crea=
mfinance.com" target=3D"_blank">www.creamfinance.com</a></div><div><a href=
=3D"mailto:contact.creamfinance@gmail.com" target=3D"_blank">contact.creamf=
inance@gmail.com</a></div><div>16, Dompl. 2, 2700 Wiener Neustadt, Austria<=
/div></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2BymumKEiBa9RCREz5fvTaPUmGoq-cWk2H66bC0DhLwCAnu=
fSQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CA%2BymumKEiBa9RCREz5fvTaPUmGoq-cWk2H66bC=
0DhLwCAnufSQ%40mail.gmail.com</a>.<br />

--0000000000006e8b5b05e8b55a5d--

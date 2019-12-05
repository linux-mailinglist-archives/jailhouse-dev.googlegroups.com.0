Return-Path: <jailhouse-dev+bncBCVKRBX6ZUARBLNGUPXQKGQEG56FEKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3c.google.com (mail-yw1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EA113E8D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 10:51:43 +0100 (CET)
Received: by mail-yw1-xc3c.google.com with SMTP id 16sf1994447ywz.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 01:51:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575539501; cv=pass;
        d=google.com; s=arc-20160816;
        b=S5eASivkiUEKp09BkUfl4sBQLayDDOaWLYvtPY1tMA0IM9GLHvk8etVBOryoVJNqWq
         oJMDerHEERHuFwccEUKiUxMl/hjt0q1e7ysi0mXxbwZkYlSfLnqObeN0fHZ4yMjAcs5M
         ogPh/RoGv5vs67wTlcOQlhSd7/7+GgURXKoZ/vBAtOMdrGvWQ6mdgtulhYyfO6fbie0f
         noYkauCBL598b60uZgoHjWCcXtqOKudztHqzn35oBnxuGIBSbWFAhSXH4O+5K3UxeAN/
         yCGZuT4Ff2sodAstpNB9aKpyWbpqSuRPS9nfrPxrGb2TsSTJi2MLgekGVumL0yzEFKr5
         MYkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=QFqdXk/zaFnohDlkAyLLHSl6HnPIuEhnZ2OvyTEW+Nc=;
        b=fMJi8nCHobevlbPdQo/5D9UtTzuhbQEUVS/RkvX6ds8z/gLx/SZ1eiz/i1Adbq5cJD
         1L7H9Jv65egfD47LhwukvkKWFjZf1HV7WVkTdFuK8cyLoyKYTWcIYsOJNunV+maDOvQP
         4PU2keNodjM755/AaFEzaQ4LcV5llvZhP1TIxsxdttbIXB2XKWoIxpmVsowOjLWBecpS
         qm/4y0j9KqZs6ZWYHQnlP8dv1pe+8Y+YacgPMW2ijH5uHJ34ob+etxlUJduHqOy4q620
         9SowCIYsqJIklyo5T2sPFmW0sdS+Kph86PXiLZwI/6jt9fsXht2lFAdZy26azN9k1+cp
         O2xQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GAfkb8Sf;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::331 as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QFqdXk/zaFnohDlkAyLLHSl6HnPIuEhnZ2OvyTEW+Nc=;
        b=P1zujI473zs6NKwkbOQOYDvVv/118iFa/cQQVEx4Z4A7HnF+dB9uyd6RypoHc8F9Rk
         OiqQbHHXEDq88ce8sgy4g8zLb8mnV0hKnlmo+bo3YsPdIon9ChyAjjuAhkIuBEBj0HHf
         i7HQHtY6ZBOrh40b52p9OW6QWdEDzb5nMVP1+nqUrG30+CuWedwwMW3g/uJqZkaaiDAq
         dqFt7h5JgA1kFrdwKd2tLfKo0lmbtxHsIyFA6yWaQJqHlYw+DBXuxUh3YDu/d0pnXhJx
         UlcmBoM9f8KyEtEEP76djCZnusg5GusYO2cnU6S21MczSX5dco+O0qsaGhM+9RykXuAA
         zWbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QFqdXk/zaFnohDlkAyLLHSl6HnPIuEhnZ2OvyTEW+Nc=;
        b=hu1c1GdbaGEbkV4GPv26m07FP7dbgMqRRo/DAlmiQzw8KzraSo9z2zTpqtjxar9Y9o
         QvZRRDxNj79eQ3RXp3lm+dHNzbNGPa5Q3lVNuUzMupuxbbtEd+my0p5YKlmjsvHo53If
         wBKYnm1ktB81eJU1PCH9u+3FJI+ZisJgk2ZZ8JYIrnknOTpNxJEVqdXO9ytd+EQcdOIp
         aLbMPm3O3cI4pVK7iYwZvx4QaEah6GDkXuv0a9On1zwsgX1RAf2lxBdhzH6bDn/J/xhs
         sS8VBd3LswJvRkpMRGAQU2AO+LxuuU6FH/zmlvWpbjsnueSN0Kj/aRBhFEvRzdIO5o3J
         0qTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QFqdXk/zaFnohDlkAyLLHSl6HnPIuEhnZ2OvyTEW+Nc=;
        b=WnRzmBxuxkIlJ53yygFZ1iJOB1N2k3xCwm779N8sXYRzaWg4Iud5eJoYgkUYrW4oJo
         s7obhQumpENTc5ZFHNAH7XEipIqIs+oUUUn1dnTI8Btjd4cShGixPs8hKCFr4dTlbsUY
         qJa5SDYnwWBgIXab0gXeoYP9HJXbQTv8VwVcQjfopNwuiznyGjMKPkzM/Jk5fSM2pjSl
         oTWOxXJwaLxI+YQOHaX03JS68+m+7GR+GcBOJ36zSbf7LewPWloWP20J27lyotyi5jUO
         IX4VJSYNtd4yO2SkPWmIy0n1Ek2i2zT+uVQNDzlS/QSfRsHImFYeAt6KfVIvB/FFEwxu
         Olpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWnmuqydH5G93Zw3V71M18ZNs28+AdU6PysfPpeZJUxQ8RxTHZp
	Hh3aeSqNnAauzynppwXffRI=
X-Google-Smtp-Source: APXvYqzyZYbYhq0pTs0ZZ9gCy2/9rPdFoVrlh14ZyyHxgyH4jKcasF0wWyaEOSFguYyLCi5GZHcvfQ==
X-Received: by 2002:a25:dc86:: with SMTP id y128mr5140026ybe.126.1575539501663;
        Thu, 05 Dec 2019 01:51:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8488:: with SMTP id v8ls368053ybk.14.gmail; Thu, 05 Dec
 2019 01:51:41 -0800 (PST)
X-Received: by 2002:a25:b219:: with SMTP id i25mr5497141ybj.195.1575539501139;
        Thu, 05 Dec 2019 01:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575539501; cv=none;
        d=google.com; s=arc-20160816;
        b=Mk8Y2koF9UD1VLa6DFTZnHlCioxVamrFoG++e8gMD2lmDz0kWs1Ksj7WVgEXqyrSlk
         TzaQenKVSsmx0CI8uUrlWZH2lrWY4lSId2DVS9/WiAy39RRvZ+0d/ZOspT08/BX2gZIK
         89NsAPcv56OghFDmDfeGD+SbY5NcriXq6E25Kc9LDNRJmutRojILoiwYargUnggCHYnH
         UnoPG71b7uxy8lAnNV2W/E7GrvqpuZL/5+/7J3qNQdfGaSssGNC3WBkEyEwHah2OHVH/
         sQ+2n4cojpurJQUKXPlx9456jAr9uUxBdPQkkOoQ9IanYjGgoUobo65RjCf4gE3KuMGK
         eO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iQwcLj0uhzajPsMoOcV7MqpWbIW84w9M8S5RcrtkQk=;
        b=P5kQiJ2djGPyfKfqG5PW29yuSWYpgkbqvZffCWDeZM8NRpvdvc4+j4ZtDMJDlNtIWg
         bnsEmD1sKERJLLSIaXKmkXCR37+eqq6VutGOV9zNi6hUyecYnJcTimlgkHtkrLDG08u9
         OEfDLLMGv41KRJe76FAx+W7/ODkWM6dlcW3zvJcctGMGKUWZEPHALlWxOq8Oz8zq8M2z
         MKtTSJf3J+l1yTFc5qMmSM5Kb/Jn12ojeOh/CiUTAsnlWc75dZg7MgSmBGHESlyTszKv
         ZZNZEPeCTuTAM4CNJ/Bs0lO+Om5mVGClthwpqjqhK+GscbPLh/Zu4UsprIIBYTWmADnq
         c0iQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GAfkb8Sf;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::331 as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com. [2607:f8b0:4864:20::331])
        by gmr-mx.google.com with ESMTPS id n82si379155yba.1.2019.12.05.01.51.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 01:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::331 as permitted sender) client-ip=2607:f8b0:4864:20::331;
Received: by mail-ot1-x331.google.com with SMTP id k14so2069237otn.4
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Dec 2019 01:51:41 -0800 (PST)
X-Received: by 2002:a9d:7590:: with SMTP id s16mr5500017otk.89.1575539500675;
 Thu, 05 Dec 2019 01:51:40 -0800 (PST)
MIME-Version: 1.0
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com> <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
 <DB7PR04MB4490F52695B91268CBB45E78885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <CANBTL1VejvQBVCyjBRezpcZ4oLAue=Nbh2A0pCQfyt3Uo8Sa+Q@mail.gmail.com>
In-Reply-To: <CANBTL1VejvQBVCyjBRezpcZ4oLAue=Nbh2A0pCQfyt3Uo8Sa+Q@mail.gmail.com>
From: Mani Sadhasivam <manivannanece23@gmail.com>
Date: Thu, 5 Dec 2019 15:21:29 +0530
Message-ID: <CANBTL1Ux+0_GjkP4LjMOR0Rcc61wyc-U6=J7pnydrJHFEudpNA@mail.gmail.com>
Subject: Re: Zephyr as a Jailhouse inmate
To: Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000044778a0598f1e0f4"
X-Original-Sender: manivannanece23@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=GAfkb8Sf;       spf=pass
 (google.com: domain of manivannanece23@gmail.com designates
 2607:f8b0:4864:20::331 as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
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

--00000000000044778a0598f1e0f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ mailing list

On Thu, Dec 5, 2019 at 2:52 PM Mani Sadhasivam <manivannanece23@gmail.com>
wrote:

> Hi Peng,
>
> On Thu, Dec 5, 2019 at 2:14 PM Peng Fan <peng.fan@nxp.com> wrote:
>
>> Sorry for top post.
>>
>> Would you mind share what products would you use i.MX8M EVK for?
>>
>
> It is just a spare time project I'm doing for fun.
>
>
>>
>> Also Could you please share the armv8 PR for zephyr?
>>
>
> https://github.com/zephyrproject-rtos/zephyr/pull/20263
>
> Thanks,
> Mani
>
>
>>
>> Thanks,
>> Peng.
>>
>> From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> On
>> Behalf Of Mani Sadhasivam
>> Sent: 2019=E5=B9=B412=E6=9C=885=E6=97=A5 15:14
>> To: Jan Kiszka <jan.kiszka@siemens.com>
>> Cc: Jailhouse <jailhouse-dev@googlegroups.com>
>> Subject: Re: Zephyr as a Jailhouse inmate
>>
>> Hi Jan,
>>
>> On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka <mailto:jan.kiszka@siemens.co=
m>
>> wrote:
>> On 02.12.19 19:43, Manivannan Sadhasivam wrote:
>> > Hello,
>> >
>> > I can see that the Zephyr RTOS has been mentioned in the FAQ as
>> > one of the ported OS for non-root cells.
>> >
>> > Is there any reference code I can look into?
>>
>> There is x86 support for Zephyr as Jailhouse "inmate". Check out
>> zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you run into trouble,
>> report to the communities.
>>
>> Ah, just noticed that it got removed some time ago:
>>
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fzephyrproject-rtos%2Fzephyr%2Fcommit%2Ff3611fdd0c8ca54a9f19bc56a14=
b4a2fdadaffe3%23diff-bb9445fa64739ef6a5a6b59d520deb07&data=3D02%7C01%7Cpeng=
.fan%40nxp.com%7C3e79e9ef68d24b68d9b808d77952bcf3%7C686ea1d3bc2b4c6fa92cd99=
c5c301635%7C0%7C0%7C637111268572956815&sdata=3D8SkuxLhNQarhgoTD8u1%2BvD6HJt=
Byb%2BNhaTxiUbGIDIw%3D&reserved=3D0
>>
>> But this could be helpful!
>>
>>
>> We could probably also easily support ARM, but the last time this
>> question came up, there was still not A-core support in Zephyr which is
>> a precondition.
>>
>> That's what I'm trying to do on IMX8M EVK in spare time. There is an
>> ongoing
>> PR for adding Cortex-A support in Zephyr, so I'm planning to utilize tha=
t.
>>
>> Thanks,
>> Mani
>>
>>
>> Jan
>>
>> --
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>>
>>
>>
>> --
>> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>> --
>> You received this message because you are subscribed to the Google Group=
s
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n
>> email to mailto:jailhouse-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgrou=
ps.google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCANBTL1VsEGSiqZe5SG4EQ3sn4KbcvK=
QqYLERCT-NbqxZK5ZBKQ%2540mail.gmail.com%3Futm_medium%3Demail%26utm_source%3=
Dfooter&data=3D02%7C01%7Cpeng.fan%40nxp.com%7C3e79e9ef68d24b68d9b808d77952b=
cf3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637111268572966810&sdata=
=3DCoOfSEdyP2GQjOiwCvjWQ9UlrD0vqtKTYuaeSYca96k%3D&reserved=3D0
>> .
>>
>
>
> --
>
> *=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D*
>
>

--=20

*=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D*

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CANBTL1Ux%2B0_GjkP4LjMOR0Rcc61wyc-U6%3DJ7pnydrJHFEudpNA%40mai=
l.gmail.com.

--00000000000044778a0598f1e0f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ mailing list<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 2:52 PM Mani Sadh=
asivam &lt;<a href=3D"mailto:manivannanece23@gmail.com">manivannanece23@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Peng,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 2:14=
 PM Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_blank">peng=
.fan@nxp.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Sorry for top post.<br>
<br>
Would you mind share what products would you use i.MX8M EVK for?<br></block=
quote><div><br></div><div>It is just a spare time project I&#39;m doing for=
 fun.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Also Could you please share the armv8 PR for zephyr?<br></blockquote><div><=
br></div><div><a href=3D"https://github.com/zephyrproject-rtos/zephyr/pull/=
20263" target=3D"_blank">https://github.com/zephyrproject-rtos/zephyr/pull/=
20263</a><br></div><div><br></div><div>Thanks,</div><div>Mani</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Peng.<br>
<br>
From: <a href=3D"mailto:jailhouse-dev@googlegroups.com" target=3D"_blank">j=
ailhouse-dev@googlegroups.com</a> &lt;<a href=3D"mailto:jailhouse-dev@googl=
egroups.com" target=3D"_blank">jailhouse-dev@googlegroups.com</a>&gt; On Be=
half Of Mani Sadhasivam<br>
Sent: 2019=E5=B9=B412=E6=9C=885=E6=97=A5 15:14<br>
To: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_bla=
nk">jan.kiszka@siemens.com</a>&gt;<br>
Cc: Jailhouse &lt;<a href=3D"mailto:jailhouse-dev@googlegroups.com" target=
=3D"_blank">jailhouse-dev@googlegroups.com</a>&gt;<br>
Subject: Re: Zephyr as a Jailhouse inmate<br>
<br>
Hi Jan,<br>
<br>
On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka &lt;mailto:<a href=3D"mailto:jan=
.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt; wrote=
:<br>
On 02.12.19 19:43, Manivannan Sadhasivam wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I can see that the Zephyr RTOS has been mentioned in the FAQ as<br>
&gt; one of the ported OS for non-root cells.<br>
&gt; <br>
&gt; Is there any reference code I can look into?<br>
<br>
There is x86 support for Zephyr as Jailhouse &quot;inmate&quot;. Check out<=
br>
zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you run into trouble,<br>
report to the communities.<br>
<br>
Ah, just noticed that it got removed some=C2=A0time ago:<br>
<a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgithub.com%2Fzephyrproject-rtos%2Fzephyr%2Fcommit%2Ff3611fdd0c8ca54a9f1=
9bc56a14b4a2fdadaffe3%23diff-bb9445fa64739ef6a5a6b59d520deb07&amp;data=3D02=
%7C01%7Cpeng.fan%40nxp.com%7C3e79e9ef68d24b68d9b808d77952bcf3%7C686ea1d3bc2=
b4c6fa92cd99c5c301635%7C0%7C0%7C637111268572956815&amp;sdata=3D8SkuxLhNQarh=
goTD8u1%2BvD6HJtByb%2BNhaTxiUbGIDIw%3D&amp;reserved=3D0" rel=3D"noreferrer"=
 target=3D"_blank">https://eur01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fgithub.com%2Fzephyrproject-rtos%2Fzephyr%2Fcommit%2Ff3611fdd0c8=
ca54a9f19bc56a14b4a2fdadaffe3%23diff-bb9445fa64739ef6a5a6b59d520deb07&amp;d=
ata=3D02%7C01%7Cpeng.fan%40nxp.com%7C3e79e9ef68d24b68d9b808d77952bcf3%7C686=
ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637111268572956815&amp;sdata=3D8Sku=
xLhNQarhgoTD8u1%2BvD6HJtByb%2BNhaTxiUbGIDIw%3D&amp;reserved=3D0</a><br>
<br>
But this could be helpful!<br>
=C2=A0<br>
<br>
We could probably also easily support ARM, but the last time this<br>
question came up, there was still not A-core support in Zephyr which is<br>
a precondition.<br>
<br>
That&#39;s what I&#39;m trying to do on IMX8M EVK in spare time. There is a=
n ongoing<br>
PR for adding Cortex-A support in Zephyr, so I&#39;m planning to utilize th=
at.<br>
<br>
Thanks,<br>
Mani<br>
=C2=A0<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
<br>
<br>
<br>
-- <br>
=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=
=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=
=AF=8D<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.c=
om" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://eur01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroups.google.com%2Fd%2Fmsgid%=
2Fjailhouse-dev%2FCANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ%2540m=
ail.gmail.com%3Futm_medium%3Demail%26utm_source%3Dfooter&amp;data=3D02%7C01=
%7Cpeng.fan%40nxp.com%7C3e79e9ef68d24b68d9b808d77952bcf3%7C686ea1d3bc2b4c6f=
a92cd99c5c301635%7C0%7C0%7C637111268572966810&amp;sdata=3DCoOfSEdyP2GQjOiwC=
vjWQ9UlrD0vqtKTYuaeSYca96k%3D&amp;reserved=3D0" rel=3D"noreferrer" target=
=3D"_blank">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgroups.google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCANBTL1VsEGSiqZe5SG4EQ=
3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ%2540mail.gmail.com%3Futm_medium%3Demail%26utm=
_source%3Dfooter&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C3e79e9ef68d24b68=
d9b808d77952bcf3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371112685729=
66810&amp;sdata=3DCoOfSEdyP2GQjOiwCvjWQ9UlrD0vqtKTYuaeSYca96k%3D&amp;reserv=
ed=3D0</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><pre dir=3D"ltr" style=3D"border:none;p=
adding:0px 0.14em 0px 0px;margin-top:0px;margin-bottom:0px;font-family:inhe=
rit;overflow:hidden;width:275px;white-space:pre-wrap;height:36px;line-heigh=
t:36px"><span lang=3D"ta"><i><font color=3D"#444444">=E0=AE=AE=E0=AE=A3=E0=
=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=AF=8D =E0=AE=9A=E0=
=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=8D</font></i></sp=
an></pre></div></div></div></div></div></div></div></div></div></div></div>=
</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><pre dir=3D"l=
tr" style=3D"border:none;padding:0px 0.14em 0px 0px;margin-top:0px;margin-b=
ottom:0px;font-family:inherit;overflow:hidden;width:275px;white-space:pre-w=
rap;height:36px;line-height:36px"><span lang=3D"ta"><i><font color=3D"#4444=
44">=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D</font></i></span></pre></div></div></div></div></div></div></d=
iv></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANBTL1Ux%2B0_GjkP4LjMOR0Rcc61wyc-U6%3DJ7pnydrJHFE=
udpNA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CANBTL1Ux%2B0_GjkP4LjMOR0Rcc61wyc-U6%3D=
J7pnydrJHFEudpNA%40mail.gmail.com</a>.<br />

--00000000000044778a0598f1e0f4--

Return-Path: <jailhouse-dev+bncBCVKRBX6ZUARBRW4ULXQKGQE46AKM6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 60165113C2A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 08:14:16 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id p3sf1497979qvt.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Dec 2019 23:14:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575530055; cv=pass;
        d=google.com; s=arc-20160816;
        b=ojfNpYnU7KESjYy8PYjZfYD+UjaQanIrHE36OqTZ90NO/tmkPqN3hEYAUnuRJC3T7+
         idVevM5JDxcEekWU2uXqkKXwElJ62Y7R/9jYwVISbH1Dn9rpHZeeeh/aXvh9ZVGMO3iC
         dPPraUvKgHyLs4qSEmZ7kLhl0mrKnO1AKd+7U8pnIy1XcpvZwfb6s7ibkBDE8irdFZGh
         eG8rKOKPtAxEATwe0xT+a8piCJ5NhIbo0VY3FrTmAaBaN6hIqrCjmSTE1lYTfUEgEqQW
         C9Qrf5OxiphbdbTUdCfA90AH4yWBqvKP01kZr57uHguTm8ECRRF8XqHosNSXmq7DdjEc
         duzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=jdSS8k4GrhpFuchgxFWLuGVhMZq7lPXWtiVPneLxO70=;
        b=XceWnaLFenFqwkpi/dUCSX0bsY4EqO25aUOJvSqHEG/2TuraPX78byFn8SuUkxWb+e
         1paKUDSPtECcmzW3RES+rY/puLlOq5NLJR+3NiUcYuVObEkh7+P6TjdbpGIHRUwXE3GG
         +Q5EMHP2Zmsh0dBHOfurdcPiANWBUk413Ua60EOQwaS7g2ZxxFNvawNDZKfTHSW5xHPg
         N1VQD62BDZJ20r8aROoZo0cZ+eLZm7teTVD80SztQn1juKCieTAd2t6ziw1BHDOSpjTd
         3tphaW9Ey0Wbqpkm1w03zi8962RwuivvVZvxliCv1o9jgT8DOgu6q2oAHHwlY/bhzCOx
         ANlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hj6jpp1c;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::334 as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jdSS8k4GrhpFuchgxFWLuGVhMZq7lPXWtiVPneLxO70=;
        b=g2UvxqmZbD0OGBWLsIBp0eDx28IzSz2lT51xMJLtsMe3Rx1dhMMLaZsTtEPcBUnVvx
         sKL+dxKA7gea81m3fDVXY95fPRLu2PmCZJoDJCT/wTTs32GejW0+nY8fQ5rHCQTDB9dg
         I0k9Ps3+2hV4qUY9q1G2IlCFGY+YzZv4TPB7HbFeDWK9Da15SRhayh3EV/W1uFS795zq
         oZajTFFfnMzvEOxbnflkRhOkBJuA/IYkKk28Zx/ZZpRXWgbd6r88H3Odtfwi1j6d5xgV
         stgL0KL3EoyFgno/n0T3WJhoF7gZeKPJA/5SR2jcYcRJwZvYxvwbRth7RXXomQeAJs/R
         cDAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jdSS8k4GrhpFuchgxFWLuGVhMZq7lPXWtiVPneLxO70=;
        b=V9X04zpjw9WmMJAbQPZ5cmVa1mGidx0t94dZoqBSOb7wmHNnmaRlkzq6MkTBjNtUiC
         LvP1YYqJv68LYYT32/4xFFTnvwHRSzlq1BwprBjDBekDnbxNeqM1oLYUgt7tRVnWNUmh
         fDKj2USRgaj216DcwyqqjgNPQru/Z5djngFv5TS4mGp/b7nkUgVzVJSRvutdQgsmtS7l
         9HYjbQ0GqlSjLLaf2ZHE/YuF/vBjLeD4J45g2BINS1fDa+6SsoODg+0L7PX0wFcaIARz
         QGRSgMDRU35YqgXBpQIkJXQSy1hMhOm01SdEn43x9VXNQg5PPQervLqwgR0CuQbpTzEH
         qqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jdSS8k4GrhpFuchgxFWLuGVhMZq7lPXWtiVPneLxO70=;
        b=VmAgOwcy/BwXiAXAtWpSHN6dQAETc2c1U6ivGqlU3hInoHvr8aqrYg3Hn1/GoXdE4k
         F4ERGJsPVbvhsOKlP9zF9gxYR7NxyrqoAB4Y/EYD3fAtvSMiijaZrJbekGc5qMA7E+AK
         6dLmSQJE5SSgOlnwWo8XqPwSauiZwxCDL91LXmm3IOSK+mj6hMQscNaP3brflDK74z/i
         Mf+CvsRDy4UG1NCyk2Rgc8gRnJ6pZWUL1VYuv3Fgqr60SOk8ThzcyWMqfcqX4fQ8aKbN
         Eeto6yrFd4zViTHRZ+MwKKuY+zaYPMg1BTQ6dUOnfwbUhqnuE/KL/Pt5nWKmJtOiV/YV
         qzMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrWlLw25CiGl3L1Icps+GHCqDnN75mRqjrZVaxlCRnAbAsEeey
	N8a4tf1HDrW3TwCAc1tFPgU=
X-Google-Smtp-Source: APXvYqzVsSlFvCaAj/9/LrKTg/ZbIkbrlugvUM3ZQoC85tpShDdLAW9LXE0GZvVIqd1Vkjy69LetWg==
X-Received: by 2002:a37:a496:: with SMTP id n144mr7066991qke.66.1575530055252;
        Wed, 04 Dec 2019 23:14:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:2823:: with SMTP id r32ls679541qtd.9.gmail; Wed, 04 Dec
 2019 23:14:14 -0800 (PST)
X-Received: by 2002:ac8:5346:: with SMTP id d6mr6504352qto.49.1575530054710;
        Wed, 04 Dec 2019 23:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575530054; cv=none;
        d=google.com; s=arc-20160816;
        b=wk8fYZeXdBHgSieILRuN2Y83eM++dzB6nD1jstqxNK7ZJM8R9BUZBZMcfaTXdA+w5R
         8XBZkYZxqzFwJCTiWczIVYCgv36ikthN4Wbgt4X0BjTmsU4JQ7GvGa9OXlFoynb5go3x
         Pxzve+4QBKA9zK8ddABvAU062PP/PoAf8SWMFrIpaR7apSVxnrYOlNFYCuaFio1Qq0iK
         jAr2R0mrpPVjV4vRv0R7R6ajN2+JDaHG+BMh1DZnecFja1YaozWQFJROsG18StKVelFO
         MvsC8NDL0Mwz0MfcBpVtHQP4pAWXKDymqOcZs5LdMbndfCFYE0LDLm0RMrw125SYa6dt
         GMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AsTDcHGrEZFPohQH0p2rUG6YCebBkEH89edwrYoZjYc=;
        b=SsJ7FHZ7D0JQubA0fcvErRsjgNcMf99KIyXapV/BU/PjJoM+ZeWNVjX9bmCYjWyD/E
         8Geb4IbLnBxbXKEaZRXwOHYjEkYwyl5td1u/ToFpFfx32JhNkR9zo18SF9UqGktSmPar
         5bye+9vw7tG1qJfw7Od6IHFJR85mJmPTAZSNo/d1OC0ph5LwAl2oz0gsbOo0FQG3gCxu
         8rIjV3oF931+hOwwsCSWlkxbU6ySTZIdMpUPA76GinpIe+vSBS4aVfF/jFrTTeL4yMJ+
         TgXanTuDVOLYlpuGRBQDYmbXT+82kQFfJAgwAQF2r8gyaV1tudUmTAXdomuBNbRPeDxY
         fcnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hj6jpp1c;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::334 as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com. [2607:f8b0:4864:20::334])
        by gmr-mx.google.com with ESMTPS id l9si456669qkg.5.2019.12.04.23.14.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 23:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::334 as permitted sender) client-ip=2607:f8b0:4864:20::334;
Received: by mail-ot1-x334.google.com with SMTP id 66so1712318otd.9
        for <jailhouse-dev@googlegroups.com>; Wed, 04 Dec 2019 23:14:14 -0800 (PST)
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr5779066otf.170.1575530054063;
 Wed, 04 Dec 2019 23:14:14 -0800 (PST)
MIME-Version: 1.0
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com> <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
In-Reply-To: <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
From: Mani Sadhasivam <manivannanece23@gmail.com>
Date: Thu, 5 Dec 2019 12:44:03 +0530
Message-ID: <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
Subject: Re: Zephyr as a Jailhouse inmate
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000349b580598efade8"
X-Original-Sender: manivannanece23@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Hj6jpp1c;       spf=pass
 (google.com: domain of manivannanece23@gmail.com designates
 2607:f8b0:4864:20::334 as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
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

--000000000000349b580598efade8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 02.12.19 19:43, Manivannan Sadhasivam wrote:
> > Hello,
> >
> > I can see that the Zephyr RTOS has been mentioned in the FAQ as
> > one of the ported OS for non-root cells.
> >
> > Is there any reference code I can look into?
>
> There is x86 support for Zephyr as Jailhouse "inmate". Check out
> zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you run into trouble,
> report to the communities.
>

Ah, just noticed that it got removed some time ago:
https://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc5=
6a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07

But this could be helpful!


>
> We could probably also easily support ARM, but the last time this
> question came up, there was still not A-core support in Zephyr which is
> a precondition.
>

That's what I'm trying to do on IMX8M EVK in spare time. There is an ongoin=
g
PR for adding Cortex-A support in Zephyr, so I'm planning to utilize that.

Thanks,
Mani


>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
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
jailhouse-dev/CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ%40mail.gm=
ail.com.

--000000000000349b580598efade8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jan,</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 12:36 PM Ja=
n Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 02.12.19 19:43, Manivannan Sadhasivam wrote:<br>
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
report to the communities.<br></blockquote><div><br></div><div>Ah, just not=
iced that it got removed some=C2=A0time ago:</div><div><a href=3D"https://g=
ithub.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14b4a2f=
dadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07">https://github.com/zephyrpr=
oject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14b4a2fdadaffe3#diff-bb94=
45fa64739ef6a5a6b59d520deb07</a></div><div><br></div><div>But this could be=
 helpful!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
We could probably also easily support ARM, but the last time this<br>
question came up, there was still not A-core support in Zephyr which is<br>
a precondition.<br></blockquote><div><br></div><div>That&#39;s what I&#39;m=
 trying to do on IMX8M EVK in spare time. There is an ongoing</div><div>PR =
for adding Cortex-A support in Zephyr, so I&#39;m planning to utilize that.=
</div><div><br></div><div>Thanks,</div><div>Mani</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><pre dir=3D"l=
tr" style=3D"border:none;padding:0px 0.14em 0px 0px;margin-top:0px;margin-b=
ottom:0px;font-family:inherit;overflow:hidden;width:275px;white-space:pre-w=
rap;height:36px;line-height:36px"><span lang=3D"ta"><i><font color=3D"#4444=
44">=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D</font></i></span></pre></div></div></div></div></div></div></d=
iv></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBK=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-Nbq=
xZK5ZBKQ%40mail.gmail.com</a>.<br />

--000000000000349b580598efade8--

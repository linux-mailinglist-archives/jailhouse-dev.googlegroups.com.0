Return-Path: <jailhouse-dev+bncBCMYJFG524BBBSENUODAMGQEAWT3HGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D683A83F0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:27:04 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id v3-20020a2e99030000b0290144dc7b6cf0sf6705725lji.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:27:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623770824; cv=pass;
        d=google.com; s=arc-20160816;
        b=OWTYBO+qzrjuqV+HR4VNg1zuLq9BDoxY0aIAk0CHaq/OtYucz7DUv7oXTfbpo3f+t8
         4HaS4AyP6npvowD7PfKKBZ9XWfIKHkO/oTX6py8f8ushzcI8WUxvRQDzpJ/oyW9dThPB
         46kWc7/Qox6VSbsHrtQv/GV7pdgQJpRw93DJWG4xFqpiumgnd2nYu5AI7FJRL+rNwUoX
         Q9HuWLueLd/utsbgEo4g5TFGZJISzqCo6Np06YRd8KQSB1cWf5Hwv7qqchvTfhCui0uY
         DojrQ8uFsF5da/XNu75c9/EmCTNEzGNsNPpKqkm94gDp41F88/xnHKSxFEUr6mxX1nY7
         gNyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=0gdfwTJAo3P2C2Hn3eFZQJdcHUkqd0iSaV7mI9/Kjoo=;
        b=JVQShY4l2jSHjxpoHza36k4C1zN05dSGlihuYApinPiQo4SqikuuVQ+5nvx4WEjXx9
         j7OaA8U3Wm9oU/jRikLcxuwL+xRaTy/n3qLpYNEypn3DGwUtz504Yl+B943Us4lpBOcB
         92fu8B//QE+5BG9aflcvuxkoY1OsNJjJ4yoRbDSAjwDglpkeLuo2BBTKWBEZoNMvojwM
         uvoLz7ZHi4seAxC7qYYt7gVQbbcW020paxW6VKas3mo4zwZkfye7n0kBEgccOmNZLNmN
         x4he8p4Pz1n2t+za1vlzOj+DKnrBjZ5m0TVMYITMc47jH8MM0AnB6cf2N29W6fF2xogO
         0umQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TA6waTaw;
       spf=pass (google.com: domain of nmiliakopoulou@gmail.com designates 2a00:1450:4864:20::12a as permitted sender) smtp.mailfrom=nmiliakopoulou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0gdfwTJAo3P2C2Hn3eFZQJdcHUkqd0iSaV7mI9/Kjoo=;
        b=iO8wIXkZV8mPRcb/+nbk5vl6Ns2KJv1UKhSt3qhEIthc5MYXmCLiFRnog2JX6fw0EG
         pw8ok2cK42/FD+8QJii2L7w1+7yN2YHWDVQqFIaVSM1o6xr1tIX3J80GF7hOga4fwqCn
         I3gMyinkK/LIJkw8DBVThwwN/FJW00Qac4HGVBAg3PpUJHHKF3zbuACwN3aZnUZv+saT
         3IR/+qAwWfJqcJGBIG+bTdla9mjX8MuzFj7OsIIA1wss2AMK6TVX1jBTji9c7Oy44uo8
         lRwumHDdGDbqcL+Y/gkn8L5hj1sQB0ACgGfRJTt17XP63//0jOpu09V7NDmgrB8RHTpt
         m+4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0gdfwTJAo3P2C2Hn3eFZQJdcHUkqd0iSaV7mI9/Kjoo=;
        b=Yp4iSwbFOBh1IdhcvvAtjqn1327SPujb3m/3nooosySEiOuI6GNhz9RrSdUvzmXZD2
         Ib+xW6NmZD3NwafobC3dFZt04gjY8o8wwpgv2CKk3pcmI5Vz4M2E9D8cqTUCLuItTDHG
         qAmUKCyWrYSt99lVC7nbFrkwv+PXDsAXDXatQj9GIr79m+31xc4tPzfrZSdUIUVGgp+/
         2m0fTHLUC1nLaqCJzPdCXvRwubBtl8OYW4G78/EO2xquNAcCcqNWNAZ2rUVnS/Q/OJji
         pKyiUncWzkxz5hCCwvpEGj3rqp7RNivIxFmAtd7uIXLNkR6eBEsm/xDsXvirNYMAPCaG
         OeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0gdfwTJAo3P2C2Hn3eFZQJdcHUkqd0iSaV7mI9/Kjoo=;
        b=CHM9dp+wlQ73lwpvbcpDUOsIjV7g+m3dF8LaPiqTCN40hQDdFtYiTi9xMQn5DRewYT
         SzZJNK3pdE6v6knhEUGhn4nehOES6Cg+U/7Xrp9aXx54mszTpCjfWHpeaEvMfqt12vpV
         X1nDMv2JBTKnZHCCL/Qw714wuc0itjM8RogVP741dk/04zFNKRtHlyns5U7xtzm22xU1
         Ssw9RPU4/cIEwNCGuLkNs3Ex1L2DutjV0ZnSw7zMHMfkjRdYJH/EJaxJZfNVMepaWxuU
         /gtCPQOOwSiSlm2Gx6sFNPSQNhJdoxaXpkLiXdOVQZVWOXS6YC4fenHrBNuc6ZxvI/OZ
         HxHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533a1kB9Aok11adN7S6GlRqxAIO/sADkSbB1HPuDMQKO8dYtgDpb
	FOOG+QwUG0sG8NcBRSePCfE=
X-Google-Smtp-Source: ABdhPJyTEqA1on9khLNA9sA7CMFFW+OMpz7BV4rswJ7iMicmXTtfoFSOhMLtAsyjte/06LyNZQWD8g==
X-Received: by 2002:a05:6512:baa:: with SMTP id b42mr15847242lfv.487.1623770824407;
        Tue, 15 Jun 2021 08:27:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8790:: with SMTP id n16ls4596174lji.11.gmail; Tue, 15
 Jun 2021 08:27:00 -0700 (PDT)
X-Received: by 2002:a2e:b4f5:: with SMTP id s21mr156122ljm.298.1623770820381;
        Tue, 15 Jun 2021 08:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623770820; cv=none;
        d=google.com; s=arc-20160816;
        b=RcgPEf3Iv7HD49U/IFQ3qC5kuGcGBzZlIDQ82mLwZZOueYVP18tuijd4HMxtcWU3HE
         /5NiOuOa1sAbzKlrvbM6MiCOlW1DXuEM4VZxytF1yasPWiim9QL1rg5KsifJjTNPDcrb
         FSHHq6qZm1laELhb70x8067X6KyowH/9rt+XYkVaDzcfRt2Hy8EDy1LoYpwLchZF76iY
         z3jv0g7hOAHm6enSJ/eFwecBUin86B898guVdR8xMxMq0CaF197Pih6nCj1cjTJBRtuq
         21wV5PGVxLrbG8TIawOFWxGYs7KmLD35Hy/BWMhG0iOTiMkjiqrjChpuxbC5lkyQqcIk
         sKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0tuZJNjbRqXoOxIqNfSM73zg7GxU126IypXvf2nxQmw=;
        b=ODHSM5VJeMLRqDp+fMEttAZf3xFCoyy1rHranuD9ZBedOIFwYJWd2HOFd3oRRI5DhT
         hU3GFL09rYZAppogWghJ12GDFjEOL6B6Gn9hiu3tesIrYMqaIugviIhV/GmTYjalGMpw
         bs8tAur5suvMPLmXe0umCfNGI6+W8SHJrUIuIWI5yvxLPtSnbQihnL88x5uourSPuFt1
         PJ3uUsFFKg5N+opTS9hX4+6ziw2vHoiJIsgJ0bZ8Sp1a7pN5b60wnUi/56e/rYppak4t
         x5a6HVJm92E9oVuxFcRS073KsDaL7RLMLFA2CLplfxQ3eARjez02KXdL7NG/yHTicBPk
         ctEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TA6waTaw;
       spf=pass (google.com: domain of nmiliakopoulou@gmail.com designates 2a00:1450:4864:20::12a as permitted sender) smtp.mailfrom=nmiliakopoulou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com. [2a00:1450:4864:20::12a])
        by gmr-mx.google.com with ESMTPS id d3si108314lfl.12.2021.06.15.08.27.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of nmiliakopoulou@gmail.com designates 2a00:1450:4864:20::12a as permitted sender) client-ip=2a00:1450:4864:20::12a;
Received: by mail-lf1-x12a.google.com with SMTP id h4so12833385lfu.8
        for <jailhouse-dev@googlegroups.com>; Tue, 15 Jun 2021 08:27:00 -0700 (PDT)
X-Received: by 2002:a05:6512:ace:: with SMTP id n14mr15507265lfu.368.1623770820091;
 Tue, 15 Jun 2021 08:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw@mail.gmail.com>
In-Reply-To: <CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw@mail.gmail.com>
From: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>
Date: Tue, 15 Jun 2021 18:26:48 +0300
Message-ID: <CAMPOHCk+XF+X5h6MVHfk2qRTX_V45jDBzOAteeQak0w+-LPysA@mail.gmail.com>
Subject: Re: COMMAND ERROR : Unsupported Architecture
To: Prashant Kalikotay <pkali@cimware.in>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000eda14e05c4cf9a4f"
X-Original-Sender: nmiliakopoulou@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=TA6waTaw;       spf=pass
 (google.com: domain of nmiliakopoulou@gmail.com designates
 2a00:1450:4864:20::12a as permitted sender) smtp.mailfrom=nmiliakopoulou@gmail.com;
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

--000000000000eda14e05c4cf9a4f
Content-Type: text/plain; charset="UTF-8"

In  https://github.com/siemens/jailhouse READMe it clearly states that "
On x86, the required hardware capabilities can be validated by running

jailhouse hardware check

"

Yours is arm64 so you simply cannot use this command. It doesn't seem
there is a problem I assume. Try to enable jailhouse and see what
happens.

Nikoleta


On Tue, Jun 15, 2021, 6:13 PM Prashant Kalikotay <pkali@cimware.in> wrote:

> Dear all,
>                I have successfully installed Jailhouse in arm64 based
> CentOS machine.  Make and Make install did not fail. However when I run the
> command
> $jailhouse hardware check
> Output is
> Unsupported architecture
>
> Does this mean jailhouse does not work with my hardware platform? Or how
> do I resolve it?
>
> Thank you
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw%40mail.gmail.com?utm_medium=email&utm_source=footer>
> .
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMPOHCk%2BXF%2BX5h6MVHfk2qRTX_V45jDBzOAteeQak0w%2B-LPysA%40mail.gmail.com.

--000000000000eda14e05c4cf9a4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p style=3D"margin-top:0px;margin-bottom:16px;color:rgb(3=
6,41,46);font-family:-apple-system,blinkmacsystemfont,&quot;segoe ui&quot;,=
helvetica,arial,sans-serif,&quot;apple color emoji&quot;,&quot;segoe ui emo=
ji&quot;;font-size:16px;background-color:rgb(255,255,255)">In=C2=A0 <a href=
=3D"https://github.com/siemens/jailhouse">https://github.com/siemens/jailho=
use</a> READMe it clearly states that &quot;=C2=A0 On x86, the required har=
dware capabilities can be validated by running</p><div style=3D"color:rgb(3=
6,41,46);background-color:rgb(255,255,255)" dir=3D"auto"><pre style=3D"font=
-family:ui-monospace,sfmono-regular,&quot;sf mono&quot;,consolas,&quot;libe=
ration mono&quot;,menlo,monospace;font-size:13.6px;margin-top:0px;margin-bo=
ttom:16px;padding:16px;line-height:1.45;border-radius:6px"><code style=3D"f=
ont-family:ui-monospace,sfmono-regular,&quot;sf mono&quot;,consolas,&quot;l=
iberation mono&quot;,menlo,monospace;padding:0px;margin:0px;background:tran=
sparent;border-radius:6px;border:0px;display:inline;line-height:inherit">ja=
ilhouse hardware check</code></pre><pre style=3D"font-family:ui-monospace,s=
fmono-regular,&quot;sf mono&quot;,consolas,&quot;liberation mono&quot;,menl=
o,monospace;font-size:13.6px;margin-top:0px;margin-bottom:16px;padding:16px=
;line-height:1.45;border-radius:6px"><code style=3D"font-family:ui-monospac=
e,sfmono-regular,&quot;sf mono&quot;,consolas,&quot;liberation mono&quot;,m=
enlo,monospace;padding:0px;margin:0px;background:transparent;border-radius:=
6px;border:0px;display:inline;line-height:inherit">&quot; </code></pre><pre=
 style=3D"margin-top:0px;margin-bottom:16px;padding:16px;line-height:1.45;b=
order-radius:6px"><span style=3D"font-family:-apple-system,blinkmacsystemfo=
nt,&quot;segoe ui&quot;,helvetica,arial,sans-serif,&quot;apple color emoji&=
quot;,&quot;segoe ui emoji&quot;;font-size:16px;white-space:normal">Yours i=
s arm64 so you simply cannot use this command. It doesn&#39;t seem there is=
 a problem I assume. Try to enable jailhouse and see what=C2=A0happens.</sp=
an></pre><pre style=3D"margin-top:0px;margin-bottom:16px;padding:16px;line-=
height:1.45;border-radius:6px"><span style=3D"font-family:-apple-system,bli=
nkmacsystemfont,&quot;segoe ui&quot;,helvetica,arial,sans-serif,&quot;apple=
 color emoji&quot;,&quot;segoe ui emoji&quot;;font-size:16px;white-space:no=
rmal">Nikoleta=C2=A0</span></pre></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 15, 2021, 6:13 PM Prasha=
nt Kalikotay &lt;<a href=3D"mailto:pkali@cimware.in">pkali@cimware.in</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Dear al=
l,<div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
I have successfully installed Jailhouse in arm64 based CentOS machine.=C2=
=A0 Make and Make install did not fail. However when I run the command</div=
><div dir=3D"auto">$jailhouse hardware check=C2=A0</div><div dir=3D"auto">O=
utput is</div><div dir=3D"auto">Unsupported architecture=C2=A0</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Does this mean jailhouse does not wo=
rk with my hardware platform? Or how do I resolve it?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thank you</div></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank" rel=3D"noreferrer">jailhouse-dev+unsubscribe@googlegroups.com<=
/a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawt=
w%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_b=
lank" rel=3D"noreferrer">https://groups.google.com/d/msgid/jailhouse-dev/CA=
CNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw%40mail.gmail.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAMPOHCk%2BXF%2BX5h6MVHfk2qRTX_V45jDBzOAteeQak0w%2=
B-LPysA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAMPOHCk%2BXF%2BX5h6MVHfk2qRTX_V45jDB=
zOAteeQak0w%2B-LPysA%40mail.gmail.com</a>.<br />

--000000000000eda14e05c4cf9a4f--

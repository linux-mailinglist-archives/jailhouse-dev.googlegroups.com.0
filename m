Return-Path: <jailhouse-dev+bncBCHN7D46VIKRBBGWVGIAMGQE5YSD3SA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21F4B539D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Feb 2022 15:45:26 +0100 (CET)
Received: by mail-qt1-x838.google.com with SMTP id y22-20020ac87c96000000b002d1bfdbd86dsf12627062qtv.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Feb 2022 06:45:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1644849925; cv=pass;
        d=google.com; s=arc-20160816;
        b=mb5Aub/y2gEbFSECUJdrcfK+P9wNAsXIN9mRf8NAO/0PU9CotNGIwCSed/JZW3Uzv6
         7+KUXM/vE7ZJ/i2pJygwe99eTcWDSuS+DsHUwKrtBpXCIXKlPubgP8MODEzBycNcbAzK
         +GM2mauLXpqVQX7PCtCm55U174o0JnCVSgquH7Z0xyVQy1G7KyJ/FMTrHcchV68Et0uA
         2H1fccZCG9sAUAQpdSSyBfAnRHB65WyU/21TGNF9C6s8ztEpcEnXeO/PwWO22PQygv0j
         RMLVfTiL0yErmHJqaItpg54cukFS3FcS1K9z+xTjlLV/Y5JwAsfcl5hqGR7J6Zun26gy
         MilA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=6oVgCt/gMTUj2O7dXaJTTohzOTbrbPi1Y+maaWM7S7c=;
        b=gT9SWT1KE89EMRq8Umgb0rHJ6yjxMySL/88CjDklVaZWH4jyxEOTXisd5W58qFAlXs
         ozPdtdTdE4Fjgcn0Kh/GP5qVErguT9dS7XQdLrX1mNUXs5DnD/7qD52dXaI1qwDwxWY/
         SiFwg143Tv9pUwGDxRenS4x1t3FV9Az1T4Pynup5n1Z1AjoOC9Yv2zeM9jgv9qswG5lB
         KtVF9ek3Zmht8Ti70t5gICAcTfHk+/3xe9eeGLhUDeuHvb7MLCsQ9ZmXbu3Ah5a25unX
         jBssaH8bGUx6NQONhcvvqZ/97ggLhkMCloQVu3/zSLppIuTVcDQeHL9w2gGxfjCBTzIw
         bAcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ox6RaXwX;
       spf=pass (google.com: domain of phoenixoa58@gmail.com designates 2607:f8b0:4864:20::72a as permitted sender) smtp.mailfrom=phoenixoa58@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6oVgCt/gMTUj2O7dXaJTTohzOTbrbPi1Y+maaWM7S7c=;
        b=tUBZpH5X4uI1/p4xD+CsZg+s2XoqZ5Fr+2wk9dcySDs4onvwpUtmVvVA91DeRf5jxO
         HiEPnhBh2x71tfYtLgaf4u3g9/uvqWJ2edzEpie7jwBBB4A9QgFE+KEQPoR/1yia1JZA
         QB9XYDp99BlwceojKpeb2z2RHwOuPLA3sULSp+Mw4YHcQRSRP7HvY9xoI9FWcsY9SzbY
         R8aU9rJI9io3jHs2dg/MMomJZTzYkKSrre7msmRxv+LNxVwr2BEteWkKHL5R2XG0XKdP
         3P1ypc3tedq3nfcH+iyl2kLbvWfN9rCqHmF7LhJDQ0F8ipX2RkeCD+PwndaLiBu9iECO
         Iz6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6oVgCt/gMTUj2O7dXaJTTohzOTbrbPi1Y+maaWM7S7c=;
        b=KygDbmqkp6wU7YjqiHYZMzBSrU4X++FO8lyHw9pWhxgsneCz2XZ/TXCxcrw2KY43gI
         7pmgr6T0YhNBGekPkanVd75toicHGLMRpfpsdM74fp2qkaxeoW0JR2V+klJu2qSnYtCf
         8cSp3aocWYHYax4nf+vQ9NUOl0dLH/9+WhZ8EmjdJcRAxShP80m7sVhXi/e8jNqNt4Ik
         QrPdTsTyCYv/3UruwWuHnCLx9EJJY34/jVNjOtk4SasWJZo4aBhK3jymRLxlDuUxFwNz
         m/aeRbIdaJQLtNuJkExLur5+qTptUJNwzfC2uXxA2glLfz0knTN2RToJnq/kW1U064j9
         mN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6oVgCt/gMTUj2O7dXaJTTohzOTbrbPi1Y+maaWM7S7c=;
        b=b+8VF47D8sL8216fWLId7O4tHgaEb8hhj4H/YgqJ+H3SO5QMiGhmMFkO30ieyaa5l3
         za3QVbLYVe9iVsNYi13ayR4EjIgZnK7lEtm7EOQSZTpvQOydWpAtiKwx7VCKI7EEeKBN
         V4BlstxT/2R+RQgylQjd9nRyOeRbhV/pgyHAPkqTuVIhINqdRiyJt7v1pNPoMsREQxsn
         5O5hdNFA38zPJuug/nrQtvZKqhE/WNj6+brTuzSrK5LH09TieBKEKkGZWMiVmD33EEnM
         JEYIPc18pOZ5KNCVlwN09yQJYVx60i3/T1pXod7ASy+dq028NSqehZEA2SHe32RH5nYO
         yZvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533pktO4g1KSHZtDFeiBbU18kxm2jLkpnw+OhPEUBuw/F4RfbdDl
	NdTebwSnnmdujpaVYHWoR/c=
X-Google-Smtp-Source: ABdhPJy3/3XXrP4hCqCY2gvCTtL6KcmzqMi/AS3QAHkB/OMSyBx12i6wWxUCQL8bqALO1sDrnB3T3g==
X-Received: by 2002:a05:6214:1c8f:: with SMTP id ib15mr54550qvb.75.1644849925371;
        Mon, 14 Feb 2022 06:45:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1920:: with SMTP id bj32ls8304qkb.2.gmail; Mon, 14
 Feb 2022 06:45:24 -0800 (PST)
X-Received: by 2002:a37:984:: with SMTP id 126mr7264793qkj.495.1644849924521;
        Mon, 14 Feb 2022 06:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644849924; cv=none;
        d=google.com; s=arc-20160816;
        b=eaYNGrY2FLs1wbY5ZDT//WisboIC5q20gH/CUZUc2You9EtiLB5jagF4av4AAddRxl
         9Ib+CV2NvWj5M+BSc3njZpGBa8RkDsLEJ0f+QlT8C6PHhRtGm6wnAA4v8X0x4TnwyGRJ
         Q1O8UAhHC+pt08hl0vw6GbACyGtQPAsLrfxgSd0N9G2iECAsMHzH5TC63w+GCNCVZyTT
         gyBXMkWi8o+i+kBru/OTPFAEgkFoM0m6r3CFsHBENt/P7a+oQZ29yMiZrDr6FN8iK1iz
         GA8qkCssihfVqY0Mao/QU8+Ek/xhzvgXw6qkRXNA+07S0026eIsGRP3RPbvQwClMqfG2
         kjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pw1In1JFHVKKzCKoWJAWImGXQ4L36V+uhSHZlhLwkwQ=;
        b=P03EntnpG+yVM4Fqbc4hRGgOQCOZ0U0rmFbNK0VfUt6IgGycjGIIOcv/xuWEvc5wcj
         ncIL9861vaR2PycAnrF/sQpwFQrtb4xaIiZIk1wg9MoUCpWsWev0HGxQs4QRBMw/2eGd
         ye0T0lQbdMe+pT12MtReYPn1kh6rP+rnvwQPohn8T89K4ijtlnfy4cJXRLmvznzSc+hk
         JMirXCkgwV2qD9/Ekc7T4b7nArempSFg8afb6fAoF1z491izXljiisPMhxmATORJ9dEJ
         kUZtdvXtuR+Wxdfm8pwZ8b7hrdn0LccnLt0KK2nubXKnJJUorXteuIyzWFse5MoaLmdC
         xc0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ox6RaXwX;
       spf=pass (google.com: domain of phoenixoa58@gmail.com designates 2607:f8b0:4864:20::72a as permitted sender) smtp.mailfrom=phoenixoa58@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com. [2607:f8b0:4864:20::72a])
        by gmr-mx.google.com with ESMTPS id i16si1343655qkp.5.2022.02.14.06.45.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 06:45:24 -0800 (PST)
Received-SPF: pass (google.com: domain of phoenixoa58@gmail.com designates 2607:f8b0:4864:20::72a as permitted sender) client-ip=2607:f8b0:4864:20::72a;
Received: by mail-qk1-x72a.google.com with SMTP id m25so14497644qka.9
        for <jailhouse-dev@googlegroups.com>; Mon, 14 Feb 2022 06:45:24 -0800 (PST)
X-Received: by 2002:a37:2785:: with SMTP id n127mr5966382qkn.470.1644849924100;
 Mon, 14 Feb 2022 06:45:24 -0800 (PST)
MIME-Version: 1.0
From: Phoenix Oabile <phoenixoa58@gmail.com>
Date: Mon, 14 Feb 2022 20:15:13 +0530
Message-ID: <CA+Qm9efisF3xQRqWPS_M_LjGUAukbt1GNtP+wqDyQGqk4Vf3Hw@mail.gmail.com>
Subject: INVOICE FQVY14022022GT
To: nortoncc2022@outlook.com
Content-Type: multipart/alternative; boundary="0000000000006f560705d7fb77cd"
X-Original-Sender: phoenixoa58@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Ox6RaXwX;       spf=pass
 (google.com: domain of phoenixoa58@gmail.com designates 2607:f8b0:4864:20::72a
 as permitted sender) smtp.mailfrom=phoenixoa58@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000006f560705d7fb77cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Member!

Your Annual membership for NORTON PROTECTION has been renewed AND updated
successfully.

The amount charged will be available within the next 24 to 48 hrs on your
account profile.


Product Information:''''''''''''''''''






*INVOICE NUMBER* #        FQVY14022022GT


*ITEM NAME* #       NORTON PROTECTION


*Start Date* #         2022-02-14

*End Date* #       1 year from Start Date


*Amount Total* #       $257.19USD


*Payment Method* #        Automatic Debit




If you wish to not to continue and claim a REFUND then please feel free to
contact our *BILLING & SETTLEMENT DEPARTMENT* as soon as
possible!]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]

You can Reach us on *:* * +1 =E2=80=93 ( 509 ) =E2=80=93 ( 588 ) =E2=80=93 =
7316*






Regards,
*BILLING & SETTLEMENT DEPARTMENT*

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2BQm9efisF3xQRqWPS_M_LjGUAukbt1GNtP%2BwqDyQGqk4Vf3Hw%40mai=
l.gmail.com.

--0000000000006f560705d7fb77cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDr=
aft,Helvetica,Arial,sans-serif;font-size:13px"><br class=3D"gmail-Apple-int=
erchange-newline">Hi Member!</div><br style=3D"color:rgb(0,0,0);font-family=
:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><div style=
=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-se=
rif;font-size:13px">Your Annual membership for NORTON PROTECTION has been r=
enewed AND updated successfully.</div><br style=3D"color:rgb(0,0,0);font-fa=
mily:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><div sty=
le=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-=
serif;font-size:13px">The amount charged will be available within the next =
24 to 48 hrs on your account profile.</div><br style=3D"color:rgb(0,0,0);fo=
nt-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><br=
 style=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,s=
ans-serif;font-size:13px"><div style=3D"color:rgb(0,0,0);font-family:Roboto=
,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px">Product Information=
:&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;</div><div style=3D"color:rgb(0,0,0);font-family:Roboto,Rob=
otoDraft,Helvetica,Arial,sans-serif;font-size:13px"><br></div><div style=3D=
"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif=
;font-size:13px"><br></div><div style=3D"color:rgb(0,0,0);font-family:Robot=
o,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><br></div><div sty=
le=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-=
serif;font-size:13px"><br></div><div style=3D"color:rgb(0,0,0);font-family:=
Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><br></div><br=
 style=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,s=
ans-serif;font-size:13px"><table border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"font-size:13px;font-family:Roboto,RobotoDraft,Helvetica,Ari=
al,sans-serif;border-top:1px solid rgb(0,0,0);border-bottom:1px solid rgb(0=
,0,0);width:443px"><tbody><tr><td style=3D"padding:10px 5px"><b>INVOICE NUM=
BER</b></td><td style=3D"padding:10px 5px">#=C2=A0 =C2=A0 =C2=A0 =C2=A0 FQV=
Y14022022GT<br><br><br></td></tr><tr><td style=3D"padding:10px 5px;border-b=
ottom:1px solid rgb(0,0,0)"><b>ITEM NAME</b></td><td style=3D"padding:10px =
5px;border-bottom:1px solid rgb(0,0,0)">#=C2=A0 =C2=A0 =C2=A0 =C2=A0NORTON =
PROTECTION<br><br><br></td></tr><tr><td style=3D"padding:10px 5px"><b>Start=
 Date</b></td><td style=3D"padding:10px 5px">#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02022-02-14<br><br></td></tr><tr><td style=3D"padding:10px 5px;border-=
bottom:1px solid rgb(0,0,0)"><b>End Date</b></td><td style=3D"padding:10px =
5px;border-bottom:1px solid rgb(0,0,0)">#=C2=A0 =C2=A0 =C2=A0 =C2=A01 year =
from Start Date<br><br><br></td></tr><tr><td style=3D"padding:10px 5px"><b>=
Amount Total</b></td><td style=3D"padding:10px 5px">#=C2=A0 =C2=A0 =C2=A0 =
=C2=A0$257.19USD<br><br><br></td></tr><tr><td style=3D"padding:10px 5px"><b=
>Payment Method</b></td><td style=3D"padding:10px 5px">#=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Automatic Debit<br><br><br></td></tr></tbody></table><br style=
=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-se=
rif;font-size:13px"><br style=3D"color:rgb(0,0,0);font-family:Roboto,Roboto=
Draft,Helvetica,Arial,sans-serif;font-size:13px"><div style=3D"color:rgb(0,=
0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13=
px">If you wish to not to continue and claim a REFUND then please feel free=
 to contact our=C2=A0<b>BILLING &amp; SETTLEMENT DEPARTMENT</b>=C2=A0as soo=
n as possible!]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]</div><br style=3D"color:rgb(=
0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:=
13px"><div style=3D"color:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helveti=
ca,Arial,sans-serif;font-size:13px">You can Reach us on=C2=A0<b>:</b>=C2=A0=
<font face=3D"arial, sans-serif" size=3D"4"><b>=C2=A0+1=C2=A0=E2=80=93=C2=
=A0(=C2=A0509=C2=A0)=C2=A0=E2=80=93=C2=A0(=C2=A0588=C2=A0)=C2=A0=E2=80=93=
=C2=A07316</b></font></div><div><br></div><div><br></div><div><br></div><di=
v><br></div><div><br></div><br style=3D"color:rgb(0,0,0);font-family:Roboto=
,RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><div style=3D"color=
:rgb(0,0,0);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-=
size:13px">Regards,</div><div style=3D"color:rgb(0,0,0);font-family:Roboto,=
RobotoDraft,Helvetica,Arial,sans-serif;font-size:13px"><b>BILLING &amp; SET=
TLEMENT DEPARTMENT</b></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2BQm9efisF3xQRqWPS_M_LjGUAukbt1GNtP%2BwqDyQGqk4=
Vf3Hw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CA%2BQm9efisF3xQRqWPS_M_LjGUAukbt1GNtP%=
2BwqDyQGqk4Vf3Hw%40mail.gmail.com</a>.<br />

--0000000000006f560705d7fb77cd--

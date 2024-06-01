Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBZWS5SZAMGQE6WJH2MY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFC8D7058
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Jun 2024 16:00:10 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dfa89c10ddesf34128276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Jun 2024 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717250410; x=1717855210; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASOhgf8M8cuH1+RRfarE9CMvXATowSwQdZmqPTLBU7g=;
        b=pvnz4fcgchAhnm0qsDWC/ZHC4rrCJiw9VHFjie6EwCeZRdwqTjjkclLcVUgV4V4WcA
         veYnrqV6xJnNDSUiaCLYgskTL3ib0eCQn7nE4Ay1epfN+weA4NMr811j5cz26Hz1v1vx
         seou3BoPaTnb+k5worZDszL4+s+dOHSHJ6atMywW1cCi4iX3aT+tGgNI26wujjloeWlA
         PdxS3GifFj+XK9KOzS9bd4D1VunblsSySP1dI9EnY5LE+dRe2rBw1czmkJe0wsMd7wny
         14D0SFs7xe8I4wZ60DGFcEyPk7GuHu4lP+fZVRXMLmJyBJaA0UVbKIYrwK6PaVjn3BhO
         T5yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717250410; x=1717855210; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASOhgf8M8cuH1+RRfarE9CMvXATowSwQdZmqPTLBU7g=;
        b=WdYqVgUf7NuFvwzK7lt/nauyw729HhN6SrT4j/dYtzv1orC1m52Si4GG4N8azHvSZr
         YllFmJEDRcpcwDUQKPmEQKhgiVD0Rt0kvwBeRL6FY54ogQ2oOfJ//Um9WWy2uLEx8Nsr
         DTCSWGBCNEkLylsxTpsak3QArrRyJSDWumQB421hQpVzdb1cmwAMDPzGrV22hqaMLcG0
         3Kc+JKtaw6lTkj/R/vWuJHdUhXQIvwCyYD1lFxr4cqL1F3a48G0xCTxaN8KHoTj3DuLS
         6zhfeSAej1UurkEDpaZYGWjWftr6x4C76FxoHZugcnuU5jEwxCm7I4jFPZjMh2aUbPaT
         sgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717250410; x=1717855210;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASOhgf8M8cuH1+RRfarE9CMvXATowSwQdZmqPTLBU7g=;
        b=POnaz3PrHs+Dun5+iOA/GZsDgtu/2huhYsQdtd/ZE0zhk51HOJxaJ1bbGgQatwhG45
         4ND2pT81/qiSDjHBGsKFJaqzq5o9qsJHFGUvRuDulHRUZOQHTDSsnPp1O7AB1QVnqKcW
         WVImbwfb4OYetG0wYp907uIIdz5COGOsR+cnU0L5kMOw9ingSyziXuWVJMKewn74YKtH
         IIna/ZIdDotZKpBXLPsIyghAGlzmlCjGIZjzBb8UDuDL6wvhU/nHLXgNsDZfYSVKu+Nv
         wN2ke0GUp/3wGEXE2us++ZkgcuCM6PZoP6XgK1saDSqYHDiVZGtOz2pYnvLQAEmrMz/2
         W3Gg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUTnTbLm4WQdE2oFqH+s+Ln5kD+WBD8lx29idyegA0covEgPxyo8eCEtd2FCkYzjR3e/UznfuRtWoMYcbtSl+ZgRhjTUCXXza1vtFY=
X-Gm-Message-State: AOJu0Yz4TERbZMOJB4vWjNYvEkJNFKlmgXkd9KWrtC41vpfdfw3YDmKc
	G31tqfZmBsv/lE9gVGTagI1Ydwo/r4tbdOOJMFQ2sTZLHCXvkjRq
X-Google-Smtp-Source: AGHT+IFvBo8U4HrfZA3Hf92oldmRbHhgtQIaC7jlJW0yetzCemlrkNKSGc2W5Vtq+VAohp+UKb3BzA==
X-Received: by 2002:a05:6902:13cd:b0:dfa:70a5:e3f2 with SMTP id 3f1490d57ef6-dfa72e8e1afmr3705187276.0.1717250407609;
        Sat, 01 Jun 2024 07:00:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2fd3:0:b0:dfa:77ba:dc1f with SMTP id 3f1490d57ef6-dfa77bade56ls59474276.2.-pod-prod-06-us;
 Sat, 01 Jun 2024 07:00:06 -0700 (PDT)
X-Received: by 2002:a05:690c:3506:b0:61b:e6d8:1c01 with SMTP id 00721157ae682-62c79896e11mr8805607b3.10.1717250404272;
        Sat, 01 Jun 2024 07:00:04 -0700 (PDT)
Date: Sat, 1 Jun 2024 07:00:03 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cfc0ca42-592e-46e0-9d6f-78e07b93ba8bn@googlegroups.com>
In-Reply-To: <8e73b722-2ebe-4bc6-9cd5-c58e546921abn@googlegroups.com>
References: <f7f9f86e-b878-4e08-ac83-eb974ef0ad07n@googlegroups.com>
 <07b211ff-3c63-437b-8712-b8540d2e62b3n@googlegroups.com>
 <6692f8f7-f400-42ff-b594-949af3c307f3n@googlegroups.com>
 <8e73b722-2ebe-4bc6-9cd5-c58e546921abn@googlegroups.com>
Subject: Re: WHAT ARE GOLDEN TEACHER MUSHROOMS AND WHERE ARE THEY SOLD
 ONLINE?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_265239_1433347238.1717250403291"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_265239_1433347238.1717250403291
Content-Type: multipart/alternative; 
	boundary="----=_Part_265240_412091586.1717250403291"

------=_Part_265240_412091586.1717250403291
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

Great Taste =E2=80=93 A chocolate bar that makes you trip your face off. Ho=
w could=20
that not be the dream?
Clean High =E2=80=93 We formulated this chocolate bar to produce a clean hi=
gh that=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate
True Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushr=
ooms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality of=20
your trip, in fact, you may even decide to switch to edibles!
Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=
=E2=80=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some chocolate=
=20
is the way to go. shroom chocolate bar
Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in this chocolate=
 can be=20
broken up for versatile dosage. Each square of this chocolate bar contains=
=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether=
=20
it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has got =
you=20
covered. shroom chocolate bar

https://t.me/motionking_caliweed_psychedelics

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cfc0ca42-592e-46e0-9d6f-78e07b93ba8bn%40googlegroups.com.

------=_Part_265240_412091586.1717250403291
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics<br /></div><div><br /></=
div>Great Taste =E2=80=93 A chocolate bar that makes you trip your face off=
. How could that not be the dream?<div>Clean High =E2=80=93 We formulated t=
his chocolate bar to produce a clean high that won=E2=80=99t leave you cras=
hing after the initial peak. shroom chocolate</div><div>True Psychedelic Ex=
perience -Just cause it doesn=E2=80=99t taste like mushrooms doesn=E2=80=99=
t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any drop in the q=
uality of your trip, in fact, you may even decide to switch to edibles!</di=
v><div>Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that=
 doesn=E2=80=99t necessarily mean you want to be seen stuffing your face wi=
th them. For those who want to keep it classy and discrete, nibbling on som=
e chocolate is the way to go. shroom chocolate bar</div><div>Versatile Dosa=
ge =E2=80=93 The combined 3.5g of mushrooms in this chocolate can be broken=
 up for versatile dosage. Each square of this chocolate bar contains approx=
imately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether it=E2=
=80=99s a micro-dose or a full-on journey, this chocolate bar has got you c=
overed. shroom chocolate bar</div><div><br /></div>https://t.me/motionking_=
caliweed_psychedelics<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cfc0ca42-592e-46e0-9d6f-78e07b93ba8bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cfc0ca42-592e-46e0-9d6f-78e07b93ba8bn%40googlegroups.co=
m</a>.<br />

------=_Part_265240_412091586.1717250403291--

------=_Part_265239_1433347238.1717250403291--

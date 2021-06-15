Return-Path: <jailhouse-dev+bncBDS77PFL3YERBDEHUODAMGQESWXVT2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F53A83B9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:13:18 +0200 (CEST)
Received: by mail-il1-x13f.google.com with SMTP id z6-20020a92cd060000b02901eb52fdfd60sf10453628iln.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:13:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623769997; cv=pass;
        d=google.com; s=arc-20160816;
        b=hA30frCUUcSbDTySnszLJk6BeJAVsGvHJqkT2akdgmEXfdr1TQKPBa2BFo67cztyF6
         mwROi59j2cB26NUnHlCklWplH8GV7l5a18pp3To53WI5S1Bkera2W1ysphkRnj3uyJil
         NhP1Y6Ku400kNxMdyjsXjWzS+mWeUKZviL3wbTGHOhmF1mCpnYZTTyiKml5WwU4JgHmS
         V9MSa4x2CXjbh5T1zIV0IM+xpm273N2OK4nk5hvw0NY5c+eJnh1deynC4g5XANQsEWfl
         pDsfplDRo7FbrI8FjXdaVGsOSWW2dby5kGsS9on1XMF4UEUCyRztIeDtXhZ3Okq71CVX
         /1ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature;
        bh=baozrE4var998CpMNg1h7d3BF9GkBGhWByWtKsgyxdg=;
        b=mhT4823xkmf9z/Ncpazq9WlUxvyl+yzEYCxKIQBl5TAw3t3hgydM0qobk9yorZM5C/
         sZ5xrSpXjHZgutbGEuJQPigJU31UFcUISGYfc43xxsm5+o8quDrLx5pjl4iebf8y7HyX
         0kmQwly8Wt3ZVg/nMs8A2YZT/KxdVk9gavjXyaXOdWW9tR7BzwOxIxjI7OZICRjYm6L/
         UQKMNE7dfzj5sSM3I1ktG0xZA3qzZoz9LSxWfI0QMn9t8P0xjJgBs6p7ZDQBwL0m6urX
         cSlWwt38HXsPOjK6NlOoq6GawHvZGDW+B70jPtU9cYh+qrnDGnnQj8lBEKEEQSL3lAtP
         MXKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=bKHRasLW;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::135 as permitted sender) smtp.mailfrom=pkali@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=baozrE4var998CpMNg1h7d3BF9GkBGhWByWtKsgyxdg=;
        b=HHv/9z3dyi6FJMTKyLAPWxs3fRBs621FdSGLCSAhysrNCAzR6QTBAhSbS5TGpodIOn
         Uer38z7lc8gzZhbFglTgLlNGlqUNc/tapPg8mS4BYMHLgh7N5DEeyRDYuYQ2iTaRqVlf
         WvKcWnv6f4bKv2KIznTbzxFBdrvtr0v1xP+Q+2Rhqp89iiS3xIGi/4CyEuNWfprOXTMU
         gTpaSqmMrVY7tyqz6b/DoiZWJvvA8ZAqYM6bzE8cmqcpoy1jnJX1SPTJJvTD4c2oWbRa
         cGhT5ryaiSdBEhPnzLaihsLM7/zjn1yBVAn9ZMh/WTOEzHAC+ff2MrcJmOvwOuLjKtfc
         cXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=baozrE4var998CpMNg1h7d3BF9GkBGhWByWtKsgyxdg=;
        b=MY8pSENu8196WhyNaFUdtYRPihhb5atQc6/LQ+AuxoxHtksjE5+CO7Gcg5hSBzXr4r
         gn3rbObntbUW91MDL6xrSaPAPSWFRThZb8BhFofLeG0aa2qjgHVn5NhPEsfR3VTrdzfM
         LUZeCtNb0KUF9Pl6h2ZTN1XeniABjk4HrF+8PEm7ULsFMTNATh9dfvgx+KxE8c95x83N
         7cpkP/AYd8F5J8SNBjCqSx+X/ynVC02KPfdS2aoU2VQ+r9fnxaT0HQgGBC2CbqBxp6HU
         gUyzI5RnWOdiZQjgH+sC2mbCGNB+Aug12u1+LuNDtVeYKCBJMirytgRIH+MXRL334jLG
         lLYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5337UYOw8JtpFa9RSTYhvDibXIpdtkdQ1gmSQaxcZ26XSJtlWhrw
	mmeyMoieowixskYcyMH3c1Q=
X-Google-Smtp-Source: ABdhPJwjFHOeRiO2V6XR9lFvRr+YJejwPM28dpUoKmB0FQGCrARXN0Ph/tq/0gDb40fdzgfD2uKd6g==
X-Received: by 2002:a92:750c:: with SMTP id q12mr17919128ilc.303.1623769997343;
        Tue, 15 Jun 2021 08:13:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:b703:: with SMTP id k3ls556425ili.9.gmail; Tue, 15 Jun
 2021 08:13:16 -0700 (PDT)
X-Received: by 2002:a05:6e02:b49:: with SMTP id f9mr16926908ilu.287.1623769996562;
        Tue, 15 Jun 2021 08:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623769996; cv=none;
        d=google.com; s=arc-20160816;
        b=bCLuWUY+4HRX/Tp7TME+PP+tXxb6IoyI60qSemYUlSNLRx9peL2s31AM5juFwpFvc3
         9SGBUg7tv7oeW42qBI4oocEj9vGlFDqg669GWJKuqf/ql0zQFx6YRQ4822lIj52jVzK7
         s8ZeAMA5MJnrKHXPef6OeRDUYwC4bzK0LldyuXYDaQbnIKdYOQfZQsK0mV8ElOp21IiK
         vHOwv2OZzlzow2ZIDX/9nQUH7CjTW+eajBIB3PfuOX8x7mL5+B64thxo0Q283RSU+T1X
         J27JRENvXrL9S5pJoQFFDmFMxuMmiPaAyZ+FAmSkJGbAzuR14BgQ0dNE4kaUC2rwMOjp
         Hsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TlvRle0Wi4cmN4bzOZeTJ3hsnsmQXC1hj/j8bh3gVpc=;
        b=TaPZWKZWd2HNWBY4hmP9hpgxPliIX09MLnss3DUP2BaKRw/VXL+oB4a57zo7d6tAVq
         r3r1jw05uKVVFhahDvTYsFdtQaUgldcUSI/+AW9/AlZExyIBxm+3Mqv4rhvQ0jjAIzDR
         R23kwqUBNNnZZ+m1oABCqAdnnjBYSekPjgspeNArGR9x02SoyGOICqbA0iT7/mHwt0Uz
         4CRkkIcNg83JPZesn57mVvZhnGaBdqn7aSMRMD0715D4nfBpVGCKTldnhDGYmZygx/Dt
         hNAHjUtkaw8dkllpJQyCpG+80E/Jbr4JFUTnkciN780yuiXkoM5nlMAe0NiFVpj/xZBs
         5eSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=bKHRasLW;
       spf=pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::135 as permitted sender) smtp.mailfrom=pkali@cimware.in
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com. [2607:f8b0:4864:20::135])
        by gmr-mx.google.com with ESMTPS id g16si317243ion.0.2021.06.15.08.13.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pkali@cimware.in designates 2607:f8b0:4864:20::135 as permitted sender) client-ip=2607:f8b0:4864:20::135;
Received: by mail-il1-x135.google.com with SMTP id h3so15593080ilc.9
        for <jailhouse-dev@googlegroups.com>; Tue, 15 Jun 2021 08:13:15 -0700 (PDT)
X-Received: by 2002:a92:dd0c:: with SMTP id n12mr7394ilm.236.1623769994983;
 Tue, 15 Jun 2021 08:13:14 -0700 (PDT)
MIME-Version: 1.0
From: Prashant Kalikotay <pkali@cimware.in>
Date: Tue, 15 Jun 2021 20:43:03 +0530
Message-ID: <CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw@mail.gmail.com>
Subject: COMMAND ERROR : Unsupported Architecture
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000bf980a05c4cf6977"
X-Original-Sender: pkali@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=bKHRasLW;       spf=pass (google.com: domain of pkali@cimware.in
 designates 2607:f8b0:4864:20::135 as permitted sender) smtp.mailfrom=pkali@cimware.in
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

--000000000000bf980a05c4cf6977
Content-Type: text/plain; charset="UTF-8"

Dear all,
               I have successfully installed Jailhouse in arm64 based
CentOS machine.  Make and Make install did not fail. However when I run the
command
$jailhouse hardware check
Output is
Unsupported architecture

Does this mean jailhouse does not work with my hardware platform? Or how do
I resolve it?

Thank you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawtw%40mail.gmail.com.

--000000000000bf980a05c4cf6977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Dear all,<div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0I have successfully installed Jailhouse in arm64=
 based CentOS machine.=C2=A0 Make and Make install did not fail. However wh=
en I run the command</div><div dir=3D"auto">$jailhouse hardware check=C2=A0=
</div><div dir=3D"auto">Output is</div><div dir=3D"auto">Unsupported archit=
ecture=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Does this m=
ean jailhouse does not work with my hardware platform? Or how do I resolve =
it?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you</div></div=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkGKcqtawt=
w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CACNW3nT9NMqDwmvpryPoBLkp9okcLbKu3r1WbDnJkG=
Kcqtawtw%40mail.gmail.com</a>.<br />

--000000000000bf980a05c4cf6977--

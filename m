Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB7EFXSBAMGQEUIZ6EEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7B33ABC7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Mar 2021 07:47:25 +0100 (CET)
Received: by mail-qv1-xf37.google.com with SMTP id j3sf22437174qvo.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Mar 2021 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QtxeqlRmXYTZidqj+qOESGx2WZa2z09i04SaYsAWTp4=;
        b=exuHMqAjFkuFT1gJrmhzxZVopolyd8p6qCh4QHwyWI8f7xS95Vk55hhrpJCydwKwtB
         /svX5sHpntYO3Y2YDUaM7Q6BusgzE2b3nhhG2jOuH+Yg6wRsNHarSazhg5p9OVCg6P64
         w4FJCdRYYFFkr4bB/vtFj5FCvl/fcpxaxQkFFqY53oX9ObdUx4qLbcI3qmixOZVRA1gP
         8FJ4PSO5mvgd1Z9cTVuA4u5HFym532fQwjM/QTn2VPef23urfps3N6e779WfQw9jIhMJ
         ojq+Gp8+iDGuR/vwlsEVkfQU1q4Y/7AbTTyLmnSjU3wuUawOAOA7JAivHcbH7zIRpW96
         fTVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QtxeqlRmXYTZidqj+qOESGx2WZa2z09i04SaYsAWTp4=;
        b=hUwfK7DQt8KC7FXAxvnDo7nYeiHn/L1f1LpWfu/GbZxgLoocKx7EL1kLUrHWdA5b2L
         G3SaDyeVHjd3VCG7k4O5kXfhWmPlMZIzkAyTWHUhvBpvTxqthcpFbzgFbv5rA4BLZLi2
         TJYQs3T7dkyIPsSIFqt+KRiXyT0XoDtHqFUUWEeBJK6ilPqSETlh3CTEfdSf843Xp96o
         k48ejgjo0t+Izmx7zYnMjOwqCoPajPlfCTkA6wLo8izlhiUjx7XzOpHjGKMtqeWszB/V
         PrDFFUsW/RaSq/N5up6BEvHwpFWQC3RX5xHFDFI/8FxsIidLxnL4ID3IajbOlDGmAGTG
         Uepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QtxeqlRmXYTZidqj+qOESGx2WZa2z09i04SaYsAWTp4=;
        b=jh3nu+zCWtWvewqXs0elL8ttDcT6g0Cq326ewfzsKsqj4aisquImzzlGXEMR78VD39
         HhauTQbzBqu/ifyAp9LTl9gDHhO9YGYL9AURPMR7YedqA4LFM6o5jLLJd4giHlfYvh1z
         Hxagz7RpSQCq/9rTXQOyVoF5WrkJvaxQWYiB6RPqpDce6St9ot58v5eIL37ST4W+yR57
         YReKqB8x0BpIo7k+9SO3JWE6SI+BrDnoyKwgS+tcnnL7K/YuDaGR3XbY2BE0MfgIVd6Y
         qYOpD0qM6gQPQQwrUn4k6dkEvON8j/RPUKgqT+onsuH3Z0LS69MNnf2tbGNWseEPNwyy
         Pvew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532UD3pu9ZBTqc0WOtnDAc9Ay81Y+qumYlcvYNIoYApa2tTH7h69
	mvMlPUlzEhT5yKnCuV9G5Zg=
X-Google-Smtp-Source: ABdhPJwdT3RlkebtwVM0HPzBL0YTH3uGOigHHJvhnlNtmGibEQ1+bnJpNPkDePF1V9bQtrutCRF+bA==
X-Received: by 2002:ad4:4eae:: with SMTP id ed14mr9293828qvb.52.1615790844559;
        Sun, 14 Mar 2021 23:47:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4096:: with SMTP id f22ls2827540qko.7.gmail; Sun,
 14 Mar 2021 23:47:24 -0700 (PDT)
X-Received: by 2002:a37:a515:: with SMTP id o21mr23577813qke.307.1615790844049;
        Sun, 14 Mar 2021 23:47:24 -0700 (PDT)
Date: Sun, 14 Mar 2021 23:47:23 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
Subject: where can I get configuration document ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2590_729698990.1615790843583"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_2590_729698990.1615790843583
Content-Type: multipart/alternative; 
	boundary="----=_Part_2591_1846464787.1615790843583"

------=_Part_2591_1846464787.1615790843583
Content-Type: text/plain; charset="UTF-8"

In  
https://github.com/siemens/jailhouse/blob/master/Documentation/configuration-format.md
It only shows "To be written..." .

I found how to write  right .c configuration is very important .
For example , I want  add a new inmate,   a new inmate to run linux,  I 
don't know how to set the value in the document.

The result is I can't   easily run a new  inmate.
I think it's not good.

Will  the document be written ? 
or 
Where  can  I found some  good tips  about  how to write a  right  .c  
configuration?
Thanks very much!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a370a48-b0d4-4f90-aed8-70da23638afan%40googlegroups.com.

------=_Part_2591_1846464787.1615790843583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>In&nbsp; https://github.com/siemens/jailhouse/blob/master/Documentatio=
n/configuration-format.md</div><div>It only shows "To be written..." .<br><=
/div><div><br></div><div>I found how to write&nbsp; right .c configuration =
is very important .</div><div>For example , I want&nbsp; add a new inmate,&=
nbsp; &nbsp;a new inmate to run linux,&nbsp; I don't know how to set the va=
lue in the document.</div><div><br></div><div>The result is I can't&nbsp; &=
nbsp;easily run a new&nbsp; inmate.</div><div>I think it's not good.<br></d=
iv><div><br></div><div>Will&nbsp; the document be written ?&nbsp;</div><div=
>or&nbsp;</div><div>Where&nbsp; can&nbsp; I found some&nbsp; good tips&nbsp=
; about&nbsp; how to write a&nbsp; right&nbsp; .c&nbsp; configuration?</div=
><div>Thanks very much!</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0a370a48-b0d4-4f90-aed8-70da23638afan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0a370a48-b0d4-4f90-aed8-70da23638afan%40googlegroups.co=
m</a>.<br />

------=_Part_2591_1846464787.1615790843583--

------=_Part_2590_729698990.1615790843583--

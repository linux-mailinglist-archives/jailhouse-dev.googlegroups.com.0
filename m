Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBHHY275AKGQEPFOE6LQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC325F663
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 11:23:41 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id y187sf7324963qka.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L+pygzEcz4sQgVdqqVYk60+JoxB8ceFHRmhk24QIliw=;
        b=aKtryGtBOPbJw40y9sF4C/ViPjxZzXQ8m2yDN9jp74qfZqdHItZYnmwxxoFh4ovFbf
         hqs4q9Dvdw0zwLHnbdwN6wPNDnkrJiDTjalkEVyOmX0Hj9dMlqsFKnAiz2KURRA4ETZE
         V5q/k9BMiqzvmCRFQQvmLglE6OJzNk9lzuVrtX5QkSIV5KVGzNEGZ6u8ykDRLkbXH6zq
         ZmTnuGjL47eZytzD4sn11rhXqJfL0NHyKWDc4jpKkicsCzmqsMqMLK0PA5lfNZ5b2laH
         DV62fDSU4WD/lNGppxlztbO3nRKpHumNbqGUoagEknpzky4XaWzKXvdb9BIzvZcGggYV
         chMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L+pygzEcz4sQgVdqqVYk60+JoxB8ceFHRmhk24QIliw=;
        b=azvXokmwyiiL4V/aMyxgWK0yUQAShzXegchCFjY8M84zCpzQ46PoWuKZ5hj0/MgcV1
         ziptUzv7pr5KQKa/kiBnYR7fILRNa3vjgNp2FZDtgW91IbCQxBrugPwPB025ClX4xjfq
         icys0U1Uz58vgCA+C0cf1CAHofgx84wPTlGojbIBFlUQiaoB3oQKFaGiIScsGXZQwquO
         r6U+kob4ETRlnbpAjq1UOE5/ami4HE8bvUPknBYxWb76kXNmcs+fApTZ+lHYOGNOeeAZ
         oM8pkUp3bA6u81W02YDx9A7OjSSMWnpymsCTDCj7zmKoEtde426IMVYx1lghcuA3l3Kq
         Oq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L+pygzEcz4sQgVdqqVYk60+JoxB8ceFHRmhk24QIliw=;
        b=dLz70Ev+VQ6rupSF1ouDeC/6GZj93kt4uLlVpQWhdiZeiizl6QXMTWthOx3+oVgTkN
         9PMBbcZnNBTwW0gMVsX6NBZbJ2qTTTA6uY2TDuO3bi/xVhZnsMewbOh3ktePNi0Cu/xg
         27rti0oSWHiKK3WIjaVVhK20AigvzUHNNPYJbjzTxiVpGTw2eRNqban7+QAuN+Dwmwrz
         54biDd1tDzmVjV7dRQHzF5L1IYEurthAgQBb54LDL2Q9vCM/MXbwj1Ef1UOrrKlHSTUj
         YeYLPl0oFQ3H4FW4NB1ix9R4GEFghRmf9XUVyw1oq3+Wi0P50NX1IzUn1LjievcgVBS/
         3wPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TxlsmX6hrqGzj4J3Ksr389AFVGQgf9CAC+FHcZv/Edit+csda
	q2rkmazcYFbe22Hd40HS1oE=
X-Google-Smtp-Source: ABdhPJwiuzXApKC9A0xyoC/u/qkkaA3XbgJGlwUpm78F0ZGTc1sOVjpsckqOQA5YMHOTYdMkBQEWIA==
X-Received: by 2002:a37:b806:: with SMTP id i6mr19053879qkf.333.1599470620433;
        Mon, 07 Sep 2020 02:23:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:c584:: with SMTP id a4ls3931932qvj.4.gmail; Mon, 07 Sep
 2020 02:23:39 -0700 (PDT)
X-Received: by 2002:a0c:ab46:: with SMTP id i6mr6303685qvb.140.1599470619681;
        Mon, 07 Sep 2020 02:23:39 -0700 (PDT)
Date: Mon, 7 Sep 2020 02:23:38 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
In-Reply-To: <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1004_1274804220.1599470618901"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_1004_1274804220.1599470618901
Content-Type: multipart/alternative; 
	boundary="----=_Part_1005_931588803.1599470618901"

------=_Part_1005_931588803.1599470618901
Content-Type: text/plain; charset="UTF-8"


I've build a Linux kernel with CONFIG_STRICT_DEVMEM and 
CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware check still not works.
From now I'll ignore the hardware check.

I've tried to create the configuration for the root cell on the targetwith 
" jailhouse config create sysconfig.c" without success.
I get an error message "This script requires the mako library to run".

My root-fs contains "python3-mako", but "python" ist still "python 2.7.18".
What version of python is the script unsing?

In my image recipe I can't add the package "python-mako" because is is 
already provided by package "python3-mako".
How do I get out of this dilemma again?

Best regards
Jan.





-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2924a8c6-5b7f-427a-846e-9fc0e64bad53n%40googlegroups.com.

------=_Part_1005_931588803.1599470618901
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div></div><div>I've build=20
a Linux kernel with CONFIG_STRICT_DEVMEM and CONFIG_IO_STRICT_DEVMEM deacti=
vate, but the hardware check still not works.</div><div>From now I'll ignor=
e the hardware check.</div><div><br></div><div>I've tried to create the con=
figuration for the root cell on the targetwith "
<span><span>jailhouse config create sysconfig.c" without success.</span></s=
pan></div><div><span><span>I get an error message "This script requires the=
 mako library to run".</span></span></div><div><span><span><br></span></spa=
n></div><div><span><span>My root-fs contains "python3-mako", but "python" i=
st still "python 2.7.18".</span></span></div><div><span><span>What version =
of python is the script unsing?</span></span></div><div><span><span><br></s=
pan></span></div><div><span><span>In my image recipe I can't add the packag=
e "python-mako" because is is already provided by package "python3-mako".</=
span></span></div><div><span><span>How do I get out of this dilemma again?<=
/span></span></div><div><span><span><br></span></span></div><div><span><spa=
n>Best regards</span></span></div><div><span><span>Jan.</span></span></div>=
<div><span><span><br></span></span></div><div><span><span><br></span></span=
></div><div><span><span><br></span></span>

</div><div><br>

</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2924a8c6-5b7f-427a-846e-9fc0e64bad53n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2924a8c6-5b7f-427a-846e-9fc0e64bad53n%40googlegroups.co=
m</a>.<br />

------=_Part_1005_931588803.1599470618901--

------=_Part_1004_1274804220.1599470618901--

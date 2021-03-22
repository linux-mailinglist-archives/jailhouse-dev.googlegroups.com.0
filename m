Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBYHK4OBAMGQEKAHLXHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2534504A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:52:00 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id r12sf26681483wro.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:52:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442720; cv=pass;
        d=google.com; s=arc-20160816;
        b=erHaldP0qw//jExdO1zgGAZb+klJLI8MSXGBK7Z7ugCJI6HIqojTgcDOPVTf5Hlrqs
         +HgiJNRO98Le/+h2kqmUXSOPfRL7/umKkXvRk1OT9DgNZLI/V0yDdaWM4pUkS3NW96si
         M49/o5mFGYwyM5anP/YyH3lU4tiiJKRmB1nDYaih5zeR8vXhOR0uaQKXfePQJPKRedVY
         GKlBD29P289/wZ3JrUlXhLEvIVWI6Un4owx/Eg+uBg/NncG7FeI/kqRNUycz15yoXyhb
         /25fHQpoD7X1+q1S2hTasVz3A46kPyhHvwCJHZECWtZKWvrYPmMewuZ4kQk+pLPfyRUj
         c15A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=/4ZHbO1pvK9WeZTCRmj1o5iI/kRlEnuvG5VYaIRzQ8E=;
        b=yQlH0ZKLQZrb8WF97839/RemXjmycFTVWvcvmXhF8jE730ky8emjtau1qeUz9SnL62
         4RMO0f9L5HrP4Myc2zWkydSHk824DR+g6DmByK/EVxlq4ot5IQLfnFOZfjJ5Z9nS3F5H
         uWA+temw5PFf/FChyglRTZIcJ6Ml+dMxldUABYwIR7EBDUmMbGRbnGAarL82v1IddkdG
         FWOArH0rv6pz99nVvzIWSiMpWeg89AHZZ7OaeTOn/t94Q+/pBCqCcY0R5NBiZ1S4UVBI
         IRZJCrR7QBdvHK39Y9qKAOaZiabw0WoUjPwzWSEDHTzKUWsWH6MhVd/F2U2rLcGl47XR
         VIGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=XkymjH0H;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/4ZHbO1pvK9WeZTCRmj1o5iI/kRlEnuvG5VYaIRzQ8E=;
        b=pgKOT1tk+r73f6ADdEaVkzA5nZ+MMHyC9r4u4y5rUL8b/Eh1fW7k9zNA6qRWwgQdk9
         g/QGQex/wPkxvZOGzymGbdJ1iZAhMtvB3ALiZ/OKrTuOQ887UyeQCX6pE3/roqRdgvJJ
         azVhDp/X7Z7iLyaSksBnzJdFcKY+lwIOvg1QECV5+ma7KAXg8Bacsc4p2zYZVT2xOPW/
         GJ/Cta2h3jYGUQsiORrkjho5N/b6axxG0YPEJ4Xsh49PQK70b4lJYwUtB3t7uc6dE5l6
         bt/BtF/9dmThGaXdhNBW8O/UPvs+SK/9ghyyMcPikNLLt/GkVSdGoPyfdYcANlX56Rhc
         Gj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/4ZHbO1pvK9WeZTCRmj1o5iI/kRlEnuvG5VYaIRzQ8E=;
        b=Nm5OYV4jz/Yup962qHehCUpzyZxWrU5IxLrZTddvA4BAtGCKrSKi0172TE/u3ch8En
         E4AWBxmk3jvPmHxpCUZifIcSGtSC0P5HnMCnWZ8VTzX3XaQG7nXikfiQKGBNTSvqfexd
         P/9XnlVV3yeLyZ+8P1ZChcKULXinzMeyKNDA8eP95PzcxuQHVdaPNDM1CLhcOebK7lVZ
         K8m0Aa6Gr2syWPkcJG9GMl0QNlHWnuRkjs/dpR9ig8Ugvv4WKQyS9kUCyznUhLGnp0dC
         0hvc3zYkT9dCzABOBoMpjt6uxZATXvT/DjmIiU9l5HI7VMQgK9TYOZe2lCT3LuECOyP/
         4/0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533jjcGSdMbYcdOjR/cwUTygiwpNIfcQ0mE69yKINOh/kaK2I2fb
	zaa1nh4uR5bO0lWI/qSN7Ks=
X-Google-Smtp-Source: ABdhPJzMbaOoy3IySRcbZZpioZmbHaD7FD/7ANbQiCdasd4/6KVZJDZ9fjYqzGojdQCeb1t9efErbg==
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr228933wro.314.1616442720314;
        Mon, 22 Mar 2021 12:52:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:24d4:: with SMTP id k203ls194440wmk.0.canary-gmail; Mon,
 22 Mar 2021 12:51:59 -0700 (PDT)
X-Received: by 2002:a05:600c:2145:: with SMTP id v5mr96338wml.65.1616442719438;
        Mon, 22 Mar 2021 12:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442719; cv=none;
        d=google.com; s=arc-20160816;
        b=QwqZTARCUsR2LiVoNQ+P3NZ3TXHELeYV3xq01gjVGhrHvhSj9/Dhs+KDMv7SnjKQjc
         B5iEqLFJnQtU9vOde+ZSebx640O+M52MH9RYvmscm+sepJssXJCxEHS4yUgCcbVVJ5SS
         3A2dOTdemWphpiu4BtJLOd1t7Y80QI1A+qQNXPwwYitWrGVW0M+iyorBfdCE5ng4Q5ll
         sssiE7t8N9JBfWIkkh7pJj/GbgPvmpOF9E59YRGwvEEnd4isweQaUcQJzN4YxQEOwKyR
         o52cbPCY6OeKbHcBVK6Cc3zhyqn++p89ML66oyT8/6seaYVJdLnf9nLBdsrdiU9Hv8of
         q+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=62a1IKUv0b31h87UGr0CxJCwx3WRPEewk2lZq57GeHc=;
        b=TaTmNqRWij7+QG5VoSdgycf2Qy9TmFgd/lN8FClx/Rm5PLP/NXxpvoZ5jJ0aLKF+BH
         PK1+30ObfwrsF9hv/egTx14t9onXNAJjMePvtHf2kkEuGks0LL/bDn6f3XwNQOwjzwqQ
         RHZ+uSc1SybnzivYwOUZOe73Nb671uuEMhIyQXTRaMQrSSBmd6M1F4Bjys0Ag2gwiVNK
         IwPKoWJnQReI1x1V2gfi8J7q8WCAg4ocfwW/Rmwdi847C+z7oOM+xf54jkk8vLqP2vRf
         VbnaKqOoeXvEOby/CNsnzo9OZk338ZbL+7U8kYcc0auf3ZW/54FnQPAa96kcEMKQakQ5
         tP0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=XkymjH0H;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id p65si44484wmp.0.2021.03.22.12.51.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44rv1ZxKzyXf;
	Mon, 22 Mar 2021 20:51:59 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.872
X-Spam-Level: 
X-Spam-Status: No, score=-2.872 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001,
	LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_HTTP_SINGLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id mlzf9wOAfFOH; Mon, 22 Mar 2021 20:51:58 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44rt2PRMzyVG;
	Mon, 22 Mar 2021 20:51:58 +0100 (CET)
Subject: Re: Root cell cache coloring in jailhouse
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com, Marco Solieri <marco.solieri@unimore.it>,
 Renato Mancuso <rmancuso@bu.edu>, Luca Miccio <lucmiccio@gmail.com>
References: <24D2D568-5334-4B88-9430-86F84E576E35@gmx.de>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Message-ID: <d108cd39-248c-2938-e5fc-7e7afd1b995c@tum.de>
Date: Mon, 22 Mar 2021 20:51:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24D2D568-5334-4B88-9430-86F84E576E35@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=XkymjH0H;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Hi Oliver,

On 22/03/2021 08:29, Oliver Schwartz wrote:
> Andrea,
>=20
> I=E2=80=99m currently evaluating the benefits of cache coloring in jailho=
use.
>=20
> In my application I have a setup with two cells, the root cell for commun=
ication purposes and an inmate cell for a realtime application. The system =
is running on a Xilinx ZynqMP. With the arm64-zero-exits patches the realti=
me cell runs without hypervisor exits after startup.
>=20
> If io load in the root cell increases (e.g. with network traffic) I can s=
ee some impact on the performance of the realtime cell. Possible reasons mi=
ght be bus congestion or cache conflicts. Since I=E2=80=99d like to minimiz=
e the effect, cache coloring is an obvious choice.
>=20
> The current set of patches for cache coloring doesn=E2=80=99t help a lot =
in my case, since only the inmate cell can be colored. In fact, the perform=
ance is worse than without cache coloring (presumably because less cache is=
 available for the inmate).
>=20
> My question is this: Is there some prototype code available for root cell=
 cache coloring? You mentioned on the list that you had done some experimen=
ts with this. I=E2=80=99m aware of the limitations that this may have and t=
he concerns that Jan has voiced for this approach - however, at the present=
 stage I=E2=80=99d be happy even with some hacky approach (be it in Linux, =
U-Boot or Jailhouse) to investigate whether cache coloring provides a benef=
it to my setup.

Yes, with BU and UniMore we have been experimenting (mainly on the ZCU102) =
with=20
coloring the root cell during the enable phase of jailhouse (what we call=
=20
"dynamic recoloring").

I'd say your timing is "perfect" :-) I took the chance to rebase our versio=
n of=20
the dynamic recoloring on top of the just sent PATCH v2.2.

You can find the full stack of the patches here:=20
https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring_dy=
n-recolor

Let us know if it helps in your scenario!

--=20
Andrea Bastoni, Ph.D.
Research Fellow

Technische Universit=C3=A4t M=C3=BCnchen
Lehrstuhl f=C3=BCr Cyber-Physical Systems in Production Engineering

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d108cd39-248c-2938-e5fc-7e7afd1b995c%40tum.de.

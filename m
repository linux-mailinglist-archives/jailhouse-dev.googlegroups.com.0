Return-Path: <jailhouse-dev+bncBD53DGEPXUCRB64GQ6DAMGQEQQM3OXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9AE3A25C3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 09:47:09 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id k16-20020ae9f1100000b02903aa0311ef7bsf15721946qkg.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yoIJ+jD2+0Nr/sffYUQLQ+r4hzK1fMeIN1BadwIzlUw=;
        b=be4nzouKDLLHmrssCKWo8IdGF92bRR0CcOhuzjKnZWeLJkLdTBkCRs7sMV5F7DSvV7
         P6QRSMTmd+odVF86c2mWVEjik+s0Qz7AVg3nV7EYnCXFvyTr3fl2z0scUrDWbV8JeOkR
         e34xZpBNFwEILFKT8R8rakEk3wL2lUeTNKltKZuAkPbeziYYB/sv0ab2VuXVNjDXhE/9
         KKwsPQfYeOXbP/xHQIBDndoUEsQyiDPvTO+AkXpS9pZAg/FE4Df78sCiRNuJ3g23Of0Q
         5oGq8y+qWeKqf5JQ5wpwfLx+CtZYPtMYIUEEGqkNVlT1f0Hy6Bq0kU42e+pNHuaeHUML
         /y0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yoIJ+jD2+0Nr/sffYUQLQ+r4hzK1fMeIN1BadwIzlUw=;
        b=HE2dTgLNcHpMqPxgA7cPsdOInsNu/v5R4zUzrPn/uHeyWVQv8vcYvLqg3+ESluE76k
         0aDgJWHZ6KJk13hQO60dNLWcIicvOLSmjW4LaNEaMxKGV6/O77N+oWZX9x1N3AMscKvI
         cBe+Kdvjwo0uNDAXbi51J/IBvPoenDEtU4iK3BvBoI/m7iuqHfxXKogKtllPIaxRbxTc
         bbjK1HoKKbBN9zJ70ieR49XUNoPXFA35BQ3tpEtXOiPXZJNI3cZtyEMrJl/WGZkggdmE
         HoEMHw4v8NiAdZFbPjTZbLzCkxldy4BHU16BaAsRCo21Qmcxvbiy37OnBhzsKS/PS/le
         XE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yoIJ+jD2+0Nr/sffYUQLQ+r4hzK1fMeIN1BadwIzlUw=;
        b=rYuamfrPZDxlXug1pPWMVgKBXMMzTYcYvLWLpJ1kwOfxCEM3/uuBPQuBfb4eHB8bCO
         kywQolCbLIrkMjzeSetub5SEudG4p5jDw8YozKIG+sCO3CBPGSZk07beQa2i/VSrU8Mu
         h6ZOoppQPPZeJojSKO+VmGiQryDDuZo/+jKTWHIAEzggFJiIqJwNUfO9LpiwtI/Sw9YE
         uKMXPyjAOiXdcjRNdY47BQWnN1SvcKVAXIYCfep9W/PCVEookbJIK+1XGps2dMx5H79m
         Z3SviotJetURwoOS51YVO9YOCVkPfEzNMW+JW67LgJp1g0Jro4BhLYLPlmZknKZJEemr
         pJ0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qSnY2MbP5EThdcotwT2WG8iowZub4KvKbPut+wAb7Bo/88VVH
	2Vk5q0Z+zvZyx7mZZF158c4=
X-Google-Smtp-Source: ABdhPJwEJzRUVIMow4UFoVRq+SIsRVM9EoiNSu4SCTqarJzcHWhnoNau4shrkwpRMQM3xp3xUff4pg==
X-Received: by 2002:ae9:dd06:: with SMTP id r6mr3455871qkf.74.1623311228126;
        Thu, 10 Jun 2021 00:47:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:438f:: with SMTP id s15ls1726566qvr.3.gmail; Thu, 10 Jun
 2021 00:47:07 -0700 (PDT)
X-Received: by 2002:ad4:4e68:: with SMTP id ec8mr3623530qvb.62.1623311227515;
        Thu, 10 Jun 2021 00:47:07 -0700 (PDT)
Date: Thu, 10 Jun 2021 00:47:07 -0700 (PDT)
From: laurent gauty <lgauty@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d56ce2d8-9299-47e2-80b6-eea428b62f70n@googlegroups.com>
Subject: Understanding Jailhouse partitionning on persistent memory
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_480_2000426164.1623311227088"
X-Original-Sender: lgauty@gmail.com
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

------=_Part_480_2000426164.1623311227088
Content-Type: multipart/alternative; 
	boundary="----=_Part_481_929512023.1623311227088"

------=_Part_481_929512023.1623311227088
Content-Type: text/plain; charset="UTF-8"

 Hi,

I'm currently playing with a NXP dev board based on iMX8Mplus. I'm very 
interested by the approach you have developed in the jailhouse project in 
order to segregate different cells running different systems.
But as i tried to install jailhouse and played with cells, i reached a 
point where i don't understand how jailhouse in intend to behave on 
persistent memory (i.e. eMMC / SD).

The current configuration is to have several cells using the same SD card / 
eMMC, but relying on different partitions. And i think that most of the 
projects in embedded world will have to deal with only one memory device 
(SD, eMMC) for cost and space reasons.

So here is my question:
is there a way in jailhouse to isolate the persistent memory (for example 
partition) of each cells from each others ?
If not existing today, do you plan for this kind of features in the future ?

Thank you for your answer,

Regards


<https://drive.google.com/u/0/settings/storage?hl=fr&utm_medium=web&utm_source=gmail&utm_campaign=storage_meter&utm_content=storage_normal>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d56ce2d8-9299-47e2-80b6-eea428b62f70n%40googlegroups.com.

------=_Part_481_929512023.1623311227088
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


<span><span><span><span><div><div><div><div><div><div><div><div><div><div><=
div><div><div><div><div><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>=
I'm
 currently playing with a NXP dev board based on iMX8Mplus. I'm very=20
interested by the approach you have developed in the jailhouse project=20
in order to segregate different cells running different systems.</div><div>=
But
 as i tried to install jailhouse and played with cells, i reached a=20
point where i don't understand how jailhouse in intend to behave on=20
persistent memory (i.e. eMMC / SD).</div><div><br></div><div>The current
 configuration is to have several cells using the same SD card / eMMC,=20
but relying on different partitions. And i think that most of the=20
projects in embedded world will have to deal with only one memory device
 (SD, eMMC) for cost and space reasons.</div><div><br></div><div>So here is=
 my question:</div><div>is there a way in jailhouse to isolate the persiste=
nt memory (for example partition) of each cells from each others ?</div><di=
v>If not existing today, do you plan for this kind of features in the futur=
e ?<br></div><div><br></div><div>Thank you for your answer,</div><div><br><=
/div><div>Regards<div><br></div></div><div><br></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div></div></div><div><d=
iv><div><div><div><a href=3D"https://drive.google.com/u/0/settings/storage?=
hl=3Dfr&amp;utm_medium=3Dweb&amp;utm_source=3Dgmail&amp;utm_campaign=3Dstor=
age_meter&amp;utm_content=3Dstorage_normal"><div><div><span dir=3D"ltr"></s=
pan><span dir=3D"ltr"></span></div></div></a></div></div></div><div><div><d=
iv><div> </div></div></div></div><div><div><div><span></span></div></div></=
div></div></div></div></span><span><br></span><span><br></span></span></spa=
n></span>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d56ce2d8-9299-47e2-80b6-eea428b62f70n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d56ce2d8-9299-47e2-80b6-eea428b62f70n%40googlegroups.co=
m</a>.<br />

------=_Part_481_929512023.1623311227088--

------=_Part_480_2000426164.1623311227088--

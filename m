Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBOUX4XWQKGQEQM3VZNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D54E983A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 09:37:16 +0100 (CET)
Received: by mail-oi1-x23d.google.com with SMTP id j13sf841330oij.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i1JdtUVmIPv6ObpSQ22oV7PMmViXyBwi+k8Dhw28cBc=;
        b=APqmV9o147xA0i9d7EoYxZZKt/L06yhtebHNNMDRuEgMK3zeNh5Xt99CHTo4TzQO0f
         pBOwqyNf0kLNgk2w/v7W9Ymeaxsaf4lS/5m6Yioc4qgGhoCUl8iHbkfuO3mGAKZzRRIB
         w5agbKsolsh1JtIxJGOX/YBwkeNmnHc1RzKxbnklH1bkC8iiRv4/suYkoOgzZb3xv3fX
         kYwhMdPKJgfFImwFXkAMOP0Qf+WKOYf1Mzw6blPeG7/fNftoc09sFWyVid+ISgLkfE5C
         iUTFFVPavVHLwl906c5olXhckj7Qoi6On/hiwXgAnClyZv6FrN2B6QP7FFHBqyA0xrxr
         ujuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i1JdtUVmIPv6ObpSQ22oV7PMmViXyBwi+k8Dhw28cBc=;
        b=KI/i5i7kDaLVUt3g85JgOFh5WbJNKmc/VL9GUY8HZPQxrneJh9Y4l+o7s7AtSaAiSl
         8cAQplNRlQbrOlmvNtxoDocSEgiVoXrNHRBmNxIxN6BFN2OrIdJPIrWIAPdqIT8gd6FD
         L+6KWGZ4i0BnKAvjbLTMDc2a9F0jV2eK9CC9exdzkiJBf+NP53EnX3mKz+FRI/U2IN7A
         KaMtZ0OMFOsyHp+rBZmkSgOSNvtRohgboTvNuPBo0xmy9jpKAN/NN+Ovluf40yMs/2TF
         +4njfrqWIm+z+89T6HGFesXc4uiutCBpQpql1vuHHqab+a+69TVqVREPpcUx9TaYrTiS
         kgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i1JdtUVmIPv6ObpSQ22oV7PMmViXyBwi+k8Dhw28cBc=;
        b=eONvrxYTED9bPzM+D2TXdtWNN9ozTioARfT1Hw6MQ3PxrCBSZa7pXEyrdhWkRVsFP1
         0PuDaiwfVDWUMxjM4SGUVLcrWn+uEIV3AZOlNiUYy5tPyjRz8mGHioQqflq3Ck46UWwa
         IiU5NsIwU04TZ1aDlKtzRvayvIBLTzNfqmqNIOmcv7rwKOcLIKpU0E4JG5JRelwjJ9t2
         p1rEB0SqEPe7q4VnIReZYvPxgjVeZRYj65qziEUz2CpAlJKef0JiGH1PBrJ63ik0PHsX
         p3VluL35f8Ou5Svehl0FzmkmdRhk2mQ50FCqNvM0WoFoCRnle9rwzxH6lm6YOQztTJBA
         AGTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWT0DauDhzREDvBK0a70whaDx2ynp60AXbOtuMV7CtpvplCMHDA
	QGuHIlGLZ52t7REF7m/vGlY=
X-Google-Smtp-Source: APXvYqwi+HWVMblfqqzHT+uQFOwjgEBHhi4hD/kBLkD8Ght7l5EhTFaTt+3bRvMzEKTSHM2+BkNf1A==
X-Received: by 2002:a05:6830:1587:: with SMTP id i7mr4092977otr.321.1572424635336;
        Wed, 30 Oct 2019 01:37:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:65c8:: with SMTP id z8ls1938030oth.3.gmail; Wed, 30 Oct
 2019 01:37:14 -0700 (PDT)
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr9434746oth.274.1572424634285;
        Wed, 30 Oct 2019 01:37:14 -0700 (PDT)
Date: Wed, 30 Oct 2019 01:37:13 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2151b869-9732-4483-8659-90234a971f1b@googlegroups.com>
In-Reply-To: <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
 <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1955_190272151.1572424633639"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_1955_190272151.1572424633639
Content-Type: multipart/alternative; 
	boundary="----=_Part_1956_833516997.1572424633639"

------=_Part_1956_833516997.1572424633639
Content-Type: text/plain; charset="UTF-8"

 
Alright, I did the bisect, checked the inmate library and PM.

I will summarize first, the fault seems like to be in the wip/ivshmem2.
P-state was already disabled (Silly me, forgot what I have already done.)
Code steal from inmate library seems fine.

Let me describe my setup first.
I am using the wip/ivshmem2, because my application favors unidirectional 
pipes and multiple interrupts between cells.
I have been using the v0.9.1 with an old version of ivshmem2(15ee5278), 
which has lstate/rstate, etc.

When I need to test with non-root-Linux, I upgraded to v0.11 for the new 
mmio decoder.
Along this process, I rebased the wip/ivshmem2 to v0.11 branch, which is 
the new, multi-peer ivshmem2(5c90e846).
I rewrite the drivers of RTOS, too.

Also, I changed the root cell Linux kernel version from 4.9 to 4.19. (Both 
wil PREEMPT_RT patch installed)

So I changed:
 * Linux kernel version
 * Jailhouse version
 * ivshmem2 version

Today, I cherry-picked the new multi-peer ivshmem2 onto:
 * v0.11
 * v0.10
 * v0.9.1
and tested with Linux 4.19.
All of them has a ~25.8us latency.

The baseline, Linux 4.9 /w v0.9.1 /w old ivshmem2 is 10.87us.

Then I tested Linux 4.9 /w v0.9.1 /w new multi-peer ivshmem2. It has a 
latency of 28.62us.

It seems like using the new ivshmem2 mechanism cause the execution to slow 
down.
I didn't find a specific hot-spot, so certain resource contention should be 
the cause.

BTW, I has code that "executes" on the ivshmem region, but I don't think 
this should be a problem, isn't it?

------
Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2151b869-9732-4483-8659-90234a971f1b%40googlegroups.com.

------=_Part_1956_833516997.1572424633639
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0</div><div>Alright, I did the bisect, checked t=
he inmate library and PM.</div><div><br></div><div>I will summarize first, =
the fault seems like to be in the wip/ivshmem2.</div><div>P-state was alrea=
dy disabled (Silly me, forgot what I have already done.)</div><div>Code ste=
al from inmate library seems fine.</div><div><br></div><div>Let me describe=
 my setup first.</div><div>I am using the wip/ivshmem2, because my applicat=
ion favors unidirectional pipes and multiple interrupts between cells.</div=
><div>I have been using the v0.9.1 with an old version of ivshmem2(15ee5278=
), which has lstate/rstate, etc.</div><div><br></div><div>When I need to te=
st with non-root-Linux, I upgraded to v0.11 for the new mmio decoder.</div>=
<div>Along this process, I rebased the wip/ivshmem2 to v0.11 branch, which =
is the new, multi-peer ivshmem2(5c90e846).</div><div>I rewrite the drivers =
of RTOS, too.</div><div><br></div><div>Also, I changed the root cell Linux =
kernel version from 4.9 to 4.19. (Both wil PREEMPT_RT patch installed)</div=
><div><br></div><div>So I changed:</div><div>=C2=A0* Linux kernel version</=
div><div>=C2=A0* Jailhouse version</div><div>=C2=A0* ivshmem2 version</div>=
<div><br></div><div>Today, I cherry-picked the new multi-peer ivshmem2 onto=
:</div><div>=C2=A0* v0.11</div><div>=C2=A0* v0.10</div><div>=C2=A0* v0.9.1<=
/div><div>and tested with Linux 4.19.</div><div>All of them has a ~25.8us l=
atency.</div><div><br></div><div>The baseline, Linux 4.9 /w v0.9.1 /w old i=
vshmem2 is 10.87us.</div><div><br></div><div>Then I tested Linux 4.9 /w v0.=
9.1 /w new multi-peer ivshmem2. It has a latency of 28.62us.</div><div><br>=
</div><div>It seems like using the new ivshmem2 mechanism cause the executi=
on to slow down.</div><div>I didn&#39;t find a specific hot-spot, so certai=
n resource contention should be the cause.<br></div><div><br></div><div>BTW=
, I has code that &quot;executes&quot; on the ivshmem region, but I don&#39=
;t think this should be a problem, isn&#39;t it?</div><div><br></div><div>-=
-----</div><div>Yang<br><iframe style=3D"padding: 0px; position: absolute; =
top: 0px; left: 0px; width: 1815px; height: 188px; visibility: hidden;" fra=
meborder=3D"0"></iframe></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2151b869-9732-4483-8659-90234a971f1b%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2151b869-9732-4483-8659-90234a971f1b%40googlegroups.com<=
/a>.<br />

------=_Part_1956_833516997.1572424633639--

------=_Part_1955_190272151.1572424633639--

Return-Path: <jailhouse-dev+bncBDDZ5MMAREJRB7FBXKNAMGQERBFGWRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id C408E602A67
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Oct 2022 13:41:49 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id h129-20020a1c2187000000b003bf635eac31sf9130331wmh.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Oct 2022 04:41:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1666093309; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ucdn9bmwlnLlJz37PNhCig5q+tnJdzqlw+DbBPcgpXxR0vv874piq3jtuStu0WXCNZ
         MLkeTx7bY4NuFYTbGnp4v6JOdorr705zUbzQ+x+WEtEoBjOE/brUTyQqGE7L/sAtYxKM
         XcqLCXcnFFl1T87bdUzCZCHdVRClg8w1Eu1T8U5O/Fd5VEJLpKDdtjXtFhhDfDiQUOFc
         pfnCtCw71kdpKGpfDHWOocOqU+2JvaipIdfFTnX0q2g3Vs1S9BK52ADnzdYlMKXhyVf1
         dVW+XNsksbpSM6I3MOKegDgSdt017OJyCIYJACuTrQyEBrrtQeXewR9L4BFyPFrPeVZu
         uPmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:from:content-language:user-agent:mime-version:date
         :message-id:sender:dkim-signature;
        bh=JRR/+s/SpxF9Xp7GczLCDfngQl02h+a925pXpU49XVI=;
        b=YHcWnTvXxRkbD459QGhAhjD3V9DGPRC95LIh3HeDu5kX6qq86dfLca9ayjU5vDEa4L
         t0yl2W0WgKt6v/P5JkjigJFuq7Kt6C6QiehgHd9Eb1c7YtkzDh6iL8O15XP8lv0qz2o+
         yPi5LLfHOFv1vxP0VNfc8QEMEw4Lep8yNbIjOYZFSzkJ9RYiinfUhnj+iFq92J9OEVmz
         0h+6FnXGEShdsrJbzZ+ls0rVv3/VdBU4i2HHkMUluwSC7HITyAtQDQdAwDv0ca3ocLe3
         VcOWurynl9qEG9Pe/hJdyPb6kWcYHRp6OBVIs8iwJ2whfCCHZvV0k9/jvOCzbDkhGLZP
         8qlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b="aHb/GvRL";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRR/+s/SpxF9Xp7GczLCDfngQl02h+a925pXpU49XVI=;
        b=l1Hw3t8EZO0+vWaO/8q5c5uIeGOP7GK2gFAky8xTk8VrOyFkAMDfo6GMfCtWyOHbqT
         58cBcqZGJ09CwWqEkeeDgzEWT7u1XVpKrao4gh6GjPletXrEuJd5qKPe/K0qybWzfRTW
         +2HDn4aRghmq6u7nrAc2LaRCeeeZjhhoPPf+6jGMNKHRHUHvxv2sQo1GB8ueIEhhrQFK
         JHf/vSqQhavqVB3lYXR3saEu5hOdOo95zeYbhLqOLo7ruv7KhaHC5Y/lkBkdSuuwHy5y
         s96RRssDDqN3aRLu0QwC7coVFPQFRtYDUdTdobEdV+p9qpEhHGo2rH1LpsLCmfPEJdRO
         C7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRR/+s/SpxF9Xp7GczLCDfngQl02h+a925pXpU49XVI=;
        b=v7rie22Z075RwdZKCNIwl9o0CQxXwyPWfHmGW8PW2sNU1xntqMMfb6rS97eBmk00sp
         Rjd5I7IPlGCbYiOsRgTa+CYGIik2I26VX5joE/rxkAdOozcxo6CTzRfXcPmj1G62jIuL
         f/icuZDfbR+CeX4Iuw17LfoakgYHX3umuWQt2NWo7g0VcXwFMw9o7YrL293lCrMjB+J3
         EK5WXrNz6hlS7SSVQvi9QfyZNonJPhNvEy9/w8utnHCBU21C02S4GyJxeOHDBmE5d1jq
         F9mzFX9vyU4iE3izUkT5Ajg0eP+BCBo0e6fflzn+AiQTM1UscO4MBztE5JXZm+N1L2Q3
         zs+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1WkchpXVw5koM4SkZi2MIGnQjac8Bk2IwfBGluDWVUu9/xekMk
	mVuQXu/FoTCyq89h26lJtPE=
X-Google-Smtp-Source: AMsMyM5hcT3VUHwgkSjjn/vicffFOyfnUtRPagqC82iFQIC7wT+GVMcnF9e1OyulhohSRAjalkEKOw==
X-Received: by 2002:a5d:4910:0:b0:22e:4007:d047 with SMTP id x16-20020a5d4910000000b0022e4007d047mr1594353wrq.609.1666093309261;
        Tue, 18 Oct 2022 04:41:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:69e:b0:22e:5d8a:c92d with SMTP id
 bo30-20020a056000069e00b0022e5d8ac92dls4092160wrb.1.-pod-prod-gmail; Tue, 18
 Oct 2022 04:41:47 -0700 (PDT)
X-Received: by 2002:a05:6000:1ac7:b0:232:8c6c:6c4a with SMTP id i7-20020a0560001ac700b002328c6c6c4amr1628111wry.455.1666093307343;
        Tue, 18 Oct 2022 04:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666093307; cv=none;
        d=google.com; s=arc-20160816;
        b=X+qhtefblIqoW7GW82WlBhgPlQ1Mx1rAgsFxnLD1jVPpqBWTwSzArU1NzI/d+4XUJc
         88c5KP0BJ4B7s++s4OS0mzr3O84x1yMN+wT8pZ9OR/76bJlwPqV8zOsSPRLVtmUBZjkq
         JkHuI7ALXydJx3VB1fOFUJ9AUyB0Vdn7fvfDq+ZEwTnfSHMVTPF+paLtYXcyc8yN+N+r
         5P38mWmqywE5lndo1qQIdUMCutTgeh7oB7d+V/IRNcqPr16oejbd5r0BRfat258R1Xml
         S8knm0an/9JucY7vEDUBPkJz9uvRSL7kzwq6PTIzE5LG0YA+PezNBxfPOyCY3aNdiMkg
         VbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C9H3X3CyWuXyoHi+6o2iFeAs4ZwPpxHq4UksvrQIGIk=;
        b=g38a1OttH+s1oZggG8Fk/36UHWb0DVrFdZQe3Ze9DNb0BKImK7ZWjezeiUFCRYuTyj
         Y1ZOvjSVFAKjdUIqzXCCBgWSNvbHYmx0qKKWOPZhoYIwhLRCC98IEgQkGzk/fGomE4h4
         tN2BDavAlKXdlHLlpNyzNVn7siQz42tJ/0FVdgzn1K8hEIR9PT+5U7ox2SGlMzDP6+B3
         CjumeX1xeg8h20f9cY9GkH/vgNWKdWHIIpgMOYG+XV6PwlrBgQYja20OzCwwmwYlXh2k
         qp3EW3nVeOBS3MIZiwJU4rC6y2SXLtxTBxptqC5kHQTcEXDGNcYIVqMrS0aMHvaZjOHM
         g5Ag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b="aHb/GvRL";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id bz7-20020a056000090700b0022c8a1af685si558840wrb.4.2022.10.18.04.41.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 04:41:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4MsBlt6sz8zyWY;
	Tue, 18 Oct 2022 13:41:46 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.87
X-Spam-Level: 
X-Spam-Status: No, score=-2.87 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001,
	LRZ_HAS_MIME_VERSION=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_HTTP_DOUBLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id FdsBRHb-ebMy; Tue, 18 Oct 2022 13:41:46 +0200 (CEST)
Received: from [IPV6:2001:4ca0:0:f293:e18f:187e:4664:173] (unknown [IPv6:2001:4ca0:0:f293:e18f:187e:4664:173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4MsBlp1b4czyT7;
	Tue, 18 Oct 2022 13:41:42 +0200 (CEST)
Message-ID: <ab3a6596-0935-73ba-b75d-14cbbc7c68d6@tum.de>
Date: Tue, 18 Oct 2022 13:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
From: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: JH extensions to improve predictability of memory subsystems
To: Jailhouse <jailhouse-dev@googlegroups.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, Renato Mancuso <rmancuso@bu.edu>,
 Marko Bertogna <marko.bertogna@unimore.it>,
 Rohan Tabish <rohantabish@gmail.com>, Giulio Corradi
 <giulio.corradi@amd.com>, Michal Sojka <michal.sojka@cvut.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=tu-postout21 header.b="aHb/GvRL";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Dear all,

During the last months we've been working at a refactoring and consolidatio=
n of=20
a series of patches for jailhouse aiming to improve predictability of the m=
emory=20
subsystem under contention conditions for certain workloads.

The implemented extensions include cache-coloring (previously presented on =
the=20
mailing-list [0]) and performance-counter-based regulation ("Memguard" [1])=
. The=20
extensions cannot be considered production ready, but have served well in=
=20
several papers (e.g., [2,3,4,5]) and are reasonably stress-tested on ZCU102=
 and=20
S32V. Profiling of the workload and knowledge of the underlying hardware is=
=20
normally needed to achieve adequate isolation and predictability results as=
 well=20
as good performance.

The latest rebase on "next" is available at=20
'https://gitlab.com/minervasys/public/jailhouse'

The extensions are a joint effort of Minerva Systems, Technical University =
of=20
Munich (TUM), Universita` di Modena e Reggio Emilia (Unimore), University o=
f=20
Boston and are also based on previous work from UUIC and CVUT. AMD Xilinx=
=20
supported the first public version of cache-coloring developed at Unimore.

Minerva Systems will do a reasonable effort to keep them updated on top of=
=20
future versions of jailhouse, and if of interest, we=E2=80=99re open to dis=
cuss which=20
parts can be integrated upstream and provide some support for questions/iss=
ues=20
when using them.

Best regards,
Andrea


[0] https://groups.google.com/g/jailhouse-dev/c/MkvXIe7CR18/m/hMRUy1CzBAAJ

[1] H. Yun, G. Yao, R. Pellizzoni, M. Caccamo, and L. Sha, =E2=80=9CMemGuar=
d: Memory=20
bandwidth reservation system for efficient performance isolation in multi-c=
ore=20
platforms,=E2=80=9D RTAS 2013

[2] T. Kloda, M. Solieri, R. Mancuso, N. Capodieci, P. Valente, and M. Bert=
ogna,=20
"Deterministic Memory Hierarchy and Virtualization for Modern Multi-Core=20
Embedded Systems," RTAS 2019

[3] P. Sohal, R. Tabish, U. Drepper, and R. Mancuso, "E-WarP: A System-wide=
=20
Framework for Memory Bandwidth Profiling and Management," RTSS 2020

[4] G. Schwaericke, R. Tabish, R. Pellizzoni, R. Mancuso, A. Bastoni, A. Zu=
epke,=20
and M. Caccamo, "A Real-Time virtio-based Framework for Predictable Inter-V=
M=20
Communication," RTSS 2021

[5] G. Ghaemi, D. Tarapore, and R. Mancuso, "Governing with Insights: Towar=
ds=20
Profile-Driven Cache Management of Black-Box Applications," ECRTS 2021
--=20
Dr. Andrea Bastoni
Research Fellow

Technische Universit=C3=A4t M=C3=BCnchen
Lehrstuhl f=C3=BCr Cyber-Physical Systems in Production Engineering
Prof. Dr. Marco Caccamo
Boltzmannstr. 15,
Geb=C3=A4ude 1
85748 Garching

T: +49 89 289 55173
Email: andrea.bastoni@tum.de

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ab3a6596-0935-73ba-b75d-14cbbc7c68d6%40tum.de.

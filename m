Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB4HXX3VQKGQES7MXNSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF82A83B8
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 15:28:17 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id f10sf1107173wmh.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 06:28:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567603697; cv=pass;
        d=google.com; s=arc-20160816;
        b=OvC4nMPJr/Q1a5tKObSU3ltl+UkAMf6ddbYXcYgjmd4Hjg3U6DpcBQDNL7EVGthQI4
         ao6940Zpnv36kwJmjJAit+kW81NbbgLOFUndb0ittMWQQ4Dv5sY59QvU5DEZNXF85JDE
         5GRNVSs98UT+VL3LRZ2hb7t2Az9Myaqc1x/OJ3qm1gSxjbIB2wHv/1VcWPBXFrlSv0+M
         HEL3HgVUC2JFViMzun/ZUT/QdJftahTnt4MGkkKMo3ZIgjIda3YjET14WUryHdsQ+tq0
         ueyebQhncj61YMqrSRHOzqaHz+wBqi3K+6cCyqcfri4qmHsQ8KjaZmKi73MOkeaN9ppW
         uBiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=zZ3n03sHE4uSEL16i7i4iG91KMZxK7DS1aUTDtjdnoA=;
        b=rOeAm8PcPPLlmq4/kZfH/YvbiMDx675dj6OaLa2g+PZEG/ukJUkGU6arw9HoCB6B9H
         nLelNZUs0IsC/Zb4hwEyDBR+eULFYVedqUGDAaADC7Qh735z7YEjQCLGRk19UE5TNqVC
         XH7iYqcvMOA6Gi9hFb4aO6SiT5lY4BC+UF9NWwrJCIXU5pnZdwH2rETrkprBhPnT352V
         gtjXLE8v3pc628Ecjz7qzZMvA7VSa1U8LaQ+8mBGq4IRk2qr7xtR6FkmT1IadIHPbxly
         ENQs2NRwUB01Ho3d6p+STPAsHhguwby5A3JtKUW0B1nzJLqH6RaNLAmkCT4w/Ms3bL+x
         9X2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zZ3n03sHE4uSEL16i7i4iG91KMZxK7DS1aUTDtjdnoA=;
        b=njzbAVW15Dp9g/aLvbV5NHGQLF8fAIxL3bcIArBU+QCufSkyQOrr/n1DZ2zlXYojN/
         NmcDmqK5+XyidGCVuzCI69taCh8+zpuGz4YRKXZLi+q1r/KV9X46hLcaB2VCXY+cVZSm
         oRuCZTffthbDjgo3z1OL6aV6GCY6fg/A6oGLEM6DjYIXTHa8WmmhTcoxySQaXNKQarLE
         YQ1yykrLmjguxBi+51zH0wzimUPFHlFWO5pzKSTRCZPExYKMgUgHW9sof2pi+r5jdrD3
         aZO/RlAHobgb6QCt5TAMamFnTycRjMS6wagmi+O83l8rIHVKz7Paad/z7EQtKXyDMxfX
         +C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zZ3n03sHE4uSEL16i7i4iG91KMZxK7DS1aUTDtjdnoA=;
        b=Q/sWffAUCr4t227HiaJAq2BlILdogM/KYimFCk84VQMoxZIaMSOaoiRFTTHtNKSsL2
         WqPEwEmFvaAw4q1xxizT+PAuR8g6byNwLdJRbUxsXQUqMCXz7aAr1Z9VW5+b5X+oCPCE
         JdCqfORR7/uOIFkT0NDZzXiQEbAEPBAeHp2Hv+Z22VM5v5AaxD2jRTzZ+N73QFTYF/kL
         xHpsuH2mnIuFqEv/a7mxSz5I2LIJjaTmoTPxjdb5FrqKLMhoZozeKuyKGTT81L1Zz/DU
         FOJZfsfPwRyL4vfJdsqJSvY3YAXAH7LPUj/jkkdjVHla6YoZ78YM6d9ncssP6kUCWsbJ
         UqAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXDHV5NpboWFgflCEPPGDP3ZCTHR1mBRpI+GBAVTJOarAX59/wt
	M3XRrsZXhwqscWQUtYbotcI=
X-Google-Smtp-Source: APXvYqyY01mIOmttkcuXd5CNawkKq8ddXAXgNSpiNSmUMsZnmKmmEDfUNSJGmaBQJOcpEF3fSJ0YbQ==
X-Received: by 2002:adf:f801:: with SMTP id s1mr3130520wrp.320.1567603697142;
        Wed, 04 Sep 2019 06:28:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:550b:: with SMTP id b11ls2322460wrv.1.gmail; Wed, 04 Sep
 2019 06:28:16 -0700 (PDT)
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr1602064wru.349.1567603696567;
        Wed, 04 Sep 2019 06:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567603696; cv=none;
        d=google.com; s=arc-20160816;
        b=ZILI5GYKJmIaw9L8WCGS+B7U/sVPkKfZ5xry4jNt1HNb46tor4ILQlBUrzls2cyRy8
         Hyp8AOikbIScP4Z0XzvWeG3MUy00lLYX7oDgLHvySFLbl/2d9Q31ksNp32+IH6Db5VwD
         urRkXm3gl7tUAniXRyg0mjj//3aKlOLBR7JCHxjhE1/CZhCYwYoC8vCca+O975W2nH9u
         v6LwDy2Hc9vv2kKIRSZG7uGMJ52RHse4tcnUd7VfnphNTigicutpC7OuJ0xgKk4TdRS6
         8Vdb47bKb5IRBqL5bRwMZDH6EoTgLkV9C89yzDoxSrgtuAIEEqfJiV1q77CY+3sFqgYO
         wnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=vFgbWr+jF6yXSy1DoIaZEa313AVnrA4Ce0LpJQOTMJM=;
        b=tdXYRps6FyCVNN3TXcnISfXj1GlPc9msGnw2pH4Cunmibf2Fqx9Nz8HBGXJunH53qA
         SLRERYuf2Eg9f4ENAzC1zCvZNAPwhLfnKfQN3vAtzjMthFbbDbggssK8QtGnrqSYygq3
         fTfrCcbzLOKrg3T3K/qz46GBH2DmAnc6QVCGzAIpeJjOHukNlBQ2+/+vGvphxY9R5wAW
         II20iRfPjmS+E6zMN0WspNORw78XrwEfEo5HMb+n4CoS0YXnSj4MP3YiQ3jVbWkerJ/f
         Al5TKnRzsr9GXA15z8FaIIDbBOyhrddXH/I/RQZuZCJowOBCg5X/44kFEj6mqXNjKodB
         kFtw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a10si158069wmm.2.2019.09.04.06.28.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 06:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x84DSGP1012332
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 15:28:16 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.141])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x84DSFLq020726;
	Wed, 4 Sep 2019 15:28:15 +0200
Date: Wed, 4 Sep 2019 15:28:15 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [jh-images][PATCH 02/13] build-images: Use latest kas-docker
 internally
Message-ID: <20190904152815.79ccde31@md1za8fc.ad001.siemens.net>
In-Reply-To: <d88a6bfa-2fd4-9358-d291-06252c69ec85@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
	<458367be5bd5bd94f0f971fdf15086c0dac3e061.1567490365.git.jan.kiszka@siemens.com>
	<20190904111502.2fcbe1c3@md1za8fc.ad001.siemens.net>
	<d88a6bfa-2fd4-9358-d291-06252c69ec85@siemens.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Wed, 4 Sep 2019 13:38:18 +0200
schrieb Jan Kiszka <jan.kiszka@siemens.com>:

> On 04.09.19 11:15, Henning Schild wrote:
> > Am Tue, 3 Sep 2019 07:59:14 +0200
> > schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
> >   
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> By now, more mature starting of the kas-isar container is achieved
> >> by using upstream kas-docker. E.g., build-images.sh still forwards
> >> SHELL unconditionally, breaking on hosts with shells the container
> >> does not support.
> >>
> >> Therefore, pull kas-docker on demand and use it. Expert users can
> >> define an own source by setting KAS_DOCKER.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> ---
> >>   .gitignore      |  1 +
> >>   build-images.sh | 33 ++++++++++++++++-----------------
> >>   2 files changed, 17 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/.gitignore b/.gitignore
> >> index fe0ae1a..43892c0 100644
> >> --- a/.gitignore
> >> +++ b/.gitignore
> >> @@ -1,3 +1,4 @@
> >>   build/
> >>   isar/
> >>   recipes-core/customizations/local.inc
> >> +kas-docker
> >> diff --git a/build-images.sh b/build-images.sh
> >> index 50ed677..28c3a50 100755
> >> --- a/build-images.sh
> >> +++ b/build-images.sh
> >> @@ -2,7 +2,7 @@
> >>   #
> >>   # Jailhouse, a Linux-based partitioning hypervisor
> >>   #
> >> -# Copyright (c) Siemens AG, 2018
> >> +# Copyright (c) Siemens AG, 2018-2019
> >>   #
> >>   # Authors:
> >>   #  Jan Kiszka <jan.kiszka@siemens.com>
> >> @@ -21,24 +21,25 @@ usage()
> >>   	exit 1
> >>   }
> >>   
> >> -KAS_FILES="/jailhouse-images/kas.yml"
> >> +JAILHOUSE_IMAGES=$(dirname $0)
> >> +KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
> >>   CMD="build"
> >>   
> >>   while [ $# -gt 0 ]; do
> >>   	case "$1" in
> >>   	--latest)
> >> -
> >> KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-latest.yml"
> >> +
> >> KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml" shift 1
> >>   		;;
> >>   	--rt)
> >> -
> >> KAS_FILES="${KAS_FILES}:/jailhouse-images/opt-rt.yml" +
> >> KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml" shift 1
> >>   		;;
> >>   	--all)
> >>   		KAS_TARGET=
> >>   		while read MACHINE DESCRIPTION; do
> >>   			KAS_TARGET="${KAS_TARGET}
> >> multiconfig:${MACHINE}-jailhouse-demo:demo-image"
> >> -		done < images.list
> >> +		done < ${JAILHOUSE_IMAGES}/images.list
> >>   		shift 1
> >>   		;;
> >>   	--shell)
> >> @@ -60,7 +61,7 @@ if [ -z "${KAS_TARGET}" ]; then
> >>   		MACHINES="${MACHINES} ${MACHINE}"
> >>   		NUM_MACHINES=$((NUM_MACHINES + 1))
> >>   		echo " ${NUM_MACHINES}: ${DESCRIPTION}"
> >> -	done < images.list
> >> +	done < ${JAILHOUSE_IMAGES}/images.list
> >>   	echo " 0: all (may take hours...)"
> >>   	echo ""
> >>   
> >> @@ -93,17 +94,15 @@ if [ -z "${KAS_TARGET}" ]; then
> >>   		fi
> >>   	done
> >>   fi
> >> +export KAS_TARGET
> >>   
> >> -if [ -t 1 ]; then
> >> -	INTERACTIVE="-t -i"
> >> +if [ -z ${KAS_DOCKER} ]; then  
> > 
> > In addition a "command -v" or "which" to see if it is installed
> > globally would be useful.  
> 
> I thought about using an installed version where available but
> dropped the idea as "too special for this interface". The point is
> that, as an expert, you can now call kas-docker on jailhouse-images
> directly while build-images.sh is the simple interface for people not
> familiar with the internals.

It is not too special because even experts in kas and isar are not
experts on how to compose the several yml files for a chosen build,
they want that "menu". But fetching this one script is not going to
hurt runtime or bandwith usage ;).

Henning

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190904152815.79ccde31%40md1za8fc.ad001.siemens.net.

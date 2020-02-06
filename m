Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHOH6HYQKGQEEC6JQVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id A9939154B97
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 20:06:05 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id 90sf3979169wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 11:06:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581015965; cv=pass;
        d=google.com; s=arc-20160816;
        b=S83EGtWFZtT/XWwI1NY/qsBqDU220NL6Fn81qtSp3zMZaqtiFvmKdjIVX4wGWYoym9
         nBodfNjxVVj+pN41UwxuS0CnYPd/yB2u1aL1jTHL5QR0FoayTEIJWt8wBN3p+4/UXaEo
         pSLZQwH75qZiY2IFJhH4zNJndtdjxWi5MtctCeerB1vNL+I1vxuqD92arSV+TMpbT7Li
         scQMZcWth8Lvesgasus5JsaDBSMK40WNXy4r1msg2q8JsoXjLfsum6V2YuLak/DMn/Sq
         13f2M+GC2HQ8LDs529LQSVR47cS9AAFssUNZQbVLSPdcGOl5uIk32LxKIVw7VkSixyIG
         BxeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Ru8kVeAnpcRfsRdMXLVpI/D2+d/yyZylFZabT35glcY=;
        b=QvQnHnISU3EnS2/358soCvo1ZoIB2fqXkU9kbc0wLjR6ME6pcL8HzQ5XSR9YmVR5LR
         Apg4MHm+6/b21eX9Mu5RLjK9CkPt2lmAqVr8ZoL4Lz9oNo0/bOik92h8Qh6SJ1GLNwtq
         SMXk3Z6vNBClaKLg+VaTA9mPpqukdsUgQHQKmEeat2thp7bSU7OhTSYMkmrzacEUnL2P
         zIfG0mn4NXRjNtR/+sgumaE0UaNmT9o+gjLmFgLD8e/U7WI05kKdZt9CZ6T6Ryq0oZcG
         5Sxw2CRhcOfaOc3/89LhH3xuYHGjFPzm2qOksbbA5z9efQdHQFs+Z2Ifu+Cbzw5i35Dd
         xt9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ru8kVeAnpcRfsRdMXLVpI/D2+d/yyZylFZabT35glcY=;
        b=MqwftRxjmeCkSlajpeXbLY2W0LUhPPdC2GO1mE8HywmpahMJ0aOscKM4Ueu2GgR8Ve
         YMrKaxVNu00z9b3gEqooXxB7S3eosXD5s87dTz+XeN5eOFqhvCwAPvimLBQRiGNOBdvT
         aeRPNcSQOUZlA3VgnqOLeOKy4+yVzbHv3BPNHkD7P6wHgZNw6oQWM2WPFc/8xf3jlBMs
         gcLmKNOI0SGkP4SqKriBtwEkdH837wkqWrS6fHkE/FHvvQ6xstjsfhO9dKGw5QqWovll
         tmZKhOlO8d+jVzRQqorR+0FdiZ604fl0VoIaMKhBovSGdPYb4CkgVMtNu98tS25q6k5i
         LBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ru8kVeAnpcRfsRdMXLVpI/D2+d/yyZylFZabT35glcY=;
        b=YSzydFkdfdKflz1doOeI2VNwgfVdxXf6Br0XLJ6r99LqflBz8aknwTncagIuRZuPn+
         PnHIXcjRspOiOKDQuj+irDMeOLC5erTm/hV3TSEFnuc4D144dKKMej2UV2sL3TRa68XN
         5VbM05iTI3+q5KTM07KDAsZIhknMEAyeOmMozsWPtPhkvMzhlgRD5OFtvU4RocwJDDwm
         vKGZeiG5kFlZ5RhVShfbj6ZHiBTxU0MRbEvBHYtUk68EuB8AWvqAR8lSsaomV+HTan9L
         IQ9VW6wJxa5oRf4bYdWDE0HYbZMkQ3XKaP8Y8FbQGXo6IckCGRFEuNw10Y/myYngtef6
         2uwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWoxnj14nVmtEGODAG8XhWInZ0gEsSUS+D4PYMLtpxHk4BawZDU
	5x7WkOBfpZdqVuoTsmHhO40=
X-Google-Smtp-Source: APXvYqwtePkhRzjZqJh5LSvZU+e0znvEc3TTXXAO2yLD50B8xLDmUGt9poJOO9ir0qJUP+qqDdnB8w==
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr5543218wrm.150.1581015965353;
        Thu, 06 Feb 2020 11:06:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4d0:: with SMTP id g16ls6286137wmk.2.canary-gmail; Thu,
 06 Feb 2020 11:06:04 -0800 (PST)
X-Received: by 2002:a1c:9602:: with SMTP id y2mr6039976wmd.23.1581015964617;
        Thu, 06 Feb 2020 11:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581015964; cv=none;
        d=google.com; s=arc-20160816;
        b=QIREQtgwiSOrxF4OQXgnfr17RZhmgWlVoGn3DtOTQL9djkSaP3IDcbu/2BQ70Sst8b
         Aw+xxYe/UtcpxJVoUMsHqEBCyi4JAxg7VAjZPNA26TifK3zrFlv76dsQZx8XLMmuj3VM
         TnX18Fqh2FeDdvMBXDpd5bmwDp4ENrQlUppIFG3mgQ24FnJMM2jBCL5TRyfKKGXTrpmo
         UvBqIWu+oNS54vxy8YHzRchuGrNGGfZuLZl691rerIW/vWBbaHLu1bryNee5FzeaodnH
         KvmkFfzKw1G5aN/NVDADSz3RMOYrturOq0HQm04P+jI0Y8NzdQ9oIultSZ+hUYR8n1dA
         cTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6hwKHO61uE+Nyi7q+f256UAxnrQ/cIDXl2ICJRtpSFU=;
        b=QMUzi3xYy95MgGALiA1FnH7NEkbXe9Ip5ctQkl7uLtOz3M/M4na/t/0Bd3oYO/R4d+
         BXeH+NqHKlHdPubD/zZGK8NSYBJrvs7Pd5ysoar2WHCwbBW1c71t6ng6NZd32U8GBC5U
         ygGwhgSF43wT02xoxpc9sGKrjPKShbS/XI4QsA64yHWUbBKn5eaFXQw16AGeB6lBGJFD
         wTv0m5LKqjU9HsPYCtygsFxS3K4kLtoRsci8xoAGYNc0yFfYc4dZilJIumyaHcaKR91w
         KvXuCBaDNfICJQmg2izNKdvyDDGm1R3eRhF55tu+AucFXK/hLiGFw4Qk4hRF2F6rG7in
         v42g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t83si343386wmb.4.2020.02.06.11.06.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 11:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 016J63jX004839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2020 20:06:03 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 016J63EY014994;
	Thu, 6 Feb 2020 20:06:03 +0100
Subject: Re: Difference in execution duration between root cell and inmate for
 same code
To: Michael Hinton <michael.g.hinton@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
 <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9c6c6364-c7a6-f2a4-507a-b5a9b1f6b8b3@siemens.com>
Date: Thu, 6 Feb 2020 20:06:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 06.02.20 20:00, Michael Hinton wrote:
> Hi Henning,
>=20
> On Monday, January 27, 2020 at 12:16:08 AM UTC-7, Henning Schild wrote:
>=20
>     Ok, so we are just looking for differences between the inmate and the
>     linux as non-root cell, because the jailhouse/virtualization overhead
>     is acceptable or known.
>=20
> I'm sorry, I was confused. That is actually not correct. I am looking
> for the difference between the inmate running my simple workload vs.
> running that same workload in the *root cell* rather than in a non-root
> Linux cell. What I am doing is activating the root cell, then simply
> running the workload in Linux with a wrapper program (sha3-512.c
> <https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862e=
f24caf641e/mgh/workloads/src/sha3-512.c>).
> Then, I activate my inmate and run the same workload, but this time
> within the inmate in a real-time wrapper application (mgh-demo.c
> <https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862e=
f24caf641e/inmates/demos/x86/mgh-demo.c>).
> Both wrapper applications now use the exact same object file, compiled
> once under the Jailhouse build system. But the results are still the same=
.
>=20
> However, the input used by the program in the inmate is in a special
> 'add-on' memory region I had to create and map manually with map_range().
>=20
> Here is the additional memory region in my config that I named the
> 'heap' (I need it big enough to hold a 20 MiB+ data input):
>=20
> /* MGH: RAM - Heap */
> {
> /* MGH: We have 36 MB of memory allocated to the inmate
> * in the root config, but are only using 1 MB for the
> * inmate's stack and program. So create an additional
> * "heap" area with the other 35 MB to allow the program
> * more memory to work with. */
> .phys_start =3D 0x3a700000,
> .virt_start =3D 0x00200000,
> // 35 MB (3a7 + 23 =3D 3ca)
> .size =3D 0x02300000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> },
>=20
> https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef=
24caf641e/configs/x86/bazooka-inmate.c#L90-L103
>=20
> I am able to map that large 35 MiB memory region into my inmate, and it
> works ok:
>=20
> #define MGH_HEAP_BASE0x00200000
> #define MGH_HEAP_SIZE(35 * MB)
> ...
> /*
> =C2=A0* MGH: By default, x86 inmates only map the first 2 MB of virtual
> memory, even
> =C2=A0* when more memory is configured. So map configured memory pages be=
hind the
> =C2=A0* virtual memory address MGH_HEAP_BASE. Without this, there is noth=
ing
> behind
> =C2=A0* the virtual memory address and you'll get a page fault.
> =C2=A0*/
> static void expand_memory(void)
> {
> map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED);

Why are you mapping your RAM uncached? That's (roughly) only needed for
MMIO.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9c6c6364-c7a6-f2a4-507a-b5a9b1f6b8b3%40siemens.com.

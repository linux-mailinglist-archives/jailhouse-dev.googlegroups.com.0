Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMGZR3UAKGQEL6DIDIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D60246077
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 16:18:25 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id a19sf698403ljk.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 07:18:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560521904; cv=pass;
        d=google.com; s=arc-20160816;
        b=DrJ2pOGYDgdjppomifAOycx6C11hIIRSDFBCKifyRmfsZY0uNQI2Vg8ZwrKCagvjK8
         wCBm4x5Y4xGOXmKQLD/wQqUj3IaMUj9JV9rtUdPl2u+6og6pAbLuqUKYmaSvdwcTAulq
         rkTj92AjEoJTz8fMPpDHtODSPZZJzbxU9LO3s3ayH1OekDFssya/ikKci0CHU0FVNq4x
         swi7TwBpd4OY/JjO0KODXNRsbhBRNYwc5qDkctMPBqFVoHQ0J19SbucD5uOLb/713qlx
         6/8kgQTzRHTWZIM7Rb085eeB1ND36Nnth+ky/OMvTQZcOUVRsCjmXqHjguxZjJ+Ill2h
         SgdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=oyqkPRuq53iCf9/VC7TdoQEFRDPWGb0KuqlwE03YuRQ=;
        b=DMp4nRF3QqhfRjMqxKo6LSDQ3qKI6jbYFAmsjO/zqroRhBQYrKNCEnCEIwzcsn7niv
         bwGPuZNRg4HuV9poudssogKyUdIyqdCV656E8zeqtcrG63+vSsi5a+g7NZ4oHjm+6AkL
         MsSyuCM0uDPZxIX0KxV/HnBoCPT4pBJhtTlvzqnG09Q6mkPuUf1Ztwue5AXxQlUzo2LA
         Q6meAdZucu4Ix77z1DAdv9EtBwzorPfj35d0OZpbwZlEvPPx00iFbro1lQACatISoGRS
         QJXVB+03vUZEFKY7g7q8VCwsz6hWajwf8J4RDEameMF0YvS6g4pyT8BSchMKGju4bJYf
         6H0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oyqkPRuq53iCf9/VC7TdoQEFRDPWGb0KuqlwE03YuRQ=;
        b=YOzERXcmw3WX7rnyWGVQq1sVcs50b1YKXACNFE48sCc6loJ63myijd7+1NDWhZvpK3
         +hW3g5h0dGoOXrb8rxusXr2TUVnP/m6IlNP6uJekqT+U5YkFF3PRE4UWLU9grVLbD73u
         koKoj3v10QvXaOnVOVK81nqD8Phv5SYzqHtfO7mTtCp2R5QjB0vclg8BdxDqGSwYWMo+
         AiVCb8a/EFMf7O+MNe4U2unCW+gYdB4g+QgvCcx9xTSG1gsMBmTqpojJQIMF40iS5ndX
         Rpb0PZJc/JJJVNYb2MSyy1Kw8FQ6qQhvDZJkwOzNxrw3E3rSNXgr0zcN38anixTriDKj
         lGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oyqkPRuq53iCf9/VC7TdoQEFRDPWGb0KuqlwE03YuRQ=;
        b=fZm9G9II6+Dz1gaC8i12S5iDGDamALUHW5S6nDubkzut3KrTnpZlt2InmJZ9RB4/R5
         h2Cv3ZvBnTWa2HO+WSnkOre31WZ2wUQNcPNMZSTtYtGKhHQuFj8Jd/rqkPBZJ8Pm84+K
         hRMoNTQhAL8zZOgOTmniq16uL0qhgqOn0aTUiDebjujsf9YYPm/wEGCQo0zdFsuER+HI
         LumZtXxXck86f29E02UG55uOY6ma/luMRAmEjI3QzCMEUe18apEUc9PehZ65nY/IiYbK
         Hl2XFESfGOm7OhSUNfON845PvkfE6SnjfH4Td2eJlSXnreRpFcBbkIwqjshrCjF6GuD5
         GOUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXmsT/2OCtpkKTNq7Hh+u/+sJXsXQ7IQbJo1vgzx4jD4ey38lKh
	K+afWN8AMxmck6asac2qybw=
X-Google-Smtp-Source: APXvYqynhAVeUqecgmgZQ2t6sTCBhOTjyxbJMHspMUcK2Ju/yVx+YyMJRCyB06Ndu99/gJcjJS+oiA==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr13126652lji.139.1560521904685;
        Fri, 14 Jun 2019 07:18:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8917:: with SMTP id d23ls1104126lji.14.gmail; Fri, 14
 Jun 2019 07:18:23 -0700 (PDT)
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr39794988ljj.68.1560521903916;
        Fri, 14 Jun 2019 07:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560521903; cv=none;
        d=google.com; s=arc-20160816;
        b=EUEfqStxtWo4jzsIkWjXGxZYxoVK0xKFkpEc3QBhX2gCr2H7UR9QOxcSBxf9eqHf/O
         9dlK6qKDjZC9yrHXGaa4NvbKSaPWkgYQOpthcVj31vVy+sVhINbPGlMiFEep0T4iIATd
         fdWTwDPw7golFJqZ4v7f4EhvdnKsdtWz1MfFDtJJGwrI3t9bhgSySSxmYFRLVyqSxtVw
         Hk+oz2SqPPxs9G5q/9GXq0OgdgkrA6Zdn45bWt49EXCyKOdiK27CLBMLqut/6f8LaVKB
         SXij1MGv824v7mRitjnGaA444ckSm6smbHFyo1xHDHdQyKMcpobLUk6Anlac/9JOXY6l
         ZuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=j8SEPibYe4iRHdfzjgxL6ne0CocHqLrE3fcpTCbgFpk=;
        b=r6nJb7Sc/F5XCbT/mGQjrbzqZ75Hl99MhqqgryrcjDzkEtdpcLDxaOlJeyTUVUfGhC
         G722Ea5SUeyXeA/kBtultHPcjVhSncp47FfEoAE2GqBw0um5yRgwMRAZo/HbTX9eJBnB
         ZC0tb+Z9wOTfeQLvEJs0gbpQqAPuEg/QK2bnpL/+a9fQt6volOpfOJMJpij4g8eeTJfa
         BGk1tVjxRI6lqeDpaKbKx+4VpRXaigE7Ar+FqCJ/T1wgvB9YRSsCsHwDF0CwvSB4zlPK
         7llejjuoCp+CNQWQTti9k26qg+Z5n+LR1faF90tQHSEDnDdBrYhXD8tAQ0DjA4P2cT+I
         T68w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h1si122984ljm.3.2019.06.14.07.18.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:18:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5EEINOb020332
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2019 16:18:23 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5EEINFZ026372;
	Fri, 14 Jun 2019 16:18:23 +0200
Subject: Re: [PATCH v4 8/8] inmates: x86: Add SSE/AVX test inmate
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
 <20190613200442.18984-9-ralf.ramsauer@oth-regensburg.de>
 <411de940-d9d3-e716-481a-6c892701ce27@siemens.com>
Message-ID: <693f6614-2825-e099-05fc-a12e16d8abdb@siemens.com>
Date: Fri, 14 Jun 2019 16:18:20 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <411de940-d9d3-e716-481a-6c892701ce27@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 14.06.19 16:09, Jan Kiszka wrote:
> On 13.06.19 22:04, Ralf Ramsauer wrote:
>> Depending on availability, this inmates executes some SSE/AVX
>> instructions, compares the result against an expected result and exits.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 inmates/tests/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
7 ++-
>> =C2=A0 inmates/tests/x86/sse-demo-32.c |=C2=A0 1 +
>> =C2=A0 inmates/tests/x86/sse-demo.c=C2=A0=C2=A0=C2=A0 | 89 +++++++++++++=
++++++++++++++++++++
>> =C2=A0 3 files changed, 96 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 120000 inmates/tests/x86/sse-demo-32.c
>> =C2=A0 create mode 100644 inmates/tests/x86/sse-demo.c
>>
>> diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
>> index 1f30852f..030e20e6 100644
>> --- a/inmates/tests/x86/Makefile
>> +++ b/inmates/tests/x86/Makefile
>> @@ -12,11 +12,16 @@
>> =C2=A0 include $(INMATES_LIB)/Makefile.lib
>> -INMATES :=3D mmio-access.bin mmio-access-32.bin
>> +INMATES :=3D mmio-access.bin mmio-access-32.bin sse-demo.bin sse-demo-3=
2.bin
>> =C2=A0 mmio-access-y :=3D mmio-access.o
>> =C2=A0 $(eval $(call DECLARE_32_BIT,mmio-access-32))
>> =C2=A0 mmio-access-32-y :=3D mmio-access-32.o
>> +sse-demo-y :=3D sse-demo.o
>> +
>> +$(eval $(call DECLARE_32_BIT,sse-demo-32))
>> +sse-demo-32-y :=3D sse-demo-32.o
>> +
>> =C2=A0 $(eval $(call DECLARE_TARGETS,$(INMATES)))
>> diff --git a/inmates/tests/x86/sse-demo-32.c b/inmates/tests/x86/sse-dem=
o-32.c
>> new file mode 120000
>> index 00000000..1136c98f
>> --- /dev/null
>> +++ b/inmates/tests/x86/sse-demo-32.c
>> @@ -0,0 +1 @@
>> +sse-demo.c
>> \ No newline at end of file
>=20
> Replaced this link with a two-liner in the makefile.
>=20
> Applied the whole series to next.
>=20

Hmm, first I messed it up, but now it seems there is some problem either th=
e=20
toolchain version or even something more fundamental:

https://travis-ci.org/siemens/jailhouse/builds/545772792#L570

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
jailhouse-dev/693f6614-2825-e099-05fc-a12e16d8abdb%40siemens.com.
For more options, visit https://groups.google.com/d/optout.

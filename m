Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBEM237TAKGQEW6JSQJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B8C1AB15
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:36:50 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id r7sf6867018wrv.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:36:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557646610; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q5d0lKtPZ83jum3R7WLBHXgxLEQhrOZBpgvNnc9tIVA+dHMK7Jhx1sw5DakRQQe/++
         k83SVxoM5GyFrxuwiCQobY/HgF+3pulwEhK4Q/2bR3EiqeqxH99dUDxhAtHB18TiKMcQ
         0MAEUFPxCi40d/V8QlnjyFioyMjGhBLPJtyP34yxjmbLkqbZuJOAqGsLroyFzPOKmdu9
         kENL8HJANKNGbJjrbWW8ht3R0nsYqw9I5sEK0r17ByLFbfI78LaWPmL2JeQl9sykhp6n
         fdxdcbT5bMtbvNK/WWQD9H5x2Z5qTo52Q6PbA42UTi7k7HFonyoBao67Q9OUDyTGsdl3
         xXlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=qOTOg0LkwyUuWUM8Ota64vNsR/QPJhCRiC919tJifXg=;
        b=vjbqh33L0TJzm3LyTgPXb7zeL6ktR6ljIRkIi5kMKIBAUekV0x+VtztMY3g3NB/Uft
         wVvvmPBBrPg3fomGoghdTmJc46mWdU3NFoPkqo26pbyFZq5SYveHMAsBwfO1dvdQZEvT
         Aw1vDny2dTLPS2wIT8HEOaW9RPIQ9U9E3IGbqIxLEbj3Eo22/QvQHl0Jq9xENUoumvSb
         AzLqHwBcVwsk37Q+6j41sP0jqup7+FJLFPNjqoAZIC67w9aNkpvy7AmLd1cr6AaiLtDr
         Q7dQsix7aAIkg/OUbNRVs/3s65maMJ8AfnFtOz9pHbJRytvzRu1kN7O7kVnC9J75Xoay
         a1Uw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=A8HzIBWw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qOTOg0LkwyUuWUM8Ota64vNsR/QPJhCRiC919tJifXg=;
        b=klrSp1G+WvIksbNVTxBu0vXgJOWQhP4D6r+Sagq05LetdST5t/gRRrKz3jB4qzjnTt
         lZ81P5cpAax0v5NXp7Rw271nqZ2UYCifDujB9X60TswMj3p3x+MztyZeS4/VCLjnUY4r
         9UamQzUPDFBxG5dMMUtpdgMKKHyO1wPmaSfaA0hOSAEWpfO0aRXpuve00F8IgXyjyag1
         e9tbUNrHvLYkR+QnXNTbGtAj6eIpeXLnRWjDuEOA9G4cFawOU2eLHBK7OX445E3EI9Rq
         M1CUiLwiWgnpsQDaZv9kfiFdxnleaYXFNo0sp82EupbTKvqqQMybYXqVH4B5wQMuBRW4
         m4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qOTOg0LkwyUuWUM8Ota64vNsR/QPJhCRiC919tJifXg=;
        b=uXIkjM/lzBwbMRxkmaigE9BMDYgSzvPY+DZLfpWzaiDxKMJs2J1wrTzKVY5LSROp/X
         GbMl5wnZNzOVXtFeEImft+7hi4Wg/EXnidqG+AyQ2ESHXjrnK3BTqeY8WF2/r+X95/EW
         ZL0hJvVPX2u21zKrZfggVmueN/ShlgqJyp7UIWJIL51MjUFkLqfw47zoz0pI27PCLhUh
         dYCFH6qIEd2HNazYjziolR+uloZ4AOrhYkqUjPmf8PPwYwnsUqXocmLRTHJPcwky+c8t
         0WVTLOuOvqtXygMrX0tUCsrtl4GAW3aH5VFeB/BbA/SWjbX9r/oIhWt/iu8IBQi54//S
         Nq/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrqHA6GXRThQju2Aj11jvZADRe0+OZXx3vGAmQkpz1orTjowT4
	p3Fsng5eQIFeikCHxTTa0X0=
X-Google-Smtp-Source: APXvYqyBuY9JnX7MX0CuiBvzDnylIg+e/hoS/bqkOdthIJBua6ZS9TQ2uYwyqap/r0mFcVLBHk4Gzw==
X-Received: by 2002:a5d:5192:: with SMTP id k18mr688335wrv.229.1557646610058;
        Sun, 12 May 2019 00:36:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:544d:: with SMTP id w13ls2352274wrv.16.gmail; Sun, 12
 May 2019 00:36:49 -0700 (PDT)
X-Received: by 2002:a5d:66c1:: with SMTP id k1mr5919493wrw.225.1557646609574;
        Sun, 12 May 2019 00:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557646609; cv=none;
        d=google.com; s=arc-20160816;
        b=dH2RBpnaduRhAVhxeR11cW7cDij0OhNT94Rcq9OwZbSJxqumKyKxC/c3HRHGtrb+oa
         3gkZAAjqcbgVeSVqhLNgEJvfjPqEC6rJeqYOFdxgWyzZ1V4Xn1ksqt5ji4x38dZevjie
         tZdq4T2YFPZb9J2j02dxuPKbEdL/kQkfndfV5iRrQhdmk2hyYFOtro8QGWZ/VzSsekYx
         Iejt5oKal/U+7e6PM+CNPmKBT1obzWHDIgZbQ9KEWwF896HqX+Kim1FGjRxxQtLNYvuq
         nazaqi9VxdMuo4LEyL/FZmIMWSW2gBtzcebY5F7eQMceHGb1ncdjG/Jt7RrgaTEywr2G
         AoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Q2v+ilG/gO6eTUlzVX8C7nd4YW4nA3dC+lW+fO4giko=;
        b=Sh7FJqRL1MSlcoTD9PsdVrqZwD3pB4xvrZj69X0Co2NIPbpgtLe1SlSyIVqMYrHYuN
         nWAOy9iur2uzGGFxTMkryxMG0wQWtH90nozUVx1HSRI20nrP/11TuRxwMcOtlFnlDD1a
         yAO5NC6unGpZtVdWXCWtz2zPggnxNUi9NRuHOcH4d31/mgcXIiC2KEAi+fhIoOCI4wwh
         lkTmRowDy1pIhg0n2s5LFcy1MenqSA8swBpL1ho/QRA+Hf06BZk9apJVQAJ3pCSQJHWg
         N9o47ZWwwUpW7J1QX7XhkFsytdhrjnV8xtz8sjfjKztBXqBcHfHQcbJLQqgm0e1Jq7Op
         Hwgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=A8HzIBWw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id v1si1853202wrd.4.2019.05.12.00.36.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Mg7Vd-1h2IMf47QD-00NSE0; Sun, 12
 May 2019 09:36:49 +0200
Subject: Re: Building on Orange Pi part 2
To: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <d7477b1b-ae39-0a0c-36ef-c56df033720e@web.de>
Date: Sun, 12 May 2019 09:36:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8Y8wTxuhV+QblXHSusQheSG5XW+zkuHh/xkgTyuS6eHXwlltt0x
 rXhZmWIq2A8U6NtDtTzzboHeEErPX47mpbv1W1kbPJ192EhazrXpBYS4eWS/RftEI6k+zpS
 fc92+R+JBPx8GLEaoux9Ih1fXKqrmUVBWkFlHAr4LBPyGbNRXACJs7hZonqemUep5GN/ue/
 RFQpPHAZjGXfXPmVVvTsw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EsdkckrBjQ4=:LB1qsuWPiqYOJfCI+usnET
 R/6fwyQ1sIRlh4oeBC4QLomBgX8O1mq7gsBbUyz1scgtl1Yu6x/TZCWGqVQbfGTSf+yxIMEGJ
 iaiZozyKgCFEAREQFhqg3m3UdcaanqmfgECPGUTePllXNiWDQmq9+02u0prn/jz/qTpYRZxjD
 HtCPS1o2p1Ie+gtEDzgjeM/jNRUAGCnVp8+ydEl6WNFKQkvWc3cVOHViPEh0c+9vS3t1QqCkR
 9C8plMHGSfrVCqblHYCCAB8kFZAedJeddfg5h288mIMGGq382ehvJkc97v9WU6XJBOUls6vZQ
 ZDIP1RJZQczHs17KvckaK/BDZKN/5hpPhLZb7SVDGDoJ1K8YM1Kni2tsMRMmcGMHUew9pMsJf
 372WWtEfpuT/4yyvMnipwgEXjYLUbtvYomeJ2tiV1NT/9lQStJUgx1co5mU+DGxvlkQyutBbG
 dHOrJSHq9Pqveq3zlS3eD2AyJ91lguP5pjVPVffDv+sGrRuKSiMv8v4xwxrLsk9t2o/ONj40T
 aTEpRzhScTz6BorA+YQAFmI5JYIJ1JWYQHE5T1Y5p8r5+fJBW3aZX80fKimgwiaN3u9KgKy5a
 Ykr1Ux79qOkFo72gEuq++h9orh1JIeMs4R+G+1QCmqBkNmcFft5h+Oi23mSpgRuEw3Ji0YeJ6
 hTWKuXnfNLOsEGZSXhA7DoQtstdIo707mstMF24r7E/80xwsNZursp+Y/5dR628jOLl18mYZG
 vMQNsw7TfVHw2PVb6CJvJWmpFGFWLAKXvac4ukQ7X7E4zGWC4M/++yTvrN+i8YCMSj9wxVhK4
 yu4cPJ0KzIXX8svTrqMuZG2Lug7zK/dAla4P8ACUpY1J2kJty+1OVpts3skWsH/8BZPuo9fKl
 bmY2Z1u4p1hjBpuj4zDVo2v5nHU852E5eDtTyeyUlNBe0uu/Nrujd7iYWLKs+/xCzT1PdR2Ik
 ylSWBJRMWtA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=A8HzIBWw;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.05.19 21:06, Arvid Ros=C3=A9n wrote:
> Hi again,
>
> I finally set up a computer to cross-compile both Jailhouse and a stock k=
ernel for my 256Mb Orange PI board. For reference, the Armbian kernel that =
comes with the standard Orange Pi images, are all compiled with thumb2 enco=
ding of the instructions, which isn't compatible with the assembly files in=
 the jailhouse repo.

That build issue was already fixed in next branch, you were on CC for the p=
atch.

>
> I have tried both kernel versions 5.1 and 4.19, both with the same result=
s. The kernel compiles fine, and a chose to copy the kernel config from the=
 jailhouse-image repo for the Orange Pi board. This yields a kernel with mi=
nimal features but no undefined references when compiling the jailhouse sou=
rces. Jailhouse.ko loads fine too.
>
> However, before calling jailhouse enable, I need to reserve memory for th=
e hypervisor. In the jailhouse-images repo, this is done by passing the ker=
nel arguments mem=3D128M and vmalloc=3D512M. If I do the same, my kernel ne=
ver makes it past "Loading Kernel image ..."
> If I change the arguments to mem=3D192M, it works, but then everything ha=
ngs if I try to call "jailhouse enable"
>
> Can anyone recommend how to proceed here? Do I need to change anything el=
se regarding the kernel or some u-boot thing for mem=3D128M to work? Or, co=
uld I go with mem=3D192M and modify the cell config somehow?

Yeah, I suspect you will need the custom kernel we build in jailhouse-image=
s due
to the size constraints of the target. If you keep the Armbian kernel and
instead decrease the memory reservation, you will also have to adjust the c=
ell
configuration accordingly. And you will not be able to load a secondary Lin=
ux
cell, only bare-metal cells.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d7477b1b-ae39-0a0c-36ef-c56df033720e%40web.de.
For more options, visit https://groups.google.com/d/optout.

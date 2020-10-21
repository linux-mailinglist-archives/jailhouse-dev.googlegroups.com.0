Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBP5AYL6AKGQEV7XDN6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DBB295317
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 21:47:12 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id q23sf491878ejx.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 12:47:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603309631; cv=pass;
        d=google.com; s=arc-20160816;
        b=g7jf4uE1/ZwAnYxsnH0fceAPjwrcgx3DJ774yueVFiwo92FK/lX/Sk8CLlFiV6awtA
         MUNvPNefwa8ntPhcPLpa0Im0kLkubAs/rhtnwweu8bovGFnyTJCSF+4djyi59W9IsthW
         yLOnED4CobLn54Bzk8sLTYuMVKM+YOtJ2vNfx4Z20yAdK1tpd+DhihySJ89CEVR6uDwf
         pe8ibs+v7CaZ+zaY8eqUQin7KHEUe+qUKnRO3aGD0EVzoFThKOpnAEIYUiDPBuy5Jg/M
         Aqdcg8awxixL4gfnZsc5E75H35rqRiFNhWqsb5CUWMpnzBm2Zby4AOYLgi4c+xnt66cN
         j9Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=bfDZED7KKyzMTGYfPW9eELNpFMdK3+qiRLpBs0AXWAs=;
        b=VvIYyk/Qu2yoeLUyak0PaXFiqiEoMIn/FklFqSn/7yLOnJBWSKMBkKIe9P6KfeXkY/
         uJiSHQnFBHeYcgfyY5bmOWQfKe+MeuAw9tnxAxP29abXdkdnliUGug8vYJwFCgqsXAb/
         SUcS6lhgy95TxWntParSN3LoexKJnRb3wzggHf5WlG5fnUxOwJqzmfpn7TM6JpCOiGMA
         ZjYce/pWvC6ZVa0xJCy+5lsip2dCfsmOgeIlTjRM2d4KIZ5P6Ug7vJjmIR+rBNLbTwUL
         OiFrhcQu72fo0YpRhzmQ3OHQHwe/GCxIZS+wvVm6wUZHdOIyFfENJIvkVJ8JitXu9GfE
         9N1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="tmv3TG2/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bfDZED7KKyzMTGYfPW9eELNpFMdK3+qiRLpBs0AXWAs=;
        b=P/7X1H1p+XOxKCKXdvMKu/HkXxxZWCVIsnlduejeuO+DwMWb6MrF4kiHsyN+2/thHI
         iBJSM2HBNxabLladqNz5KB1dKdSKYrFCskCegBzcalTL6QoVaUZFkoiO3um7YJ8l9A2u
         0E9GkrA7Sm5Da9N+PVcvYmKaFW1rTR9NPOWuSi1/nNlzEeIFd3bN4/lJUfHsuI3+vsrq
         4WbOpoCc82VRwB8fqf0Cq7ggn91mR5Q39uDur4Eg4Zs3BiMd6ToT1b+CWV6geL/qqq7O
         SNTdMOWb8I7q5Fx7pyKKEagmfFooMabJMUiR/xYx1qecpk+PSBrGEEY5I5jRl6qbzFhH
         1Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bfDZED7KKyzMTGYfPW9eELNpFMdK3+qiRLpBs0AXWAs=;
        b=GsvT+k4jUV49BWaZ0MM0rNWEH5JNXwKcB5sHY7AjMvJnsUeRcoJGDNJ+l6M6OkdlH+
         Hc4YM5VZHmlz1I6rNab2jWTORqd87xlss1tMsBbbO51NrFckAlOwJixkVyQ+i2XjdMyV
         /5Ohjz1PSVJiu9OslnuHiefWpfcLN0tjnmx4y47WvFOeBaHNrueuphLd+V2KmzWaC2hq
         OYonvDVD3tZWDzEsxAH92yQ9q8CR8IECW135U2Pf86urlWh9Ca49QIAe4nAHcR+wbQUN
         zCkQA9M/T5uwcWcu+MRPfLtQqtBv2H2L4pPiUDc1YCmc2l9dgxQNRSE+8yOnm4wR3J0g
         6udA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xp3AQlTHtOimf2x0pz0BEaCJsZU4YrSJZLH/xYE/ybs7Dx6fk
	uDNuBnjTznK6DWmVQLqwzKw=
X-Google-Smtp-Source: ABdhPJyAeYsCrALySeqGLNNfx9IsPyt1tnigIkr/PvjJT6l36MbcsCMZp54KSf/ocvfgl9xd6CuMig==
X-Received: by 2002:aa7:ce18:: with SMTP id d24mr4850282edv.9.1603309631718;
        Wed, 21 Oct 2020 12:47:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls698803edt.3.gmail; Wed, 21 Oct
 2020 12:47:10 -0700 (PDT)
X-Received: by 2002:a05:6402:1388:: with SMTP id b8mr4767666edv.1.1603309630558;
        Wed, 21 Oct 2020 12:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603309630; cv=none;
        d=google.com; s=arc-20160816;
        b=XRlBBbE5qm2wy2h0FMbSWOr7U/lvX5py+iy17s56Gg4AEt8qcSqVAtbFEHV2BmGNve
         43ZAlX8zgFynEd2wWeTaESNeb6TlwMA8meCJ2hCeJmgSKeuTwSKZVk6cEjljhs8tjGUv
         3ydFOp/2i/bFP36uZamBYyw/higkfTtfLJbAh9yDhjqF0qvD8jID1oNeGbp7i+H7agJ7
         qQVaFLbKYnfSBVHVmFgyJGyZXmv07RZkmdwq8cVSODAwZC77oENwOPtXmPjqov5S1eeN
         lMFaIUmBCYQ52QXVQIXwSaBTDq/HMnk5M/GIjRABoGmxZ/TXz702UJYk0b6B08dGfvr0
         8r0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=LPQYHtjBSEKQ/vovn7eRCTjmFKvL4RbSqNop4XK4gQo=;
        b=WMXXVfNl3Ugjr9wimLgU8uyKUEyGBQEGf7OLb4qQpK1xLrrifTgo+q3j4AdvreIpJY
         mylm8Cf3ZuW1ODaPS3w1RDyZSF+FKzzNtCN07pnvcnAh3sthdZidFpNe72E1GGfQQWNZ
         t11+H0R4IHd3gsdxhKvH4gY6veJcKXTzrG4A1Blydp1cneNBzABxk9ERpJrHzyiOh81p
         ASqzNRTL+CbfsEoC8q2mTnr3iWQ5UWT7GxMt8IEtrwpz4MVhlHQfzTzEqsjGc/Ux9z4M
         BrSvc+kw8cRHOdHBSefyF7tD/yz7aQqlutcIq1HwCzhIm3l9yqOOtK8gH3kw65flD9vC
         s4kQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="tmv3TG2/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id lf25si141582ejb.0.2020.10.21.12.47.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 12:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGgxV1SHSzyXf;
	Wed, 21 Oct 2020 21:47:10 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.874
X-Spam-Level: 
X-Spam-Status: No, score=-2.874 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id FdkGDFAi4tbS; Wed, 21 Oct 2020 21:47:09 +0200 (CEST)
Received: from [IPv6:2001:4ca0:2fff:11::2aa] (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGgT8685xzyv8;
	Wed, 21 Oct 2020 21:26:04 +0200 (CEST)
Subject: Re: [PATCH 01/26] hypervisor: add extra warning flags
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <20201021145404.100463-2-andrea.bastoni@tum.de>
 <3ed6ecf9-900c-6dc5-9a16-900bfeef891b@siemens.com>
 <07653995-e5e1-3857-099a-a45fd0194b13@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <fd0aecbc-2650-7df2-f113-eae7ec85da7e@tum.de>
Date: Wed, 21 Oct 2020 21:26:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <07653995-e5e1-3857-099a-a45fd0194b13@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="tmv3TG2/";       spf=pass
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

On 21/10/2020 20:44, Jan Kiszka wrote:
> On 21.10.20 20:43, Jan Kiszka wrote:
>> On 21.10.20 16:53, Andrea Bastoni wrote:
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>> =C2=A0 hypervisor/Makefile | 4 ++++
>>> =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
>>> index 5322b5aa..41bf99f3 100644
>>> --- a/hypervisor/Makefile
>>> +++ b/hypervisor/Makefile
>>> @@ -31,6 +31,10 @@ KBUILD_CFLAGS :=3D -g -Os -Werror -Wall -Wstrict-pro=
totypes
>>> -Wtype-limits \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-stric=
t-aliasing -fno-pic -fno-common \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-stack=
-protector -fno-builtin-ffsl \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -D__LINUX_=
COMPILER_TYPES_H
>>> +# Nice to have: -Wcast-qual -Wpointer-arith
>>
>> Shouldn't got here as comment.
>>
>>> +KBUILD_CFLAGS +=3D -Wextra -Wundef \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wnested-externs -Wsh=
adow -Wredundant-decls \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wdeprecated
>>
>> Should be merged into the assignment above, no need for splitting it up.
>>
>> However, this must come last as we have -Werror, and you are now breakin=
g the
>> build.

Yes. I thought too late that the order should be reverted for next.

>>
>=20
> It could also come in pieces
>=20
> =C2=A01. fix nested-externs
> =C2=A02. enable related warning
> =C2=A03. fix shadow
> =C2=A04. enable related warning
> =C2=A0...

Yes. But Werror should be added last then.

--=20
Thanks,
Andrea Bastoni

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fd0aecbc-2650-7df2-f113-eae7ec85da7e%40tum.de.

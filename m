Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBCMY37TAKGQESA5FPYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AB1AB03
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:32:25 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id c26sf12091718eda.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:32:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557646345; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZPlXb51V1nQ+pOyRah7sH98+VQV3lW8p2wTBgtkmyz4pHY1igzCnhyvsATYg9qw534
         r/ct1vbZq24rzge9uWuYfvYOsOZq5l82oRHxfwpkACb3RCUn1aQICoNTJ3akFpuzdvHP
         wKBNlERs7Zu5v3Rssimp/TeyaNf5FCi5d8QgUmuZ1/p/otDWU45STWfCb574npkTtDjU
         q+/kDYUq2Lug/SftGVNqfMgmhPa8vQ6ZEBwdV/egmHlWHEXXiEjc0lDEVt82wTxTpV0d
         pJ9eyPwiJoRbbBos6Gzd4lp7RWTinUW3ugy0G0GeJg5IbNmjHVOPw0kVbYxarZYIriKB
         +FQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Oj+1IncYYtB0l4Op35wEXNVJtzUR1Fhr9kJxp2u0q04=;
        b=jdNDGlavMTF5o8+jTe3bjWGqHKp/nsa3UUzZ2Kdt9acQKMPFStSwVRGMHeQ7Z3vb63
         AC36iAHkwEcjMb9XRIwMzBYf5yKMc4tUZsCE0dcQpN0570yBDpqdM91bDVWHqsHPbhmn
         bJ0EURU8aPrQqMiCmRpXgxa09OWwyYqdlgNteTHXsNRqf/zncViHns4tqkn754iN9Gp8
         9sbd+XihEPKQN/JeDEmDU3os0lBeczVlhLzO2DauK/24LRzssTPlSTrbtNYRT8G3MgFT
         q6FnY/y/wF0jThxqjx25jRliMd5mRJpH8Tm4KC1JQ89gNA79Qbo9jEAVRTdiLSjj2Kcb
         Aruw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fMs9Rv58;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Oj+1IncYYtB0l4Op35wEXNVJtzUR1Fhr9kJxp2u0q04=;
        b=nabPM/3AZ8MYZPCHuDFJTSPfE8ic3qGWq37IJsVuhKv86ZhDBXcOdjS1ygGK+n4/CW
         1h0bTL7rFOS3a7vSCa6egvjni9k1Yi/SN0znH872ejDJ85GN03S8RxDQlO9YTL74dTPF
         srtaBGODgKNekhL0kR7p0Ls/QlbVrWkiNVjTX+pWf64wWSOIk2UqbgCLdV8EMq9JVemc
         rWSyHToB7mf4PysxWfARyNYKtRYTebb8inATPwd4Z4XXu0lP3/O48n8GhEYkirkvJbjM
         5axDPIMiJIcyn2qJ3RzLWzCiKcyp36DxD0LUJ90K9pDkoWb/horJjuL6tiggTEEj5arT
         9+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Oj+1IncYYtB0l4Op35wEXNVJtzUR1Fhr9kJxp2u0q04=;
        b=X4U/gPAQ4Imd/x4bQvNQxvgQs+ZI6ippcRuouL03YA09g2LhR7mvQM7TakMLEjdcgc
         WfC2ACoifKX3rPjaJivrGSBVXICLStnFtg0LuWAR+qYSDNzgyfHgpjP87WaMOKL4mDmZ
         5M3rlOeqo0Q4LV9dRg2SMM9JuBgNcK2r0feLUH7bM4sM1K8BgHOFhhjS4VXbIIe98o5o
         ILOgv7XTQTaXveABN8zb20ssJA0GzcV2yk7jZuMix+71l/jOqfvngt65h1RMGatKP+as
         03zyudLEKcG+Ohd04PqQqbKsRs9Gm/py3Cxeue2oHpD+k/YQCVVInHXU3Fcv+HjfA7Ce
         pKYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXp5g/JS6/R8Al3XItmSbmCc16Rd1r9VHcfCWF+//2lR5x85sqt
	aRUJnyBhVKvkYrXv5PbWtY0=
X-Google-Smtp-Source: APXvYqxHdwXBvfLIhykG57bMGJArWJbFLhxNO54UcpXeozn8LdJDTGfQI3U+srZpfDzBO25GWQrTyQ==
X-Received: by 2002:a50:94a1:: with SMTP id s30mr22166768eda.4.1557646345488;
        Sun, 12 May 2019 00:32:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3442:: with SMTP id d2ls2331678ejb.1.gmail; Sun, 12
 May 2019 00:32:25 -0700 (PDT)
X-Received: by 2002:a17:906:aacb:: with SMTP id kt11mr2014232ejb.246.1557646345024;
        Sun, 12 May 2019 00:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557646345; cv=none;
        d=google.com; s=arc-20160816;
        b=qr0J2SitwKveiUcjJlELMAXQHvw8BB8d1rDq7MqV+hUvaxbBcSy3TRnfKFIBOrlsnE
         Sg3QYrYAYMDyVI7jozWoCaVx6emyDucfiRwFGwHbNTkh87zyzjc5PXkAbbmzGUk6XF2z
         rn7x9+BOpG8lczMMb6rUOeFz2c/+UI128FCCtLZmrmTrqw9CQcBeegLRINNwxDyRKDZj
         7ZD8zjeCqhd6oLLGYnNsKBxn+Y8vI+kL2E4tqOkisoSFf9cifBRaRUZDLaU0QTjtSGnq
         7v4lJhSrJwqbBo+QJJMzbBBDv4d23hv4bo55chFf/l8moew1x29XtkYRYqOK2E9lZuA9
         Ok3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LEFquHXO//1uGCGwDgFAPYZMwcY/2f26On/5CvxF+bk=;
        b=LKvvGPvjFWllb7+zAm3XWidXsecR8Oi4PMyOcbn8Q1GV5Pl2tRUX2yO6rgknbD541e
         b3cPVxydpeBanweGQL44uGmMzkpYAl+QWSCc1UlpmfEU+a6zb59UgLeiSmwEiGTQVt18
         XX3dD4IR7DjqHy4iDUIF9VSNhqObktaZde1sbviKrwFp0B0xLXGUy1t0tpoDawI3Fd+z
         3DDpPKlGfHVt8VwhQCtjRK6FO9h4pslbWXgoGk2DLVRZkd+AE28RpYnjXqIP56C/r6ae
         3Z5c4GPLsgzy0aghYLxhywAzszmItN6atNGTewbXeQHtXHEV7t6YKUZuPOZSrX0hR4k7
         Emsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fMs9Rv58;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id l30si2741707edd.4.2019.05.12.00.32.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M2IuS-1gXcNg0A6e-00s7Ee; Sun, 12
 May 2019 09:32:24 +0200
Subject: Re: Running apic-demo trapfree without x2APIC
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <e5d2b706-ca42-9d07-3093-eb9ec547bf1c@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <835ecb8b-3e0a-b90f-69d9-c240801d3b35@web.de>
Date: Sun, 12 May 2019 09:32:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e5d2b706-ca42-9d07-3093-eb9ec547bf1c@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ioai+YgnUfMblFJ6ccany6gcH+8YRH90buvYu5oKk/fC/ki4KH2
 iNnOPi+vIEiYHTT6l3ZWPl0/euM6x196Mm50dFHitNEQJXnLR4EInEL3Sd9kDePsQr3oAqg
 18FViDZ+ZlDlo3ZFY9Du7IJsdJqv+ZAuvAfwIS5hVA53heCzAemujvmY6WXvawGXhbfw1s3
 ZHnhgc9Bz4ZAypWLZPJ2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:14v7noenjjc=:KLnmSPfEnIxxdLkZgcK2tB
 oeatS76LesjC4BjjQtL9OP6bT6pHHIrLGif7NmCCSKoVn7ncsHPcqbbgELp2ozfwBqhqXvHn5
 z09qOTHue861qyYv19YXYTn3MghVR8XQSgpj8cBc87YsBtjq8ikAbp/kZMuxVtT5mJV5nuUel
 jUSZEKS2+XnwyZWqk+s8fFkOp8bcWk4CHFPeZ1saDKyNdxoZRbeLw2unOpSNwiLhiAEytqfCf
 GPN0FCrLXryeOqmW1c3qV/eBeh84SwQnykluoK/KtrIZ2WDna+RhBRUBzX8b5fJWJ1YDs4QNO
 rVtZuBNEyPxLSeJTWmOcjk1+KslUnxBPAsoAQq66qjU7drRbeORJXwtDGADPDUoluGENmxP0P
 6FVj5XdDt1oxUpEiuEbSxAXZVqSD8hWtXh7CHyJdxi1nF9jbh34RHJZ1MB96GYGQj4eHufH5U
 eqhlGk+IY2R4Q7H13wqkbO1AdkasnpRTJ1ygkrGlnxANqif3vTIjDJGTPi0QzbNoc1BiE1Qun
 x2lOJliGcxGLVORH0Vrh4kP7QCap3iE3yUuSpKkoTEb4CDAoBnFpYhE7PGMg2+KcNM26TryPz
 RENyOaehCQS1d0ZKTFp3haN66F5rgVAqxKOyegCibDunQG2exCqOT9LafwlUgdOn8e9mBBFPK
 0aqoQu+PV2/5atpSZyspQl6qw7LGfdDPWWilN2qyfPrvS5uEK94FlC8FqBaXLjj0nW2Xs1VUJ
 hh3mD9xh+MWrf/rec5a71Ulndig0epEbSImFbuPVq0F9RDmTmR8dXjdozwdHKMlhiRto2Xm8T
 20BhIhfRJ7ALbhHXVXTLDQWf6zwRTkzrd9GSrMVnXW+tRX0tCa+dBMJhoA6XNG9dZsaTBMpKD
 a9hEFtiZgP/eoBYqN5SCzROJa1Ch+1XkHnf345lu7z6EYQanUBBGMNHo7Y3TQS9paWpUjZOMb
 0ClFVN2hbaQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fMs9Rv58;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.05.19 17:19, Andrej Utz wrote:
> Hello everyone,
>
> while working on Jailhouse to run on AMD Ryzen without obstacles, we obse=
rved
> high jitter (>1000 =C2=B5s; 40 MSR_OTHER traps/sec) with the apic-demo. O=
ur target
> comes with an AMD AVIC and does not implement x2APIC or tsc_deadline.

1 ms jitter sounds like power management. This can't be explained by a hand=
 full
of vmexits.

>
> The timer implementation in the inmate library will use x2APIC access met=
hods
> which will be translated by JH into native xAPIC access.
>
> If we switch to native xAPIC access in apic-demo, would it still need hyp=
ervisor
> interception?

Yes, because xAPIC is MMIO access that needs to be intercepted completely i=
n
order to filter out the sensitive accesses.

>
> Also how far is AVIC from being usable?

IIRC, it was implemented but didn't work as expected in all cases. That's w=
hy
it's still off.

I do not remember, though, what exists it can avoid. With AVIC on, some of =
the
xAPIC accesses should be handled directly by SVM. But one question is if AP=
IC
timer interrupts could be generated natively - I would guess not.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/835ecb8b-3e0a-b90f-69d9-c240801d3b35%40web.de.
For more options, visit https://groups.google.com/d/optout.

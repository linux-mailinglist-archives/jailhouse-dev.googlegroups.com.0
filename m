Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBIWPR35QKGQEF54D37Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89726E354
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 20:14:58 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id j7sf1188812wro.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 11:14:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600366498; cv=pass;
        d=google.com; s=arc-20160816;
        b=XXMfa135TKfqEjZu4HVDUPaY5wrjvanLo2jll3km8K61CbDWZ87Fez/XT6pokfXuv4
         6StnngC5rfU3ws05rEuag0cPHFVBfdB6tP8ant5Y2Mp7arlZFNmjTfz5n+kHY396F8e8
         ffmXAhqnILv/fuNwFhpX6eonj+EolCaEvrbJ1zf379xMdSKWNURtNRH0HsgKhOZc4cta
         xqz/FRnOMpm85hLUywUizsOpPmHWWzVAGFdndaKfBUvTn2ok452Pv7OOdnGjR+XRO+rc
         RVbmz5v/jdf//MGZGK25j+b35K6YZAtQ73cYJYffIblr/5+S5mgu1w1OfU9yf3Gg+XAY
         ZdXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:to:cc:in-reply-to:date
         :subject:mime-version:message-id:from:sender:dkim-signature;
        bh=mJNGHodRepWM52IQQWSdpIg5zEl6CgzL05E4jtBlwnc=;
        b=Hn3wxwoSh1p0H3tTG/GB+vdNi+M7YBosjPVMQIO3O60c4Udrg3rjjYnvEAF4Lt4nHQ
         c1Z+gwBQS06RD0dnwazbYeBN39lM7K2d2NX1CwHFmzJW2Neg54IvmrF4NhRJHJn2lpxl
         2cWJhcA0Ci7V4s7WxGaJyVKcGE8vSg4/Kj3rsfJBjpmWyBAqhjxWQ+ZV8uvL1QoX3JOM
         tGPLURq8IR5X3OBaFXr/m1WBlv1AFIqRjGy4joTuGpKH8OCwVnIiFZ7s+AspteGYOdhv
         Vnte/LuUuhiPZtvDJ9Ug4bI1rzLF2ZfSCIYxPqP6pq5skfDwPYrokBzau1BFbu2/UWvm
         bu0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kuRyIzJW;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mJNGHodRepWM52IQQWSdpIg5zEl6CgzL05E4jtBlwnc=;
        b=agHj07VOLtaq2ck+6r4Tl1ECt01dIA11h+t/BycaswIHghX3VL88BaJro0A9niOGUH
         IBHE04eBEcUGiRJdhvu3ZAYSzXCiuEawGvVSyuQSHt+x2PbalzZHYkLpUlsr5ljHmHKX
         HbJBRZtFjmI8DnJHhNscTaFRalvttwfg4g7Xq4RiMxs7rwy2eTAHqfyC5SLjgvctnRU7
         Mc0ZegA1kEhUN5biesdQlN1rRmZVzGuiqPTiZxi/l/rWQgZAB+eQFBVkwVR7EUa/MrQe
         V0TIjmrMlR08hQ8RzSue+uu7oLo3UNy7BHVYXZzda5Iy9eCc5XSmFXbNt/AmmZVTERYf
         9z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mJNGHodRepWM52IQQWSdpIg5zEl6CgzL05E4jtBlwnc=;
        b=ZJYLRRRO6U6okP68SqY3wqR95gryW3ODsQfCOEdHpk2Q8dbGleznkTIMHJd8vW4Ahm
         FJxuS5Eha+YHT5d3duRJbQfOl5QbfdGL0TCJXxdWDKXfa3vvPhAJpbNAkMZ47OJdUWYW
         OHfgbuLWJhf7B4EQP3lKmojhNAcZuOP017b9Xw5J32nxrjxkJelOZUan0C3HbgjY9rQB
         imNbwOur4xaVyhsxAnq0ql39uKJnNmR/JLZ1sFhwYYWIx+CbjuKQKz6GzH1MpnSDbctz
         LuxOdx8LOPwGTyNd7Tanx7tqzxyf7z/BxekCmRzL1ySL4dZUX4AiK/5sSYUNRuyQDzHa
         FUsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532OalrtRrygXc3qG3T74SEYZRvCj6NnpZAEFXDx+qmGO6FW42qi
	39MmguXksPr4+dVy0qiHazE=
X-Google-Smtp-Source: ABdhPJxZuhrI9mzG+o9+jdnmKImcQPSlftsCHIrnmR/xhTzvrp61DhyARRUYir+6ZSVfXfUFStZ28A==
X-Received: by 2002:a5d:6404:: with SMTP id z4mr35352336wru.423.1600366498647;
        Thu, 17 Sep 2020 11:14:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls3676850wrq.0.gmail; Thu, 17 Sep
 2020 11:14:57 -0700 (PDT)
X-Received: by 2002:adf:8187:: with SMTP id 7mr33949034wra.266.1600366497429;
        Thu, 17 Sep 2020 11:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600366497; cv=none;
        d=google.com; s=arc-20160816;
        b=YjrZUhHi6Js+IGcjq4lFcG2KQjj/kk78YK2rATlhh/fc0FT/x+mx1pcBTteu+mKS+q
         dJkOF5TGFEOqbFXZyWMpMLIXpPS7TZ4Yp3eE0CBFX4W0D+XBLuM5yTJj3WA2zI6NpETg
         0HbtgZPXpVaqee+7FYV6WUOi/aMJonuXabycCHS1DkPyvY0w1RkY6dXVAZPHrJR79r8v
         4lkn1C7vdH0wWzDM6epVbr2IXwxQPx7aaJsw5BmMlgRHwHtcpvZJ/ESoKs9GqYtncBuZ
         X3uqMfX/FpsmmBMcK/B6eIXMqrIGr4urhd2+T3wLYZVKVPNHEbzFqzLGpqT/kxmpzVTG
         dYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:dkim-signature;
        bh=BGjCZg60z0O3OoEe5sN86Hk6/2++zzF69U94Hv6hkiQ=;
        b=Kc9kYAKAPacpkosB8sZUrDABPjbswfNLEbUz9jteGo203apf61E8MyaVqy6cMhIRcv
         gDimo75EvOmUv1o2A+TldyxAli7ori37s9DtdpETJVlwOegivK4/pxfzRg+A1KLFWkC6
         XOFFXuGEh0D9vU8dEaNrVFWJh1sjElwINpgGIeOZounGbzZdHDT3OJEyH4ypC9CnIc4L
         oHDoN0y1esrthvQH8ZlMg0UAD+qNfiSPUbJ9nHNqKizrQzhoxTXAy3rOospSZZr7cOmU
         5ziL581+7OtSXOorDDRb2BEdEM8pRB3nGTxVMEjnPt9IsFeEZlc9+0GnGY/4K4ucHZiq
         eE3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kuRyIzJW;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id z11si16069wrp.4.2020.09.17.11.14.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 11:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4b1y-1kJW8E3CC6-001mU2; Thu, 17
 Sep 2020 20:14:56 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 223DD202544E;
	Thu, 17 Sep 2020 20:14:56 +0200 (CEST)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Message-Id: <EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C@gmx.de>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_282B1E02-DF0C-4EE4-B0A8-83CABE194FCE"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have
 side effects
Date: Thu, 17 Sep 2020 20:14:55 +0200
In-Reply-To: <7ecaf35b-6669-143d-60fb-f7b63fb27d28@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
 <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
 <7ecaf35b-6669-143d-60fb-f7b63fb27d28@oth-regensburg.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:Xf0NVZFRmbo0UYz8DLQHNeHoeEpuPlCE0ANlkijafJ+ewb2ZAe2
 nEr8ozcwoZJXoa6Nc+Uw6DKdn4/3Mz7RgngOjq3SvlRY/2PseyfIuGB9I/5SytHztYc3ae4
 yt3dQ308JcXGN1oQmQydCKUwULsjdZLWsdoRZ33Y7nkXC9TiljUXTP0bkR3fsBqhsVhBhly
 EEIlP81lWFTr9CxgXgHXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WRehuyFmrJs=:NH31E1lzsPAmQMlnyp2Rbw
 wkACLLZisy3GxDeQ9XN79nX/RwT4G3d+Q3IT0yJsv/oZEAiuk+W55Ob1N8y/O0FwDqhnzsF2g
 DpjczD2xmARAKJ3O0v2+1iyGbCtFUE8hiXq1Ra2VC0VP42rrSzQX+b0tSacvRPk5iXmz0l/r7
 riFC2BM6BVOIffTtGpWmQ7gBkPVVP64iCQQbImvPji9lpPHtBcbyoZ7FtvfpdrpPGiB9m6NDF
 nyIwJNv5x9glM13zJM2QJgxyEgh9R8SI2Vnr+kNl5xgAazljdg4n4KbtSQxx1AuCDGAzwOqgs
 1kqVpXRdct440pfF2acktVUq3P2gUELs3JRAekOC/91tGCjWQDLrCtZ0V8Zs+sy6YAzmGeZRV
 /kJzAr/LUtOssB18w8YlsVVCe+7a7FtZkbB2D+Bfuc0Hhj8F7TRBR9LDGFGYwu6Fp1pQI1wxC
 9kSSp4ZvdSOFeTVQyBIR9ZmAQRC5fryjXr3OCTMvKT03bYc/MS9DpLvDIWj0Za/C+m6L8FPCt
 zXEAj4gytWdhoxmdMDjp+Ij2yK7Ub7mvOgZFPY+oa4Peie+FnqWHiNMIChGZujTuRkkRWEIJn
 DC385HSGzOjHYVHZad2hG2CPdBhJIOHIJ+CJ+6OsqjnlucRm+gOsnsdKzKCNSQvQCmWnSU1XH
 TsgGjUX9nzJxnTZR7DKag85SXd/BR/L6cEpnGR2aaHNVe3JVeSizGDS+Tn0qTnk4CWHtbXrSS
 DYzJDgXXNnpZBHDJvqMcONonLwITwPeNdJ/QgZP2wAB9LpEmrEeDvJwqnC2esDn/R3kw7EDMk
 6vSBt0k+dx1Y9RdVwdYDeueeG+6rJaZzve95JmEMPAa0GEK0EmLSx1BmNb4HSMJhRlR8ktRQ6
 dmG0PUlNCHqd2aaD7JNkYRVdEl1qzll2xO6weVyZVmCAkR+JtYuMJ/bf08fI2ZnOGnMiyA1jU
 1d/kNj3PEhgPGnFMc9wZ+8Rcbo8hts3pV+ISCiwB1ED3sSHsd5c2k8HOCIAxP8oC+YG/ou8cU
 eW2wZOkAqZ/iNG27jexMx7rp0AgFpsCFAPD6bya+69jMFsS6h7YQN0ywZ6pYdL8Wy9wla/uU7
 +4tMvQ8+DrvnQNms4rQluoCQ03SsMVgtyD1CHqyjV9C6cpNIBdefXP8IILsWrRr/EIBrE82VL
 ihhVWLb4lh83L9ZDnTub/FVaq45YypPgqetK8V9Q7+2nPkDNQ6EZFf6A1XC0LTXvK/ZYw9Mxi
 m9924LPEHQGMTtCyqvYADDmoEUxTB9W8dnfLEfA==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=kuRyIzJW;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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


--Apple-Mail=_282B1E02-DF0C-4EE4-B0A8-83CABE194FCE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"



> On 17 Sep 2020, at 18:21, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>=
 wrote:
>=20
>=20
> On 9/17/20 8:26 AM, Jan Kiszka wrote:
>> Subject tag should be "arm64". And the patch should go over next first.
>> I can fix up both.
>>=20
>> On 16.09.20 15:07, Oliver Schwartz wrote:
>>> SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
>>> doesn't assume input registers to be constant, also mark these register=
s
>>> as output when used as input.
>>>=20
>>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>>> ---
>>>   hypervisor/arch/arm64/include/asm/smc.h      | 13 ++++++-------
>>>   include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++--------=
-
>>>   2 files changed, 17 insertions(+), 16 deletions(-)
>>>=20
>>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h
>>> b/hypervisor/arch/arm64/include/asm/smc.h
>>> index 1a5d5c8..c80fe15 100644
>>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>>> @@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id,
>>> unsigned long par1)
>>>       register unsigned long __par1 asm("r1") =3D par1;
>>>         asm volatile ("smc #0\n\t"
>>> -        : "=3Dr" (__id)
>>> -        : "r"(__id), "r"(__par1)
>>> +        : "+r" (__id), "+r"(__par1)
>>> +        :
>>>           : "memory", "x2", "x3");
>>>  =20
>>=20
>> For SMCCC, I'm considering to align fully with Linux, i.e. convert the
>> remaining register clobberings into early ones, but I also have no
>> strong argument for it.
>>=20
>> Ralf, thoughts?
>=20
> Just had a look at Linux's implementation. And now I recall why I didn't
> c&p it from Linux: it's an unreadable macro hell [1] that would benefit
> from being open-coded. But trying to follow Linux's __constraint macro,
> shouldn't we protect r2 and r3 as well?
>=20
> Linux would unroll __constraint_read_1 and __constraint_write_1, and
> __constraint_read_1 would protect r2 and r3 as well. We protect x2 and
> x3 via the clobber list -- is that enough?

I=E2=80=99m by no means an expert on arm assembler. However, I=E2=80=99m qu=
ite positive that there are no physical registers r2 and r3 that can be pro=
tected in arm64. These are just placeholders that are translated by the com=
piler to x2 and x3. So protecting r2/r3 as dummy arguments or x2/x3 via clo=
bber list is in effect the same, just more explicit.

Oliver

> Anyway, I think we can trust Linux's implementation, but Linux's clobber
> list only consists of "memory" and protects registers via operand lists.
> If anything would have blown up there, someone would have probably notice=
d.
>=20
>  Ralf
>=20
> [1]
> https://elixir.bootlin.com/linux/latest/source/include/linux/arm-smccc.h#=
L293 <https://elixir.bootlin.com/linux/latest/source/include/linux/arm-smcc=
c.h#L293>
>=20
>>=20
>> Jan
>>=20
>>>       return __id;
>>> @@ -43,8 +43,8 @@ static inline long smc_arg2(unsigned long id,
>>> unsigned long par1,
>>>       register unsigned long __par2 asm("r2") =3D par2;
>>>         asm volatile ("smc #0\n\t"
>>> -        : "=3Dr" (__id)
>>> -        : "r"(__id), "r"(__par1), "r"(__par2)
>>> +        : "+r" (__id), "+r"(__par1), "+r"(__par2)
>>> +        :
>>>           : "memory", "x3");
>>>         return __id;
>>> @@ -62,9 +62,8 @@ static inline long smc_arg5(unsigned long id,
>>> unsigned long par1,
>>>       register unsigned long __par5 asm("r5") =3D par5;
>>>         asm volatile ("smc #0\n\t"
>>> -        : "=3Dr" (__id)
>>> -        : "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
>>> -          "r"(__par4), "r"(__par5)
>>> +        : "+r" (__id), "+r"(__par1), "+r"(__par2), "+r"(__par3)
>>> +        : "r"(__par4), "r"(__par5)
>>>           : "memory");
>>>         return __id;
>>> diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h
>>> b/include/arch/arm64/asm/jailhouse_hypercall.h
>>> index 108d052..a9d13ee 100644
>>> --- a/include/arch/arm64/asm/jailhouse_hypercall.h
>>> +++ b/include/arch/arm64/asm/jailhouse_hypercall.h
>>> @@ -42,6 +42,7 @@
>>>   #define JAILHOUSE_CALL_NUM_RESULT    "x0"
>>>   #define JAILHOUSE_CALL_ARG1        "x1"
>>>   #define JAILHOUSE_CALL_ARG2        "x2"
>>> +#define JAILHOUSE_CALL_CLOBBERED    "x3"
>>>     /* CPU statistics, arm64-specific part */
>>>   #define JAILHOUSE_NUM_CPU_STATS          =20
>>> JAILHOUSE_GENERIC_CPU_STATS + 5
>>> @@ -54,9 +55,10 @@ static inline __u64 jailhouse_call(__u64 num)
>>>         asm volatile(
>>>           JAILHOUSE_CALL_INS
>>> -        : "=3Dr" (num_result)
>>> -        : "r" (num_result)
>>> -        : "memory");
>>> +        : "+r" (num_result)
>>> +        :
>>> +        : "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
>>> +          JAILHOUSE_CALL_CLOBBERED);
>>>       return num_result;
>>>   }
>>>   @@ -67,9 +69,9 @@ static inline __u64 jailhouse_call_arg1(__u64 num,
>>> __u64 arg1)
>>>         asm volatile(
>>>           JAILHOUSE_CALL_INS
>>> -        : "=3Dr" (num_result)
>>> -        : "r" (num_result), "r" (__arg1)
>>> -        : "memory");
>>> +        : "+r" (num_result), "+r" (__arg1)
>>> +        :
>>> +        : "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
>>>       return num_result;
>>>   }
>>>   @@ -81,9 +83,9 @@ static inline __u64 jailhouse_call_arg2(__u64 num,
>>> __u64 arg1, __u64 arg2)
>>>         asm volatile(
>>>           JAILHOUSE_CALL_INS
>>> -        : "=3Dr" (num_result)
>>> -        : "r" (num_result), "r" (__arg1), "r" (__arg2)
>>> -        : "memory");
>>> +        : "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
>>> +        :
>>> +        : "memory", JAILHOUSE_CALL_CLOBBERED);
>>>       return num_result;
>>>   }
>>> =20
>>=20
>=20
> --=20
> You received this message because you are subscribed to the Google Groups=
 "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to jailhouse-dev+unsubscribe@googlegroups.com <mailto:jailhouse-dev+=
unsubscribe@googlegroups.com>.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/jailhouse-dev/7ecaf35b-6669-143d-60fb-f7b63fb27d28%40oth-regensburg.de <h=
ttps://groups.google.com/d/msgid/jailhouse-dev/7ecaf35b-6669-143d-60fb-f7b6=
3fb27d28%40oth-regensburg.de>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C%40gmx.de.

--Apple-Mail=_282B1E02-DF0C-4EE4-B0A8-83CABE194FCE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 17 Sep 202=
0, at 18:21, Ralf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensbu=
rg.de" class=3D"">ralf.ramsauer@oth-regensburg.de</a>&gt; wrote:</div><br c=
lass=3D"Apple-interchange-newline"><div class=3D""><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none; float: none; display: inline !i=
mportant;" class=3D"">On 9/17/20 8:26 AM, Jan Kiszka wrote:</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; widows:=
 auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">Subject tag should be "ar=
m64". And the patch should go over next first.<br class=3D"">I can fix up b=
oth.<br class=3D""><br class=3D"">On 16.09.20 15:07, Oliver Schwartz wrote:=
<br class=3D""><blockquote type=3D"cite" class=3D"">SMC/HVC calls may modif=
y registers x0 to x3. To make sure the compiler<br class=3D"">doesn't assum=
e input registers to be constant, also mark these registers<br class=3D"">a=
s output when used as input.<br class=3D""><br class=3D"">Signed-off-by: Ol=
iver Schwartz &lt;<a href=3D"mailto:Oliver.Schwartz@gmx.de" class=3D"">Oliv=
er.Schwartz@gmx.de</a>&gt;<br class=3D"">---<br class=3D"">&nbsp;<span clas=
s=3D"Apple-converted-space">&nbsp;</span>hypervisor/arch/arm64/include/asm/=
smc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++++++-------<br class=3D"">&nbsp;=
<span class=3D"Apple-converted-space">&nbsp;</span>include/arch/arm64/asm/j=
ailhouse_hypercall.h | 20 +++++++++++---------<br class=3D"">&nbsp;<span cl=
ass=3D"Apple-converted-space">&nbsp;</span>2 files changed, 17 insertions(+=
), 16 deletions(-)<br class=3D""><br class=3D"">diff --git a/hypervisor/arc=
h/arm64/include/asm/smc.h<br class=3D"">b/hypervisor/arch/arm64/include/asm=
/smc.h<br class=3D"">index 1a5d5c8..c80fe15 100644<br class=3D"">--- a/hype=
rvisor/arch/arm64/include/asm/smc.h<br class=3D"">+++ b/hypervisor/arch/arm=
64/include/asm/smc.h<br class=3D"">@@ -28,8 +28,8 @@ static inline long smc=
_arg1(unsigned long id,<br class=3D"">unsigned long par1)<br class=3D"">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</sp=
an>register unsigned long __par1 asm("r1") =3D par1;<br class=3D"">&nbsp; &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</=
span>asm volatile ("smc #0\n\t"<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; : "=3Dr" (__id)<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; : "r"(__id), "r"(__par1)<br class=3D"">+&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; : "+r" (__id), "+r"(__par1)<br class=3D"">+&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</s=
pan>: "memory", "x2", "x3");<br class=3D"">&nbsp;<span class=3D"Apple-conve=
rted-space">&nbsp;</span><br class=3D""></blockquote><br class=3D"">For SMC=
CC, I'm considering to align fully with Linux, i.e. convert the<br class=3D=
"">remaining register clobberings into early ones, but I also have no<br cl=
ass=3D"">strong argument for it.<br class=3D""><br class=3D"">Ralf, thought=
s?<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" class=3D""=
>Just had a look at Linux's implementation. And now I recall why I didn't</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">c&amp;p it from Linux: i=
t's an unreadable macro hell [1] that would benefit</span><br style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none; float: none; display: in=
line !important;" class=3D"">from being open-coded. But trying to follow Li=
nux's __constraint macro,</span><br style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;" class=3D=
"">shouldn't we protect r2 and r3 as well?</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Linux would unro=
ll __constraint_read_1 and __constraint_write_1, and</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">__constraint_read_1 would protect r2 and r3 a=
s well. We protect x2 and</span><br style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;" class=3D=
"">x3 via the clobber list -- is that enough?</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D""></div></blockquote><div><br class=3D""></div><div>I=E2=80=
=99m by no means an expert on arm assembler. However, I=E2=80=99m quite pos=
itive that there are no physical registers r2 and r3 that can be protected =
in arm64. These are just placeholders that are translated by the compiler t=
o x2 and x3. So protecting r2/r3 as dummy arguments or x2/x3 via clobber li=
st is in effect the same, just more explicit.</div><div><br class=3D""></di=
v>Oliver</div><div><br class=3D""><blockquote type=3D"cite" class=3D""><div=
 class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none; float: none; display: inline !impo=
rtant;" class=3D"">Anyway, I think we can trust Linux's implementation, but=
 Linux's clobber</span><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">list=
 only consists of "memory" and protects registers via operand lists.</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0=
, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-var=
iant-caps: normal; font-weight: normal; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: =
none; display: inline !important;" class=3D"">If anything would have blown =
up there, someone would have probably noticed.</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none; float: none; display: inline !important;" class=3D"">&nbsp;Ralf</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none; float: none; display: inline !importan=
t;" class=3D"">[1]</span><br style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><a href=3D"=
https://elixir.bootlin.com/linux/latest/source/include/linux/arm-smccc.h#L2=
93" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; orph=
ans: auto; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px;" class=3D"">https://elixir.bootlin.co=
m/linux/latest/source/include/linux/arm-smccc.h#L293</a><br style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquote type=
=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; orphans: auto; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-ad=
just: auto; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><br class=3D"">Jan<br class=3D""><br class=3D""><blockquote type=3D"c=
ite" class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converte=
d-space">&nbsp;</span>return __id;<br class=3D"">@@ -43,8 +43,8 @@ static i=
nline long smc_arg2(unsigned long id,<br class=3D"">unsigned long par1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-spa=
ce">&nbsp;</span>register unsigned long __par2 asm("r2") =3D par2;<br class=
=3D"">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-s=
pace">&nbsp;</span>asm volatile ("smc #0\n\t"<br class=3D"">-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; : "=3Dr" (__id)<br class=3D"">-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; : "r"(__id), "r"(__par1), "r"(__par2)<br class=
=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "+r" (__id), "+r"(__par=
1), "+r"(__par2)<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
:<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span=
 class=3D"Apple-converted-space">&nbsp;</span>: "memory", "x3");<br class=
=3D"">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-s=
pace">&nbsp;</span>return __id;<br class=3D"">@@ -62,9 +62,8 @@ static inli=
ne long smc_arg5(unsigned long id,<br class=3D"">unsigned long par1,<br cla=
ss=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space"=
>&nbsp;</span>register unsigned long __par5 asm("r5") =3D par5;<br class=3D=
"">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-spac=
e">&nbsp;</span>asm volatile ("smc #0\n\t"<br class=3D"">-&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; : "=3Dr" (__id)<br class=3D"">-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; : "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3)=
,<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "r"=
(__par4), "r"(__par5)<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; : "+r" (__id), "+r"(__par1), "+r"(__par2), "+r"(__par3)<br class=3D"">=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "r"(__par4), "r"(__par5)<br c=
lass=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=
=3D"Apple-converted-space">&nbsp;</span>: "memory");<br class=3D"">&nbsp; &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</=
span>return __id;<br class=3D"">diff --git a/include/arch/arm64/asm/jailhou=
se_hypercall.h<br class=3D"">b/include/arch/arm64/asm/jailhouse_hypercall.h=
<br class=3D"">index 108d052..a9d13ee 100644<br class=3D"">--- a/include/ar=
ch/arm64/asm/jailhouse_hypercall.h<br class=3D"">+++ b/include/arch/arm64/a=
sm/jailhouse_hypercall.h<br class=3D"">@@ -42,6 +42,7 @@<br class=3D"">&nbs=
p;<span class=3D"Apple-converted-space">&nbsp;</span>#define JAILHOUSE_CALL=
_NUM_RESULT&nbsp;&nbsp;&nbsp; "x0"<br class=3D"">&nbsp;<span class=3D"Apple=
-converted-space">&nbsp;</span>#define JAILHOUSE_CALL_ARG1&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; "x1"<br class=3D"">&nbsp;<span class=3D"Apple-con=
verted-space">&nbsp;</span>#define JAILHOUSE_CALL_ARG2&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; "x2"<br class=3D"">+#define JAILHOUSE_CALL_CLOBBERED&=
nbsp;&nbsp;&nbsp; "x3"<br class=3D"">&nbsp; &nbsp;<span class=3D"Apple-conv=
erted-space">&nbsp;</span>/* CPU statistics, arm64-specific part */<br clas=
s=3D"">&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>#define JAI=
LHOUSE_NUM_CPU_STATS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;<br class=3D"">JAILHOUSE_GENERIC_CPU_STATS + 5<br class=3D"">@@ =
-54,9 +55,10 @@ static inline __u64 jailhouse_call(__u64 num)<br class=3D""=
>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space"=
>&nbsp;</span>asm volatile(<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>JAI=
LHOUSE_CALL_INS<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=
 "=3Dr" (num_result)<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; : "r" (num_result)<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; : "memory");<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; : "+r" (num_result)<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; :<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "memory"=
, JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,<br class=3D"">+&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_CALL_CLOBBERED);<br class=
=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&=
nbsp;</span>return num_result;<br class=3D"">&nbsp;<span class=3D"Apple-con=
verted-space">&nbsp;</span>}<br class=3D"">&nbsp;<span class=3D"Apple-conve=
rted-space">&nbsp;</span>@@ -67,9 +69,9 @@ static inline __u64 jailhouse_ca=
ll_arg1(__u64 num,<br class=3D"">__u64 arg1)<br class=3D"">&nbsp; &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>asm=
 volatile(<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;<span class=3D"Apple-converted-space">&nbsp;</span>JAILHOUSE_CALL_INS<b=
r class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "=3Dr" (num_resu=
lt)<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "r" (num_re=
sult), "r" (__arg1)<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; : "memory");<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=
 "+r" (num_result), "+r" (__arg1)<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; :<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; : "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);<br class=3D""=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;=
</span>return num_result;<br class=3D"">&nbsp;<span class=3D"Apple-converte=
d-space">&nbsp;</span>}<br class=3D"">&nbsp;<span class=3D"Apple-converted-=
space">&nbsp;</span>@@ -81,9 +83,9 @@ static inline __u64 jailhouse_call_ar=
g2(__u64 num,<br class=3D"">__u64 arg1, __u64 arg2)<br class=3D"">&nbsp; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</s=
pan>asm volatile(<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;<span class=3D"Apple-converted-space">&nbsp;</span>JAILHOUSE_CAL=
L_INS<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "=3Dr" (n=
um_result)<br class=3D"">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "r" =
(num_result), "r" (__arg1), "r" (__arg2)<br class=3D"">-&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; : "memory");<br class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; : "+r" (num_result), "+r" (__arg1), "+r" (__arg2)<br cl=
ass=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<br class=3D"">+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : "memory", JAILHOUSE_CALL_CLOBBERED)=
;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-converte=
d-space">&nbsp;</span>return num_result;<br class=3D"">&nbsp;<span class=3D=
"Apple-converted-space">&nbsp;</span>}<br class=3D"">&nbsp;<br class=3D""><=
/blockquote><br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: no=
ne; display: inline !important;" class=3D"">You received this message becau=
se you are subscribed to the Google Groups "Jailhouse" group.</span><br sty=
le=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; f=
ont-style: normal; font-variant-caps: normal; font-weight: normal; letter-s=
pacing: normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; d=
isplay: inline !important;" class=3D"">To unsubscribe from this group and s=
top receiving emails from it, send an email to<span class=3D"Apple-converte=
d-space">&nbsp;</span></span><a href=3D"mailto:jailhouse-dev+unsubscribe@go=
oglegroups.com" style=3D"font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-s=
ize-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">jailhouse-dev=
+unsubscribe@googlegroups.com</a><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">.</span><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none; float: none; display: inline !impo=
rtant;" class=3D"">To view this discussion on the web visit<span class=3D"A=
pple-converted-space">&nbsp;</span></span><a href=3D"https://groups.google.=
com/d/msgid/jailhouse-dev/7ecaf35b-6669-143d-60fb-f7b63fb27d28%40oth-regens=
burg.de" style=3D"font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 orphans: auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adj=
ust: auto; -webkit-text-stroke-width: 0px;" class=3D"">https://groups.googl=
e.com/d/msgid/jailhouse-dev/7ecaf35b-6669-143d-60fb-f7b63fb27d28%40oth-rege=
nsburg.de</a><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">.</span></div></blockquote></div><br class=3D""></body>=
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C%40gmx.de?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/EADE8BFE-2CA2-4942-80CA-CB40FDEEB71C%40gmx.de</a>.<br />

--Apple-Mail=_282B1E02-DF0C-4EE4-B0A8-83CABE194FCE--

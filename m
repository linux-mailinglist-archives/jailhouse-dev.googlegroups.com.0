Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBNFD5D4QKGQECU2WQNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B88245BCE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 07:12:21 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id u11sf3266445lfg.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Aug 2020 22:12:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597641140; cv=pass;
        d=google.com; s=arc-20160816;
        b=zjZYNBJl5IVL4VA15SeVw7zo6WA9mL6RKcVWlVUXb/y6PCwKyV7iXoeCqYLlScWc+Z
         L2RGGi6Qtt8s/Vz/jgmPPeKKUQRfWbKdPZoEVdcY+zDo3jRWAJBy00HMuK8RHlfWL21W
         JKv/rnMMKQ2fPhiJ5Z3Cc+A7VxvSYHrvvg9fQa18RdScOj6rDGW/63AGgvsp8ZQmR7cf
         FOkejbbFelikG+EIT1bafRStDu9KCo/hOzN8x7k5ktXa/QTyKLRZZFFP/szar8vUZyEw
         FyIGDUtKSIp8IOGFXxGNjKR84LXY15ncT8k7mXoPBADfvfTcBRpi068B3/b/ZcGG269f
         VddA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=W9NTTHLbA46YKaL8L4LRKsJ5/RnxuXlehRZgcUSXIsw=;
        b=sEIOj9vyu6DJiuAJnvnDkaa4HdKvJdw/tXmUAGdc2w3+zSb6kimEujddE2nH8LYBqt
         DCAAhI1sU80qn8bolqF6ecRWsdl4lMzEkUQu3m3IScND4SZYvXGBdWUfVUc3rlxuLXIL
         lsaR1AA9DkKr00hsKYo3pERMcudb1SUoDPmefHem1DVV+h5FGF7xiDtY7P6u/4OMYNLI
         Lstfb82CqdT2XXQR8HCQnwmEzT+DyV5StSHBreh+QanwNs5DD6SB6GjGNKW53+ikpEPa
         Aw7mohBszw83SwVETFbT3GCFXzfwVDaUYTynW6Q2JVEZCUjYG2MXA7n9Io51O1zUt2GN
         dnrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=co2gdp5g;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W9NTTHLbA46YKaL8L4LRKsJ5/RnxuXlehRZgcUSXIsw=;
        b=esC2ekKSbozIGzLtm1vnQrrKy4kZ2Qk14w0+vYTcbewo1XU+QcJLcC0CYxXE78XILO
         VDKqAw3PE0qq6CJMWzDzyAc77Pj88dpNdqJ9EAEdYNsYuiz4gupC3V+JvlxL5gg4/8kQ
         0ODR2JA+uNIWQLx2cUsy3WrihnseMY8MOs6zelPa4ObCxZ+mNph5ITt4qniC3iwzLmzU
         GUPARTlo7mS1WumTEDCH1VoqpeuyXM6q9LuTNc6tGzy7wBFygWyZDHHtVFPUFXg4rn7I
         12EZFbJVjcrWdIUBpQyrMonoTlBOmk4pC0YNbRQR1ggmkeiTYDmoupQVKdsw5Ua/cM71
         7tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W9NTTHLbA46YKaL8L4LRKsJ5/RnxuXlehRZgcUSXIsw=;
        b=FyLynH66V4OugFqgYNw/Y5MLdseHJ3Eu2wZF4dei6ZGwQFmPlIyBpvzlXQtg2KSbOW
         i6JiPJvBEPdOvi0/d1bl+MAt62YN2NhqbTZGOfyvjzo7RpyBGHtVfw/OVVjxSl99r4AG
         FUynEtZJVey7udLweQK5AhLj0qaRBDP1y5MoS9CsY9NzBY4gyvanf+IWsCPfG5x0Plt4
         5qWfnXCJhZDMebg0x9YFUCO0FHKCQ1wxbvQH1VFAJgSG1pktYyBWFpJ8mLdB7enDTUFk
         GxgZoFmV1qYlIQBLRz36eZVr+KcFVruQIVMuNa6loFGoeCOMSGX9rMtjBuXLI2nuKVjF
         M8XA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531SOymKQEYWK5Vwx74Y4nCnhCGB8OqCR3cE4JLirrXf21dQYWNH
	DXG+Bmg88tK6sB8zD64Dph4=
X-Google-Smtp-Source: ABdhPJzO2g4tKMfqArXP4209DKSdwyshk0Xnxv6+QsFY25hW1psSIPiVRXZphlQw4U+VOMYQrbos3A==
X-Received: by 2002:a05:6512:1055:: with SMTP id c21mr6550975lfb.84.1597641140514;
        Sun, 16 Aug 2020 22:12:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls524631lfg.1.gmail; Sun, 16 Aug
 2020 22:12:19 -0700 (PDT)
X-Received: by 2002:a19:7f94:: with SMTP id a142mr6508051lfd.43.1597641139634;
        Sun, 16 Aug 2020 22:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597641139; cv=none;
        d=google.com; s=arc-20160816;
        b=h9TxQtEiqRFKSHsMv2BaXF4W/Aw7XZS4HKmptXprQNfx4nxSIKOmPzIw1ud8D8WBrf
         0hUvlJOQOyWfmPqarnztEuhforc3fkCC8yuUqpfXFyEy9gjdcDa8o3e+OL6DJAO8Ua5y
         EplJem/yN/6rD9/Pj7C3dmZ/2dHIddpP6CDaQcnwBGGPnXoYXARI2YEtHz5k9cORocfj
         wj0MG9Q17AiBPYuZD2nfhX5k+ikGwfGsov1GNUbCtyvc8gaysLxAJzukYCZMviUDNINq
         rE90DoBG9krvQtvLV2RLd0jhm14eD8vUxV2GzLVZTp6YoVW7K/kZAbrjHTUdQyCyxC+N
         azhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=l5vr6rmUNilb3OHKrPRXgbKQsxqPzfWaJJjXM++E4Gg=;
        b=loqGtwv6gbQSga7ZANcmiGo3pAx8z+r4gf6XxuT6al9+ru2h0wJMxFn0tn2i99lIcw
         gzBbZc9n6L6vs/P2D8soo03hF0DDe/M/lg49KUaO98UzyKe/mxMmrwQOXZ5hEdKeYuPp
         lWqtrGPYxMXpFKTPvmYGbq+Xfg8BtOrCh41AhJEsdP2eKPLflXnsO9auz9v2xW75o5/k
         +oI5IF9sZ3HJsRbGNusEBdvhG/FL8Q5ljPO/i5fO/wSfxCN0X74HtICzqzbvuv+LmLQf
         AH7wDss/Z6WfUsWuX5K9XhJpNT2RbNllO4Ypkuu14KsCZAA79rOBOuZCVsWkWlU0r5qC
         akXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=co2gdp5g;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id a7si556205ljp.2.2020.08.16.22.12.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 22:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3V28-1k6zTc2hYg-000zes; Mon, 17
 Aug 2020 07:12:18 +0200
Subject: Re: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <1b65d312-fc95-72a3-541f-aae43be7a126@siemens.com>
 <fccdea7b-8c96-8387-373e-bc00b163e4f4@web.de>
 <DB6PR0402MB2760A09B1BCEA12BB66B88A8885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <caf5198b-0cda-1281-800e-470a33ae0163@web.de>
Date: Mon, 17 Aug 2020 07:12:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760A09B1BCEA12BB66B88A8885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4xdWKf5WBVjtWsWTHLAzAbLmsJSRd4ym58r4czqVMO5y5uch1Nc
 ArpeQ0o31M2iOuUFOjYnkYMwiQsTtJj61LdniTNoDrY4KfszGojQg1a1lUKYw1xCgvdk4Ah
 G4mH4YZpt9Zrsk8I52nMrozwZfcJuMHu0Hr5aD6b7rLxrrdvD533hpBqon3O1o4xmoLgVE0
 gC0xm20c9HVSQKBSJ0UQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YT01vAQBhLY=:XAgGRcjKOVSgiWLvnHUewM
 KC+padFzvtq9U9Wqgk7IEPoZxA9+/8wiFLxcJznJCn0wU9UJujvGkEJiVoe3Wv1qHAgqIhZMy
 Wxs4iYIMU3g9X6LTSzSMIuS1YNS9Z4CA1f2ATYIlpAq9cM5EJZPywhi9Y9dgA9Cb1NF0cnnkv
 WWMnkulTbvG+2WDa9Vo3426k21rvnR6f9Nk/X9eBAD2fjbouHqmFnJdGqp2e2QuGPb0/DWLGx
 wGf17Y3kOsGfOpVpQY604lFyQOL5HIrbNQ7Fl6iqs9fdoYFLxokNxkOGAqBWjZ1AEVW5zdo1p
 P/vOEnP2vDjVqMuvUggunF1rbAvXgc05mMLatn2b/wE8Gyj18OSY9yh+DoN4tvE2cPwwFw8Ff
 l6rIekDc3WQO/oTEdCu8EZ8yWUW8pKBr4/TM/Zrmhx+p0EASXolyH4enRYWCVVvyf8NqHRSNl
 /nM6AmPDKoYYvWfRBN9VVCN8hvg5V8vQJpNld6aTlkHo6fgZQnZ79ulY+gpD/3KuykQJki7sp
 5Bxu6wt7lfuXhbn745T7605WNl8eur1LtTa+UotYtHHh9LA0H+UAphoKOcO3qHniiGcKUJpbn
 Z4ITRnXJnRhJys3B3JuOp9umG1qEAmqSdXCrlOT2wjyQBQc2tBJC6nX3uxbNhG4PzCQvvp153
 TgDI9Irk1VXCotPfs0Kd+HUOvzyj/wuACWmQaRlSswQAB2qzBf5HWcmzZgcQbtqZar40IceLO
 M3vITDM0zCy/o5dTX+5zaFMkNEsyhYQ1Gm3SwfH2a28Al26qN6R1WNZPL5EBy9LQSQ9QbuujU
 XjV9vhZcQ5vdyFZ4daOr3YgWf101IyIrvOEFBsn5YDqUqCjE0IBGyniJIlxutrESPSq88gK0K
 CVtjDk16jJvkNpMrngmDwuRkbrB/ratqbAQL2vLj34EkTZDuqXuTeoaUQQIN4OjQOzIhcK4wq
 57rbIC9CbHlhPylp015pVbB0JisfcSAGw0tMUS1rIdruGRGyhtgmWcBXGZak+BgKc7KRNM86h
 42/9QsiEBlq5N3/ramVrcLPq1In3PMsTrOSzxgWdK0wjjSQLsKHHkGcR6Tv+R5F+LKjPMbYZR
 16pR/oRLswXi3fMs9nnWxTh2NrzCuQkLbQaDRVWth0bao0meD45AoWBkUp7D/K9528/svfO/Z
 m9h8cnIo8V7Ea1JzBbehyZDhcYrifnR7di1YJ6ygQmprcPtiAZFVCsHddT8CnUaiK5fBUiCNo
 J5BXXYdtsE+Y0+P3Fe12QuaqD7NSLA3XWkz8ssQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=co2gdp5g;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 17.08.20 04:29, Peng Fan wrote:
>> Subject: Re: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
>>
>> On 14.08.20 15:17, Jan Kiszka wrote:
>>> On 15.08.20 21:09, Alice Guo wrote:
>>>> An AArch64 hypervisor can host both AArch32 and AArch64 virtual
>>>> machines at the same time. If the inmate cell wants to run in AArch32
>>>> mode, the assigned cpu must change to AArch32. Because AArch64
>>>> hypervisor and
>>>> AArch64 root cell are used, when the AArch32 inmate cell is
>>>> destroyed, cpu owned by inmate cell will be reassigned to AArch64
>>>> root cell, switch the cpu back to AArch64.
>>>>
>>>> The following is a summary of some of the points when supporting
>>>> inmate cell in AArch32 mode:
>>>> Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32
>> execution
>>>> state. Add this macro to flags of struct jailhouse_cell_desc, and you
>>>> can use it to indicate whether a cell is AArch32.
>>>>
>>>> AArch32 and AArch64 virtual machines use different
>> ARM_PARKING_CODE.
>>>> 0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
>>>> 0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by
>>>> AArch32 in arm64/include/asm/processor.h, and then select which one
>>>> to use by arm_cpu_reset().
>>>>
>>>> When an exception occurs, the processor must execute handler code
>>>> which corresponds to the exception. When the exception is being taken
>>>> at a lower Exception level, the execution state of the next lower
>>>> level
>>>> (AArch64 or AArch32) will be used. Fill exception handling functions
>>>> for Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.
>>>>
>>>> Changing to AArch32 happens after the command "jailhouse cell start 1"
>>>> is executed. Changing to AArch64 happens after the command "jailhouse
>>>> cell destroy 1". If a cell is AArch32, SPSR_EL2.M[4] will be set to
>>>> 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will be set
>>>> to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to 0b0
>>>> which means lower levels are all AArch32. If a cell is AArch64, make
>>>> sure HCR_EL2.RW is 0 and the other registers are configured according
>>>> to the previous code.
>>>>
>>>> After Linux operating system boots up, execute the following commands
>>>> to use AArch32 virtual machine on the i.MX8DXL:
>>>> ./jailhouse enable imx8dxl.cell
>>>> ./jailhouse cell create imx8dxl-gic-demo-aarch32.cell ./jailhouse
>>>> cell load 1 gic-demo.bin (32-bit) ./jailhouse cell start 1
>>>>
>>>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>>>> ---
>>>>  =C2=A0 hypervisor/arch/arm-common/control.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
>>>>  =C2=A0 hypervisor/arch/arm64/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10
>> ++++++++++
>>>>  =C2=A0 hypervisor/arch/arm64/entry.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +=
+++----
>>>>  =C2=A0 hypervisor/arch/arm64/include/asm/processor.h |=C2=A0 4 +++-
>>>>  =C2=A0 hypervisor/arch/arm64/include/asm/sysregs.h=C2=A0=C2=A0 |=C2=
=A0 4 ++++
>>>>  =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
>>>>  =C2=A0 6 files changed, 29 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/hypervisor/arch/arm-common/control.c
>>>> b/hypervisor/arch/arm-common/control.c
>>>> index 70793432..bfd9e710 100644
>>>> --- a/hypervisor/arch/arm-common/control.c
>>>> +++ b/hypervisor/arch/arm-common/control.c
>>>> @@ -32,7 +32,10 @@ void arm_cpu_park(void)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enter_cpu_off(cpu_public);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&cpu_public->control_lock)=
;
>>>> -=C2=A0=C2=A0=C2=A0 arm_cpu_reset(0);
>>>> +=C2=A0=C2=A0=C2=A0 if (this_cell()->config->flags & JAILHOUSE_CELL_AA=
RCH32)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_cpu_reset(PARKING_ENTR=
Y_ADDR_AARCH32);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_cpu_reset(PARKING_ENTR=
Y_ADDR_AARCH64);
>>>
>>> Let's do
>>>
>>> arm_cpu_reset(this_cell()->config->flags & JAILHOUSE_CELL_AARCH32 ?
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PARKING_ENTRY_=
ADDR_AARCH32 :
>> PARKING_ENTRY_ADDR_AARCH64);
>>>
>>
>> Just thought about again, and I think there is an even better way: Pass =
the
>> mode as second parameter to arm_cpu_reset
>
> "the mode" you mean "boot aarch64_mode"? or "bool parking"?
>
> I think "bool parking" is reasonable. Because for parking, we could
> park in aarch64 mode. For return to aarch32 inmate vm, we need
> to configure to run in aarch32 mode.

aarch64 mode: For parking, you would pass aarch64 unconditionally and,
thus, only need to provide one parking code.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/caf5198b-0cda-1281-800e-470a33ae0163%40web.de.

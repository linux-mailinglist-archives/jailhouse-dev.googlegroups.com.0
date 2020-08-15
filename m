Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIUC334QKGQEKP4GP4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id B78292450B8
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 08:30:59 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id d6sf4189186wrv.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 23:30:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597473059; cv=pass;
        d=google.com; s=arc-20160816;
        b=F0qDDm6GhBqTW5WNLX7ndnDs/CZ9qPJINQ1wW1K4yh9/s6MI61TaWOR+iI6guS17H/
         te5WpG9yuxcdoZbxrFNwXkNdP1cta1mn5dIWEYGQPQjdgU0WyGbB5xrm9Zar86XoI2RZ
         C6TuOhCXg8OAvb/HsiB5EOmdaeFrhpKBFPFwNpAybe1D9L79qCe+qzGNwhuc4xNn73i8
         AZ8wLqv3hIfqkK8dbjSY/QOPepNpNryMnSA+XpSbLlVdeXyX9UoanH5Ort6bX7d1vwcJ
         oOcMpZmNTCgwFQOWGlemqBxtNeSzzPSPIXV4r+pMHS5KjYlu44t/wE+LCIuqnSY9rQe/
         1v4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=4itMnayZHMK3Tebzicay7qg4B6ftbhmGg+DtdOB3AWo=;
        b=Y2bH1XTyZlbRqsqCg11bZUlrWtFq7QSIIu2bRq6/fEcbCOHSZbKN0q+WGc2Zj0bYCs
         D0YnlU76GFXTdXzXd9g8MVLTrruti458OA3MrPCkZLnQOGGHBTQHkgvPWi60AqIYG+Hb
         qNflUz0kryWgqaxrmfYWrY2lvlVFYhrafnXiwt4lAozwMps0rWjAZLRooH4ZG6xz7LVa
         q86KrcAKr7KVVs4e0rME8CkfCgGwUKknB2H0KyzpIciIz4bxBZ5e+zQNaq2LRprDTUJT
         buAnDNgoFYgjAMQKZYUF3RDsrXwja6E5HGjnHtQXKRzqQOBiXFE2F+7kp4sJUCLcfLbm
         gVnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FFNZq2AM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4itMnayZHMK3Tebzicay7qg4B6ftbhmGg+DtdOB3AWo=;
        b=NA8IOgJ1hnxjOYyuNfAgXTyqxiX9dN2e9EEE1+1Rg/ZphyVC9pnIIhP5ujXh9vyWHY
         vhWKht8e+ZJmuJRt9ZqJprqnzCzaPwPn8+7ns5/cs+aVa3OJw/JwzmhOee67/i49szIZ
         YdvuGH0mf7AKv9lU83F6wpMal2MtjpyYq9mrMye+Sughdh9Zi5G9abUQtsEQ5HOHb7GX
         9yTMKhiEfWfYB7gDkc559ZDhtL4xRsPpucQIV80z4LHN3ax38luiMCkUll+6Jq+dn/Dv
         fIfxTKAGFBZgtxWajVNCp0lBfc14cbwxLxDQ6xBULoPVUFD2rq6oo2LtTVr7g8jBQ2G3
         QJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4itMnayZHMK3Tebzicay7qg4B6ftbhmGg+DtdOB3AWo=;
        b=R2/Fm/IlvyTNE2rGIJfG6cDUJmy8bI3NB9YCUj1H87m5eqlMfVSd2tWmzjZoW9Baaq
         lQcTC5Me1Cju2iCwTZrKY1KXAaPOcfF6oNNVKfvZoOU9xCbmhTBrCGuaZhBeCYGaa21u
         MgB4p8G0C+kiorEciqMlNMgPV2HJPYHP0W/wChEJS//EgWd2SoMNCfV6a8GxQWR9ZbN7
         9WzZ2m/T2qmRZjx+Yua+AepVAyiUTiCUw+eoy8Q45Y0u2sHWQR4aDjXTYRbgsmaDPndi
         E2bb0UOxuDWfNJbkFfMO0/mayCGgeM4bBnMzqutfQSM1VlvTbiy4tiWSpR4e6aO/BgHB
         f7FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WxwYyR8XU5VGR/d/NsDbRTNQqOVEcs9fndRPUKx5bRf/h3xG8
	/RytB7917iHcVGFCfLREovU=
X-Google-Smtp-Source: ABdhPJzbuwOV+BdWvClpE1OLgRPp8dXCuq9h4DAI9FQINTDAohxxlBKSkMPKE1A9ccB3bbDE2DZrwA==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr6155306wrj.347.1597473059089;
        Fri, 14 Aug 2020 23:30:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2049:: with SMTP id g70ls5049771wmg.0.gmail; Fri, 14 Aug
 2020 23:30:58 -0700 (PDT)
X-Received: by 2002:a05:600c:21c2:: with SMTP id x2mr5691346wmj.142.1597473058199;
        Fri, 14 Aug 2020 23:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597473058; cv=none;
        d=google.com; s=arc-20160816;
        b=Tpc+CsZgEmWyBGrU1WPfayBxoTLJ4mw+gTWrcoxeeKD5yNhkBMKtJcBVAX/J5jC7HV
         tbPoT8y/sQwcOp1inKJxN7PJdMbrHnf2z+JZb1r2hsVc62qSMGZr/N9ZV3pHDvDPu4v+
         vDRA+i0Vm2mtAlCZleAb/7CVdZREw5/bUDYgiapoq4ZcL6fsaZPoLWzFpriRvU3CAkUs
         Yw0FOGGB26U/ViZ0bWHcow+Ls/8DEupro5bLp8YcKSUlLuZ32DlJssTUPGP/HJj6OHxC
         w8nTVllQz+DrUrp4qD3kHIQmB6csH49vip5ZVVSxeEyRvug9PTlziy5q4pC7CYYEx2Ua
         AdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=QL+YFApztrMOT8Jjp0pS5u8PsEz7l4xeUVYQojZUwks=;
        b=Y/RVQSmU+crO4BZYC/DWRXXw7f0Y782ZgeuNuA+LUXN7cPNCWGV/BNbY5vzsFHojTR
         HHgRLELBGrfmnCNNsPxySKsOjNPOj3DMp9x2XK8teJ2f7dSRZAjpTXkrl+JhEqLyiwJl
         c2dSsBvcYx859qLIp4vymLWfSmx61o1d+NX1DBeDJ2RAU+RKBujetSi/1Al641IiqV7m
         fXslkmLvM3fS77s9v+WWGdtq6OJbumrGbxRCpd/127M4bMCtBJny5EAd1oXSupo/MnCG
         nSva+CkTbTPKR7ntwAdbWeTvpVwgyZrfqqftz5FVmQgjjKJl3NEm1byuPWnBkpn809h+
         btCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FFNZq2AM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id y12si407913wrt.1.2020.08.14.23.30.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 23:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MT7WN-1kG1bK3GDX-00USZj; Sat, 15
 Aug 2020 08:30:57 +0200
Subject: Re: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
From: Jan Kiszka <jan.kiszka@web.de>
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <1b65d312-fc95-72a3-541f-aae43be7a126@siemens.com>
Message-ID: <fccdea7b-8c96-8387-373e-bc00b163e4f4@web.de>
Date: Sat, 15 Aug 2020 08:30:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1b65d312-fc95-72a3-541f-aae43be7a126@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1mhrcwIy8yhqDcHFhNztdwVwKy/q0GziB3lhZXhLYoHppfpVWNJ
 E8pvku/eX0wRsUJcbixWXS4uOovuFHlIh6QQUgkEb5EQAR23FDHzFNaQdg75bSMdkP2VZur
 L/s771eFZD95Pdi5K7CRbbaH+4sZ3eLjONG+H7j7QSzKsuJ24/8A/rQKt+NvxRnm2dZPrJX
 vT+MDUxwV75h4vCdR7aTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJqYmPw6ZII=:RvX1A1jd5nB5sSbJSLrqit
 KbACcD/5Fw4uVZZ83d4QPjptWjVwORpNcVvcIZWlHzCQbTNGvM/Zr+7XkHdYAjvcdNYD0S9HN
 wSXxAbHuoXWH8LbEQND8x6Po7O4J0VwZwo7hiUpF6KbQZgEDnGT+ohbqlZ4dwTg0lN7UZ3+jA
 y+knRYWwC2NvWUMiLKVhql6H8FkGuE0fU3Yt67+r4D1cRkOn5OclE/yw9O6PjVK9Jjmc0Y3Y9
 EYWbSouxTFJWkwjFuH9ne11A97XPLSZripdtybKW/UIV5Rh3CMcp4Ehx7fRewWwSFXW1e8k2H
 y0s4T7DAJ3r+yYFuPo9X9maTBL0+GFa/a57NvhC/1T9jb4oOEELXl3yfPJXvk7QRFerb/QIap
 sZcwinq9GW97CMpLyTtAmMzu8QQL+pBn5B3Y6ThCus556MHACfiwGYrDsW/4RZIpaUfaQD7T0
 P70es8Wlyig/CPKjmcaEC8IrJwSzMkSwk8vI55XAip87KnOtwj4/7ow5WBfsH0VdfwLHssNFC
 DZRcCetQwHW/k4wuNdQyrh9clRHiffb5wetBERqUUr4vuPrD08rigYXfRvbrUYV3rq89UEF9/
 pkJ/KBH/dTNyPDX9XgehtHEK065U/vaaiUCD03cENHeouLHGPR9E7pPywkdJghFUVsJR4Fy4K
 1R3Qmx6BqqyIlIOEzu5Vf52XXpToSYKQsIhujGZP0zd77fkZonkuJhuOkjJnr3KDcVSdUQRcP
 aR72Tf0LbXWhHQ1DA1t8Lc6418b5/REifIrwxOYu3XS0xSaLfXSC336OW1sdz4Wff/Cclw5OX
 iKMs6YhTFQD4AtYX0Zs+5PfB+Iol1EQnbgfhFV/lTisyEzbhw248QHClQOASH4lr3CylFKRU2
 TiIdUIy2Bq9wx3AZJeAoxsluRgnJYR3tgPpNT2jjv3kg+3wPUDGj0NAPU91wHhB6rjAlymiUT
 SUCNOfCgmARb0dYIBrcRb6RCUyxUOo1+IQ9wPhQgbsDIeTSGTXFKXEDIEBYepKJ4jNJdzf2Ae
 xQmBBwGNIFxRnt6mb76g7oUG67vTfPDdDx5HnD7IfX1hA7eyFRLrUoAsWrw9ol6X6z15bWrcD
 4jKSKLNo6ytnj+JWMwgLGvDo8Pa5MrBTX0uAJeUnkIZnRgwG4PVKZLkHfnqypXlakT/JJTsHh
 FrWlhb6aiPaHPKoBzOzx9hNna8VBD+xAHF98iBnRaMoUQDD10B72nVA5B2JOSPpZ3/IoXE701
 IKqxyjkWmj5mYhhJT
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=FFNZq2AM;       spf=pass
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

On 14.08.20 15:17, Jan Kiszka wrote:
> On 15.08.20 21:09, Alice Guo wrote:
>> An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
>> at the same time. If the inmate cell wants to run in AArch32 mode, the
>> assigned cpu must change to AArch32. Because AArch64 hypervisor and
>> AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
>> cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
>> the cpu back to AArch64.
>>
>> The following is a summary of some of the points when supporting inmate
>> cell in AArch32 mode:
>> Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
>> state. Add this macro to flags of struct jailhouse_cell_desc, and you ca=
n
>> use it to indicate whether a cell is AArch32.
>>
>> AArch32 and AArch64 virtual machines use different ARM_PARKING_CODE.
>> 0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
>> 0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by
>> AArch32 in arm64/include/asm/processor.h, and then select which one to
>> use by arm_cpu_reset().
>>
>> When an exception occurs, the processor must execute handler code which
>> corresponds to the exception. When the exception is being taken at a
>> lower Exception level, the execution state of the next lower level
>> (AArch64 or AArch32) will be used. Fill exception handling functions for
>> Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.
>>
>> Changing to AArch32 happens after the command "jailhouse cell start 1"
>> is executed. Changing to AArch64 happens after the command
>> "jailhouse cell destroy 1". If a cell is AArch32, SPSR_EL2.M[4] will be
>> set to 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will be
>> set to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to 0b0
>> which means lower levels are all AArch32. If a cell is AArch64, make
>> sure HCR_EL2.RW is 0 and the other registers are configured according to
>> the previous code.
>>
>> After Linux operating system boots up, execute the following commands to
>> use AArch32 virtual machine on the i.MX8DXL:
>> ./jailhouse enable imx8dxl.cell
>> ./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
>> ./jailhouse cell load 1 gic-demo.bin (32-bit)
>> ./jailhouse cell start 1
>>
>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>> ---
>> =C2=A0 hypervisor/arch/arm-common/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
>> =C2=A0 hypervisor/arch/arm64/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
>> =C2=A0 hypervisor/arch/arm64/entry.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++=
----
>> =C2=A0 hypervisor/arch/arm64/include/asm/processor.h |=C2=A0 4 +++-
>> =C2=A0 hypervisor/arch/arm64/include/asm/sysregs.h=C2=A0=C2=A0 |=C2=A0 4=
 ++++
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
>> =C2=A0 6 files changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm-common/control.c
>> b/hypervisor/arch/arm-common/control.c
>> index 70793432..bfd9e710 100644
>> --- a/hypervisor/arch/arm-common/control.c
>> +++ b/hypervisor/arch/arm-common/control.c
>> @@ -32,7 +32,10 @@ void arm_cpu_park(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enter_cpu_off(cpu_public);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&cpu_public->control_lock);
>> -=C2=A0=C2=A0=C2=A0 arm_cpu_reset(0);
>> +=C2=A0=C2=A0=C2=A0 if (this_cell()->config->flags & JAILHOUSE_CELL_AARC=
H32)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_cpu_reset(PARKING_ENTRY_=
ADDR_AARCH32);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_cpu_reset(PARKING_ENTRY_=
ADDR_AARCH64);
>
> Let's do
>
> arm_cpu_reset(this_cell()->config->flags & JAILHOUSE_CELL_AARCH32 ?
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PARKING_ENTRY_ADD=
R_AARCH32 : PARKING_ENTRY_ADDR_AARCH64);
>

Just thought about again, and I think there is an even better way: Pass
the mode as second parameter to arm_cpu_reset and park in AARCH64 mode
unconditionally. Obviously, that parameter will be ignored on 32-bit ARM.

Jan

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_paging_vcpu_init(&parking_pt);
>> =C2=A0 }
>> diff --git a/hypervisor/arch/arm64/control.c
>> b/hypervisor/arch/arm64/control.c
>> index 6e1ffebf..71615c04 100644
>> --- a/hypervisor/arch/arm64/control.c
>> +++ b/hypervisor/arch/arm64/control.c
>> @@ -20,6 +20,8 @@
>> =C2=A0 void arm_cpu_reset(unsigned long pc)
>> =C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 u64 hcr_el2;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* put the cpu in a reset state */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle big endian suppor=
t */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_sysreg(SPSR_EL2, RESET_PSR);
>
> Please pull this into this AARCH64 branch below to avoid needless
> duplicate writing.
>
>> @@ -67,6 +69,14 @@ void arm_cpu_reset(unsigned long pc)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle PMU registers */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle debug registers *=
/
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle system registers =
for AArch32 state */
>> +=C2=A0=C2=A0=C2=A0 arm_read_sysreg(HCR_EL2, hcr_el2);
>> +=C2=A0=C2=A0=C2=A0 if (this_cell()->config->flags & JAILHOUSE_CELL_AARC=
H32) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_sysreg(SPSR_EL2, R=
ESET_PSR_AARCH32);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hcr_el2 &=3D ~HCR_RW_BIT;
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hcr_el2 |=3D HCR_RW_BIT;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 arm_write_sysreg(HCR_EL2, hcr_el2);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_sysreg(ELR_EL2, pc);
>> diff --git a/hypervisor/arch/arm64/entry.S
>> b/hypervisor/arch/arm64/entry.S
>> index 27e148c6..4789e933 100644
>> --- a/hypervisor/arch/arm64/entry.S
>> +++ b/hypervisor/arch/arm64/entry.S
>> @@ -401,8 +401,8 @@ hyp_vectors:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> +=C2=A0=C2=A0=C2=A0 handle_vmexit arch_handle_trap
>> +=C2=A0=C2=A0=C2=A0 handle_vmexit irqchip_handle_irq
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> @@ -425,8 +425,8 @@ hyp_vectors_hardened:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> +=C2=A0=C2=A0=C2=A0 handle_abort_fastpath
>> +=C2=A0=C2=A0=C2=A0 handle_vmexit irqchip_handle_irq
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
>> diff --git a/hypervisor/arch/arm64/include/asm/processor.h
>> b/hypervisor/arch/arm64/include/asm/processor.h
>> index b52782b7..e7b048e0 100644
>> --- a/hypervisor/arch/arm64/include/asm/processor.h
>> +++ b/hypervisor/arch/arm64/include/asm/processor.h
>> @@ -34,7 +34,9 @@ union registers {
>> =C2=A0 #define ARM_PARKING_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xd503207f, /* 1: wfi=C2=A0 */=C2=A0=C2=
=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0 0x17ffffff, /*=C2=A0=C2=A0=C2=A0 b 1b */
>> +=C2=A0=C2=A0=C2=A0 0x17ffffff, /*=C2=A0=C2=A0=C2=A0 b 1b */=C2=A0=C2=A0=
=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 0xe320f003, /* 2: wfi=C2=A0 */=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 0xeafffffd, /*=C2=A0=C2=A0=C2=A0 b 2b */
>> =C2=A0 #define dmb(domain)=C2=A0=C2=A0=C2=A0 asm volatile("dmb " #domain=
 "\n" : : : "memory")
>> =C2=A0 #define dsb(domain)=C2=A0=C2=A0=C2=A0 asm volatile("dsb " #domain=
 "\n" : : : "memory")
>> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h
>> b/hypervisor/arch/arm64/include/asm/sysregs.h
>> index 0105b109..62a56743 100644
>> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
>> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
>> @@ -15,11 +15,13 @@
>> =C2=A0 #define PSR_MODE_MASK=C2=A0=C2=A0=C2=A0 0xf
>> =C2=A0 #define PSR_MODE_EL0t=C2=A0=C2=A0=C2=A0 0x0
>> +#define PSR_MODE_SVC=C2=A0=C2=A0=C2=A0 0x3
>> =C2=A0 #define PSR_MODE_EL1t=C2=A0=C2=A0=C2=A0 0x4
>> =C2=A0 #define PSR_MODE_EL1h=C2=A0=C2=A0=C2=A0 0x5
>> =C2=A0 #define PSR_MODE_EL2t=C2=A0=C2=A0=C2=A0 0x8
>> =C2=A0 #define PSR_MODE_EL2h=C2=A0=C2=A0=C2=A0 0x9
>> +#define PSR_32_BIT=C2=A0=C2=A0=C2=A0 (1 << 4)
>> =C2=A0 #define PSR_F_BIT=C2=A0=C2=A0=C2=A0 (1 << 6)
>> =C2=A0 #define PSR_I_BIT=C2=A0=C2=A0=C2=A0 (1 << 7)
>> =C2=A0 #define PSR_A_BIT=C2=A0=C2=A0=C2=A0 (1 << 8)
>> @@ -28,6 +30,8 @@
>> =C2=A0 #define PSR_SS_BIT=C2=A0=C2=A0=C2=A0 (1 << 21)
>> =C2=A0 #define RESET_PSR=C2=A0=C2=A0=C2=A0 (PSR_D_BIT | PSR_A_BIT | PSR_=
I_BIT | PSR_F_BIT \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | PSR_MODE_EL1h)
>> +#define RESET_PSR_AARCH32=C2=A0=C2=A0=C2=A0 (PSR_A_BIT | PSR_I_BIT | PS=
R_F_BIT \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | PS=
R_32_BIT | PSR_MODE_SVC)
>
> Indention is ugly now, and naming is inconsistent. So let's align
> everything after RESET_PSR_AARCH32, at least in this block, and rename
> RESET_PSR to RESET_PSR_AARCH64.
>
>> =C2=A0 #define MPIDR_CPUID_MASK=C2=A0=C2=A0=C2=A0 0xff00ffffffUL
>> =C2=A0 #define MPIDR_CLUSTERID_MASK=C2=A0=C2=A0=C2=A0 0xff00ffff00UL
>> diff --git a/include/jailhouse/cell-config.h
>> b/include/jailhouse/cell-config.h
>> index 6df4a745..6fda32b9 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -56,6 +56,10 @@
>> =C2=A0 #define JAILHOUSE_CELL_PASSIVE_COMMREG=C2=A0=C2=A0=C2=A0 0x000000=
01
>> =C2=A0 #define JAILHOUSE_CELL_TEST_DEVICE=C2=A0=C2=A0=C2=A0 0x00000002
>> +#define JAILHOUSE_CELL_AARCH32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000004
>> +
>> +#define PARKING_ENTRY_ADDR_AARCH64=C2=A0=C2=A0=C2=A0 0x0
>> +#define PARKING_ENTRY_ADDR_AARCH32=C2=A0=C2=A0=C2=A0 0x8
>
> The last two do not belong here. They are internal to the hypervisor.
> Move them to asm/processor.h where the code block is also defined.
>
> Jan
>
>> =C2=A0 /*
>> =C2=A0=C2=A0 * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows =
inmates
>> to invoke
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fccdea7b-8c96-8387-373e-bc00b163e4f4%40web.de.

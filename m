Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBSW2U3UQKGQE74X2S4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038B6799C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 12:07:07 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t9sf5663316wrx.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 03:07:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563012426; cv=pass;
        d=google.com; s=arc-20160816;
        b=nU8sZFX0KnDWfKLcpFR6tkdq7jjJomrfZEGYEFu9GGPeTFGCT1ylPN7Cxyo4hMuhf7
         349nxXOMdEDPKsMPhYvsEM2/7+i1ChsOR/j3PfZdB9RstZtv3g1ZziV9+9bXZhWt0pmr
         V5L5GEzokDM6zJKkQdk+Qv5ihuD6UCmGGwX7oyOCvTlL76ebNhxmKmpXSfvJBLnt7iDz
         pxWURRMneiF7O+NBVMIqmY/CZGTXFH//JsxR+CNQs2nV5HMZ/1fbAgd8DAz4SRJzZfyr
         qB8bJrUD9lXYWjjy9ZRgR89N6TOuzNDvqE/fvdBbyLVpBTymOSNXSE4kTBvXBt27THYq
         TG7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=CCZJ6C3lL7Tsd77DmnX0URPJFYpmmm9N0KTiqBe8a1Y=;
        b=dmW6FayVrRzq+GcZeEjaSsAjmU5uz8bOFz7GwCcYOH5I0nlZXVmAcDhGg/A57kR7BR
         UB2L7D3VLONPgewiesY/1qgjZrzNVD+lSqXC2x74RtlV1/Ey6/2Z6FigPegtC2nUfAY/
         PSpkrlWTBtspUSToNXcYWs8k1VB748ZVpnGxlKp89B6Lxz2GlWQza1U1sbLyspIvTsYk
         +w7qyxKYPQlQOJUGBsUYbtlQNWwMcAOT6gEtAF/aZjl2O1smlkdGkx3UcOrGVayZwgFg
         cUaYKhIn67YR2g3neqEy6wep9xdVDsl/UPOBiMdEyo87XcPhHkJYZAvfOF2NkogIRjPC
         buYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EijkHUi6;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CCZJ6C3lL7Tsd77DmnX0URPJFYpmmm9N0KTiqBe8a1Y=;
        b=Q8VoWYQW/gWyrgykIT/y4viIdiCd7tHWDvjaw9PtHWQFO+uuQmXww6D/XvhRcsHAnA
         69qa1XxsxK9KWHJFaqCdmdzsy/PtqIcGn7xEV5FPGaeiuTu/RmM8bP8m6LWWPlaGfKL9
         LLNCLsBrPnX2XrOTELim4gZSFkHnJmrWX6moxVDuLLzEp57JJ/b2YgOcgsNjxvfCjvpc
         usAUeBgMZnHR4Ih/nmeXd9eVdnpTJ2YJDjbJOkpZzzDaGu16EmP7Zq3d8r4iUoeSenRL
         XKFAw8FjOmR5yktf8nmFOJpcsUIanff/Qr/7qJAGF4RCqAP6FhVHevHTIkR901NZAzCm
         slKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CCZJ6C3lL7Tsd77DmnX0URPJFYpmmm9N0KTiqBe8a1Y=;
        b=Dz6zO/Qy/XQbBFUOoSsr+UIuERCcIHbvhfwy38aCtbJ2nW2JcvfuAhXZ2dAR8v/6ZZ
         +SpLcmvrwPF3Qroe0CKN69IuN0v5ahHy6JPy0wYk8wub82+00gcBu0aeTujJKHxBa54m
         RGpr8oKZCMErEK2UDv18p/UMsxz0hhhNFN8bUzP30hAWjZJ0H9gNkkkQgzUMkBxrO1HQ
         iUHPyGoQKQjftK/K2IDZWlJEnZuM943j38L/y1KmQHAy12qKTVsyfN9dTMcIjL2upUss
         JLajdNpe8n7DH5/rea5edtjJ3YpKr/qV9hFlX/UKX5cS4BK9xo+a/onANUxmGAPtlvCQ
         vSEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXxpxERzgQ6YvIUPprPMaQ1bDrw61T5++NSfqUBcgU8YIvoD/+G
	3lO2HnF1M1XoI9Tig4vLjzc=
X-Google-Smtp-Source: APXvYqwUH/bMROX1qynj0Am52vQS7w29lOghDYl1rKMgSC/FbrW2y8CM2CR1HDFTXb3EfELccSHAlg==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr17316387wrq.110.1563012426828;
        Sat, 13 Jul 2019 03:07:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a745:: with SMTP id e5ls3865762wrd.5.gmail; Sat, 13 Jul
 2019 03:07:06 -0700 (PDT)
X-Received: by 2002:adf:e2c6:: with SMTP id d6mr16691325wrj.326.1563012426068;
        Sat, 13 Jul 2019 03:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563012426; cv=none;
        d=google.com; s=arc-20160816;
        b=LiTlsjuK6qhry2QrbmBMRa7GvkWMtnQe88Uk5FsdewqXTZ+8BX+hHQoX/3/CvgKgOm
         5+kWnsk9I0EAMK/qc5ANsys2YpaDpTLbrjUZ2ufgarOtAu+WnEOcc4CYd2rQE4ieEro1
         MESEgUHJX3mMJv21vE8nmY90i9PMW/L017ryIROMlfGZDdRB9524ANo9JY7/lyf2oWtL
         CVTZaE6O7CVSudEsB6I6qvOy/n55+svVX2QhCQ+rjAJpvvhxY+O6U5B9nc/5Q89npGzN
         0y0TwN9agkyO1k0TZwjXOI22Nlr06XroKAAFjzNCnCCNpyuyo9ce7HhJkJIkABzgbXAg
         rBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=iqNqQviyfv1Y/2qVQVNh/R/cojjw0TED6JlxvXPAmJ8=;
        b=anjNYHfzaHIhUruUW0F7prgdNoY+hWpaDVYNoxD2wzOt/W0KpM5AZPYd+PVSlinCFJ
         Lc/E8Y3R6c+fY9ZH3WBCS77L2ZpwDTeeYHHZ6+G/4WBjPyAdx9eqToi7LvicAVRnNWeH
         gIO0CioN5iK/xMMtApwL/g/sdZUA38yeOIMptNIW45EgQRrinFBhfZkai5q+7le6eAdo
         4mBAngyiKgE7wHzpcAZBVr5TwZopmAfkUWQYujZld3Q1PxgD93kYDBgOw1MGezW3Vr6j
         7ODjoPVDLq7jYMaxbuVeSWHClAUzV/2PHSrlgWU9vMvx2T4KKjO40rmMjaRtaWkbmaF1
         H5xg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EijkHUi6;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o4si517888wrp.4.2019.07.13.03.07.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 03:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LaTaN-1iBd8I1rep-00mLqz; Sat, 13
 Jul 2019 12:07:05 +0200
Subject: Re: [EXTERNAL] Re: Errors to compile jailhouse with ARM GCC
 8.3-2019.03 toolchain
From: Jan Kiszka <jan.kiszka@web.de>
To: Vitaly Andrianov <vitalya@ti.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
 <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
 <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
 <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
 <cceb2f75-8899-4544-7e4b-e21c8774ef4d@ti.com>
 <7c482200-ebb3-f373-1186-f36928dea965@siemens.com>
 <aa74bdfd-c7b3-f798-6ac7-6ef836017c46@ti.com>
 <c1ca3b69-9521-84d1-c37e-a83c085dd0a4@siemens.com>
 <b98a12f8-f526-15d0-ff5f-8b3e9058a9e0@ti.com>
 <0dd9d362-e37e-ddca-b687-8e529dec5cac@siemens.com>
Message-ID: <00738f6d-ff7f-3afc-89e8-c29d2883ec74@web.de>
Date: Sat, 13 Jul 2019 12:07:02 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <0dd9d362-e37e-ddca-b687-8e529dec5cac@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m/0pCFysinPfKP2wDQIzjXeuVFaPiZn/4Pvz33FG0VLmoeUwgqt
 Glyu48ginLBgGtmdCFw1aeZFC/sNtAqKvrpdKVw6QAkQ1xj/HKgweMg5yk+X33MvHnuO7ml
 RWL8XH2KrYZoUsZgSQ/rbjj7Xgg4KR8CGmk3C1vewHhQlb7gd0j6OFAumppZZkrFPheP1p2
 Bioj4ZcJCbLGq1haS10Nw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1uf+qPEJuC0=:HoTUy4GjDTnf4gOxiHoSyM
 d8q17+q8ZLINJAzApJWiOw3CJ6bfUQEYSyo07roaoViYBnsnsVWr5gzUUk+j5gi87uaiJQlig
 t1ju+15PWtGKdp96XMTmenAYdBC24tc0mDVsgAfikMjcvkbi9qRQzhGZHs17eNol12t6W4Bdz
 toIY21W1PTWPLv32v6gviDuABhmxkNZqlOS2C4xtoikd2kehayD3yj6AXAEE4WjpCtr6a+1Jb
 qLktDy1sKPEcS8EdAcyFtcxdcll/WOwc7Jz9e3gQUe7i7hZ+JIUc9QWl+grkLx/qDoeo89Z+p
 /AqT+Ktn9RB+mJzYL3gprQpDnaDkE4GX8pSsNCgdgHlNjzcpz67inlZFHNIthlqMsPZwW35Sj
 ZuU2GeodGtiQvvdP2/YiQYn80D4FwX0GNfLC1jOvYITajnWHD+Irwq+7vaOJwjyzvkzptiV76
 f04FAlZa2gI1uvSeCI0qj5WyA16uh7k8RdShNdivqhs3OgUBcWuXx6jQhgkd+dmVeXpWaU7tI
 Nz7upPVOF/viEDrjqFgJZEV3hJ/S0eCSKBPSrADA2tsWxfa9k2PesZV9EZYJL7X6wLM47JLML
 Ktclom3HwVUdJeDJkUqj7FvBIsWeGet1hj0KwLKVf7j4NtSByqyTjugLVUtc2DElZ0XdcgWKP
 F468Dnn9z8mRUUGuev1sLXrFtiKLjYOepk/WWL+nxZ+FhqEiUf0KTprzu3wbMcGcmdT4YwnMu
 FZJPL5GW7uhpKdteqP+7CR7Hy5Lk3V8cCJhrKcFM7hXYSRcNvZKXnbWX88wk8c1UjSM8Rf3OZ
 vkfuB1fZwg/E+d6EufDP1cmuW1m8qcOAGFNYGe8UPa66hfNwb4IGLEWJRNdqti3AHgz7Ll1ef
 1AyKuArztO3xPrEWNXuTW9qEpR0FPI6AL/kpYVRF3nIh0fDCGKpEE/JzF8BTJ/uFagaMwuIL1
 g4p8eD7wJPGfiv5pBj/cduye0JbvwfvHKay8gljaS7q2e3sYA47BSi+V5eImlO88zLFnpHFcV
 GIc2cghClBmOhutC/aS3P/MxZKQ/gyvJCQ4c/NbXFplTSR/hEvTHyJzS7Z5QF7TKK11DpUYr+
 +nfYt7UlzVspwDSsBNTCoyTl2C8ruOELzdj
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=EijkHUi6;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 28.06.19 17:46, Jan Kiszka wrote:
> On 28.06.19 16:37, Vitaly Andrianov wrote:
>> On 06/28/2019 10:07 AM, Jan Kiszka wrote:
>>> On 28.06.19 15:50, Vitaly Andrianov wrote:
>>>> Jan,
>>>> I was able to get almost everything working on AM572 IDK, but had to m=
ove to
>>>> a new compiler:
>>>>
>>>> arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
>>>> 8.3-2019.03 (arm-rel-8.36)) 8.3.0
>>>> Copyright (C) 2018 Free Software Foundation, Inc.
>>>> This is free software; see the source for copying conditions.=C2=A0 Th=
ere is NO
>>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PUR=
POSE.
>>>>
>>>> Now I'm getting errors:
>>>>
>>>> =C2=A0=C2=A0 CC
>>>> /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/=
setup.o
>>>> =C2=A0=C2=A0 CC
>>>> /home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/=
smccc.o
>>>> /tmp/ccm9f2Kw.s: Assembler messages:
>>>> /tmp/ccm9f2Kw.s:52: Error: selected processor does not support `smc #0=
' in
>>>> ARM mode
>>>> /tmp/ccm9f2Kw.s:82: Error: selected processor does not support `smc #0=
' in
>>>> ARM mode
>>>> /tmp/ccm9f2Kw.s:109: Error: selected processor does not support `smc #=
0' in
>>>> ARM mode
>>>> /tmp/ccm9f2Kw.s:140: Error: selected processor does not support `smc #=
0' in
>>>> ARM mode
>>>> /tmp/ccm9f2Kw.s:170: Error: selected processor does not support `smc #=
0' in
>>>> ARM mode
>>>> scripts/Makefile.build:303: recipe for target
>>>> '/home/a0794637/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common/s=
mccc.o' failed
>>>>
>>>> make[4]: ***
>>>> [/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm/../arm-common=
/smccc.o]
>>>> Error 1
>>>> scripts/Makefile.build:544: recipe for target
>>>> '/home/<username>/GIT_REPS/jailhouse/hypervisor/arch/arm' failed
>>>>
>>>> I guess the new toolchain requires to pass additional "arch_extension"
>>>> options to assembler.
>>>> If I add asm(".arch_extension sec\n"); before each asm line in the smc=
cc.c
>>>> that works, but I'm getting errors at other places missing "virt" exte=
nsion.
>>>>
>>>> I don't believe I need to edit each source file, It must be a way to a=
dd the
>>>> required options to makefiles.
>>>> Do you know how to fix that issue?
>>>>
>>>
>>> The original idea was to have that extension enabled by just including
>>> hypervisor/arch/arm/include/asm/smc.h which contains that statement. Se=
ems we
>>> lose that with this compiler version. Or we rather need it in the asm b=
locks
>>> that define smc() and smc_arg1().
>>
>> Yes adding the extension to each block helped. After that we have errors=
 for
>> each macro in the sysregs.h
>>
>
> OK, this doesn't scale. I guess we need to study how the kernel does that=
...
>

Oh, this one was forgotten to fix for 0.11. Just ran into it myself due
to Debian Buster coming with gcc-8 as well. Looks like this fixes the
issue:

diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
index 2f930cf3..a170b593 100644
--- a/hypervisor/arch/arm/Makefile
+++ b/hypervisor/arch/arm/Makefile
@@ -12,4 +12,4 @@

 LINUXINCLUDE +=3D -I$(src)/arch/arm-common/include

-KBUILD_CFLAGS +=3D -marm
+KBUILD_CFLAGS +=3D -marm -march=3Darmv7ve
diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/in=
clude/asm/smc.h
index 34944a2d..5cde3d8b 100644
--- a/hypervisor/arch/arm/include/asm/smc.h
+++ b/hypervisor/arch/arm/include/asm/smc.h
@@ -10,6 +10,7 @@
  * the COPYING file in the top-level directory.
  */

+/* for gcc < 5 */
 asm (".arch_extension sec\n");

 static inline int smc(unsigned long id)
diff --git a/hypervisor/arch/arm/include/asm/sysregs.h b/hypervisor/arch/ar=
m/include/asm/sysregs.h
index 76dd5b55..b7eaccf6 100644
--- a/hypervisor/arch/arm/include/asm/sysregs.h
+++ b/hypervisor/arch/arm/include/asm/sysregs.h
@@ -283,6 +283,7 @@
 #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)

 #ifndef __ASSEMBLY__
+/* for gcc < 5 */
 asm(".arch_extension virt\n");

 #define arm_write_sysreg_32(op1, crn, crm, op2, val) \

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/00738f6d-ff7f-3afc-89e8-c29d2883ec74%40web.de.
For more options, visit https://groups.google.com/d/optout.

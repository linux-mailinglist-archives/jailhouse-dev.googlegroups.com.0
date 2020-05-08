Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVGR232QKGQEL7E7E5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257C1CB788
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 May 2020 20:45:41 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id c20sf454552lji.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 11:45:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588963540; cv=pass;
        d=google.com; s=arc-20160816;
        b=R82PUaXhlfD+w13OZGab/noINVADN8/qm9uig5XdqjPgjogphNkibGkE4bAYNKcGUB
         9SGt6RL56ww1LpPsrMPQIvATfqRMg5Zji7j8lE7TMvndIyQ9LDGGiZcNvTL2vtaxpgP9
         GxSomdV077NYIRbjCLCzchXoOYHJYq+xZ9b10hsf/3j2DBO3riyXMUwQV4++gd8/AumH
         sJaUACKsWUx9q8hPbZfaHffvARorggqJYsqS3XDbMzNIAjnh1lelJpf1Q9TFYt9XJsNR
         hb0i62iiiQzGZpTnjnqEzl1wAprah+eMS+CxgUkmCBXk03A0d8Uq8Iif7eBsuT7BXrXD
         J06g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=UNFqF/gLi2Cnqg0G402ZSHHAyArv9wHxkfwzzsjjVss=;
        b=UsRwzrFmFDcwxBTwi25D3hUchYT2W76fboKyvf0Z/+6Mv/pHZis4w4FEPZuNMBSO24
         nagWZ1aOcdvgAWYkf6VkEyprI//0fbwiyy+owOSzhsR5H6JCfp6Bl7UfxUFiFqSjsmoN
         1B3eaDOcm4/e3OO92ZoYalm6ykN0IbOOC9VJLth8zhVgsQKNLjGvs2obI7CAMEc/CoRn
         SVtM9kYSneI4vj0pST06qCKpMBDZDKJ9kytwF+rXkf9vImjPjRUZJGvkWrjvpN6n664n
         y6ybBOdndUX16BahzX+biW2X45eJlIKBBceV2/o+Jn9nTxb666w/+3THNNOPw5D+VDqL
         wR6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Dx4dE2Ap;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UNFqF/gLi2Cnqg0G402ZSHHAyArv9wHxkfwzzsjjVss=;
        b=Mkr+XFGxRA6fAcXVgij23fKO1hcqi1jZejielLdG1O0wPtcnxQyzVCf51/mKfIb7Yn
         kD6NHlnfvrg1lif65gey0l6tzVjrMXKCqUhz4P+cD5TqUsjTtk1cvIEMm54VRO479mRs
         AQD8PEDw1gxiLy3Zfyax5E04oqlvLCXS7+aLqwUGJ3DDl0qWYuoeFKQPVLtntbbBX56Y
         suwI08dBwt9RhidroHIUlyFPJAV7yVntXtYo8wsVjBXRWIyn51daJYpzT7EujF/jyakn
         MjatPWwDqrmF/eYCdX4E5O8pEVAESDxNxoq1ATjOCYRUrrWRqC/mfNMm8w1uVQHL5Qiz
         xHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UNFqF/gLi2Cnqg0G402ZSHHAyArv9wHxkfwzzsjjVss=;
        b=lO7xsvPXOyPUt7Uk9KvNRFaFXHwWg17rgH71A9HIShqfgz6UHAwH38D5btWCNKjcgR
         wU2BgZIAKyynXk+OVg56N3caICR50SWJwA+jzdS/W4u2fDh4mh8ILe7KBvFAyW+c5Rq6
         PlPw9RtD9ii0Y86Ro13mFDuYvrk51kT+g3Xr/+hnk9DgpVau0TSSp8etYpXa0kZBifwV
         dsbH65NqWjlcjzSwMztRlRK3oBFtx1ISOl9qZziavdzY/I1u6HfhRnLCbtQ5bIKbOfkB
         p/6m2IpxrlStd+nJjrcsV7q1VlXf5MnGUMQTOewj3jj8kv52Y/plV7fHeDwjPHxcfphj
         Qg4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532DL5O8sW3okHmpJEVWjznqSELvGuoyMvPRolNDB3wt7WcNyguo
	f/d4zit1iVUiib3yCrMBwdU=
X-Google-Smtp-Source: ABdhPJwmT4cKtNL8+gsgUuHvpeRQ9okroYYz2089tezzG0PLFgGHQ7kozjYg+JrbfekFAPLPeqTTSw==
X-Received: by 2002:a2e:8949:: with SMTP id b9mr2693502ljk.108.1588963540653;
        Fri, 08 May 2020 11:45:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4566:: with SMTP id k6ls551105lfm.6.gmail; Fri, 08 May
 2020 11:45:39 -0700 (PDT)
X-Received: by 2002:a19:f70f:: with SMTP id z15mr2789850lfe.53.1588963539901;
        Fri, 08 May 2020 11:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588963539; cv=none;
        d=google.com; s=arc-20160816;
        b=VJgp8a6cJHwwdddq6M4ZaaY9nuJX5qw/bwj2hcCARMFzFrIPjdzPkoKdkbrM5GA56+
         uisKhWW9gvRN4acpDkYUusKh5Jdk+Qo3RCrQP4HbP6Sl5LSkfoy+D/sKiWqVDV6DGheb
         QqDL+0zNKsmy7olmpWyb5q2Iovs7CM0g+WLS8mdhRL08cKXwkeaocJ1KTMpdWZlQtNk9
         Zt58MGo5e0eU3nDrJ8pduTK5UqrC3YmDHX715jHpu4/Q2bYGLOdErWZgtnAsFEfiYfKS
         tyd/rj/bUtzBE08atHtZ0o+lttn5sLyUO2eY2OR1MDIHR6ZMLz3As0qEwp5onnXuU1Yq
         kzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=by85Uoyb3IBE2emNzsuSTRf9Xn6zEd3Q70NIKDmy494=;
        b=L/tTQJfbJpiC5EbKStQ7K93ZwC1pBGH5dROJfJxH3/iTcCj/hcG3lAmURxvzmj4xlx
         iR8zNWoq6z2BJuG3AmjnOX82fDwU04GndTduHvNnfvP2or0VxUo6UKLxrv4boue+qQyB
         +PWlXseeycREETzYs8fnc9YhXWfA4fMkThNKTKYgp+I+BwDNo9kdhq4esiyjU8Dl7bBO
         BXFHBplx+TUt4b2gsL+dP7e2mpqJAYMugSi1AsyQhd03eWjNIr/B9XIvCmQXv9KGA4hD
         AeEYHXdVfOsqn4cnZaqAD7tbAhgvLvcPiBvvz9P1EVVgulXcRNuMUZCXJE0y5PtAs97T
         1PNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Dx4dE2Ap;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id c16si141387ljk.5.2020.05.08.11.45.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 11:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLzn1-1joWOZ1FXF-00HvZi; Fri, 08
 May 2020 20:45:38 +0200
Subject: Re: Problem with setup on Banana Pi BPI-M1 ARM board - jailhouse
 enable bananapi.cell crash
To: Luigi De Simone <luigi.desimone3@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <e5934ccb-97ba-49f5-bf43-d47b2763f4b4@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fc9db7b7-1804-d4ef-e37d-d5d8198c8278@web.de>
Date: Fri, 8 May 2020 20:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e5934ccb-97ba-49f5-bf43-d47b2763f4b4@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V7+hUH7R8HBsNvvy2AUjreioMOLPmeDJWguWMayjrg99n8Ya2vg
 EjwGniyxT3QJLCon/Bs0aa++nX2ioALxMf0ZBe9v8ImnhFTqCSTgeUcH0US1Z4JQwzswD+f
 46auE6roD7N/F+qdEi8LuaiEoaqTpC9dx4j85DAKC6Gqk/MpNkh2yqHBWZ323HsarLsIi9O
 S8dhNQ4YMcYcxzcRoWcWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fhwv5aHfWgA=:5vfZ82dSQ47TRVMnf4XpmZ
 XirDuww1VXzWsjFhmVlctdEK6U/OBWeFNhzmuQ3AyQEpMgm3EY+XpVpd3ZDLTtl7g665bHHRV
 ifSMly20/CMluqcTtKlsr26ysgeFUqbXBVh7Nxh++nCkIMC+36JKakJmv236nkno2IRdpKoNq
 mUhewBvZFE4dbvs1XDhrZ5wV+d+11d+DbLvCUOrU9uRNeutVe+Qr/UbyZ6z15E34giB1buQjf
 +kmaasDuQIgrivh8XazDkGt7VIJJ6MRtyMhqlaUXyPhEmOuHCYuhP2OU6cxBnLmRMuaZV4Nq3
 X6snBfFdY/HkRKxlbIfylZTEdjxHo+acht2dnJeumszbCFcvTNlGBFjx9rnS1JX23XwYm8Pld
 EnsNU7aLtxBiOBiSpFjVxg9LQt/hKQPAjgOtefEQCKk9iYKNkoHypWPOrTT1gFZ+xmqD5oVAz
 pexpNo2U2bk9piBAUP4euaL9cWY7dQR7cHisCEWlIU8kVO+NpDWjpzo3vb8auQfZtkS0k84hX
 YTwUHk/8//Z5veLgcTPY8TpJKjh0CH47gZdQEcdODs9K1fJoIJ4ZSezn+WYex1BtgKYU1hpfw
 1gb4zjldIy/lVPb6BtYZXaNFyU2eGMyqgZSQmOifhefjJFCbP+SrFPsGFpUfqxZDP5gJZDQo+
 frvcgvrXiBYJkK2ea7coaaM0S/wB5+6/oXwzu3DRe8nT8dY7QZnTIqI9OoxZ/G3tI/Lxq6umZ
 jn9HiYhlG7Qiwgi70kPZaeIoHkRWmTQdTFGmYw3rvgSVGkZzp/jPl28MmUPaL5R273MqOu1dV
 rsKgGTodz/VzA1ZqpdSTr7Xj/ASMywLv0zB6zpNPIMM5XXbbPbXs/D3SK0x9pKiTuw1fz41pS
 u1zNTD55UvyYPMKNCjAM2kbrIgPJMasjxvW2qbF2lqpl+1ppk0A93B3VOL3h4K/g0Diw19Z6v
 Pbub5WXWbjvZa23PoGspa3IfNspwF3l/KZZY0hJI49oN09ZVi6PHlvqjXxX62rucokBJTBCYW
 KlGUpLbvGee7SsovM6nPDCDM9F0FQq0VcoriGpd1O6aULut/GXPb6P018CUbUGEOh36zNvzKT
 FEJeRnkA+Vg8LZAWFNz3hNdhixxo8g4Zk2ArRZ1oP7iKq3dXNn+KVaNWwv2yzORVZIorBSErC
 AOE4V0pD75o0ubvflNnSFR59AM20CVK9c/8vxMWUiX1jPDwQdk4/3h6ZtKZCiVuFJZSDNtU/l
 CgX4ZZ34UbzvAfmLE
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Dx4dE2Ap;       spf=pass
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

On 08.05.20 19:19, Luigi De Simone wrote:
> Hi all,
>
> I really need your help about finding out a solution with FreeRTOS
> BananPI demo. My board model is BPI-M1
> I've followed exactly the guide at
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-b=
anana-pi-arm-board.md
> with a kernel
> Only one deviation is about command:
>
> |
> cp -av ~/jailhouse/ci/jailhouse-config-banana-pi.h
> ~/jailhouse/include/jailhouse/config.h
> |
>
> because *jailhouse-config-banana-pi.h *does**not exist anymore in the
> repo (I don't know if it is a refuse from refactoring).
> What I've done is to create a config.h file like this:
>
> |
> #defineCONFIG_TRACE_ERROR 1
> #defineCONFIG_CRASH_CELL_ON_PANIC 1
> #defineCONFIG_TEST_DEVICE 1
> #defineCONFIG_ARM_GIC 1
> #defineCONFIG_MACH_SUN7I 1
> #defineCONFIG_SERIAL_8250_DW 1
> |
>
> according to old *jailhouse-config-banana-pi.h *file.

Most of these are nops by now, and the rest is not needed for a working
setup.

> Anyway, once booted the board and try to run command:
> |
> jailhouse enable jailhouse/configs/arm/bananapi.cell
> |
>
> The board stall, and the output is:
>
> |
> InitializingJailhousehypervisor v0.12(35-g2e4d71f6-dirty)on CPU 0
> Codelocation:0xf0000040
> Pagepool usage after early setup:mem 56/16359,remap 0/131072
> Initializingprocessors:
>  =C2=A0CPU 0...UnhandledHYP data abort exitat 0xf0005b10
> r0:0x7c01b000=C2=A0r1:0x7c00e000=C2=A0r2:0x00001fff=C2=A0r3:0x00000000
> r4:0x00001000=C2=A0r5:0xf0010090=C2=A0r6:0x7c00e000=C2=A0r7:0x00000000
> r8:0x7c0037a0=C2=A0r9:0x7c000000=C2=A0r10:0x00000000=C2=A0r11:0x7c01b000
> r12:0xc3ff7000=C2=A0r13:0xf0003ce4
> Physicaladdress:0x7c01b004HSR:0x94000007
> StoppingCPU 0(Cell:"Banana-Pi")
> |
>
> What is wrong?

I didn't test on the BananaPi M1 for a longer while (and my board is out
of reach the next days). We may have regressed with its configuration
over refactorings in the past releases. You could try by rolling
Jailhouse back to version around the time when the doc was once written,
then bisect forward to find out the breaking change.

Another option is jailhouse-images: We generate a known-to-work image
for the OrangePi Zero, which is technically not that far away from the
BananaPi. You could use that as baseline, adjusting bootloader and
kernel config, and then try with recent Jailhouse again.

Or you did into the fault above: "arm-linux-gnueabihf-objdump -dS
hypervisor/hypervisor.o" gives the disassembly of the hypervisor core
and could be matched with the faulting PC (0xf0005b10). That would be a
first hint on what fails.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fc9db7b7-1804-d4ef-e37d-d5d8198c8278%40web.de.

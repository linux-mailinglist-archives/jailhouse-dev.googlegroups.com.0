Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYXVXKUQMGQECS6QUIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DB7CC90E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 18:48:36 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 5b1f17b1804b1-40590e6bd67sf44447815e9.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 09:48:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1697561316; cv=pass;
        d=google.com; s=arc-20160816;
        b=FFxRpHj9aSlzXLrosCVzR6H5gPcH07gksVaJZ2H5JEInvfLG35A29e3MygxCd/08ik
         Py7njgrDUua3PNil56kAK0U4i0GWd3HjcD1aLAIv1vbwzjXUh/9HCZT43nThlj+0Qs3e
         A5HzVP1FZQyLaW6gLBi06vQQ4m4CoHb4XbllJAdJT0+elnldEzcLydBjqikXtgh6+hb8
         Tgoxzqu4LJMI0FEfU29EFxZ4HgCf55qzfLt8i0tG4zthLExXrSm0/ETkVXNhmD9H1Gxp
         LfngqHwBDdq838N/EmaNTXgjTg7ByXoecj8aRHC/fnADOWoE6LbRsqcPgo9am7xMiTfI
         yJMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=uQbklqeXuSZ4hKDZdEXWB6RVuB3V91iWUlMLektqt1g=;
        fh=J5alDSmlXI7Pb0oA7ehsj3Z5I2SFqOUgtz+zoYcMawU=;
        b=S5cipcct3crnv4birS6gQhs8hUt6pN50dwnF3AaLQnR4gmo2DVDh/v5GPQW00X/5at
         1Zfi1YH9txAXKSGjQCwkRXZJ3UAESiJLZW8Q7WDgIEqtzckxKG66+uaJGoUL/nCxeoUb
         kc7BlZjKNabd4XW8Zmbqqgb7/imBWLgNxQ6ejmSFO+b1dfT/PsRk8vlbgsBwIzpkUhH7
         FMtvOzmLUg4uKcAimcMrK8SL2XUHVHTQzwWqIaNqxqrKkTg/zM3v2v4ZO1584qWna0R3
         zNGLPKCt9g7faiKBWBlXds/hUk7KkB4rFxgaBjMgE9OJ4AJ/823Ttt21ecBijXuuO+5G
         oplQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=hTmYYzi1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697561316; x=1698166116; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQbklqeXuSZ4hKDZdEXWB6RVuB3V91iWUlMLektqt1g=;
        b=qby9mLAcgnj2H8K+yl6fq4uJuU3D/kNTDFK9al0RQ84dPc1Ht5McgTjWiBg2+SlzJ8
         9SzDc0SjlhVvR4k7HZcZGL/6m24IpYOe77eheAke178TaIP62n0bnkDKewvQWQj8Ms/U
         0+IZP+9mUa1DPH6Xd1VG7OXarv1Bbyu+HMxkaa76qyrYn+egmTPF2QBmFl8sktTws+Wa
         14arQJu3Rt2qO8+KW1cxCslVOwx9UeM0/lCjExYPUGWDuWSoV+HcpEhh5IE0j+BFFk6D
         rSZqkZNEvco+ORcJ59s8dP9J/CZteDGC32B9fnC56rNAeG4gtWZnEdN3r/fJKXUu/Urn
         yqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697561316; x=1698166116;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQbklqeXuSZ4hKDZdEXWB6RVuB3V91iWUlMLektqt1g=;
        b=ZuqgVptbgU2DTBOszwAjHU7RsEcoM78Eg1EmY1YA+De0AdIIJFObyW6pOzLSWszH5u
         KaWFSE5VV5fLW9wtWLRatqKSX8G68fMdJ5mckFNXqW/3YBPv4dAoSFx60oQKox/MK3Z+
         21f/P3u+WjckkTCCnkTkcSv8Xwm2kUF8AK65zHe25QW41SpEpPGnNEUuSxnhLsfISTlP
         n87sZIvv+0tMN1GfgQy25yNyGInj70WENsfkJ4eBZvAYpZHY4fm+LMjPjirCK/vFHTbG
         Qf7Fj0qxwYRJAztv2khJ0Sg/iVtuli4/dBWJS5hW0YX+FuYtv9lYSofZ02gFGYO2Q3hg
         /7ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxMqz0Ofoqe+iRY2Iwb88TfG6un3cFG8PqqQqx+iWiV8oUTrQrI
	ATvs+LV9avCs/H77GgWJ6Zc=
X-Google-Smtp-Source: AGHT+IFri98e7HbyMhTzOa3w/FirfVHt5sQnDfZH7pDvOc8sID9qV51sUT6WI0rwkV0JqaCiUvdx/w==
X-Received: by 2002:a05:600c:209:b0:405:1c19:476d with SMTP id 9-20020a05600c020900b004051c19476dmr2174980wmi.39.1697561314718;
        Tue, 17 Oct 2023 09:48:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b19:b0:407:7e47:8258 with SMTP id
 m25-20020a05600c3b1900b004077e478258ls41905wms.2.-pod-prod-03-eu; Tue, 17 Oct
 2023 09:48:32 -0700 (PDT)
X-Received: by 2002:a5d:4b84:0:b0:32d:9a87:b7a with SMTP id b4-20020a5d4b84000000b0032d9a870b7amr2384865wrt.50.1697561312095;
        Tue, 17 Oct 2023 09:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697561312; cv=none;
        d=google.com; s=arc-20160816;
        b=XcSE8IhbAPoRfmOmtntatnh0mS9K1Ye1ejvLL2K/C3g0qrJ2UYravBBXHfs1xfYI6O
         +DsJ2pfR9gmgUGLhTZkV6cDS3tVkPmY26iNTArFWcxaxy+C/Yiw0ALVcf3/+uNobkFig
         VGyvXhgc9hN9hqZNVn5tXUg1FGA7BKXHK+tqYmpxZ34R45R8BE69ZqVzxxC+BzMzXtQC
         MQFje6FQB2EkrDQxEfIaa1U9xrKYeRzWFlBqQI7aIcZ8ybofl6S2EMn3lT4mRsAOfi5+
         z3plbh6+GvgXr7CABeFiu4Krc+HRGlPnvCsQ+9M7B7/ZZ2z3OXWGkHGqIHqtFJY4fgxX
         NMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=h/a8meiCqSEbvWBXRUs7gxEtn1cndMHN5JTThbtqr8w=;
        fh=J5alDSmlXI7Pb0oA7ehsj3Z5I2SFqOUgtz+zoYcMawU=;
        b=tX9xWEoXuNo22/l/d0up0lwCqe/5T7svPM/tgWkXO6gIs0zU6ISvvmj4TCB6uBEKFg
         OLkzG3U6jm4r12tgXkJeJCnBIRInvPvXQmI2q2+jzpdk4W05dJaolWwouD3i102MwAbQ
         tZgARx1aoyvTG+y9MzQNn4PmLRKjcshc0muumfh3TvTKfveRbeg2amh3hXW2QUMct46T
         CRikZx0QyqDi3msdsHFzsbXa89KR4M5rWdzGmTjp7r8fXBjADa7LasxjxoSU0tVVDU2z
         jOf4qOSJXFTW4DvShACx7nUeKWKrIi+vqgI0pvzQgxzZbY+4wE7UwUikj3SGn1Hs6L0F
         nesg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=hTmYYzi1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id o15-20020a5d4a8f000000b003263a6f9a2csi5619wrq.8.2023.10.17.09.48.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 09:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 020B42E0128;
	Tue, 17 Oct 2023 18:48:30 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4S90Kp49SRzxsK;
	Tue, 17 Oct 2023 18:48:30 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 17 Oct
 2023 18:48:30 +0200
Content-Type: multipart/mixed;
	boundary="------------tebzTJjQ3R9VNHU5gegLyQCS"
Message-ID: <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
Date: Tue, 17 Oct 2023 18:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can't install jailhouse on linux-6.1 arm system
To: Dave Marples <dave@marples.net>, <jailhouse-dev@googlegroups.com>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=hTmYYzi1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

--------------tebzTJjQ3R9VNHU5gegLyQCS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 17/10/2023 15:04, Dave Marples wrote:
> On 17/10/2023 09:48, Dave Marples wrote:
>> I'm building jailhouse on a arm64 linux 6.1 Debian bookworm system=20
>> (imx8m, if it matters) using gcc 12.2.0...or, more specfically,=20
>> failing to build. I get to the module install stage and then get;
>>
>>
>> ERROR: modpost: "__hyp_stub_vectors"=20
>> [/root/jailhouse/driver/jailhouse.ko] undefined!
>> ERROR: modpost: "ioremap_page_range"=20
>> [/root/jailhouse/driver/jailhouse.ko] undefined!
>> ERROR: modpost: "__get_vm_area_caller"=20
>> [/root/jailhouse/driver/jailhouse.ko] undefined!
>> make[2]: *** [scripts/Makefile.modpost:126:=20
>> /root/jailhouse/Module.symvers] Error 1
>> make[1]: *** [Makefile:1989: modpost] Error 2
>> make: *** [Makefile:40: modules] Error 2
>>
>>
>> So far as I can tell I have all of the required KALLSYMS set, so=20
>> wondered if anyone else had trouble with recent kernels or if I'm=20
>> missing some magic somewhere?
>=20
> Just to start the follow-up on this in case it's useful to anyone else=20
> in future; I figured out that I'd missed the stage of patching the=20
> kernel ( It might make sense to add a prod for this in the 'Build &=20
> Installation' instructions ... ) using the patch embedded in=20
> gen-kernel-build.sh and adjusting to suit my kernel..is there somewhere=
=20
> else I'm supposed to get that patch from in a cleaner way?
>=20
> I'm now at the point where the thing will start, but pretty quickly=20
> falls over in a big heap;
>=20
> # jailhouse enable imx8mm.cell
> [=C2=A0=C2=A0 62.953888]=C2=A0 jailhouse: firmware: direct-loading firmwa=
re jailhouse.bin
> [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-executa=
ble=20
> memory at virtual address ffff80000a004000
> [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-executa=
ble=20
> memory at virtual address ffff80000a004000
> [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-executa=
ble=20
> memory at virtual address ffff80000a004000
> [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-executa=
ble=20
> memory at virtual address ffff80000a004000
> [=C2=A0=C2=A0 62.961248] Mem abort info:
> [=C2=A0=C2=A0 62.961248] Mem abort info:
> [=C2=A0=C2=A0 62.961248] Mem abort info:
> [=C2=A0=C2=A0 62.961249]=C2=A0=C2=A0 ESR =3D 0x000000008600000e
> [=C2=A0=C2=A0 62.961250]=C2=A0=C2=A0 ESR =3D 0x000000008600000e
>=20
> Help still appreciated...Can't help getting the feeling I'm missing a=20
> document somewhere whereby all this lot magically becomes easy...

Did you also apply the patch that I attached? I'm pretty sure that it's=20
missing.

Thanks,

   Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/36d21a58-fb8b-47f3-977f-ab179f0ea8b6%40oth-regensburg.de.

--------------tebzTJjQ3R9VNHU5gegLyQCS
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-Revert-mm-don-t-allow-executable-ioremap-mappings.patch"
Content-Disposition: attachment;
	filename="0001-Revert-mm-don-t-allow-executable-ioremap-mappings.patch"
Content-Transfer-Encoding: base64

RnJvbSA1NGNlOGJkMGI1Y2MyYjkxNTAwMjVlMDZhYjUwZWU4M2JmY2I2MmU0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMu
Y29tPgpEYXRlOiBTYXQsIDIgT2N0IDIwMjEgMTE6MjQ6MTYgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBSZXZlcnQgIm1tOiBkb24ndCBhbGxvdyBleGVjdXRhYmxlIGlvcmVtYXAgbWFwcGlu
Z3MiCgpUaGlzIHJldmVydHMgY29tbWl0IDg0OTE1MDJmNzg3YzRhOTAyYmQ0ZjIyM2I1Nzhl
ZjQ3ZDM0OTAyNjQuCgpKYWlsaG91c2UgbmVlZHMgZXhlY3V0YWJsZSBpb3JlbWFwcGVkIFJB
TSB0byBzdGFydCB0aGUgaHlwZXJ2aXNvci4KClNpZ25lZC1vZmYtYnk6IEphbiBLaXN6a2Eg
PGphbi5raXN6a2FAc2llbWVucy5jb20+Ci0tLQogbW0vdm1hbGxvYy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvbW0vdm1hbGxvYy5jIGIvbW0vdm1hbGxvYy5jCmluZGV4IDUyZjUwZmU3ZGI4My4uN2Zi
ZmFkNTcxOTY4IDEwMDY0NAotLS0gYS9tbS92bWFsbG9jLmMKKysrIGIvbW0vdm1hbGxvYy5j
CkBAIC0zMTYsNyArMzE2LDcgQEAgaW50IGlvcmVtYXBfcGFnZV9yYW5nZSh1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAogewogCWludCBlcnI7CiAKLQllcnIgPSB2
bWFwX3JhbmdlX25vZmx1c2goYWRkciwgZW5kLCBwaHlzX2FkZHIsIHBncHJvdF9ueChwcm90
KSwKKwllcnIgPSB2bWFwX3JhbmdlX25vZmx1c2goYWRkciwgZW5kLCBwaHlzX2FkZHIsIHBy
b3QsCiAJCQkJIGlvcmVtYXBfbWF4X3BhZ2Vfc2hpZnQpOwogCWZsdXNoX2NhY2hlX3ZtYXAo
YWRkciwgZW5kKTsKIAlyZXR1cm4gZXJyOwotLSAKMi40Mi4wCgo=

--------------tebzTJjQ3R9VNHU5gegLyQCS--

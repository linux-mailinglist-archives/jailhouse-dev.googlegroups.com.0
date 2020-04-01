Return-Path: <jailhouse-dev+bncBAABBXF2SH2AKGQEHOH6PLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC319A88B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 11:22:37 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id y17sf9885850lfh.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 02:22:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585732956; cv=pass;
        d=google.com; s=arc-20160816;
        b=WiqD+cyTGZsgziOgt7pB2laV/EAvbhevoJFryN7/RuFcI831xKYmCQndXty4fWr+f5
         qNHrDAkhORp4jXtNrouDJZxiqX/JR0TN7V1WSkP63xkwHkxO1FHMd4iEGENpE71R8CTz
         PQKUrZmiltD4CZLWUaZMZN8hBvDxNdg2HBdSDrt26xWz5MGyF6YeT3oVouetmerFlLzw
         tKzzNmrpIOkrqy8X+hHeo3hEyvfJaGPMn2MQPYPpn+96TpVux8Z4EA0ZgB3a8cwz3atU
         N1cXl6JeAX4E2DqJsn7gEcW/a0FJInAMSVZ8PLJr7myTE8ebM9Yjffn+X1lNK4y3fPhA
         9IsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:ironport-sdr:sender:dkim-signature;
        bh=OqW/yKmmtv56v51Y3T2VBLHEhd+Q5jeHqDt++AZQ9xY=;
        b=yiw+AuxnjLWRe8EWXp0ErqUu/rmYylb6g/xsByTK37xcmZrMqLQfPdXj6+ORMl35vz
         c6G34qwAA9llWaUQYKF0vAC7Mpjxi2TmJTAZGSRznE3zgkxIvDUTSbnrws5Enrip7omR
         icjH0acFpdRDt0CrRpw8GFii4O6o6SlNHaTVpKVdwoyRvMP0rxk2KZKkqC+6r6mgpFkO
         7vaxsKNZCmZovGdWQUyJPw+lKxLji+lJHA6mMrsaVUKoH2omTEbSCUgHhxFEHi+LmghK
         C8vqNyhu7n88SsfnY+K7EYIYU0YRO1P43QT4VQjwOmVolRRPdfCLzKOj7H55WVi4bI08
         vUlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=MwcNtGRv;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.175 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OqW/yKmmtv56v51Y3T2VBLHEhd+Q5jeHqDt++AZQ9xY=;
        b=cw95xSVPfxbY1mcLQ32ClcGySWmHHKHxk8kIDVKJDh4jLOVW5aR5bdwFt+lX7G32aC
         /sP7k4IaUdPHR0gUH8Jm/FkEX8wRjEhFyWCVzFWnkQUrU8NxY79rpUT/Bf6gfcsXYa5S
         Ua27NJzAKRbXsHNtJ7mnCPMGxhOmVfLsMIqMKNmnWBq8xnP4B+J1HERwY9DNSraNVicl
         OZT4T1VYF3m5C+09Gkod0+Z4TxVmOdmrkE6zKv5m83Rf3vV2igt8JUpKPU/DRHw4UOJS
         ycRyLwxXRX9vcZykdV3hdNu8zZnSZ5i2kzxgp8gKNCMEbOjnCiTzG4X9sd+liT0zLpBo
         QJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:subject:to:cc:references
         :from:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OqW/yKmmtv56v51Y3T2VBLHEhd+Q5jeHqDt++AZQ9xY=;
        b=mr4odx7vBYybU6wtR+9JB62kMAoaC8SiefQfAkjNtpn2sb3of+GdzOIqQQbVZq/v0z
         +4lidKTCRHVAehIhBG94FHlzO9QbRGPIgs1A3+VCSIo8l5yKi1B7hk83xKsk3izaA+sX
         26WH1OLIwN7zbp1wGrf7bLu/qiitVG+IlisFsTQ+0uKXeakt1e+5+z/Z2z7O3jIh2/SF
         qUNyUVrS7pZYPBmd3OreuibBSlSi726CKu25lDcdBnr63celP0YrWdlnZnFTFEJJifhh
         cR3l40rC0PMwMENICti25Qxbxs3r+qXVtd0O1DitDdnfSyPwyNqWj4ggI1zt+Y8rq+MT
         ERBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZZSEuKCh43uhhIxDHGJKbW/FU//hPgeFIyCGcYtS86XzoKG5Bn
	g7qeoA/ZNjsCnjsDcgmTMjs=
X-Google-Smtp-Source: APiQypI/iN3suzeDPCao+nnNOjd8QDo6tcJ/zBW39ogJy7ZsWDAUn9Jwd7x4gGf2bVJkJ2z12RUv0g==
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr10905597ljk.14.1585732956636;
        Wed, 01 Apr 2020 02:22:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:455c:: with SMTP id j28ls4162999lfm.10.gmail; Wed, 01
 Apr 2020 02:22:36 -0700 (PDT)
X-Received: by 2002:a19:c507:: with SMTP id w7mr13062779lfe.131.1585732955926;
        Wed, 01 Apr 2020 02:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585732955; cv=none;
        d=google.com; s=arc-20160816;
        b=gB2EhTsFSxGeuOz2NC7P/9gebqwT9VJv7/dGZwUREBSjFzAL+KXdie90S60KHLnGNV
         6wxuMtsl50poRvyH1c+qEgBbQMXfdhhFT0eVcGrB/xKjrqdIbkI0WG8U+mAWQ2MBnbzk
         HtLXQ2Mdf8ZDISquIarha8CNmOWBT9HwK91YzVOOe+Sn0Znm42T2mRqHihe6sx6qIEws
         Qo2fyrLWqn4V8tHYr6Yv0FaCb+Ff7B/DJcxQqBcjTDHYGqUlxiCcW7mfWfelVqwVR8yp
         WNVCfQtmMt32GqmQP16O28+tuRIMQIAQnMIuov7h6tCUmfQKaVbdxDheWYcZZZnNnkRl
         jwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :ironport-sdr:dkim-signature;
        bh=OCsK1Qo2cwMqNVc/3QFkgNDpVjaoNMvu98iuzONhsN4=;
        b=dPNVhwh7AS0YTNw3hHNqiXR21KYqM/sKOFwYy4woUfWFxY5ks4kRXATmH02JRA2Nwh
         dGXqN1b4MwDiObFjunvC5GMnNntxaVecrbdjGkRYqLDkQxlCvdkubz5wgF+7bbDFqo/O
         duA7QNPR9OxpAWQjWotOBEO+hFZLdMl6U988WzT2F9DaQmgEwSHQI4RbRS007d2YLsqQ
         Bdmfuug8H/nyNEdbU4Ql1ciUKab5/nus1K0UdWbPX3KZ2EGb1cRO8Hg/Jrovb1ZvFINh
         wKqllu2xTCus33uFIWMKa3m4laSa2ifQqdvOfyyBwxcom56RRsavl7vin9uxvxqXJPmi
         h+0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=MwcNtGRv;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.175 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com. [216.71.155.175])
        by gmr-mx.google.com with ESMTPS id h8si96832lfm.5.2020.04.01.02.22.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2020 02:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.175 as permitted sender) client-ip=216.71.155.175;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: 47JPB1ufd71MwYKC3AM8prCu8I1IjLXO5EQQCaMwtAITzLQJv0Wp0LBs3UbGfA8rS2xuKjsHeh
 eXAsBLMZSjrMOyof7KevSjCBWzHUn8PuRIpFsWlwglJuG/kdNNOearKX7lmw+ViPQ25XY+r6ZI
 3sV9x0c02Bwz1FRcOX6hvJXrxwWtKpdyobJAUuUKwnsbRDbWnzLGqVr1fZqzvG/68XIPpF8Jdh
 cfkxHwHIRagklFTWCtVW+9d5WWlPdLtCl6gOAKh6doAXExBHXLFsQXF5GLa/pgA9iRtXTFDl3n
 qrE=
X-SBRS: 2.7
X-MesageID: 15394601
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,331,1580792400"; 
   d="scan'208";a="15394601"
Subject: Re: [PATCH v2] x86/smpboot: Remove 486-isms from the modern AP boot
 path
To: Brian Gerst <brgerst@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter
 Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, David Howells
	<dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh Boyer
	<jwboyer@redhat.com>, Steve Wahl <steve.wahl@hpe.com>, Mike Travis
	<mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Kees Cook
	<keescook@chromium.org>, Martin Molnar <martin.molnar.programming@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>, <jailhouse-dev@googlegroups.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <20200331175810.30204-1-andrew.cooper3@citrix.com>
 <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
 <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com>
 <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52@citrix.com>
Date: Wed, 1 Apr 2020 10:22:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b=MwcNtGRv;       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.155.175 as
 permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=citrix.com
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

On 31/03/2020 23:53, Brian Gerst wrote:
> On Tue, Mar 31, 2020 at 6:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 31/03/2020 23:23, Brian Gerst wrote:
>>> On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> Linux has an implementation of the Universal Start-up Algorithm (MP spec,
>>>> Appendix B.4, Application Processor Startup), which includes unconditionally
>>>> writing to the Bios Data Area and CMOS registers.
>>>>
>>>> The warm reset vector is only necessary in the non-integrated Local APIC case.
>>>> UV and Jailhouse already have an opt-out for this behaviour, but blindly using
>>>> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.
>>>>
>>>> We could make this conditional on the integrated-ness of the Local APIC, but
>>>> 486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
>>>> list and header files as appropriate.
>>>>
>>>> CC: Thomas Gleixner <tglx@linutronix.de>
>>>> CC: Ingo Molnar <mingo@redhat.com>
>>>> CC: Borislav Petkov <bp@alien8.de>
>>>> CC: "H. Peter Anvin" <hpa@zytor.com>
>>>> CC: x86@kernel.org
>>>> CC: Jan Kiszka <jan.kiszka@siemens.com>
>>>> CC: James Morris <jmorris@namei.org>
>>>> CC: David Howells <dhowells@redhat.com>
>>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> CC: Matthew Garrett <mjg59@google.com>
>>>> CC: Josh Boyer <jwboyer@redhat.com>
>>>> CC: Steve Wahl <steve.wahl@hpe.com>
>>>> CC: Mike Travis <mike.travis@hpe.com>
>>>> CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
>>>> CC: Arnd Bergmann <arnd@arndb.de>
>>>> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
>>>> CC: Giovanni Gherdovich <ggherdovich@suse.cz>
>>>> CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>>>> CC: Len Brown <len.brown@intel.com>
>>>> CC: Kees Cook <keescook@chromium.org>
>>>> CC: Martin Molnar <martin.molnar.programming@gmail.com>
>>>> CC: Pingfan Liu <kernelfans@gmail.com>
>>>> CC: linux-kernel@vger.kernel.org
>>>> CC: jailhouse-dev@googlegroups.com
>>>> Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> v2:
>>>>  * Drop logic entirely, rather than retaining support in 32bit builds.
>>>> ---
>>>>  arch/x86/include/asm/apic.h        |  6 -----
>>>>  arch/x86/include/asm/x86_init.h    |  1 -
>>>>  arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
>>>>  arch/x86/kernel/jailhouse.c        |  1 -
>>>>  arch/x86/kernel/platform-quirks.c  |  1 -
>>>>  arch/x86/kernel/smpboot.c          | 50 --------------------------------------
>>>>  6 files changed, 60 deletions(-)
>>>>
>>>> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
>>>> index 19e94af9cc5d..5c33f9374b28 100644
>>>> --- a/arch/x86/include/asm/apic.h
>>>> +++ b/arch/x86/include/asm/apic.h
>>>> @@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned long x)
>>>>                 return (x >> 24) & 0x0F;
>>>>  }
>>>>
>>>> -/*
>>>> - * Warm reset vector position:
>>>> - */
>>>> -#define TRAMPOLINE_PHYS_LOW            0x467
>>>> -#define TRAMPOLINE_PHYS_HIGH           0x469
>>>> -
>>>>  extern void generic_bigsmp_probe(void);
>>>>
>>>>  #ifdef CONFIG_X86_LOCAL_APIC
>>>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
>>>> index 96d9cd208610..006a5d7fd7eb 100644
>>>> --- a/arch/x86/include/asm/x86_init.h
>>>> +++ b/arch/x86/include/asm/x86_init.h
>>>> @@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
>>>>  struct x86_legacy_features {
>>>>         enum x86_legacy_i8042_state i8042;
>>>>         int rtc;
>>>> -       int warm_reset;
>>>>         int no_vga;
>>>>         int reserve_bios_regions;
>>>>         struct x86_legacy_devices devices;
>>>> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
>>>> index ad53b2abc859..5afcfd193592 100644
>>>> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
>>>> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
>>>> @@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
>>>>         } else if (!strcmp(oem_table_id, "UVH")) {
>>>>                 /* Only UV1 systems: */
>>>>                 uv_system_type = UV_NON_UNIQUE_APIC;
>>>> -               x86_platform.legacy.warm_reset = 0;
>>>>                 __this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
>>>>                 uv_set_apicid_hibit();
>>>>                 uv_apic = 1;
>>>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>>>> index 6eb8b50ea07e..d628fe92d6af 100644
>>>> --- a/arch/x86/kernel/jailhouse.c
>>>> +++ b/arch/x86/kernel/jailhouse.c
>>>> @@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
>>>>         x86_platform.calibrate_tsc      = jailhouse_get_tsc;
>>>>         x86_platform.get_wallclock      = jailhouse_get_wallclock;
>>>>         x86_platform.legacy.rtc         = 0;
>>>> -       x86_platform.legacy.warm_reset  = 0;
>>>>         x86_platform.legacy.i8042       = X86_LEGACY_I8042_PLATFORM_ABSENT;
>>>>
>>>>         legacy_pic                      = &null_legacy_pic;
>>>> diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
>>>> index b348a672f71d..d922c5e0c678 100644
>>>> --- a/arch/x86/kernel/platform-quirks.c
>>>> +++ b/arch/x86/kernel/platform-quirks.c
>>>> @@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
>>>>  {
>>>>         x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
>>>>         x86_platform.legacy.rtc = 1;
>>>> -       x86_platform.legacy.warm_reset = 1;
>>>>         x86_platform.legacy.reserve_bios_regions = 0;
>>>>         x86_platform.legacy.devices.pnpbios = 1;
>>>>
>>>> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
>>>> index fe3ab9632f3b..a9f5b511d0b4 100644
>>>> --- a/arch/x86/kernel/smpboot.c
>>>> +++ b/arch/x86/kernel/smpboot.c
>>>> @@ -72,7 +72,6 @@
>>>>  #include <asm/fpu/internal.h>
>>>>  #include <asm/setup.h>
>>>>  #include <asm/uv/uv.h>
>>>> -#include <linux/mc146818rtc.h>
>>>>  #include <asm/i8259.h>
>>>>  #include <asm/misc.h>
>>>>  #include <asm/qspinlock.h>
>>>> @@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
>>>>         return retval;
>>>>  }
>>>>
>>>> -static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
>>>> -{
>>>> -       unsigned long flags;
>>>> -
>>>> -       spin_lock_irqsave(&rtc_lock, flags);
>>>> -       CMOS_WRITE(0xa, 0xf);
>>>> -       spin_unlock_irqrestore(&rtc_lock, flags);
>>>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH)) =
>>>> -                                                       start_eip >> 4;
>>>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
>>>> -                                                       start_eip & 0xf;
>>>> -}
>>>> -
>>>> -static inline void smpboot_restore_warm_reset_vector(void)
>>>> -{
>>>> -       unsigned long flags;
>>>> -
>>>> -       /*
>>>> -        * Paranoid:  Set warm reset code and vector here back
>>>> -        * to default values.
>>>> -        */
>>>> -       spin_lock_irqsave(&rtc_lock, flags);
>>>> -       CMOS_WRITE(0, 0xf);
>>>> -       spin_unlock_irqrestore(&rtc_lock, flags);
>>>> -
>>>> -       *((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) = 0;
>>>> -}
>>>> -
>>>>  static void init_freq_invariance(void);
>>>>
>>>>  /*
>>>> @@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
>>>>          * the targeted processor.
>>>>          */
>>>>
>>>> -       if (x86_platform.legacy.warm_reset) {
>>>> -
>>>> -               pr_debug("Setting warm reset code and vector.\n");
>>>> -
>>>> -               smpboot_setup_warm_reset_vector(start_ip);
>>>> -               /*
>>>> -                * Be paranoid about clearing APIC errors.
>>>> -               */
>>>> -               if (APIC_INTEGRATED(boot_cpu_apic_version)) {
>>>> -                       apic_write(APIC_ESR, 0);
>>>> -                       apic_read(APIC_ESR);
>>>> -               }
>>>> -       }
>>>> -
>>>>         /*
>>>>          * AP might wait on cpu_callout_mask in cpu_init() with
>>>>          * cpu_initialized_mask set if previous attempt to online
>>>> @@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
>>>>                 }
>>>>         }
>>>>
>>>> -       if (x86_platform.legacy.warm_reset) {
>>>> -               /*
>>>> -                * Cleanup possible dangling ends...
>>>> -                */
>>>> -               smpboot_restore_warm_reset_vector();
>>>> -       }
>>>> -
>>>>         return boot_error;
>>>>  }
>>> You removed x86_platform.legacy.warm_reset in the original patch, but
>>> that is missing in V2.
>> Second hunk?  Or are you referring to something different?
> Removing the warm_reset field from struct x86_legacy_features.

Ok, but that is still present as the 2nd hunk of the patch.

~Andrew

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52%40citrix.com.

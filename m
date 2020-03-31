Return-Path: <jailhouse-dev+bncBC25XUMBOQIPZE4P6QCRUBFICXJIK@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58619A21B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 00:53:49 +0200 (CEST)
Received: by mail-io1-xd3c.google.com with SMTP id n15sf20475563iog.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 15:53:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585695228; cv=pass;
        d=google.com; s=arc-20160816;
        b=P7hctImbtb8fbZKTryn0e0+sNWSw66qJQJrdnCKYWIUjCcBqI5PuvmpamlgGZfnxGS
         LiGFt34Ln027LlNXE98zKPD3vRi5xsR0ETY4eKiG8vZMMufD72fPc3rCMrzFlMtqzjxR
         rvTdLpmhnNvs7tBpoCgLjt+t6GFUC+Ek6TOcEdjd+ziwIyfpmJqpXTQThO08QaWx1eKn
         8/ca/qTgBmzxbsPInTv1ig05cg4RA8F78T+CQfRr8vCjJsQ+GDqvueAOkoq+HZNtr0VH
         KmSnn1jUGEdG96XoXU3crebaTEUE66IXuuX06GGKwJlZcNkcyRGEC0TI3x2xybbCX1Z4
         +oSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=5ALtpg6mcPy0iWnsQTBpGJFcTWduP7nTwznhRJqq+A0=;
        b=iEQ21huigg2vSRs6KrdBDvcv+1nRHgIKlg2l0oCdSzxS1XVBkh0Z/PvhCRu+KRzzBq
         dx54utPty5Nnuyo8UxJauDGCi8nDp131Hh4WquiwXcEfVx+6fkC2GIt0MLVXDGdF6UOe
         g6Bq07m7i0b424wo6lhtYc16GFPpoAjvdsoWHqD8yU2KU4lZ5XsT4S2V8iidkfvvYIdZ
         TKVRcUqhYxPZn/LmEmKT44OHHWVyyJn0isTLzZZ7hxC/h61hr8oA4HBpwM5hIPPbTB6t
         F0uzs95jmW6tlhAbIdRrBpRc7wu19CeC7yXgSlAT+Sj0ZEDoZK0VB7/N07kq5IpZc88L
         SWBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="YXnf/E0m";
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::141 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ALtpg6mcPy0iWnsQTBpGJFcTWduP7nTwznhRJqq+A0=;
        b=VSTxG3R0DybDdP6/mb152W/c/0+6kwUuz7PRgt85/Wy6waBGJCSxO4OYueHrhRKzu1
         +3AjkQHPOIDFCpm9t4Puwv2okOC8yRn6A63uHl3VPeuaSSETOoT7At5+tf9/9jCqEv4k
         6+DRBGGamBanT8iMwbLa+YNBY8T7ut0zB7bWBYSVhzAQCoUdjh3uwZLd4PbseLdLt61G
         Tc8jVDIRFqmyB4Ojil44F8TfoMday/Jnj+fykulqPBDSUGHYiCfDl58bXjv59O3rJ0ki
         mz7IqTzlz9aMry4/P1n/8Hb+yVllVEIuSO3tQZKORdYqs6Q4vqNljLvl1DN6a8PXDfdJ
         zugg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ALtpg6mcPy0iWnsQTBpGJFcTWduP7nTwznhRJqq+A0=;
        b=YQdAI7Y8Lr7z9B5VVpOoYTcBsnbp796yhxok52NKGQ6Z9KowKFQZTyOfuOKEJbckU8
         oD84cKDimXVUI7/tubGHRhXL9ZHGk2Se81mp4PKtbNaJ6HgL/GahGCB3vn6uAEvYnZ5l
         FtrUhnNowfs+5QG+9SrqlnOT/6ZMLfLpy++6Cu79/AEatro3OHawZPRXwllyOtZYUgqE
         EeJE28ttRQ1/vMJ0nhE9I8Zhay7KAsVrG0wOvGBgWUHcwavwvrZjV/trj+q0Co3qkMiM
         5NUcRCcTFmMQrokmmArvqLY+i7EXpknX3xhzDGbctT9H2QXIVGmAZOyi+8r+EBmVuT27
         CpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ALtpg6mcPy0iWnsQTBpGJFcTWduP7nTwznhRJqq+A0=;
        b=TBiyJJkC9U62nwekgLI2k1e7iEECNIFpJuthHSBBcTFdDxMnKLR4o6WzF4WyNlcKyb
         5YF8X9+PQhvhvP/Ybjr1E8NflocmZSzH/GGCj6+BY6IVXBCo0fILmzrN+pyqZKGol0fo
         gbiPeesg0I+18hggGrPV9Qqlwh9fp45nlnPdnb5ntnLsrgq55QygM6aKfovyTz3jgaeF
         jzAYzuH6LWZzg/HgM/8SUdsO9p1mZ0JK5AnYv7NASxIsUZwpKQAthUmsZddQyd13grDy
         NeSAbD1PIm31OnR/eeaUD5uyLz+vGVBA1HShgTj6cK6ORyLR5J6I1Y674mQgnbX7uU2/
         zWlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0NuIO0wQ0nauC9sWSQCfAB6KrzarNVWh1E0/417icptWt7BIIb
	EyAVAzYVpG4MwFMr6EDxwJQ=
X-Google-Smtp-Source: ADFU+vsvYrkd6hsBXdPCBRQwmVQCYeQrQ28Y2+8YAEXcU6bwxtKzGKsqpxFIMNU4PFnSIFKL6QZtFA==
X-Received: by 2002:a05:6602:2242:: with SMTP id o2mr17607816ioo.22.1585695228445;
        Tue, 31 Mar 2020 15:53:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:778d:: with SMTP id s135ls7047338ilc.2.gmail; Tue, 31
 Mar 2020 15:53:47 -0700 (PDT)
X-Received: by 2002:a92:8bc2:: with SMTP id i185mr19156556ild.273.1585695227751;
        Tue, 31 Mar 2020 15:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585695227; cv=none;
        d=google.com; s=arc-20160816;
        b=jldTPZHR0xolAVnhAOSvko9Nhlp3IyIZFXCRqSpobaWoQKx0AsyNcSue8MaTslWUvb
         H/5UE4fr8Op0zgWfliVkZLS3mge2u1nvA5pOJDvveOUI+MIe0XDG6d2jFozvP9VxPPi0
         ShjKlLmSt68BfNUQynozz6UDCyFNAATNtwNLzWRErOvilCB/Oaduc74D7ikIw697z9F7
         lZQ0faiwpkIkRrFViWpCxUo3kkDnxQUtTo+IVSvNZhUZiqvnOeBTHPuvrFcUfLBkCyu8
         UWRr7ND1AMurO89vuQv4NwGCLkKstwtErqzqB4cfOvVjv36mPMgfyASAoLJqxn58z9YU
         zAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4lSIs5KmUeHoPf+dlU13Wy8fQHxGHPUiAuWPTtGMo4=;
        b=O4FkfzJqfoebm2qfL8nNKztkvo0v4tFmH8NIZNDyV3yomAvZYSVgbfvBALHccQ6gqZ
         3I6kScz/14fZ7K/6fOQl5Sn99mu6PgJTuc+Os5zacGM/GjpGRxRgnlZfo1IcQr1PiCMi
         fybkP0UvfBAOqoIiPTZ5uDbit+cpsrSQ8H3sh+dwlgbopETSopuTTMYv2XSIh3/Ce7/E
         jMP+SvRdygwbNL/Xy5p9rjHlrIAe/wpYrxG7QWOH9PmUvwDnASljTlfUCiQcXOskrPvp
         gn71l7O1h5R94tA+nEwbiZOvtYEhpZm9ywVMRm8OVzavFtTdxgwxX9l8edclHTPk5hzM
         mTlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="YXnf/E0m";
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::141 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com. [2607:f8b0:4864:20::141])
        by gmr-mx.google.com with ESMTPS id d207si27389iof.3.2020.03.31.15.53.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 15:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::141 as permitted sender) client-ip=2607:f8b0:4864:20::141;
Received: by mail-il1-x141.google.com with SMTP id n13so13854624ilm.5
        for <jailhouse-dev@googlegroups.com>; Tue, 31 Mar 2020 15:53:47 -0700 (PDT)
X-Received: by 2002:a92:41c7:: with SMTP id o190mr18476989ila.11.1585695227407;
 Tue, 31 Mar 2020 15:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <20200331175810.30204-1-andrew.cooper3@citrix.com> <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
 <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com>
In-Reply-To: <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Tue, 31 Mar 2020 18:53:36 -0400
Message-ID: <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/smpboot: Remove 486-isms from the modern AP boot path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
	Matthew Garrett <mjg59@google.com>, Josh Boyer <jwboyer@redhat.com>, Steve Wahl <steve.wahl@hpe.com>, 
	Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>, 
	Martin Molnar <martin.molnar.programming@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: brgerst@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="YXnf/E0m";       spf=pass
 (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::141 as
 permitted sender) smtp.mailfrom=brgerst@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Tue, Mar 31, 2020 at 6:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 31/03/2020 23:23, Brian Gerst wrote:
> > On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> Linux has an implementation of the Universal Start-up Algorithm (MP spec,
> >> Appendix B.4, Application Processor Startup), which includes unconditionally
> >> writing to the Bios Data Area and CMOS registers.
> >>
> >> The warm reset vector is only necessary in the non-integrated Local APIC case.
> >> UV and Jailhouse already have an opt-out for this behaviour, but blindly using
> >> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.
> >>
> >> We could make this conditional on the integrated-ness of the Local APIC, but
> >> 486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
> >> list and header files as appropriate.
> >>
> >> CC: Thomas Gleixner <tglx@linutronix.de>
> >> CC: Ingo Molnar <mingo@redhat.com>
> >> CC: Borislav Petkov <bp@alien8.de>
> >> CC: "H. Peter Anvin" <hpa@zytor.com>
> >> CC: x86@kernel.org
> >> CC: Jan Kiszka <jan.kiszka@siemens.com>
> >> CC: James Morris <jmorris@namei.org>
> >> CC: David Howells <dhowells@redhat.com>
> >> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> >> CC: Matthew Garrett <mjg59@google.com>
> >> CC: Josh Boyer <jwboyer@redhat.com>
> >> CC: Steve Wahl <steve.wahl@hpe.com>
> >> CC: Mike Travis <mike.travis@hpe.com>
> >> CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> >> CC: Arnd Bergmann <arnd@arndb.de>
> >> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> >> CC: Giovanni Gherdovich <ggherdovich@suse.cz>
> >> CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >> CC: Len Brown <len.brown@intel.com>
> >> CC: Kees Cook <keescook@chromium.org>
> >> CC: Martin Molnar <martin.molnar.programming@gmail.com>
> >> CC: Pingfan Liu <kernelfans@gmail.com>
> >> CC: linux-kernel@vger.kernel.org
> >> CC: jailhouse-dev@googlegroups.com
> >> Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> v2:
> >>  * Drop logic entirely, rather than retaining support in 32bit builds.
> >> ---
> >>  arch/x86/include/asm/apic.h        |  6 -----
> >>  arch/x86/include/asm/x86_init.h    |  1 -
> >>  arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
> >>  arch/x86/kernel/jailhouse.c        |  1 -
> >>  arch/x86/kernel/platform-quirks.c  |  1 -
> >>  arch/x86/kernel/smpboot.c          | 50 --------------------------------------
> >>  6 files changed, 60 deletions(-)
> >>
> >> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> >> index 19e94af9cc5d..5c33f9374b28 100644
> >> --- a/arch/x86/include/asm/apic.h
> >> +++ b/arch/x86/include/asm/apic.h
> >> @@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned long x)
> >>                 return (x >> 24) & 0x0F;
> >>  }
> >>
> >> -/*
> >> - * Warm reset vector position:
> >> - */
> >> -#define TRAMPOLINE_PHYS_LOW            0x467
> >> -#define TRAMPOLINE_PHYS_HIGH           0x469
> >> -
> >>  extern void generic_bigsmp_probe(void);
> >>
> >>  #ifdef CONFIG_X86_LOCAL_APIC
> >> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> >> index 96d9cd208610..006a5d7fd7eb 100644
> >> --- a/arch/x86/include/asm/x86_init.h
> >> +++ b/arch/x86/include/asm/x86_init.h
> >> @@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
> >>  struct x86_legacy_features {
> >>         enum x86_legacy_i8042_state i8042;
> >>         int rtc;
> >> -       int warm_reset;
> >>         int no_vga;
> >>         int reserve_bios_regions;
> >>         struct x86_legacy_devices devices;
> >> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
> >> index ad53b2abc859..5afcfd193592 100644
> >> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
> >> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
> >> @@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
> >>         } else if (!strcmp(oem_table_id, "UVH")) {
> >>                 /* Only UV1 systems: */
> >>                 uv_system_type = UV_NON_UNIQUE_APIC;
> >> -               x86_platform.legacy.warm_reset = 0;
> >>                 __this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
> >>                 uv_set_apicid_hibit();
> >>                 uv_apic = 1;
> >> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> >> index 6eb8b50ea07e..d628fe92d6af 100644
> >> --- a/arch/x86/kernel/jailhouse.c
> >> +++ b/arch/x86/kernel/jailhouse.c
> >> @@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
> >>         x86_platform.calibrate_tsc      = jailhouse_get_tsc;
> >>         x86_platform.get_wallclock      = jailhouse_get_wallclock;
> >>         x86_platform.legacy.rtc         = 0;
> >> -       x86_platform.legacy.warm_reset  = 0;
> >>         x86_platform.legacy.i8042       = X86_LEGACY_I8042_PLATFORM_ABSENT;
> >>
> >>         legacy_pic                      = &null_legacy_pic;
> >> diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
> >> index b348a672f71d..d922c5e0c678 100644
> >> --- a/arch/x86/kernel/platform-quirks.c
> >> +++ b/arch/x86/kernel/platform-quirks.c
> >> @@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
> >>  {
> >>         x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
> >>         x86_platform.legacy.rtc = 1;
> >> -       x86_platform.legacy.warm_reset = 1;
> >>         x86_platform.legacy.reserve_bios_regions = 0;
> >>         x86_platform.legacy.devices.pnpbios = 1;
> >>
> >> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> >> index fe3ab9632f3b..a9f5b511d0b4 100644
> >> --- a/arch/x86/kernel/smpboot.c
> >> +++ b/arch/x86/kernel/smpboot.c
> >> @@ -72,7 +72,6 @@
> >>  #include <asm/fpu/internal.h>
> >>  #include <asm/setup.h>
> >>  #include <asm/uv/uv.h>
> >> -#include <linux/mc146818rtc.h>
> >>  #include <asm/i8259.h>
> >>  #include <asm/misc.h>
> >>  #include <asm/qspinlock.h>
> >> @@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
> >>         return retval;
> >>  }
> >>
> >> -static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
> >> -{
> >> -       unsigned long flags;
> >> -
> >> -       spin_lock_irqsave(&rtc_lock, flags);
> >> -       CMOS_WRITE(0xa, 0xf);
> >> -       spin_unlock_irqrestore(&rtc_lock, flags);
> >> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH)) =
> >> -                                                       start_eip >> 4;
> >> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
> >> -                                                       start_eip & 0xf;
> >> -}
> >> -
> >> -static inline void smpboot_restore_warm_reset_vector(void)
> >> -{
> >> -       unsigned long flags;
> >> -
> >> -       /*
> >> -        * Paranoid:  Set warm reset code and vector here back
> >> -        * to default values.
> >> -        */
> >> -       spin_lock_irqsave(&rtc_lock, flags);
> >> -       CMOS_WRITE(0, 0xf);
> >> -       spin_unlock_irqrestore(&rtc_lock, flags);
> >> -
> >> -       *((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) = 0;
> >> -}
> >> -
> >>  static void init_freq_invariance(void);
> >>
> >>  /*
> >> @@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
> >>          * the targeted processor.
> >>          */
> >>
> >> -       if (x86_platform.legacy.warm_reset) {
> >> -
> >> -               pr_debug("Setting warm reset code and vector.\n");
> >> -
> >> -               smpboot_setup_warm_reset_vector(start_ip);
> >> -               /*
> >> -                * Be paranoid about clearing APIC errors.
> >> -               */
> >> -               if (APIC_INTEGRATED(boot_cpu_apic_version)) {
> >> -                       apic_write(APIC_ESR, 0);
> >> -                       apic_read(APIC_ESR);
> >> -               }
> >> -       }
> >> -
> >>         /*
> >>          * AP might wait on cpu_callout_mask in cpu_init() with
> >>          * cpu_initialized_mask set if previous attempt to online
> >> @@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
> >>                 }
> >>         }
> >>
> >> -       if (x86_platform.legacy.warm_reset) {
> >> -               /*
> >> -                * Cleanup possible dangling ends...
> >> -                */
> >> -               smpboot_restore_warm_reset_vector();
> >> -       }
> >> -
> >>         return boot_error;
> >>  }
> > You removed x86_platform.legacy.warm_reset in the original patch, but
> > that is missing in V2.
>
> Second hunk?  Or are you referring to something different?

Removing the warm_reset field from struct x86_legacy_features.

--
Brian Gerst

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_%2BXVgA%40mail.gmail.com.

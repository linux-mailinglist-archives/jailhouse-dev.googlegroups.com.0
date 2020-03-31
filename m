Return-Path: <jailhouse-dev+bncBC25XUMBOQINBBMP6QCRUBAF2FBVE@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 7706019A1DD
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 00:23:14 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id k34sf19183280otk.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 15:23:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585693393; cv=pass;
        d=google.com; s=arc-20160816;
        b=BmodDcxuzp6P9sE8CkhE7xMOYis+kNBCsxVPr0fZVskQp1ufWjV5+PuMbdjp12Rw4M
         979YSspjee5sWMlysXerz+5ZxpECFrTqCFjauQFsKnAy3UnzT/WVRcQZCjyz0cq8aLEY
         +VSmAcnsvTaqIrDKNFXXqWS9DhBt3YRSRQdE/5MOb+mcbldLxkzGoUE9edCQuEPI5JZy
         5f9fD8cZ6NRIdGj5QBwU6W9zUat0nTWjkikaZ5i8WEiXGlFAlPoTRR/VLbOOdvC1gE6w
         2zG1gFjBEqB1T7XyzXjd2M8DuCuRzC/vw9Ys6MU3hyR8/ny1+HFH03DsVEUXQDlMD3nH
         k0Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=qTBv1i0Ye5B8YE+eAhhRk5TCeCyi3rC2lpkH0WSVwcE=;
        b=T5M4itO+ktOZlN7jZVVJ0by+mcbR6pmJFQ6crZnesLZJ/NCVEgOggAcjeyKirGL+I3
         3pXSbsMmpyT/9FgJ68E+8uBZEGrRmIV9g9RFjxzt9v9hJuKGK5wfSvoPSvVTccBMFmqq
         5M7AJRHYtgD8QEf4p7CMxzP4fk+S+Hx077OqfR3szPZDAf2DAx6TFA1Th1jk6T1yGyCe
         UpRZlLMgrrrHKO+50qZLx0zjTna4Qsj0xcH4nemRMdNst2ERaxRI/I7QKT4tPZxjBHE6
         tw5ZH8QPjaq+p2Ya/5tbF1F2SVs1n3Ok/ycS67X2EkMVEuDqgghrcfTu9tXsO/R+ZW0/
         67/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dZdqLlKR;
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qTBv1i0Ye5B8YE+eAhhRk5TCeCyi3rC2lpkH0WSVwcE=;
        b=H+ca4DXcRDZMpE9NatNPwjocMNBGxUtDCM9Q/RcAZRfTevlF4jpw15+jho7X47gjh+
         LMw2jCHG1L9XUSZts7fORu0IYKzeY8eyGrq5q5/9pfKZ/f9adN8AW6GQdJ36MPhjBVym
         U8Zn/Itdqa/WWI9hYCcRo2ymFD167vDr5I5HJ4MaVtKJ9UIsvuD0TV+Z1gjouNykcRNr
         fDsCc5gJ3Pw2P4vUnD4K4Hu1XNkvMgV0VpKe1LuQWicx6tq2uEjbhTLLNeN5X6ADFMeH
         EbPagm/+sQh07bD5Vqi75WPfw/RzrWKDes92wb5020o1nC0dvN0LXRII6AwoJpAVRg/o
         AxZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qTBv1i0Ye5B8YE+eAhhRk5TCeCyi3rC2lpkH0WSVwcE=;
        b=OpDjnNmsCPXSU86F+qOIYO0qCSMQ6kl375oWr3p3wegPIxL0uXAeyNY1hiDoIam0cO
         f2VTSDOZ3lgIp+2yTSdeeIAzJ/GIyRTT1Z2RpDIwgyMghLSVFc3ihqBpu7mgy0BtZI6a
         l+HNS/xT6eTa9yUNNkFZzqMvC5PjmaSy0kCsQ5YF9d6epKZTrk79wzvKzAjdEU5GDWsv
         dAE0XNUSxrMalrmBBmrAaz1dpoQLsD0jOiW2S96QQ9rt5B7V041gyS/5we9St7YslEN0
         r/WlrOc4c0am/rEWiOdN0a+f+amjwS1wBBxLazwHf5Fbf19/ASZaklPqvEbeiS/vg8bR
         E3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qTBv1i0Ye5B8YE+eAhhRk5TCeCyi3rC2lpkH0WSVwcE=;
        b=kkzpTWKu3GM0ZvyXv73sv0tyT611TW0w4rS5DWYhEFKuZdKKZVY0N4JjoUCX+ahuH5
         77u6rKfi77rX8Jx0H1fbAg92lgwGvrEl2l9vEw6iBuH1I0goZeejmqAM0sqKYaM/qU50
         CBsDNhE6vV9UNqbw057j4ihN0wV59eNzc4sz6Ny6Y4ALU23rIqmEHcYi9oe5Ceo/+i42
         EVdIFSycJQEfvlgXmuu+iUekKkcYt/DiXC+SWliNeAiPGpAyqOp8WhqFue+wWMQsCTTF
         Ha+GV+VJdu8UYd8xJU5pthTBuYdUfawObJZvD1nGS9eYYz7dm8pqTlLsd0Mop4q1uTlx
         ePJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1iyrpB2srB3BrQAYF8fzv+wUrXpXm0pTT2UHvpfXId/mt9c41i
	BVrsjsegt02Wr8Xh/kckWOc=
X-Google-Smtp-Source: ADFU+vuKjJeK8D8Yn6KF3l3XFNE+WYspHk0v5VqgtazqLBuUATHfZJoph+TWkxkChzBcbircCeWMCw==
X-Received: by 2002:a9d:1a2:: with SMTP id e31mr5219365ote.30.1585693393099;
        Tue, 31 Mar 2020 15:23:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:bf16:: with SMTP id r22ls2246389oop.1.gmail; Tue, 31 Mar
 2020 15:23:12 -0700 (PDT)
X-Received: by 2002:a4a:d1a4:: with SMTP id z4mr14961182oor.52.1585693392553;
        Tue, 31 Mar 2020 15:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585693392; cv=none;
        d=google.com; s=arc-20160816;
        b=II1taK9xJU2KSFUt0sva+jf8I7KvtTmukv9jKa45MuOMNi6GWGLQEoJU+j0qWlZ6zd
         3QmMtKwrrA6r5/6onvK+xsXG+Hfaqxnq5jm+KgmfDSuoNmIZr5xzLTtiTOO7/po0jGY7
         DL5rJy3mkVw4TsaUemdRWUNEAGHHJeVMs3N/VsuZvjNtVnSW2l1TMZOlKgPU90IOh5nH
         l+Np/LVjOuHY1T8GRS29+dRFAXqXAu0UEPy1WdUnCKYEOisiwGcUsZrEZLGKnWBEGKE/
         H4C+/b4dlOcCD4vwUkEyLSK1dFgehlXbqQiog/UyW32MfOhUd5sDbX+uxGWsbrV0MuYx
         oFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ARULjoQtf8jPl9YqlhaD51ipsNLJ+vghKOqa6OLsOPo=;
        b=JGFmHVNhe0mM03yhjHcZxypOjsroT3J/wQLx6UYQ+wlDz7ocqANU5SXhfxCr4Wr4bE
         u8mYFGQI/40DDAKJ9rj7vE+S7OFE6640rIEm8HFEKgU5gowRAC9V8rDVxsySJ4HQbKWE
         jxOT4F6k2UqwRfjwA6U38aR+liFwBRNWk+bfcibNaPgCpe+fuXVaBCfGCEiRjk5a1xAM
         HVhbiHsST49uKOS9t6Bac04fyS0NYHEJFm6mIUQ8+TV+LW0TClUqlM4N8/zqwKYS3iZL
         d4v1xzFCqVuWepgYGscL7Hlw/BQhTLWqCkhovk4Ai2c39xH2NcSaw+QfbyjMqaBPDcpJ
         u1Fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dZdqLlKR;
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com. [2607:f8b0:4864:20::142])
        by gmr-mx.google.com with ESMTPS id s12si19111oth.1.2020.03.31.15.23.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 15:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::142 as permitted sender) client-ip=2607:f8b0:4864:20::142;
Received: by mail-il1-x142.google.com with SMTP id j69so21066680ila.11
        for <jailhouse-dev@googlegroups.com>; Tue, 31 Mar 2020 15:23:12 -0700 (PDT)
X-Received: by 2002:a92:86d1:: with SMTP id l78mr18569494ilh.172.1585693392005;
 Tue, 31 Mar 2020 15:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200325101431.12341-1-andrew.cooper3@citrix.com> <20200331175810.30204-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200331175810.30204-1-andrew.cooper3@citrix.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Tue, 31 Mar 2020 18:23:00 -0400
Message-ID: <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
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
 header.i=@gmail.com header.s=20161025 header.b=dZdqLlKR;       spf=pass
 (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::142 as
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

On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Linux has an implementation of the Universal Start-up Algorithm (MP spec,
> Appendix B.4, Application Processor Startup), which includes unconditionally
> writing to the Bios Data Area and CMOS registers.
>
> The warm reset vector is only necessary in the non-integrated Local APIC case.
> UV and Jailhouse already have an opt-out for this behaviour, but blindly using
> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.
>
> We could make this conditional on the integrated-ness of the Local APIC, but
> 486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
> list and header files as appropriate.
>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: "H. Peter Anvin" <hpa@zytor.com>
> CC: x86@kernel.org
> CC: Jan Kiszka <jan.kiszka@siemens.com>
> CC: James Morris <jmorris@namei.org>
> CC: David Howells <dhowells@redhat.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Matthew Garrett <mjg59@google.com>
> CC: Josh Boyer <jwboyer@redhat.com>
> CC: Steve Wahl <steve.wahl@hpe.com>
> CC: Mike Travis <mike.travis@hpe.com>
> CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> CC: Giovanni Gherdovich <ggherdovich@suse.cz>
> CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> CC: Len Brown <len.brown@intel.com>
> CC: Kees Cook <keescook@chromium.org>
> CC: Martin Molnar <martin.molnar.programming@gmail.com>
> CC: Pingfan Liu <kernelfans@gmail.com>
> CC: linux-kernel@vger.kernel.org
> CC: jailhouse-dev@googlegroups.com
> Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> v2:
>  * Drop logic entirely, rather than retaining support in 32bit builds.
> ---
>  arch/x86/include/asm/apic.h        |  6 -----
>  arch/x86/include/asm/x86_init.h    |  1 -
>  arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
>  arch/x86/kernel/jailhouse.c        |  1 -
>  arch/x86/kernel/platform-quirks.c  |  1 -
>  arch/x86/kernel/smpboot.c          | 50 --------------------------------------
>  6 files changed, 60 deletions(-)
>
> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> index 19e94af9cc5d..5c33f9374b28 100644
> --- a/arch/x86/include/asm/apic.h
> +++ b/arch/x86/include/asm/apic.h
> @@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned long x)
>                 return (x >> 24) & 0x0F;
>  }
>
> -/*
> - * Warm reset vector position:
> - */
> -#define TRAMPOLINE_PHYS_LOW            0x467
> -#define TRAMPOLINE_PHYS_HIGH           0x469
> -
>  extern void generic_bigsmp_probe(void);
>
>  #ifdef CONFIG_X86_LOCAL_APIC
> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> index 96d9cd208610..006a5d7fd7eb 100644
> --- a/arch/x86/include/asm/x86_init.h
> +++ b/arch/x86/include/asm/x86_init.h
> @@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
>  struct x86_legacy_features {
>         enum x86_legacy_i8042_state i8042;
>         int rtc;
> -       int warm_reset;
>         int no_vga;
>         int reserve_bios_regions;
>         struct x86_legacy_devices devices;
> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
> index ad53b2abc859..5afcfd193592 100644
> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
> @@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
>         } else if (!strcmp(oem_table_id, "UVH")) {
>                 /* Only UV1 systems: */
>                 uv_system_type = UV_NON_UNIQUE_APIC;
> -               x86_platform.legacy.warm_reset = 0;
>                 __this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
>                 uv_set_apicid_hibit();
>                 uv_apic = 1;
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index 6eb8b50ea07e..d628fe92d6af 100644
> --- a/arch/x86/kernel/jailhouse.c
> +++ b/arch/x86/kernel/jailhouse.c
> @@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
>         x86_platform.calibrate_tsc      = jailhouse_get_tsc;
>         x86_platform.get_wallclock      = jailhouse_get_wallclock;
>         x86_platform.legacy.rtc         = 0;
> -       x86_platform.legacy.warm_reset  = 0;
>         x86_platform.legacy.i8042       = X86_LEGACY_I8042_PLATFORM_ABSENT;
>
>         legacy_pic                      = &null_legacy_pic;
> diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
> index b348a672f71d..d922c5e0c678 100644
> --- a/arch/x86/kernel/platform-quirks.c
> +++ b/arch/x86/kernel/platform-quirks.c
> @@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
>  {
>         x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
>         x86_platform.legacy.rtc = 1;
> -       x86_platform.legacy.warm_reset = 1;
>         x86_platform.legacy.reserve_bios_regions = 0;
>         x86_platform.legacy.devices.pnpbios = 1;
>
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index fe3ab9632f3b..a9f5b511d0b4 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -72,7 +72,6 @@
>  #include <asm/fpu/internal.h>
>  #include <asm/setup.h>
>  #include <asm/uv/uv.h>
> -#include <linux/mc146818rtc.h>
>  #include <asm/i8259.h>
>  #include <asm/misc.h>
>  #include <asm/qspinlock.h>
> @@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
>         return retval;
>  }
>
> -static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
> -{
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&rtc_lock, flags);
> -       CMOS_WRITE(0xa, 0xf);
> -       spin_unlock_irqrestore(&rtc_lock, flags);
> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH)) =
> -                                                       start_eip >> 4;
> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
> -                                                       start_eip & 0xf;
> -}
> -
> -static inline void smpboot_restore_warm_reset_vector(void)
> -{
> -       unsigned long flags;
> -
> -       /*
> -        * Paranoid:  Set warm reset code and vector here back
> -        * to default values.
> -        */
> -       spin_lock_irqsave(&rtc_lock, flags);
> -       CMOS_WRITE(0, 0xf);
> -       spin_unlock_irqrestore(&rtc_lock, flags);
> -
> -       *((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) = 0;
> -}
> -
>  static void init_freq_invariance(void);
>
>  /*
> @@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
>          * the targeted processor.
>          */
>
> -       if (x86_platform.legacy.warm_reset) {
> -
> -               pr_debug("Setting warm reset code and vector.\n");
> -
> -               smpboot_setup_warm_reset_vector(start_ip);
> -               /*
> -                * Be paranoid about clearing APIC errors.
> -               */
> -               if (APIC_INTEGRATED(boot_cpu_apic_version)) {
> -                       apic_write(APIC_ESR, 0);
> -                       apic_read(APIC_ESR);
> -               }
> -       }
> -
>         /*
>          * AP might wait on cpu_callout_mask in cpu_init() with
>          * cpu_initialized_mask set if previous attempt to online
> @@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
>                 }
>         }
>
> -       if (x86_platform.legacy.warm_reset) {
> -               /*
> -                * Cleanup possible dangling ends...
> -                */
> -               smpboot_restore_warm_reset_vector();
> -       }
> -
>         return boot_error;
>  }

You removed x86_platform.legacy.warm_reset in the original patch, but
that is missing in V2.

--
Brian Gerst

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q%40mail.gmail.com.

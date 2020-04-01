Return-Path: <jailhouse-dev+bncBC25XUMBOQIPD6UR6QCRUBC25RKWU@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90E19AAEF
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 13:39:30 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id w124sf20832646qkd.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 04:39:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585741169; cv=pass;
        d=google.com; s=arc-20160816;
        b=pS6ok+Icb4WGb6e+hylxjaoAC4HWe9839DNz/ooGddofCcDJ/E160UcVswkRoWzVU3
         Dvdt0qrfNJwx2OJNOWeoiF64U78s+LW8tXVV/V1XAds2MCu6XpOGvF9poNEDbw9fRC91
         xWq5cjKYxylRBPglwKsLiU8lENJnRAN68hzY9SGa5PM4eVGhRhSvT0SlERM2udSPbo9K
         ofm4esTWH6XSZgJ/vdC4pEIYtHXK37d5Cs4txkyaV/yvHJ7S2V5JnpC9vquxeBM17Agz
         rEasWJx7egO+2RCy/Lb4cUh+ndvSmS1XErFudY6lk1F37u+v8gYFo1nc4V5zJPiKfN+M
         xUSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=X2iXsTQnmh9mca7kvyJ1eQz0+wlBjhkhOAJxDXoWA6Y=;
        b=xhm3qysVt8nqtBRWghtE0Y1pXuWJk5Lp11VRkyQXLQo1UGala5yO0FSOTWcOBfOiye
         rDIFccLVMcF6/apFzoIr9jXVOrWALDo8S1X39vzZISbzNBT4bKfpjARuZ/PppymMEvUs
         /8QiEYKsYSJqVzSQakU7IDJ4E+wyN2FQeUAGWUggH99khGU+Im9Hk/tY3nowI+vINA6n
         mkgwGt9xv0EAaKrY4auGSYhtwGrVcH742HOzm/FdB8lhV7s/TnRduUWuwvIIZxLVQ8GY
         Dql947z/vKzyWGP2i/8WKsETBa4ELjvNm1PDVeyh8vvmtiwHe1ZtsgFBOBCEpwIB+Vpz
         23bA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6roFE5d;
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d43 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X2iXsTQnmh9mca7kvyJ1eQz0+wlBjhkhOAJxDXoWA6Y=;
        b=raxU2TWDaA5YcR8Rw6sJVyetRUfFvaOWzYhrnJrAXDKO/fioaCRLjgCEBUg2meF8Ur
         48LDdy9cnV9JSoEOMDXh5lLicWVrRuLkKpp9soCLIAjmfYzDsLvygZaBV69Sk4udEZft
         73tmzM9eZBguJb1CwSUagILfSWQZ6OA9Gr0NAtlj2uDwlDihHQi7eD5uo+p3oXvDunU5
         Wl0dEblletF9/t/4gf1vM2LI4mXypsjfNsP0MIPFjIrNPJHgpySrqUBKB4FgRUqU0Tii
         LEMesV3ghAmqyJ5/lKaJkJizxeeet+ACNnentjJbywg6JyIErkejSkcrfV/4BN5K8IaU
         4p0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X2iXsTQnmh9mca7kvyJ1eQz0+wlBjhkhOAJxDXoWA6Y=;
        b=tNwW+Q3VYi4sh9yun7yu1NNLgOm0GGSX4fMUqhw68Wgsa6FiRyTh1jqUidU4bHTBiW
         cr6EbWombQt8QSGs2IyQY9q2HTp+YM6E2EVfyLof6nygIpgFt1KagpCKmOBeeOAS06R3
         rRq5XHhGQDu32fGb1z+Z3r191IhNigD6du8f/md8mQ+wSVUVR8qNcepohaHY08JlJDRd
         dVrdtIsG9txflEK/EBE9HMQVjuJ36VW7DZEZxVcVWe9Iei54V35hVAR3zbK+aNimRlaC
         XFhKZsac4W/tCAbF6Kxow5ZfG3Ai6Q+cznN/I89AahZEdRTWfN9oari4RMCgsuTWWxPb
         CuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X2iXsTQnmh9mca7kvyJ1eQz0+wlBjhkhOAJxDXoWA6Y=;
        b=SwmAGmk3hjjtec3w//jS3WfLhV7oLj7lkOYIsiXGCt+qTns6IfesHsH4a3xB3+IA9E
         bUZ76pp5E2KFqCLvGOEdXaz5rBeecMoJOi4PW5aFSWB4ZwvOHFbfKnOBMWSxaktkVsQi
         ZXILS58CmgN2Jd0gNPCpbZUz3TdlbgS2KL1pyzWdli7EQs7tV01mmyyZQWUVlKhuFtbe
         gdk0XTAIBDMMRMQXFCXdQWfi71p2I7rmy9iwsAQToyiCpV1gPo6nt8LwRJoDGNo9N11m
         EkjKO2GnfMdjkidCuhn0EprbpHvkVYwbJ//4bEwCQjCdX89KfOrkgrgNErJoFTK2zii6
         gKbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1FgApD+LnTXDeHffwTZN64b52UNfBWUtrxsVPrWt74ymiY01it
	DHNjUjAG8M/vCB3wsRo2+mI=
X-Google-Smtp-Source: ADFU+vtxf8XoOBVokMWO3xMcnq6pt3dUIcV7O00zAJ4V6iR11IWJr0lMTv1XH9yAExpfsqLC7Bjqng==
X-Received: by 2002:ad4:41c2:: with SMTP id a2mr20589503qvq.112.1585741169224;
        Wed, 01 Apr 2020 04:39:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:6714:: with SMTP id b20ls12030368qkc.5.gmail; Wed, 01
 Apr 2020 04:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:149:: with SMTP id e9mr9459615qkn.356.1585741168662;
        Wed, 01 Apr 2020 04:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585741168; cv=none;
        d=google.com; s=arc-20160816;
        b=ITzbcA8QaUCkjXN5I+5WfGEacTi5QMpyiIMlTBWDbQPhf5L/7W4siwxuKZHKWRVwhF
         rVBSIDJCKqiypGUT+8offaJQkC29hWrcukaKXIGVUPnpzMY1v+SmyNPVum4q089zsyaQ
         oI646NtH35UhWHNdR5fdfyDUerpFno7RWiFoVcjCRMbyUVCYElZ/1VhIthr+oWvvoB8V
         J1XLY8CjqRcyTajpRDGCkt7oAGAk9KxMsiT3dYqFjA4Frp0aJG5TSJIfjh4QzbH2VltB
         jr5K7Gg/QWcA0Sv0lztFXRs/UdILXzXO3UheAY3X9kcKJvM9XGxFV2xm1oelCDjFXnTi
         aG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B6LtkV31Mx0Wb2yWk+q4vycLOOPy+wzd4O74v4uZk5c=;
        b=HIN52b3VMwlpwyP5aS0l600XeeJjV3TMoEDs3KYIb0QIuAZsYtJCZXucjKZVpx4yBO
         YHoUP5lxKdaac/DfsLoM7FlPwESrFGjWtT5VkfVlcMc/L74+t/ydedTlT6amSjgPFjBy
         DoTv/SYJMVib6nYV0S3qDakuWlBhcHcDWFKInTArLtiS4wx2vJd+1gdJ+YgRXtODSGMz
         6uFnfrulnRkyX9C39IkmfPN/MpgUG3EE8nOGLIgOC+wpoTPQelqANuRJlk4FdYxpSi/F
         ttz2IFIdS7c08WiMK8MFgGqa1yXEIeIMTzIhCymiutVvYl9GlckPKWve0RqrXwVIZYOP
         dXiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6roFE5d;
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d43 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com. [2607:f8b0:4864:20::d43])
        by gmr-mx.google.com with ESMTPS id c194si72413qkb.0.2020.04.01.04.39.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 04:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d43 as permitted sender) client-ip=2607:f8b0:4864:20::d43;
Received: by mail-io1-xd43.google.com with SMTP id h131so25257978iof.1
        for <jailhouse-dev@googlegroups.com>; Wed, 01 Apr 2020 04:39:28 -0700 (PDT)
X-Received: by 2002:a05:6602:2242:: with SMTP id o2mr19807209ioo.22.1585741167864;
 Wed, 01 Apr 2020 04:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <20200331175810.30204-1-andrew.cooper3@citrix.com> <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
 <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com> <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
 <bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52@citrix.com>
In-Reply-To: <bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52@citrix.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 1 Apr 2020 07:39:16 -0400
Message-ID: <CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com>
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
 header.i=@gmail.com header.s=20161025 header.b=n6roFE5d;       spf=pass
 (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d43 as
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

On Wed, Apr 1, 2020 at 5:22 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 31/03/2020 23:53, Brian Gerst wrote:
> > On Tue, Mar 31, 2020 at 6:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> On 31/03/2020 23:23, Brian Gerst wrote:
> >>> On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>>> Linux has an implementation of the Universal Start-up Algorithm (MP spec,
> >>>> Appendix B.4, Application Processor Startup), which includes unconditionally
> >>>> writing to the Bios Data Area and CMOS registers.
> >>>>
> >>>> The warm reset vector is only necessary in the non-integrated Local APIC case.
> >>>> UV and Jailhouse already have an opt-out for this behaviour, but blindly using
> >>>> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.
> >>>>
> >>>> We could make this conditional on the integrated-ness of the Local APIC, but
> >>>> 486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
> >>>> list and header files as appropriate.
> >>>>
> >>>> CC: Thomas Gleixner <tglx@linutronix.de>
> >>>> CC: Ingo Molnar <mingo@redhat.com>
> >>>> CC: Borislav Petkov <bp@alien8.de>
> >>>> CC: "H. Peter Anvin" <hpa@zytor.com>
> >>>> CC: x86@kernel.org
> >>>> CC: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> CC: James Morris <jmorris@namei.org>
> >>>> CC: David Howells <dhowells@redhat.com>
> >>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> CC: Matthew Garrett <mjg59@google.com>
> >>>> CC: Josh Boyer <jwboyer@redhat.com>
> >>>> CC: Steve Wahl <steve.wahl@hpe.com>
> >>>> CC: Mike Travis <mike.travis@hpe.com>
> >>>> CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> >>>> CC: Arnd Bergmann <arnd@arndb.de>
> >>>> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> >>>> CC: Giovanni Gherdovich <ggherdovich@suse.cz>
> >>>> CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >>>> CC: Len Brown <len.brown@intel.com>
> >>>> CC: Kees Cook <keescook@chromium.org>
> >>>> CC: Martin Molnar <martin.molnar.programming@gmail.com>
> >>>> CC: Pingfan Liu <kernelfans@gmail.com>
> >>>> CC: linux-kernel@vger.kernel.org
> >>>> CC: jailhouse-dev@googlegroups.com
> >>>> Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
> >>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> ---
> >>>> v2:
> >>>>  * Drop logic entirely, rather than retaining support in 32bit builds.
> >>>> ---
> >>>>  arch/x86/include/asm/apic.h        |  6 -----
> >>>>  arch/x86/include/asm/x86_init.h    |  1 -
> >>>>  arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
> >>>>  arch/x86/kernel/jailhouse.c        |  1 -
> >>>>  arch/x86/kernel/platform-quirks.c  |  1 -
> >>>>  arch/x86/kernel/smpboot.c          | 50 --------------------------------------
> >>>>  6 files changed, 60 deletions(-)
> >>>>
> >>>> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> >>>> index 19e94af9cc5d..5c33f9374b28 100644
> >>>> --- a/arch/x86/include/asm/apic.h
> >>>> +++ b/arch/x86/include/asm/apic.h
> >>>> @@ -472,12 +472,6 @@ static inline unsigned default_get_apic_id(unsigned long x)
> >>>>                 return (x >> 24) & 0x0F;
> >>>>  }
> >>>>
> >>>> -/*
> >>>> - * Warm reset vector position:
> >>>> - */
> >>>> -#define TRAMPOLINE_PHYS_LOW            0x467
> >>>> -#define TRAMPOLINE_PHYS_HIGH           0x469
> >>>> -
> >>>>  extern void generic_bigsmp_probe(void);
> >>>>
> >>>>  #ifdef CONFIG_X86_LOCAL_APIC
> >>>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> >>>> index 96d9cd208610..006a5d7fd7eb 100644
> >>>> --- a/arch/x86/include/asm/x86_init.h
> >>>> +++ b/arch/x86/include/asm/x86_init.h
> >>>> @@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
> >>>>  struct x86_legacy_features {
> >>>>         enum x86_legacy_i8042_state i8042;
> >>>>         int rtc;
> >>>> -       int warm_reset;
> >>>>         int no_vga;
> >>>>         int reserve_bios_regions;
> >>>>         struct x86_legacy_devices devices;
> >>>> diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
> >>>> index ad53b2abc859..5afcfd193592 100644
> >>>> --- a/arch/x86/kernel/apic/x2apic_uv_x.c
> >>>> +++ b/arch/x86/kernel/apic/x2apic_uv_x.c
> >>>> @@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
> >>>>         } else if (!strcmp(oem_table_id, "UVH")) {
> >>>>                 /* Only UV1 systems: */
> >>>>                 uv_system_type = UV_NON_UNIQUE_APIC;
> >>>> -               x86_platform.legacy.warm_reset = 0;
> >>>>                 __this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
> >>>>                 uv_set_apicid_hibit();
> >>>>                 uv_apic = 1;
> >>>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> >>>> index 6eb8b50ea07e..d628fe92d6af 100644
> >>>> --- a/arch/x86/kernel/jailhouse.c
> >>>> +++ b/arch/x86/kernel/jailhouse.c
> >>>> @@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
> >>>>         x86_platform.calibrate_tsc      = jailhouse_get_tsc;
> >>>>         x86_platform.get_wallclock      = jailhouse_get_wallclock;
> >>>>         x86_platform.legacy.rtc         = 0;
> >>>> -       x86_platform.legacy.warm_reset  = 0;
> >>>>         x86_platform.legacy.i8042       = X86_LEGACY_I8042_PLATFORM_ABSENT;
> >>>>
> >>>>         legacy_pic                      = &null_legacy_pic;
> >>>> diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
> >>>> index b348a672f71d..d922c5e0c678 100644
> >>>> --- a/arch/x86/kernel/platform-quirks.c
> >>>> +++ b/arch/x86/kernel/platform-quirks.c
> >>>> @@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
> >>>>  {
> >>>>         x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
> >>>>         x86_platform.legacy.rtc = 1;
> >>>> -       x86_platform.legacy.warm_reset = 1;
> >>>>         x86_platform.legacy.reserve_bios_regions = 0;
> >>>>         x86_platform.legacy.devices.pnpbios = 1;
> >>>>
> >>>> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> >>>> index fe3ab9632f3b..a9f5b511d0b4 100644
> >>>> --- a/arch/x86/kernel/smpboot.c
> >>>> +++ b/arch/x86/kernel/smpboot.c
> >>>> @@ -72,7 +72,6 @@
> >>>>  #include <asm/fpu/internal.h>
> >>>>  #include <asm/setup.h>
> >>>>  #include <asm/uv/uv.h>
> >>>> -#include <linux/mc146818rtc.h>
> >>>>  #include <asm/i8259.h>
> >>>>  #include <asm/misc.h>
> >>>>  #include <asm/qspinlock.h>
> >>>> @@ -119,34 +118,6 @@ int arch_update_cpu_topology(void)
> >>>>         return retval;
> >>>>  }
> >>>>
> >>>> -static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
> >>>> -{
> >>>> -       unsigned long flags;
> >>>> -
> >>>> -       spin_lock_irqsave(&rtc_lock, flags);
> >>>> -       CMOS_WRITE(0xa, 0xf);
> >>>> -       spin_unlock_irqrestore(&rtc_lock, flags);
> >>>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_HIGH)) =
> >>>> -                                                       start_eip >> 4;
> >>>> -       *((volatile unsigned short *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) =
> >>>> -                                                       start_eip & 0xf;
> >>>> -}
> >>>> -
> >>>> -static inline void smpboot_restore_warm_reset_vector(void)
> >>>> -{
> >>>> -       unsigned long flags;
> >>>> -
> >>>> -       /*
> >>>> -        * Paranoid:  Set warm reset code and vector here back
> >>>> -        * to default values.
> >>>> -        */
> >>>> -       spin_lock_irqsave(&rtc_lock, flags);
> >>>> -       CMOS_WRITE(0, 0xf);
> >>>> -       spin_unlock_irqrestore(&rtc_lock, flags);
> >>>> -
> >>>> -       *((volatile u32 *)phys_to_virt(TRAMPOLINE_PHYS_LOW)) = 0;
> >>>> -}
> >>>> -
> >>>>  static void init_freq_invariance(void);
> >>>>
> >>>>  /*
> >>>> @@ -1049,20 +1020,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
> >>>>          * the targeted processor.
> >>>>          */
> >>>>
> >>>> -       if (x86_platform.legacy.warm_reset) {
> >>>> -
> >>>> -               pr_debug("Setting warm reset code and vector.\n");
> >>>> -
> >>>> -               smpboot_setup_warm_reset_vector(start_ip);
> >>>> -               /*
> >>>> -                * Be paranoid about clearing APIC errors.
> >>>> -               */
> >>>> -               if (APIC_INTEGRATED(boot_cpu_apic_version)) {
> >>>> -                       apic_write(APIC_ESR, 0);
> >>>> -                       apic_read(APIC_ESR);
> >>>> -               }
> >>>> -       }
> >>>> -
> >>>>         /*
> >>>>          * AP might wait on cpu_callout_mask in cpu_init() with
> >>>>          * cpu_initialized_mask set if previous attempt to online
> >>>> @@ -1118,13 +1075,6 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
> >>>>                 }
> >>>>         }
> >>>>
> >>>> -       if (x86_platform.legacy.warm_reset) {
> >>>> -               /*
> >>>> -                * Cleanup possible dangling ends...
> >>>> -                */
> >>>> -               smpboot_restore_warm_reset_vector();
> >>>> -       }
> >>>> -
> >>>>         return boot_error;
> >>>>  }
> >>> You removed x86_platform.legacy.warm_reset in the original patch, but
> >>> that is missing in V2.
> >> Second hunk?  Or are you referring to something different?
> > Removing the warm_reset field from struct x86_legacy_features.
>
> Ok, but that is still present as the 2nd hunk of the patch.

My apologies, Gmail was hiding that section of the patch because it
was a reply to the original patch.  For future reference, add the
version number to the title when resubmitting a patch (ie. [PATCH
v2]).

--
Brian Gerst

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw%2BshMOg8WEWGsx%2BBHpg%40mail.gmail.com.

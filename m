Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBBUW75TZQKGQEPPXZWKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCF8192543
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 11:17:56 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id q198sf1211631qke.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 03:17:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585131475; cv=pass;
        d=google.com; s=arc-20160816;
        b=lyCoYzBE/DMhj0gFHozE1oi+eIUxhiIA0ZNOE9tV4sMmEHaLwg1JaVCX6I2CVZ2h4n
         TjEj8sS25rAhtkEPLW0QKPMyrFCyGwygrRCsGMkT3a1RePbd4eRi+mtg3nEvC/28Ujdm
         SqvjrhS2Alng0G6CDGAhwMZSHbYUZ2r35JR/+8dZ+PaY3T5gDc05yU691OQGnKa/eZbo
         cRQcVOeLywtJgKU6FdZg7hEEoZFI5Ak9Hj/xB8NVPNLywPPhzIWohbjArsSKJxzdaH16
         Bs9eVvNHi7bvWMBdR20o/z54TCwqb3ogwN+IFPMM0kR/SrZylML1niXfBuQIhGVMsxD1
         f+9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:from:cc:to:subject
         :mime-version:references:in-reply-to:user-agent:date:dkim-filter
         :sender:dkim-signature;
        bh=MSML3d17RNGZPoe0O4jJkGg8pEDG3hejG8BTL0vodRs=;
        b=BH8H1GYQM2mBBO5eIlMx0mNKRuDBZrG03uSk78Eaf7UcEqWvntQ5z2YbLgXmDP9B3O
         +/vsyLOo3HydhKvfnphO+QQGJf0z+bVoa0m3oZq2kTNq/K8GKlUvgs0sibzrIN1fNDOK
         naa4v3jEfr473xAV77bHz0hJsyzd9GxH89Uc4OYezc9k3re4c4poFFMLYBBqxofHsR4y
         NGjx8j2EV+sZZFJ7Fn+tMekLZrUND9kW0hjg9vqE/A7kW+aW7CfuIqDHsz4sQqmbpDJu
         Zw0mmOLXadioyVC/udbLPROc8GSBoeEz9L6yIBn6P0OVSobra88cUjFP9L7Xq4/R0BhV
         HJ4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2020032201 header.b=fxxkenOd;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:dkim-filter:date:user-agent:in-reply-to:references
         :mime-version:subject:to:cc:from:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MSML3d17RNGZPoe0O4jJkGg8pEDG3hejG8BTL0vodRs=;
        b=W/R0HUREdelV2FkcM9/APwtqdHSFKeFNQzwzBlAEG7gfKuj80dzfRsEdeqTZAaIMWE
         YCjuGryKxyHRBLxUESCJxuxIPLJ5ta4OlE2m6hcSAqCvs5TUEu+AFOfvQNXisksa71JG
         H20qqq7BvVzN3gE5agPqFs7gdbcL5XOvgeIc8cHHrrNgDt480clZO+9X+Ror+/wgBDdG
         Z1AthCHf0ZVmgzT1mdyQeBB+xBdtzOVS+C9/MjPM81r9pCmM21IcbnlNdY+tvvOYy9ut
         sl1CauXeU/mYQD7rnqwiZQvAfV5MYIXnqVhq6F5y8q4b/ffiG5gWlmDByLHgdN8dyTzR
         Sp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:dkim-filter:date:user-agent:in-reply-to
         :references:mime-version:subject:to:cc:from:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MSML3d17RNGZPoe0O4jJkGg8pEDG3hejG8BTL0vodRs=;
        b=aAEZpDADKyVcHBIrTA1LNZAPg46zP7MqY5JPdVdAC8IhLy1h+lpVv7Nw1qjmXmUtNh
         WJPvudtEXRz55H3WV+q0bgedw4kUgoqBzr5QcsAHdPiLwteQpYeZ6SMFpeBo38xLciNU
         /CVXqxR8fsXlur87JdSYPNPPwRZG4RuTJ8O9CJiIxEkJmuxR++pI8+kKNHtnIxTf0wyS
         A+WrVmVRrkqbXZ8URPimT78rYs2BHPcSPm+DsK5b4J6cE+UuxhnZLyP0caWPIocW509L
         rZIKwh9D31729UZ5FgWK9FhZK+2oPZ63WjbqN8UKY6X78bsEpv+p469XA118wz22J2KY
         L2tg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1YVg/0+LSWO5QT1qI3mlSC4TPrUXHHS5TcLNNE62Kejg5w0Ux8
	iK1XuAniBLpk00iLcDj2Zog=
X-Google-Smtp-Source: ADFU+vtF7rC5D0OtW2XLOZvTgOSZ7TUi78dPbRYh7eG+FXASyG5bqdV8TOF+HhiGKFnTnHZR3oJ3qA==
X-Received: by 2002:a0c:a602:: with SMTP id s2mr2403864qva.222.1585131474897;
        Wed, 25 Mar 2020 03:17:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:6192:: with SMTP id v140ls608611qkb.4.gmail; Wed, 25 Mar
 2020 03:17:54 -0700 (PDT)
X-Received: by 2002:a05:620a:84d:: with SMTP id u13mr2130444qku.94.1585131474373;
        Wed, 25 Mar 2020 03:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585131474; cv=none;
        d=google.com; s=arc-20160816;
        b=Am4S3IaUHtkbCvtlRZDpTcSeZ7RSa2vI+354+52w6Q7zW8kLLhfG0zuQFSuuDJeOBP
         I8UCKj0GZufCfE3E4/2X1UwKfoy9bOTW3CQmRBxpFsTMz4ARIwUKLsh+IBpEBGOnC+q5
         fRdRql3Yx8kxcsnEECyF0KkV9y37wZSGw0NEiiUrd8tj9K9CjSbuX81SccOJOjlrGqyH
         OccrnwfO2JjZBVXZTAzNHoA8BVRCgH1Ti9TLpkUN/v+izA4836YuPvGAZ+2agiRFSm3w
         +XTiliyCSXw54FtBgKWeBnOAxAY/+q872Oy9eMFyY0Dt6eNTJoFVJ/CLqxmfRHYkGogE
         S+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:from:cc:to:subject:content-transfer-encoding
         :mime-version:references:in-reply-to:user-agent:date:dkim-signature
         :dkim-filter;
        bh=MfCnNAHIm3q3trq9/ponNXXkVrT3z6pQ6mvLieAcQOw=;
        b=OftGPmEC9dr5q2hPBuThlfoT7bOZs2IQbVTZdv0c/1hIxdcfCWGSzi2HEGenWxj7Mw
         zWpZuDWAnHjW6pkQDPE2nP8Qtg1w3lhtTtK7IJfuwOc56VL+a1LiP/oqmj/W+JATp80X
         Q8M6eJm5ScIkYSCG9bBaSJQxh4UTDmfneoHv6Gh6525TuQAL47TaqZ/hfmj73iExRq6h
         iMEXHx0v1847hXTdQqkHkGAGaQxoz66Ma9fY3CnF5GHKtRVqVqAjQDTH0lRaSIzoP3Gg
         fK9TSx6N1SCBn62hKIWYwhHKvHJWCR8U1gfZvq714buxS3qNH5BRXP+3QpZ5EIajZh8a
         KhGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2020032201 header.b=fxxkenOd;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com (terminus.zytor.com. [198.137.202.136])
        by gmr-mx.google.com with ESMTPS id j56si1165309qta.0.2020.03.25.03.17.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 03:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) client-ip=198.137.202.136;
Received: from [IPv6:2601:646:8600:3281:c898:2a71:8b3c:1618] ([IPv6:2601:646:8600:3281:c898:2a71:8b3c:1618])
	(authenticated bits=0)
	by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 02PAHWME3424848
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 25 Mar 2020 03:17:37 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 02PAHWME3424848
Date: Wed, 25 Mar 2020 03:17:24 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <20200325101431.12341-1-andrew.cooper3@citrix.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot path
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        LKML <linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        Jan Kiszka <jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>, Josh Boyer <jwboyer@redhat.com>,
        Zhenzhong Duan <zhenzhong.duan@oracle.com>,
        Steve Wahl <steve.wahl@hpe.com>, Mike Travis <mike.travis@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>,
        Martin Molnar <martin.molnar.programming@gmail.com>,
        Pingfan Liu <kernelfans@gmail.com>, jailhouse-dev@googlegroups.com
From: hpa@zytor.com
Message-ID: <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com>
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@zytor.com header.s=2020032201 header.b=fxxkenOd;       spf=pass
 (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted
 sender) smtp.mailfrom=hpa@zytor.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=zytor.com
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

On March 25, 2020 3:14:31 AM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>Linux has an implementation of the Universal Start-up Algorithm (MP
>spec,
>Appendix B.4, Application Processor Startup), which includes
>unconditionally
>writing to the Bios Data Area and CMOS registers.
>
>The warm reset vector is only necessary in the non-integrated Local
>APIC case.
>UV and Jailhouse already have an opt-out for this behaviour, but
>blindly using
>the BDA and CMOS on a UEFI or other reduced hardware system isn't
>clever.
>
>Drop the warm_reset flag from struct x86_legacy_features, and tie the
>warm
>vector modifications to the integrated-ness of the Local APIC.  This
>has the
>advantage of compiling the warm reset logic out entirely for 64bit
>builds.
>
>CC: Thomas Gleixner <tglx@linutronix.de>
>CC: Ingo Molnar <mingo@redhat.com>
>CC: Borislav Petkov <bp@alien8.de>
>CC: "H. Peter Anvin" <hpa@zytor.com>
>CC: x86@kernel.org
>CC: Jan Kiszka <jan.kiszka@siemens.com>
>CC: James Morris <jmorris@namei.org>
>CC: David Howells <dhowells@redhat.com>
>CC: Andrew Cooper <andrew.cooper3@citrix.com>
>CC: Matthew Garrett <mjg59@google.com>
>CC: Josh Boyer <jwboyer@redhat.com>
>CC: Zhenzhong Duan <zhenzhong.duan@oracle.com>
>CC: Steve Wahl <steve.wahl@hpe.com>
>CC: Mike Travis <mike.travis@hpe.com>
>CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
>CC: Arnd Bergmann <arnd@arndb.de>
>CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
>CC: Giovanni Gherdovich <ggherdovich@suse.cz>
>CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>CC: Len Brown <len.brown@intel.com>
>CC: Kees Cook <keescook@chromium.org>
>CC: Martin Molnar <martin.molnar.programming@gmail.com>
>CC: Pingfan Liu <kernelfans@gmail.com>
>CC: linux-kernel@vger.kernel.org
>CC: jailhouse-dev@googlegroups.com
>Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>---
>Thomas: I finally found the reference we were discussing in Portland. 
>Sorry
>this patch took so long.
>
>I don't have any non-integrated APIC hardware to test with.  Can anyone
>help
>me out?
>---
> arch/x86/include/asm/x86_init.h    |  1 -
> arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
> arch/x86/kernel/jailhouse.c        |  1 -
> arch/x86/kernel/platform-quirks.c  |  1 -
> arch/x86/kernel/smpboot.c          | 21 ++++++++++++---------
> 5 files changed, 12 insertions(+), 13 deletions(-)
>
>diff --git a/arch/x86/include/asm/x86_init.h
>b/arch/x86/include/asm/x86_init.h
>index 96d9cd208610..006a5d7fd7eb 100644
>--- a/arch/x86/include/asm/x86_init.h
>+++ b/arch/x86/include/asm/x86_init.h
>@@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
> struct x86_legacy_features {
> 	enum x86_legacy_i8042_state i8042;
> 	int rtc;
>-	int warm_reset;
> 	int no_vga;
> 	int reserve_bios_regions;
> 	struct x86_legacy_devices devices;
>diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c
>b/arch/x86/kernel/apic/x2apic_uv_x.c
>index ad53b2abc859..5afcfd193592 100644
>--- a/arch/x86/kernel/apic/x2apic_uv_x.c
>+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
>@@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char
>*_oem_id, char *_oem_table_id)
> 	} else if (!strcmp(oem_table_id, "UVH")) {
> 		/* Only UV1 systems: */
> 		uv_system_type = UV_NON_UNIQUE_APIC;
>-		x86_platform.legacy.warm_reset = 0;
>		__this_cpu_write(x2apic_extra_bits, pnodeid <<
>uvh_apicid.s.pnode_shift);
> 		uv_set_apicid_hibit();
> 		uv_apic = 1;
>diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>index 6eb8b50ea07e..d628fe92d6af 100644
>--- a/arch/x86/kernel/jailhouse.c
>+++ b/arch/x86/kernel/jailhouse.c
>@@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
> 	x86_platform.calibrate_tsc	= jailhouse_get_tsc;
> 	x86_platform.get_wallclock	= jailhouse_get_wallclock;
> 	x86_platform.legacy.rtc		= 0;
>-	x86_platform.legacy.warm_reset	= 0;
> 	x86_platform.legacy.i8042	= X86_LEGACY_I8042_PLATFORM_ABSENT;
> 
> 	legacy_pic			= &null_legacy_pic;
>diff --git a/arch/x86/kernel/platform-quirks.c
>b/arch/x86/kernel/platform-quirks.c
>index b348a672f71d..d922c5e0c678 100644
>--- a/arch/x86/kernel/platform-quirks.c
>+++ b/arch/x86/kernel/platform-quirks.c
>@@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
> {
> 	x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
> 	x86_platform.legacy.rtc = 1;
>-	x86_platform.legacy.warm_reset = 1;
> 	x86_platform.legacy.reserve_bios_regions = 0;
> 	x86_platform.legacy.devices.pnpbios = 1;
> 
>diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
>index d85e91a8aa8c..e2ebb0be2ee3 100644
>--- a/arch/x86/kernel/smpboot.c
>+++ b/arch/x86/kernel/smpboot.c
>@@ -1049,18 +1049,21 @@ static int do_boot_cpu(int apicid, int cpu,
>struct task_struct *idle,
> 	 * the targeted processor.
> 	 */
> 
>-	if (x86_platform.legacy.warm_reset) {
>+	/*
>+	 * APs are typically started in one of two ways:
>+	 *
>+	 * - On 486-era hardware with a non-integrated Local APIC, a single
>+	 *   INIT IPI is sent.  When the AP comes out of reset, the BIOS
>+	 *   follows the warm reset vector to start_ip.
>+	 * - On everything with an integrated Local APIC, the start_ip is
>+	 *   provided in the Startup IPI message, sent as part of an
>+	 *   INIT-SIPI-SIPI sequence.
>+	 */
>+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
> 
> 		pr_debug("Setting warm reset code and vector.\n");
> 
> 		smpboot_setup_warm_reset_vector(start_ip);
>-		/*
>-		 * Be paranoid about clearing APIC errors.
>-		*/
>-		if (APIC_INTEGRATED(boot_cpu_apic_version)) {
>-			apic_write(APIC_ESR, 0);
>-			apic_read(APIC_ESR);
>-		}
> 	}
> 
> 	/*
>@@ -1118,7 +1121,7 @@ static int do_boot_cpu(int apicid, int cpu,
>struct task_struct *idle,
> 		}
> 	}
> 
>-	if (x86_platform.legacy.warm_reset) {
>+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
> 		/*
> 		 * Cleanup possible dangling ends...
> 		 */

We don't support SMP on 486 and haven't for a very long time. Is there any reason to retain that code at all?
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/601E644A-B046-4030-B3BD-280ABF15BF53%40zytor.com.

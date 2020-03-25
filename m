Return-Path: <jailhouse-dev+bncBAABBE665TZQKGQEO4LWXXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63b.google.com (mail-pl1-x63b.google.com [IPv6:2607:f8b0:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id E4974192535
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 11:14:44 +0100 (CET)
Received: by mail-pl1-x63b.google.com with SMTP id g7sf1288022plj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 03:14:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585131283; cv=pass;
        d=google.com; s=arc-20160816;
        b=yNlcEyRQ65JssJkjWzCs5IpE1oOCedDIzKdA+Tr6wuWa3tQqbC+tbRJzk2QgOgizWQ
         d2JeIlfmNt13WzKDDP3qo3XNFT1n42NJ2W/T/JpXV+cnutsYoe0EuNdgRPibW20L8EoQ
         PYEGRLICfqOE6unTLzY5h8uxCKuHb8oQ2XQChZJAJabPLep1KY5CkmiX5qnifxRu9vgf
         76fyBP4MSLp+Miz9l4plWwiKE0fxnzW3bKxdO3IdjHekwgO4UikVNgDwgb6baLr7UZnY
         h8D75K9vHeAGRNtBJk+mZroAdWENUofZ7jxy9MMpvvqn3utRPhvbzP8zJ50GzLrvoiqo
         wBvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:ironport-sdr:sender:dkim-signature;
        bh=lv+gGDldt0ecP5TZp8dQ+W1sjAy+GTNcwdzkwVKOTXQ=;
        b=pbfypJ48I6ChHqLDsdtOVJFkdOL5zyDntcJ1wsgC1P/vAnmPd7cdBBjPWhSQmbW/MH
         mJPtJLVxWQgNZ4xntIawqzguN3Oe/q2ziPxih104gdbOw05V90pzarH+ZG5bi6sm80yK
         ZC0J+zM5itrjJpuwQdKQ31DrYzE1wH/n768ySA32hP4C+2SperOoeevIJ0AYwankZ0td
         MBzSPnkXUlPPhnzBXEXKgnQFqaO0libsUKTs2Voav7FxciTwh+NqldXu8IHc+Y/Sh50i
         4a9DPfgWbTWIR1w073Pl+ebtbFf/0nxKctUOSGbg1p15QWIzekxIi7kyfkt3X/OUYLQu
         YKBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=ZUJ7PJnh;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.155 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:ironport-sdr:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lv+gGDldt0ecP5TZp8dQ+W1sjAy+GTNcwdzkwVKOTXQ=;
        b=SYMqNsuUP50IjyWVtAGpoSLNSLM2/Sj1tv3xVqKc/T45EicWOydac6UGK2WfGePZxJ
         roOAb39BBSLbQmUImB8ECOI3lCSgKXmwkrlKrWovXDXXuoch+BB1QRe5ogFseICJu3z8
         fsZccU3wBPDq60LLTiHtMvipcTWSZZvZhH1+pCiC4aqtc3BssHSX8cQQZtV9B9BbtM75
         tVJMbxEVoO4NDulQsmCf7OhAlkrmw91xT3H8RWUYoiUQVeM1xcxNwnvmlNOrkOU548AR
         EOUgTVc3wqAuEhTBV0aYcCG4rPV7MM5DSO0cE2yfhjsSPwZR58U9jpb2ENEyKe+m0Jci
         Fugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:ironport-sdr:from:to:cc:subject:date
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lv+gGDldt0ecP5TZp8dQ+W1sjAy+GTNcwdzkwVKOTXQ=;
        b=WqnnCnGuQqFj9Mi1YRk4Nz+8u/Rwa3t2EY5vnWW73zgUDXDAm8lg0EAMBnRvpWXsQL
         J4WMuy+8ujfT7n8B32CAA47khhUkMyqeo9NDObx6ei7zVQeAdTMcElWaokh9PjposNyi
         ND5LAyrKVrzmXZhjUGAQMC2l/4VGgQKbX+QFI/qMwGYjfwWx8UBQFY5fyZOqPFYoyRVG
         wzOKIuDwGVqzxmK8eFuRuEFko9GRNWauneltEGveRn/YWyRiiGkCd6kmwcObmC5GNSW7
         Fer9RI35PIPye3xaRo757bj8lunSJ6sQK5MuRq4NGBzBjxnwnHz/oiNsUByDLLZGs5Co
         HXyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3waBln/QxYCLF+p+LevGRjIbaAMClf90ObzVNs/em6NeehDj6R
	x5/MtPr5pwwTYC5j21vYRuQ=
X-Google-Smtp-Source: ADFU+vu2aAyVD12RVOTv1FrY2T0vOLWSIo6FQYZDwYBNQjiHAL8N2jX05CYFaWoWI3QFfRe2ykYJjA==
X-Received: by 2002:aa7:8f36:: with SMTP id y22mr2652988pfr.162.1585131283405;
        Wed, 25 Mar 2020 03:14:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:245:: with SMTP id fz5ls1762914pjb.3.canary-gmail;
 Wed, 25 Mar 2020 03:14:42 -0700 (PDT)
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr2577388plb.138.1585131282836;
        Wed, 25 Mar 2020 03:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585131282; cv=none;
        d=google.com; s=arc-20160816;
        b=QeLFUk6Rkcq9n95hTuZ3Mz8D2EvlDVc4vOJnGkXmtZ2FSNhOdKxV8DB8GCyhk2iTyK
         SSzuWWXQnbo0GO6lgU0zQ5a0C6Tihf9q+0Pi0OcQJOTkhcXmNycQ2zoIDO66AS8laJbZ
         ThEnA4xWCCvjclwAh40k7lsl56iy6zOT3GMUEd/8EKbrTKMO1JifhDjw7/ylGaIL2Tmu
         3znAk4hWwpIy+yJ/JFolEL8OiCQQwcuHDrrJewCOda7XmkxL/lLH9jUM2nK7jCKJ7S3M
         rU5dDn4f8sx0ytpGqXmO8m9tKhuYLh01PzucIa28pfk4Q3/GInySTTyBNv2ogvWPryaL
         10Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:ironport-sdr
         :dkim-signature;
        bh=KOIwnx6HRTmJcJSHKAjNfU5z6USMeWWw4NPXieF8UAw=;
        b=aBCfcCPSvObt/U/rnlZRDllECsbwOjFNYG4xEGmdIrVi3yFBh+ecZfhRLw7jSW8Zq6
         e2ZklInY/cqFw2cwRzv7K26hFIPup9GVm5hIw8s8jqhTnaPP6PpPVXUF8cfN7zAvvqz5
         i5O1DjX1WQLcmn9C/5Xsu5t1ns9eP8LEQTRNrSVB7t8MKvYLiba4OlmCPrZDhEvmPul7
         vb72ffrToR4R0qWmeL+aelUxHg35Hh8Jx6RcM2labkq+Qz+O3JVfD7vSenj/N1zywZD+
         rSBkyfsLKzBCrVRUO904FjWgPoMxjJPylxqQT7a0h+BCMzvfF48c3n5NVfsrlIwmR/TH
         BzgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=ZUJ7PJnh;
       spf=pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.155 as permitted sender) smtp.mailfrom=Andrew.Cooper3@citrix.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com. [216.71.145.155])
        by gmr-mx.google.com with ESMTPS id y1si341301pjv.2.2020.03.25.03.14.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2020 03:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.155 as permitted sender) client-ip=216.71.145.155;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  andrew.cooper3@citrix.com) identity=pra;
  client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="andrew.cooper3@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
  Andrew.Cooper3@citrix.com designates 162.221.158.21 as
  permitted sender) identity=mailfrom;
  client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="Andrew.Cooper3@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
  ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@mail.citrix.com) identity=helo;
  client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Andrew.Cooper3@citrix.com";
  x-sender="postmaster@mail.citrix.com";
  x-conformance=sidf_compatible
IronPort-SDR: r/duezuPH95hneB0/6WiVnY7dVNcDiDLinZUb8n5MUnf4OrVPpdVF0jTSag0GTB1xkfm3Ubrjl
 2Br2IgAz9LjqMDwhGObwCn1Lfzw1mDFw0IjvtGT2TCIqUUVEbMm5Zf+I5oK/+vkmb+vOkrWJXc
 h5kwlYMlRzDU7VOb9XZMt1Nxgor5pBpwSsNp7ucLyVvjiR57qDj84b/Bw7N0GSjIpc2CEjH0wj
 64ZZ4MkvLSazeACNFca1jBl3m5g9jDggi6n+sH9Z+rpIaPVlrc9u/rATgDrmBsoIunkNXXOv1C
 lM8=
X-SBRS: 2.7
X-MesageID: 14580578
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; 
   d="scan'208";a="14580578"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: LKML <linux-kernel@vger.kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, <x86@kernel.org>, "Jan
 Kiszka" <jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, "David
 Howells" <dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh
 Boyer <jwboyer@redhat.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Steve
 Wahl <steve.wahl@hpe.com>, Mike Travis <mike.travis@hpe.com>, Dimitri
 Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Giovanni Gherdovich
	<ggherdovich@suse.cz>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len
 Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>, Martin Molnar
	<martin.molnar.programming@gmail.com>, Pingfan Liu <kernelfans@gmail.com>,
	<jailhouse-dev@googlegroups.com>
Subject: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot path
Date: Wed, 25 Mar 2020 10:14:31 +0000
Message-ID: <20200325101431.12341-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: andrew.cooper3@citrix.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@citrix.com header.s=securemail header.b=ZUJ7PJnh;       spf=pass
 (google.com: domain of andrew.cooper3@citrix.com designates 216.71.145.155 as
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

Linux has an implementation of the Universal Start-up Algorithm (MP spec,
Appendix B.4, Application Processor Startup), which includes unconditionally
writing to the Bios Data Area and CMOS registers.

The warm reset vector is only necessary in the non-integrated Local APIC case.
UV and Jailhouse already have an opt-out for this behaviour, but blindly using
the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.

Drop the warm_reset flag from struct x86_legacy_features, and tie the warm
vector modifications to the integrated-ness of the Local APIC.  This has the
advantage of compiling the warm reset logic out entirely for 64bit builds.

CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: x86@kernel.org
CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: James Morris <jmorris@namei.org>
CC: David Howells <dhowells@redhat.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Matthew Garrett <mjg59@google.com>
CC: Josh Boyer <jwboyer@redhat.com>
CC: Zhenzhong Duan <zhenzhong.duan@oracle.com>
CC: Steve Wahl <steve.wahl@hpe.com>
CC: Mike Travis <mike.travis@hpe.com>
CC: Dimitri Sivanich <dimitri.sivanich@hpe.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Giovanni Gherdovich <ggherdovich@suse.cz>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
CC: Len Brown <len.brown@intel.com>
CC: Kees Cook <keescook@chromium.org>
CC: Martin Molnar <martin.molnar.programming@gmail.com>
CC: Pingfan Liu <kernelfans@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: jailhouse-dev@googlegroups.com
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Thomas: I finally found the reference we were discussing in Portland.  Sorry
this patch took so long.

I don't have any non-integrated APIC hardware to test with.  Can anyone help
me out?
---
 arch/x86/include/asm/x86_init.h    |  1 -
 arch/x86/kernel/apic/x2apic_uv_x.c |  1 -
 arch/x86/kernel/jailhouse.c        |  1 -
 arch/x86/kernel/platform-quirks.c  |  1 -
 arch/x86/kernel/smpboot.c          | 21 ++++++++++++---------
 5 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 96d9cd208610..006a5d7fd7eb 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -229,7 +229,6 @@ enum x86_legacy_i8042_state {
 struct x86_legacy_features {
 	enum x86_legacy_i8042_state i8042;
 	int rtc;
-	int warm_reset;
 	int no_vga;
 	int reserve_bios_regions;
 	struct x86_legacy_devices devices;
diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
index ad53b2abc859..5afcfd193592 100644
--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -343,7 +343,6 @@ static int __init uv_acpi_madt_oem_check(char *_oem_id, char *_oem_table_id)
 	} else if (!strcmp(oem_table_id, "UVH")) {
 		/* Only UV1 systems: */
 		uv_system_type = UV_NON_UNIQUE_APIC;
-		x86_platform.legacy.warm_reset = 0;
 		__this_cpu_write(x2apic_extra_bits, pnodeid << uvh_apicid.s.pnode_shift);
 		uv_set_apicid_hibit();
 		uv_apic = 1;
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 6eb8b50ea07e..d628fe92d6af 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -210,7 +210,6 @@ static void __init jailhouse_init_platform(void)
 	x86_platform.calibrate_tsc	= jailhouse_get_tsc;
 	x86_platform.get_wallclock	= jailhouse_get_wallclock;
 	x86_platform.legacy.rtc		= 0;
-	x86_platform.legacy.warm_reset	= 0;
 	x86_platform.legacy.i8042	= X86_LEGACY_I8042_PLATFORM_ABSENT;
 
 	legacy_pic			= &null_legacy_pic;
diff --git a/arch/x86/kernel/platform-quirks.c b/arch/x86/kernel/platform-quirks.c
index b348a672f71d..d922c5e0c678 100644
--- a/arch/x86/kernel/platform-quirks.c
+++ b/arch/x86/kernel/platform-quirks.c
@@ -9,7 +9,6 @@ void __init x86_early_init_platform_quirks(void)
 {
 	x86_platform.legacy.i8042 = X86_LEGACY_I8042_EXPECTED_PRESENT;
 	x86_platform.legacy.rtc = 1;
-	x86_platform.legacy.warm_reset = 1;
 	x86_platform.legacy.reserve_bios_regions = 0;
 	x86_platform.legacy.devices.pnpbios = 1;
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index d85e91a8aa8c..e2ebb0be2ee3 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1049,18 +1049,21 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
 	 * the targeted processor.
 	 */
 
-	if (x86_platform.legacy.warm_reset) {
+	/*
+	 * APs are typically started in one of two ways:
+	 *
+	 * - On 486-era hardware with a non-integrated Local APIC, a single
+	 *   INIT IPI is sent.  When the AP comes out of reset, the BIOS
+	 *   follows the warm reset vector to start_ip.
+	 * - On everything with an integrated Local APIC, the start_ip is
+	 *   provided in the Startup IPI message, sent as part of an
+	 *   INIT-SIPI-SIPI sequence.
+	 */
+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
 
 		pr_debug("Setting warm reset code and vector.\n");
 
 		smpboot_setup_warm_reset_vector(start_ip);
-		/*
-		 * Be paranoid about clearing APIC errors.
-		*/
-		if (APIC_INTEGRATED(boot_cpu_apic_version)) {
-			apic_write(APIC_ESR, 0);
-			apic_read(APIC_ESR);
-		}
 	}
 
 	/*
@@ -1118,7 +1121,7 @@ static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle,
 		}
 	}
 
-	if (x86_platform.legacy.warm_reset) {
+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
 		/*
 		 * Cleanup possible dangling ends...
 		 */
-- 
2.11.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200325101431.12341-1-andrew.cooper3%40citrix.com.

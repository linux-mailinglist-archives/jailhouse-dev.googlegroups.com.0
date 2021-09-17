Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRPPSGFAMGQEFPA6IRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262C40F68B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 13:11:02 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id g9-20020a0565123b8900b003f33a027130sf6456042lfv.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 04:11:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631877062; cv=pass;
        d=google.com; s=arc-20160816;
        b=0nQoHRG0j0opUeRFhD349TxbV6l3/jw/Tj4wxA5NaW5zQKybeb9qHoWBZbfnIa2CTV
         Q+Tlzah+/o56nwHw7/3d0OzyQqmqPm5XKURd5GPhR39yYHvVioYSXPYl5ymD+qjQzIuF
         Y3TrgUcVOFnAFcorav551d7B+NcWTXZ59ZUNjlshgom0wPPTFzFKzNIoSS003Xpc/xXW
         I95BligPW3a8plIJ+mr9E9r+ZKLfcsedp6+kB8ydDOiKdDKSTsRF7Bph8YB1PMsRhvpt
         eEU71Gk51reAlZLAXkQBam5/uMM6KIMbz91FuL9cIsq4oi4dQ1Sa6RHL0SEYG3frcSis
         DzRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=cdGnfw9xMTcI+lg04NwLCQpky+vCE2HGHjukBwKY2YI=;
        b=UimrhEP7ais5PlPfaTxnqODbY2xGhgHAkE43FxAfyPbVpOSm9NGZIuXrX2l+G1eaHA
         Jrw7eqe4Vx4rT4phKpuzA1qwexMv0HpNmUMUKe99sPmz4689DPEi3kf6BQt5BgvYx+B+
         rpGiBmuBdiKudZT9EHmpJBoYyR0A/1pZj2IwAsJWILjv8rzsMsKFXoJWEzQlwj5QCduB
         TvUQr66b78/WzlCQBLP6UabdGSNFF0FOnKUmYd++W0C25AnVyyTmwOGr8ptRg97qY/zR
         QlFntvMbWQhvBU/8Eq2EKWOE5AMefmSKJcAe6vZsHBaDJBaLOxGeRUtnr0tJSbn9L8cb
         fxnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cdGnfw9xMTcI+lg04NwLCQpky+vCE2HGHjukBwKY2YI=;
        b=OPyrrNPjNKhGjjYc2acie9EebGt0M9y9KQl3nfTKoq08OVy0HL/OhNSB9hLqY/UMUJ
         97YFfOr3V51+fXdZDTYvIBzNz30HcPrScl644kZOyUMdVeIqL10Pxpyf/wfF7B6csK8t
         P2rHiOgeXCamiTLdDNzFaFuNV3OyJZT4ulpUJlziWNv3IuKyMhaP87AJZfbTC1j1t7Gm
         hg37L/jl1b9SwZpqRpfx/YxmNMvON+TSdKdX9PCjT4jXr1v6OU/2o936fvb9F0pp2GRY
         mCM2H1b4fftYctvSO9Db/6MockqLGS8EXpQOujQBJ4ltszbInp+mNkpRGaCLzGPt7Yoh
         XQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cdGnfw9xMTcI+lg04NwLCQpky+vCE2HGHjukBwKY2YI=;
        b=C12E3lHRyPdFzEYJ5ksXAeTloAQadCxA4LV755cjQu43AOBw8W8id9VImeIxF4mvro
         c1iWZGhpizJXrWaBH0+ed8SYumRmR+KWaLn0QxqsOnR6WgUnvLTkh6hPCmJlQH2AlhVd
         I3BC1Wii7YNx2DyetreXTbYCEMcCcMEDwwiuITcMEjq5ti9lGPS/Fdx7k5cyA9L8T9bm
         sqW1hWo39apVOXgRiCONl+NkzLy7GFFAcUptmQyGszTLcMCfNuRhAfAx84TTOSdxgWLE
         nBcGFKeYhZaN7N0cSrgEXMiOMNAPb+d7BaKhngmXQGNWhibHDcBmCHgNiKn9LyO7Zj5y
         pzvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533n8gBc76Ho4qPpPfAiJnSo9gUw90bOh/6rmRQx/JeOhn2pnnam
	cl/6EmY4zO51laJM4TdJlRA=
X-Google-Smtp-Source: ABdhPJzrlwnWNNy5Vt4ZCdcUOKDrD1oyHZw8A+O3Y1+Al/VayrFVt9W3pEi6+U7pOlgf4yUF3OhL/Q==
X-Received: by 2002:a2e:165b:: with SMTP id 27mr6467167ljw.485.1631877061865;
        Fri, 17 Sep 2021 04:11:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls1596868lfi.2.gmail; Fri, 17 Sep
 2021 04:11:00 -0700 (PDT)
X-Received: by 2002:a05:6512:696:: with SMTP id t22mr1300617lfe.156.1631877060677;
        Fri, 17 Sep 2021 04:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631877060; cv=none;
        d=google.com; s=arc-20160816;
        b=eKYyqLzob7LB+dS71WSHDZACv9MQA8NC4bwjCqIUh9XNYNObpWwaaa8WaG1XG9/jfm
         fRjOrfw6P6pHNNu0niObXbxCAGsgwFMLtatbsEXJyTl9014U4OuWcAD0TkDtsn8jpvR2
         mshyNCyn9SGf0joIoD3KLYkNDKSVyT38wJv3y80KaLVKCmvhRfjinQT3j/UzaS3XVn/w
         wRLBXZIpAUMGta0e5BRAy/PVOXc4oRMGyxc9t2GGReNB1EtH2zcLq39g2DFXhesTqmOw
         I/BoratGIhQkHfiM00fvOtE3BtSC2O+XH3/0yL4+cZBil6RRLA/x8oQGwuOZ5l9/eWkn
         1Akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=QCM0rZ3NEaCMw2jnncpGQqm4Dj7HNy8ZrNMgPiWhXQA=;
        b=UxoAGpgGtyk9ou9Lg2kZ2EyIFxP9gbodsAJadsZBuq1RC2vurAuLbWmVPo0tBbvjlI
         hmn3QGf3drrMcQQcWDpRCikPjaVSZ2ylF/XD6R/PvBeHyjA9GT3TsA+xXp/T3ww2Qt3F
         C3hipUP+GlxBu1Ws/m6pxVcKTaeE0qoR0ZEXccEfbnxYBzwb5p78U8hReS4sjrksvDm8
         xGaWIodnu68NvTptxQnueC17pCP0Wc+QT38cPrgRE06ndMFzLUsmFqw3qOycvVCU8eFe
         /8kuBBAphvwsSFsAVjIaKRNU1X4L2bhM3X2FtQd+TJBFGYKcVt5naXu/ZRhLCQnOfQ83
         WYsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f16si655410ljj.3.2021.09.17.04.11.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Sep 2021 04:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 18HBAxZU028685
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Sep 2021 13:10:59 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18HBAxub028615;
	Fri, 17 Sep 2021 13:10:59 +0200
Subject: Re: [PATCH 1/2] Makefile/Kbuild: Fix "FORCE prerequisite is missing"
 warning
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dec7614e-23e8-5381-6528-24c486a038f6@siemens.com>
Date: Fri, 17 Sep 2021 13:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 17.09.21 09:46, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> With Linux kernel has a change that
> "kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and
> filechk", so add FORCE in Makefile/Kbuild to avoid build warning.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Kbuild                         | 4 ++--
>  configs/Makefile               | 2 +-
>  hypervisor/Makefile            | 6 +++---
>  hypervisor/arch/x86/Kbuild     | 6 +++---
>  inmates/lib/arm64/Makefile.lib | 4 ++--
>  inmates/lib/x86/Makefile       | 4 ++--
>  inmates/lib/x86/Makefile.lib   | 4 ++--
>  tools/Makefile                 | 6 +++---
>  8 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/Kbuild b/Kbuild
> index b76a8dd7..2863c121 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -46,12 +46,12 @@ $(GEN_VERSION_H): $(src)/Makefile FORCE
>  
>  quiet_cmd_gen_pci_defs = GEN     $@
>  define cmd_gen_pci_defs
> -	$^ $(src)/include/jailhouse/pci_defs.h > $@
> +	$< $(src)/include/jailhouse/pci_defs.h > $@
>  endef
>  
>  GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
>  
> -$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
> +$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh FORCE
>  	$(call if_changed,gen_pci_defs)
>  
>  subdir-y := hypervisor configs inmates tools
> diff --git a/configs/Makefile b/configs/Makefile
> index 74b35f0d..327043b7 100644
> --- a/configs/Makefile
> +++ b/configs/Makefile
> @@ -38,5 +38,5 @@ targets += $(DTS:.dts=.dtb)
>  # prevent deleting intermediate files which would cause rebuilds
>  .SECONDARY: $(addprefix $(obj)/,$(CONFIGS:.c=.o))
>  
> -$(obj)/%.cell: $(obj)/%.o
> +$(obj)/%.cell: $(obj)/%.o FORCE
>  	$(call if_changed,objcopy)
> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> index 3807e608..8ae4e332 100644
> --- a/hypervisor/Makefile
> +++ b/hypervisor/Makefile
> @@ -80,7 +80,7 @@ ASM_DEFINES_H := arch/$(SRCARCH)/include/generated/asm/asm-defines.h
>  
>  targets := $(ASM_DEFINES_H) arch/$(SRCARCH)/asm-defines.s
>  
> -$(obj)/arch/$(SRCARCH)/asm-defines.s: $(src)/arch/$(SRCARCH)/asm-defines.c
> +$(obj)/arch/$(SRCARCH)/asm-defines.s: $(src)/arch/$(SRCARCH)/asm-defines.c FORCE
>  	$(call if_changed_dep,cc_s_c)
>  
>  $(obj)/$(ASM_DEFINES_H): $(obj)/arch/$(SRCARCH)/asm-defines.s
> @@ -110,13 +110,13 @@ HYPERVISOR$(1)_OBJS = $$(addprefix $$(obj)/,$$(hypervisor$(1)-y))
>  LDFLAGS_hypervisor$(1).o := --whole-archive -T
>  
>  targets += hypervisor$(1).o
> -$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds $$(HYPERVISOR$(1)_OBJS)
> +$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds $$(HYPERVISOR$(1)_OBJS) FORCE
>  	$$(call if_changed,ld)
>  
>  OBJCOPYFLAGS_jailhouse$(1).bin := -O binary -R .eh_frame
>  
>  targets += jailhouse$(1).bin
> -$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o
> +$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o FORCE
>  	$$(call if_changed,objcopy)
>  endef
>  
> diff --git a/hypervisor/arch/x86/Kbuild b/hypervisor/arch/x86/Kbuild
> index a6badcac..7a42adb4 100644
> --- a/hypervisor/arch/x86/Kbuild
> +++ b/hypervisor/arch/x86/Kbuild
> @@ -40,10 +40,10 @@ intel-objs := vmx.o vtd.o vmx-vmexit.o $(common-objs-y) cat.o
>  targets += $(amd-objs) $(intel-objs)
>  
>  quiet_cmd_link_archive = AR      $@
> -cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> +cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(filter-out FORCE,$^)
>  
> -$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs))
> +$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs)) FORCE
>  	$(call if_changed,link_archive)
>  
> -$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs))
> +$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs)) FORCE
>  	$(call if_changed,link_archive)
> diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
> index 2ea037cd..5df2632d 100644
> --- a/inmates/lib/arm64/Makefile.lib
> +++ b/inmates/lib/arm64/Makefile.lib
> @@ -58,8 +58,8 @@ endef
>  
>  .SECONDEXPANSION:
>  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> -		   $(INMATES_LIB)/lib.a
> +		   $(INMATES_LIB)/lib.a FORCE
>  	$(call if_changed,ld)
>  
> -$(obj)/%.bin: $(obj)/%-linked.o
> +$(obj)/%.bin: $(obj)/%-linked.o FORCE
>  	$(call if_changed,objcopy)
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index 35f04161..a3e149b3 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -51,9 +51,9 @@ lib-y := $(TARGETS) $(TARGETS_64_ONLY)
>  lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
>  
>  quiet_cmd_link_archive32 = AR      $@
> -cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> +cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $*

Is $* really correct here? Elsewhere, you do a filter-out of FORCE from $^.

>  
> -$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
> +$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y)) FORCE
>  	$(call if_changed,link_archive32)
>  
>  targets += $(lib32-y)
> diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
> index 872b7ce0..b5748565 100644
> --- a/inmates/lib/x86/Makefile.lib
> +++ b/inmates/lib/x86/Makefile.lib
> @@ -57,10 +57,10 @@ endef
>  # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
>  .SECONDEXPANSION:
>  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> -		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> +		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) FORCE
>  	$(call if_changed,ld)
>  
> -$(obj)/%.bin: $(obj)/%-linked.o
> +$(obj)/%.bin: $(obj)/%-linked.o FORCE
>  	$(call if_changed,objcopy)
>  
>  # 32-bit (i386) support
> diff --git a/tools/Makefile b/tools/Makefile
> index 4faf9430..1108433a 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -111,7 +111,7 @@ define cmd_gen_man
>  	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
>  endef
>  
> -$(obj)/%: $(obj)/%.o
> +$(obj)/%: $(obj)/%.o FORCE
>  	$(call if_changed,ld)
>  
>  CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
> @@ -122,13 +122,13 @@ LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
>  targets += jailhouse-gcov-extract.o
>  always-y += jailhouse-gcov-extract
>  
> -$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
> +$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl FORCE
>  	$(call if_changed,gen_collect)
>  
>  targets += $(MAN8_PAGES)
>  always-y +=  $(MAN8_PAGES)
>  
> -$(obj)/%.8: $(src)/%.8.in
> +$(obj)/%.8: $(src)/%.8.in FORCE
>  	$(call if_changed,gen_man)
>  
>  install-bin: $(BINARIES) $(DESTDIR)$(sbindir)
> 

Looks good otherwise.

This affects 5.15+, right? Worth mentioning in the commit log.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dec7614e-23e8-5381-6528-24c486a038f6%40siemens.com.

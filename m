Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZETZH4QKGQER7PSNWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C729241738
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:33:57 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id e15sf4783076ejk.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:33:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597131237; cv=pass;
        d=google.com; s=arc-20160816;
        b=oqZZ5eO9Xf8RhkEOV6vzRU8fXQfKavUSOKDgoO21pM9DO7MCOezQAZUDwTkFa4cSH4
         WCGAhscGh8rHWPolZOo0klq7eZFn62X8jWDG0d47qix1lwJXcrjzKMTMQXuKnQ3Nzd3u
         kpCsx3oToXraUACO6My3hNu5pLso8Ha/ep3nsvXgqMd+WV3CdaCmG+sJ5bXHr5nshbS+
         DV9Nr46mjb+xiD6/4JTJRbYnAaRNeN8zdFq2tbVtc3maLHo3qMot7gc+8x/dZBSZQOOr
         GjrqfocZKx8ugTf5JpOV44NIKj/GzrktnA6u/hINhQMv/FD7RWoLMJVx1TIBacNTAmW6
         2XCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=CLYfLPfhm80n/eS+GVJt/1Z1zGIlX2pcYR7+paOxJIE=;
        b=OEh4B+/GYP3KDVAZ+9Vr6vcKCPQDlL9DkuL538w6o/7ViDLeIzidGstibGHEuVCBay
         58yBVe0S8xFJ00p2AUqMRFK+vQNAOt94e0gePwGvoo0yOvgxrrfqJ+OMyPRtOvynR3JH
         SexL6+nRB8nF1edhglE6IbQCMsp/+dEOjk+QILLTHx2PxE7sD1aNT8mjLQVIAiEkU+nU
         4VvKCF9ONKZVknP1FJrn9rhY6k/+7afJgMYcNx/trAyIfmNAEcCjoHxUtgMSn5JNWDA0
         FhS06GltFzGfKesfdUKGx7Jng8ENMk6YUkkmqVXz5/KnB6CVWThE+U5wIGCHWka9g2lG
         KnPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CLYfLPfhm80n/eS+GVJt/1Z1zGIlX2pcYR7+paOxJIE=;
        b=gFVTMGenT8B4EUZVBF8HHA0MPEMTbBOTgG6jCIjwNoJeN1oOU/zdkr9W8nOL5L7+rC
         NAOn36q8d3f+BeZjP7T6Uz2q96O93QmtlDhSb1nUA4dnHWXj5GnENjHAwtpRLoDkBFJL
         Ug0Mo6JOSNb4Itb1cNKEasCCuBt5nwDSjVUB7MdtPCHNAS0ClNv3v47hK74y7xn+Znba
         P7PwVf1KRcynRj8FGdJj+eKwvb746KfWbwXIbsndswNG1qlp8fXAXbXMiqEuvGZk8m86
         oHs544kLxSkuCIJ3g0RWlouSKRjtSg3Dr3z6li+XOMl5TOFMtDTuR9nz5RIDLVWVd5L9
         Hgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CLYfLPfhm80n/eS+GVJt/1Z1zGIlX2pcYR7+paOxJIE=;
        b=jVtyiRK/wYH0CTAR0SWIRPzevEbZklGCB2keSZxffrz6Xbc1P3bLMmPCqWjvYD1jBG
         cRLg7sM/tqEK78Az1qMBSSE7gA6OyEuihHN4L6UAku76Ie21sudyQyvfD+collS14C3k
         Li4panz2hPXoSANLIZj420/2aU6A0snixQZpcgdyDz5tQAcfnylxV0okc1F6/7NiXy0T
         H1Yy8SNqgz3cQapgYMkKJ/qpcsT9wrpvR4EnDeVxqzB+ERlM3G4WHvSdol5Med57/9uY
         P8pnSC8ry4IkkIWIUbdrwNI0QjHmkJXHMX4jVAsszhyT0XzMdal8V4cwNz/zs4FCR8rv
         o3tA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fsEzuGwxWr4cPukNoocseCElbKCMAlEbQqq0oY5RMKLXTvDYO
	5gzhBngRIeEHlSi+rqULBAM=
X-Google-Smtp-Source: ABdhPJyOPMyCn+HQ3eXNeeJkG0v+EHhbRZ5ZS9Ve+XGhxFpcSALe5aUSpGImgRl1moM+L+a74JgUEg==
X-Received: by 2002:a17:906:819:: with SMTP id e25mr26331081ejd.95.1597131236861;
        Tue, 11 Aug 2020 00:33:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:baa2:: with SMTP id x31ls1165957ede.0.gmail; Tue, 11 Aug
 2020 00:33:56 -0700 (PDT)
X-Received: by 2002:aa7:c88f:: with SMTP id p15mr25093767eds.33.1597131236065;
        Tue, 11 Aug 2020 00:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597131236; cv=none;
        d=google.com; s=arc-20160816;
        b=Fo2w4B3Oec3YSgBn3WSs1Xu3/F6PPEpxl3BXe3h4hSjlgrqbAejusmHlT4y8YoM5X6
         s4ovsuRjgJAhd+Tn74cX+Ya9HriV3xjjDaWet0Q/7iN0fcGwVTUhapF7LNfiO1SmJJw0
         +aLAdb55xNaT3ybn0m4zpbn9VCXtEsg+JRVitqCboT841frAxujPH9KTdGUr1UslLlCM
         UV6+k7cjy0k4r/l8SLosAcfbjvgh7IcnG3RK8Wo61i87Z3PUkKC0lQtGrmdgWgJPNESZ
         gXKy3NciT83sqjQYi08CqMYwBtxl3M9px4cjRuhDW4uA7pZmjk29Js/qXo39kjEo/ErV
         L+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=5KY5ZD7Q/qt3hWgbN53tHpD4UVVAuEs907aMhujsNiY=;
        b=jN4CZWSoGY3u5UFCK9KlQqmvT7a5c8Q3oHSxhfM/6+6fz9uoPSaBo4dQCU7Gqhva+L
         neJQd2Qec5JIRuNrNeNG2VKO4F3ISy4btduD9NjKrCcEs/NbaTopyEvjoBHY+67MKkTV
         KyfbPOrb+PF27nuy8WUj1cTWBdULWnU7Gtr1i6KD0giYJ5qRbZ4jV2En1VljugfruOmv
         TNx0ekeprn+ackM0pvd7Z0Gh+UKZoWAl6togRw+DAnuafG3k35OaYktpG4oQ5UDibSZE
         z3qoeiaab6n7aaVuxT5OTknVCvc2e6MsdDQ2s9hrBw5c6/WMNUqXtMyzqI9lWdK3bEdZ
         kYnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o23si812099edq.5.2020.08.11.00.33.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07B7Xt5F027134
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 09:33:55 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B7XsMX005531;
	Tue, 11 Aug 2020 09:33:55 +0200
Subject: Re: [PATCH 06/10] Add libbaremetal
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
Date: Tue, 11 Aug 2020 09:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807030632.28259-7-peng.fan@nxp.com>
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

On 07.08.20 05:06, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add libbaremetal for sharing code between inmates and jailhouse
> baremetal loader.
> 
> The Makefile code is copied from inmates, currently only string.c
> is moved from inmates to libbaremetal. In future, we might
> need to share uart/mmu and etc.

Might quickly become confusing to have two libs. What prevents renaming
inmates/lib completely into libbaremetal? Sure, there are some jailhouse
specifics in inmates/lib, but those could likely be put in some corner.

Jan

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Kbuild                                 |  4 +-
>  inmates/Makefile                       |  4 ++
>  inmates/lib/arm-common/Makefile.lib    |  2 +-
>  inmates/lib/arm/Makefile.lib           |  2 +-
>  inmates/lib/arm64/Makefile.lib         |  2 +-
>  inmates/lib/x86/Makefile               |  2 +-
>  inmates/lib/x86/Makefile.lib           |  3 +-
>  libbaremetal/Makefile                  | 46 +++++++++++++++++++++++
>  libbaremetal/arm-common/Makefile.lib   | 41 ++++++++++++++++++++
>  libbaremetal/arm/Makefile              | 44 ++++++++++++++++++++++
>  libbaremetal/arm/Makefile.lib          | 63 +++++++++++++++++++++++++++++++
>  libbaremetal/arm64/Makefile            | 44 ++++++++++++++++++++++
>  libbaremetal/arm64/Makefile.lib        | 63 +++++++++++++++++++++++++++++++
>  {inmates/lib => libbaremetal}/string.c |  0
>  libbaremetal/x86/Makefile              | 66 ++++++++++++++++++++++++++++++++
>  libbaremetal/x86/Makefile.lib          | 69 ++++++++++++++++++++++++++++++++++
>  16 files changed, 449 insertions(+), 6 deletions(-)
>  create mode 100644 libbaremetal/Makefile
>  create mode 100644 libbaremetal/arm-common/Makefile.lib
>  create mode 100644 libbaremetal/arm/Makefile
>  create mode 100644 libbaremetal/arm/Makefile.lib
>  create mode 100644 libbaremetal/arm64/Makefile
>  create mode 100644 libbaremetal/arm64/Makefile.lib
>  rename {inmates/lib => libbaremetal}/string.c (100%)
>  create mode 100644 libbaremetal/x86/Makefile
>  create mode 100644 libbaremetal/x86/Makefile.lib
> 
> diff --git a/Kbuild b/Kbuild
> index 0b25e26e..dc6423ad 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -51,7 +51,7 @@ GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
>  $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
>  	$(call if_changed,gen_pci_defs)
>  
> -subdir-y := hypervisor configs inmates tools
> +subdir-y := hypervisor configs inmates tools libbaremetal
>  
>  subdir-ccflags-y := -Werror
>  
> @@ -62,6 +62,8 @@ ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
>  
>  $(obj)/driver $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
>  
> +$(addprefix $(obj)/,inmates): $(addprefix $(obj)/,libbaremetal)
> +
>  $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)
>  
>  $(obj)/tools: $(GEN_PCI_DEFS_PY)
> diff --git a/inmates/Makefile b/inmates/Makefile
> index 095055c8..44354c87 100644
> --- a/inmates/Makefile
> +++ b/inmates/Makefile
> @@ -15,7 +15,11 @@
>  INMATES_LIB = $(src)/lib/$(SRCARCH)
>  export INMATES_LIB
>  
> +BAREMETAL_LIB = $(src)/../libbaremetal/$(SRCARCH)
> +export BAREMETAL_LIB
> +
>  INCLUDES := -I$(INMATES_LIB) \
> +	    -I$(BAREMETAL_LIB)/include \
>  	    -I$(src)/../include/arch/$(SRCARCH) \
>  	    -I$(src)/lib/include \
>  	    -I$(src)/../include	\
> diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
> index 3d7b335d..d99102a9 100644
> --- a/inmates/lib/arm-common/Makefile.lib
> +++ b/inmates/lib/arm-common/Makefile.lib
> @@ -36,7 +36,7 @@
>  # THE POSSIBILITY OF SUCH DAMAGE.
>  #
>  
> -objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
> +objs-y := ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
>  objs-y += ../printk.o ../pci.o
>  objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
>  objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
> diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
> index 0976f894..4b4165bb 100644
> --- a/inmates/lib/arm/Makefile.lib
> +++ b/inmates/lib/arm/Makefile.lib
> @@ -56,7 +56,7 @@ endef
>  
>  .SECONDEXPANSION:
>  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> -		   $(INMATES_LIB)/lib.a
> +		   $(INMATES_LIB)/lib.a $(BAREMETAL_LIB)/lib.a
>  	$(call if_changed,ld)
>  
>  $(obj)/%.bin: $(obj)/%-linked.o
> diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
> index 0976f894..6d5df339 100644
> --- a/inmates/lib/arm64/Makefile.lib
> +++ b/inmates/lib/arm64/Makefile.lib
> @@ -56,7 +56,7 @@ endef
>  
>  .SECONDEXPANSION:
>  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> -		   $(INMATES_LIB)/lib.a
> +                   $(INMATES_LIB)/lib.a $(BAREMETAL_LIB)/lib.a
>  	$(call if_changed,ld)
>  
>  $(obj)/%.bin: $(obj)/%-linked.o
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index 40d3eba2..74e38b5a 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -42,7 +42,7 @@ always := lib.a lib32.a
>  
>  TARGETS := cpu-features.o excp.o header-common.o irq.o ioapic.o printk.o
>  TARGETS += setup.o uart.o
> -TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o ../test.o
> +TARGETS += ../alloc.o ../pci.o ../cmdline.o ../setup.o ../test.o
>  TARGETS += ../uart-8250.o ../printk.o
>  TARGETS_32_ONLY := header-32.o
>  TARGETS_64_ONLY := mem.o pci.o smp.o timing.o header-64.o
> diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
> index 6190315b..754dc426 100644
> --- a/inmates/lib/x86/Makefile.lib
> +++ b/inmates/lib/x86/Makefile.lib
> @@ -55,7 +55,8 @@ endef
>  # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
>  .SECONDEXPANSION:
>  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> -		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> +		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) \
> +		   $(BAREMETAL_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
>  	$(call if_changed,ld)
>  
>  $(obj)/%.bin: $(obj)/%-linked.o
> diff --git a/libbaremetal/Makefile b/libbaremetal/Makefile
> new file mode 100644
> index 00000000..f36a2d09
> --- /dev/null
> +++ b/libbaremetal/Makefile
> @@ -0,0 +1,46 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2013
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +-include $(GEN_CONFIG_MK)
> +
> +BAREMETAL_LIB := $(src)/$(SRCARCH)
> +export BAREMETAL_LIB
> +
> +INCLUDES := -I$(BAREMETAL_LIB) \
> +	    -I$(src)/../include/arch/$(SRCARCH) \
> +	    -I$(src)/include \
> +	    -I$(src)/../include
> +
> +ifeq ($(subst arm64,arm,$(SRCARCH)),arm)
> +INCLUDES += -I$(src)/../hypervisor/arch/arm-common/include
> +INCLUDES += -I$(src)/arm-common/include
> +endif
> +
> +LINUXINCLUDE  := $(INCLUDES)
> +KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
> +KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
> +		 -Wmissing-declarations -Wmissing-prototypes \
> +		 -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
> +		 -fno-common -fno-stack-protector -ffreestanding \
> +		 -ffunction-sections \
> +		 -D__LINUX_COMPILER_TYPES_H
> +ifneq ($(wildcard $(INC_CONFIG_H)),)
> +KBUILD_CFLAGS += -include $(INC_CONFIG_H)
> +endif
> +
> +OBJCOPYFLAGS := -O binary
> +# prior to 4.19
> +LDFLAGS += --gc-sections -T
> +# since 4.19
> +KBUILD_LDFLAGS += --gc-sections -T
> +
> +subdir-y := $(SRCARCH)
> diff --git a/libbaremetal/arm-common/Makefile.lib b/libbaremetal/arm-common/Makefile.lib
> new file mode 100644
> index 00000000..7b650a44
> --- /dev/null
> +++ b/libbaremetal/arm-common/Makefile.lib
> @@ -0,0 +1,41 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) OTH Regensburg, 2016
> +#
> +# Authors:
> +#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +objs-y := ../string.o
> +
> +common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/libbaremetal/arm/Makefile b/libbaremetal/arm/Makefile
> new file mode 100644
> index 00000000..952b1475
> --- /dev/null
> +++ b/libbaremetal/arm/Makefile
> @@ -0,0 +1,44 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2015, 2016
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +include $(INMATES_LIB)/Makefile.lib
> +include $(INMATES_LIB)/../arm-common/Makefile.lib
> +
> +always := lib.a
> +
> +lib-y := $(common-objs-y)
> diff --git a/libbaremetal/arm/Makefile.lib b/libbaremetal/arm/Makefile.lib
> new file mode 100644
> index 00000000..0976f894
> --- /dev/null
> +++ b/libbaremetal/arm/Makefile.lib
> @@ -0,0 +1,63 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) ARM Limited, 2014
> +# Copyright (c) Siemens AG, 2014
> +#
> +# Authors:
> +#  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +-include $(GEN_CONFIG_MK)
> +
> +LINUXINCLUDE += -I$(INMATES_LIB)/include
> +LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
> +
> +define DECLARE_TARGETS =
> + _TARGETS = $(1)
> + always := $$(_TARGETS)
> + # $(NAME-y) NAME-linked.o NAME.bin
> + targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
> +            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
> +endef
> +
> +# prevent deleting intermediate files which would cause rebuilds
> +.SECONDARY: $(addprefix $(obj)/,$(targets))
> +
> +.SECONDEXPANSION:
> +$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> +		   $(INMATES_LIB)/lib.a
> +	$(call if_changed,ld)
> +
> +$(obj)/%.bin: $(obj)/%-linked.o
> +	$(call if_changed,objcopy)
> diff --git a/libbaremetal/arm64/Makefile b/libbaremetal/arm64/Makefile
> new file mode 100644
> index 00000000..6d3cf399
> --- /dev/null
> +++ b/libbaremetal/arm64/Makefile
> @@ -0,0 +1,44 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2015
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +include $(BAREMETAL_LIB)/Makefile.lib
> +include $(BAREMETAL_LIB)/../arm-common/Makefile.lib
> +
> +always := lib.a
> +
> +lib-y := $(common-objs-y)
> diff --git a/libbaremetal/arm64/Makefile.lib b/libbaremetal/arm64/Makefile.lib
> new file mode 100644
> index 00000000..c4560721
> --- /dev/null
> +++ b/libbaremetal/arm64/Makefile.lib
> @@ -0,0 +1,63 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) ARM Limited, 2014
> +# Copyright (c) Siemens AG, 2014
> +#
> +# Authors:
> +#  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +-include $(GEN_CONFIG_MK)
> +
> +LINUXINCLUDE += -I$(INMATES_LIB)/include
> +LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
> +
> +define DECLARE_TARGETS =
> + _TARGETS = $(1)
> + always := $$(_TARGETS)
> + # $(NAME-y) NAME-linked.o NAME.bin
> + targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
> +            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
> +endef
> +
> +# prevent deleting intermediate files which would cause rebuilds
> +.SECONDARY: $(addprefix $(obj)/,$(targets))
> +
> +.SECONDEXPANSION:
> +$(obj)/%-linked.o: $$(addprefix $$(obj)/,$$($$*-y)) \
> +		   $(INMATES_LIB)/lib.a
> +	$(call if_changed,ld)
> +
> +$(obj)/%.bin: $(obj)/%-linked.o
> +	$(call if_changed,objcopy)
> diff --git a/inmates/lib/string.c b/libbaremetal/string.c
> similarity index 100%
> rename from inmates/lib/string.c
> rename to libbaremetal/string.c
> diff --git a/libbaremetal/x86/Makefile b/libbaremetal/x86/Makefile
> new file mode 100644
> index 00000000..e4e72b5b
> --- /dev/null
> +++ b/libbaremetal/x86/Makefile
> @@ -0,0 +1,66 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2015, 2016
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +include $(INMATES_LIB)/Makefile.lib
> +
> +always := lib.a lib32.a
> +
> +TARGETS := += ../string.o
> +
> +lib-y := $(TARGETS) $(TARGETS_64_ONLY)
> +lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
> +
> +quiet_cmd_link_archive32 = AR      $@
> +cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> +
> +$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
> +	$(call if_changed,link_archive32)
> +
> +targets += $(lib32-y)
> +
> +# Code of this object is called before SSE/AVX extensions are available. Ensure
> +# that the compiler won't generate unsupported instructions for this file.
> +CFLAGS_cpu-features.o += -mno-sse
> +
> +$(obj)/%-32.o: c_flags += -m32
> +$(obj)/%-32.o: $(src)/%.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/%-32.o: a_flags += -m32
> +$(obj)/%-32.o: $(src)/%.S FORCE
> +	$(call if_changed_rule,as_o_S)
> diff --git a/libbaremetal/x86/Makefile.lib b/libbaremetal/x86/Makefile.lib
> new file mode 100644
> index 00000000..6190315b
> --- /dev/null
> +++ b/libbaremetal/x86/Makefile.lib
> @@ -0,0 +1,69 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2013, 2014
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +# Alternatively, you can use or redistribute this file under the following
> +# BSD license:
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright
> +#    notice, this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright
> +#    notice, this list of conditions and the following disclaimer in the
> +#    documentation and/or other materials provided with the distribution.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> +# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> +# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> +# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> +# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> +# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> +# THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +-include $(GEN_CONFIG_MK)
> +
> +KBUILD_CFLAGS += -m64 -mno-red-zone
> +LINUXINCLUDE += -I$(INMATES_LIB)/include
> +
> +define DECLARE_TARGETS =
> + _TARGETS = $(1)
> + always := $$(_TARGETS)
> + # $(NAME-y) NAME-linked.o NAME.bin
> + targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
> +            $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
> +endef
> +
> +# prevent deleting intermediate files which would cause rebuilds
> +.SECONDARY: $(addprefix $(obj)/,$(targets))
> +
> +# obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
> +.SECONDEXPANSION:
> +$(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
> +		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
> +	$(call if_changed,ld)
> +
> +$(obj)/%.bin: $(obj)/%-linked.o
> +	$(call if_changed,objcopy)
> +
> +# 32-bit (i386) support
> +define DECLARE_32_BIT =
> + CFLAGS_$(1).o := -m32 -msse
> + LDFLAGS_$(1)-linked.o := /dev/null -m elf_i386 -T
> + $(1)_32 := y
> +endef
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4bfbd74f-843e-c3b9-47c7-31100d085052%40siemens.com.

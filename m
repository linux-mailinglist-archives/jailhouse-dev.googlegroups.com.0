Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBEPX2WFAMGQEVRBTAEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1841D5D0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 10:55:45 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id f21-20020ac25095000000b003fd0f3d19f4sf3783834lfm.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 01:55:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632992145; cv=pass;
        d=google.com; s=arc-20160816;
        b=C2EGYdDc6R8bPaA5shcFjjHPDN3GfqR/c85LBKb6XIJJeO8LMdZMqIAD4il9e6deX6
         UOWuWn+V9rgmJhsYji+H7kZqd44X1SCwX8QiEctBD/YZhenmwlkxoju4ZCtL321Ihck6
         5Q7ZVsgfXixn2sT3WasDFCT3D6qeJ4YILDvCFzbCJRlEVQ39kDPHP73d7HryJqlv8rgU
         erusvE8MjxWc+INCoXuGz1U0gAr5pPt0PPNd4pjO8OVGG49pYHrjO2fLGlZSmTY2Pc80
         hPOrqFBRHmTtsvltOoMr8CXiCA1eEsppLeD7kI108GhFDNocaLs/Lbzaisa22jmOPMkN
         oDIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=eFxa4uTDzrk6O6mq8GH76KtDQ1GKtTzC8Qfak9/7JbQ=;
        b=s90nmuVt1p6+1wSZFmPFBN1qo6ZUtHsRwZImk4a6ZlIZ10eNWo/EJO+ov4cSUKeEkp
         HRY8D89Tv9eN5GsocNs+92hEfeZTqO21M+RIU2+egRyn9XSk223G8jBZSLW5roInh/U/
         NPxYY6JmB7+3004q5vnALbLNoEWbqxwCN4hXZInj1NPtaskGPv4ilYNA6aKxHCZkGmAv
         G4COkbNb2mRtDkPvAQThA8J5a0i6ZqZv2PQla5WXZJtTcQYivyJm+snf2lKPFexKbX3P
         h2NPXMyppGG5zpP6GmWdujVV+lduoYFU6fBbbvC8KRpWl0T9I39G+Zfd+IP9Zhiq6djD
         kICA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="jP7Sex+/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eFxa4uTDzrk6O6mq8GH76KtDQ1GKtTzC8Qfak9/7JbQ=;
        b=M61FVGdXV/qYb7lehwPVzkF/4BawA1+KbcMoP6pUgTxn6WVBFqa2o7nv9ZicS9R3UA
         Jy7DLbi+MYVEQoohjohQqFSheBIukW+iEr8Bbaj0ngSbzcCPXctjVmlyIn12GFVy3E/O
         vjSb5kL4VsgP97lPYxPKs3rsNO7Pd48UQ9O4k05QhNE7s3jVOG7/E15gnPw/ozeVhOpf
         vhYmVtyxwcYJ+xuKYVsPmeYuy8DJml6nkNZuULgo4JXuGzt39rfn94B4arpZU1w9Lwup
         O2x8BaQnL4DPrLGlrhRjtwGVOyuzmeVA2c1wzAT0VSXm2Q/LzJ9UkhThdhjUOvUcoAiS
         dOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eFxa4uTDzrk6O6mq8GH76KtDQ1GKtTzC8Qfak9/7JbQ=;
        b=4YG1GsTDehJnvMA0j9JxAfRXWIwmqYbBT3shXp5tlT7aRXeHoVlQhn2hHguj11LELk
         pxuiWsPx0UCABGJXu/EbRIdGN0TA1eGNTprQbQO29X+/dH+MTqUnQFu0N8bVTSPtDH+a
         6UAEpOtJEgvkotbDyQtWLIJcaMpFo4V+LH9XzfiEVWhmr9jhbB+9mq9hJJA4j1NAcrlS
         V0eOP/2AxFiBJcmzWEk5s+Psbi4Jw79cByxAEUhUPsNNZ0TIN3q4QjvhTmu4lcMDq15k
         H9zbXGWj+1fhsIcwsRiS8snOdJ1L22i8qQEnpTE2wbhi87Zx/4ypcm3zlupr05YmfaMn
         xM/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5331TxfAwWYnmXz2VHv13ExE+KSr/9ydTFno5GdZPf4CcXkBXo7z
	zRBlczdkIb2pdMFLq8Z+CmE=
X-Google-Smtp-Source: ABdhPJyQI0i4KG1w7ra+ju8pdr0brsX7LaMXijZ6CwU50ouxDrJoetqL4vo0MrcZD6j98+jukRg2Ww==
X-Received: by 2002:a2e:3518:: with SMTP id z24mr4714159ljz.312.1632992145545;
        Thu, 30 Sep 2021 01:55:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f14:: with SMTP id y20ls34021lfa.1.gmail; Thu, 30
 Sep 2021 01:55:44 -0700 (PDT)
X-Received: by 2002:a19:550c:: with SMTP id n12mr4813480lfe.511.1632992144464;
        Thu, 30 Sep 2021 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632992144; cv=none;
        d=google.com; s=arc-20160816;
        b=LlZCPSYmRC78Yg+7G7tSoCKhDPeAg7y2Oem4sdd9VhDXPsdDHiRodI27yZnNYYce8b
         yEXY1n6w47wVhYRZH8CUFCH0ci8oX7+7rxEui39BVjgulXQJXNbEHrskfSP4qsLkxrDF
         Y14QfMOtECOjrvLv1/PYZ5R5Sf9zwvBO9/fnwNtn0Y9VdW8Oo1vGdgi1cwQbvmHixgWr
         JLDRbC4pis1FPsUSIG8SayvMUDmCaAX+AwRcAPQ/JxaUVTXbC/+ADukAY7FvzmCREwCK
         H7L32//8SjQhK4ZweVc8yFpNcdBYUQpn1rz4Gvo0CknzvLvaB/rRw9xyjarpEfCKTFXl
         2j3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IhvgwNMnO+3N/sRq4gSQajzwKBUys4KmJqg0tfQRJPU=;
        b=ksPDBEhVmGeg1iJJHjBGJEsXzTgUVzkmRSu4/rUnAJJZNfoEiDNHJKXKZ0AlbaCqwy
         2waFIE7sMKsdoNbdXZBqRMSPpNs7EvNERtAruiOuD+s4NrFPsJJypo5aqO+3Rw++G525
         RO1zv7smKdBcVtvudfHVh2qGy+zSQhZKuL2SA0nVrITuUFuf6QQ4+oj8bK0NA20i1TKj
         DfF5DJ2TjaGn66PXxZ510s1isNzJDZhVI6GY/z+MXxe50kfDzfIBlaKM/g0XlgfnXqls
         BfsBOzde20pno4oQIrR1HFNQfJfCASk/uClep6mtkN8Moo5Rvv7EQpn84w3Emwf4Fc7g
         RIUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="jP7Sex+/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id w6si126602lfa.7.2021.09.30.01.55.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 01:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([94.217.148.121]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LgYSP-1n8B9m2LED-00nwvp; Thu, 30
 Sep 2021 10:55:43 +0200
Subject: Re: [PATCH V2] Makefile/Kbuild: Fix "FORCE prerequisite is missing"
 warning
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
References: <20210930070319.2314855-1-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c5b90cb3-9693-e0b0-fa1a-abb34c8ff1a4@web.de>
Date: Thu, 30 Sep 2021 10:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930070319.2314855-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:ncupsfOpaHXrrFE1iK6ZYtSgYQkjGPaFFr9OlCbu88M/Hi1xL0Q
 T1ll0I+iavuwakEK5AtzNCXPGm0HIcp3V6AO5Pqqp8fYPZtbWP5R7l4iU9eAlejSnAX6j2R
 vCrzMRCgJOdVvQcYgzz9A1xXm8gwI9LxA08TTbOjMqyddkwUCmrMULbsmWowaCxMiroNtd/
 wo5M5rnNqLjvG1PXZ4z3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GLE+8iROFjA=:QCND37LZHICTwe3HrxICAX
 pw84cKoMKsHh12b3T2BJgDl4NpMcy6iJOuaLmWqgIvQrL74SxOWVFqdS7h0ZBYgoRFjO6EHD4
 CYtagJRUThpyLTBHrHt1M+IIm2Ir1pC77q4PMGK0vf2R4iVBFI+vjRxSzzS6DyIV5Fg5ALTQW
 TAVxPT9Rbmv/x9xV8hzZjESFJDMqO3CG535Z9xuaA1T0AwfarNpsjZNCX5EwbOBvRw+VAoxlI
 5mWL25yASi9KlIRBImzUADGCYZHYkQ6maf1BXGKDuVtXI2KrCCAr8Bs4n4Eq3aYQh3+zPeKMS
 fkclfbEDo/Kfwv7X3+/eeYW2yZcbRtyCiMFoVRLI9UwAnSdK4wbNDxZqocedjrxD9uMC1n34Q
 darNYdiSVERqChZFPz1kGin6lVQNggYdJDlFZc4zHFNZyIN89HoO5johMxHriohZB5SZlmv25
 w5pQKkCbqlO2PN011AJssaRgz3mQ1ypt3IChiL7i8WiVmQyyMytuukAb91cTt9LivMHF6fn/5
 GfpmtgBj3sF80V86JCExBf4ERoSXmkjyNLjvmXDdUaP/J/Ec77bUXV8eNcUs1sCOxyVnWCJ0o
 o+EmAZzmZcWDe0djVaRFTLOy0jw/J1WZxuWBPmwXhS9tMKV5U+m96E55KMi8Y9wODcBc92oFW
 u5uZuZTnLpRzs3UDyYHJSYLnz43vsPU6ZTFLw9sOZeNSEKs2zQj1n1iPvLeNThOCWpJJeYyQd
 fFU0O2AQQAE3FPInfQmjyr11ds9nJpFiVQgvJPrONzo/+Vgqsqk+0YTxBxGzlSVbeBah5whdF
 FiylUtA1QerJw0FQOgX1DeHCN4Zv1Aevr1VNp+ltbnZBuScl8FCg9HWqaRXPk/R4HTjdWp3ze
 eYEvFL1xC4FOIBL19ej1tjO3ZrjGAFVlOYSCzYOd4YhnmSKSG/Ths5Su4XuV90BbmcmP+Bi3Q
 sXFpDcmgaDHN70mi4iQxVaSdk/+M2HixdwFUmUlJ1B3g6BmmC3lczqMda6qjumXLU4AcRhjDM
 LfZ+wE5M6inlWGDTzgW7/cpOg3VAPjVkSzzuL+GxguKisxn0bzMhuFc5P8YmQYuq9eNsXfAmQ
 Tlfv7r+WfydcO4xuUhoeqQKkAtATSyY0h6GuLMYXk5KZld9berZuBcXYKL3Z5cWPLgWJPvk+e
 txVMQW11fZjiqieAMykSnGoAjN
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="jP7Sex+/";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.09.21 09:03, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> With Linux kernel has a change that
> "kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and
> filechk", so add FORCE in Makefile/Kbuild to avoid build warning.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V2:
>  Use filter-out FORCE for x86 cmd_link_archive
>
>
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
> index 35f04161..06a84ecf 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -51,9 +51,9 @@ lib-y := $(TARGETS) $(TARGETS_64_ONLY)
>  lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
>
>  quiet_cmd_link_archive32 = AR      $@
> -cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
> +cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(filter-out FORCE,$^)
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

Thanks, applied.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c5b90cb3-9693-e0b0-fa1a-abb34c8ff1a4%40web.de.

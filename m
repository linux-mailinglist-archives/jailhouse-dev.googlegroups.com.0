Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBB6455WMQMGQEUYS6YGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd38.google.com (mail-io1-xd38.google.com [IPv6:2607:f8b0:4864:20::d38])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D85F3776
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Oct 2022 23:07:08 +0200 (CEST)
Received: by mail-io1-xd38.google.com with SMTP id b5-20020a05660214c500b006a43c89e0bdsf7822468iow.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 14:07:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664831227; cv=pass;
        d=google.com; s=arc-20160816;
        b=QPZ8Ii7YisDIJhur1ulynNY31QVoVUt/uYdHg9tVukao5y4pbvBPwNSUMnQNgKRamM
         CUNuaBVOXEGza26mZYXW9w4lac0mQNyXV2UIDad2eNxshY/H7xQlBNaDpmLHHONN6Y6m
         eqTUvkhM0dgsBfIBH5qh+r5IXTFNARz9OXOSQpalyi3cdFJHq4gl2v9TGv/irrYt3efu
         hGLxxAzG7QQuI3b8NvpI8lQavN5tljtYweIP20XVsHYl8V1Ag+8zZzFDVkdNrewE7UFn
         EaMSdM67+NDo/u06TPsAif/O8l3vwncmfltj0eJG3pbraS68qT3netWCz7947zWYOV77
         CRSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:user-agent:subject
         :cc:to:from:date:dkim-filter:sender:dkim-signature;
        bh=2JkUYkWY+3T7Qkhushe58yk9r0qcoMolpJfEMS7jdhY=;
        b=zdCm/iZEv8ldHjgB4o4S6vRbqF1ACFhiRUDxzUpbRMEdPiGLsb6PP6Y93KNc653oT+
         MotnYkey6yfmRrL9vw0FIHqEdIBXJxnIrl8BZctWXfqPIpePjO4yvHtUmx9X8JAocZtg
         r9JY0uF+IzovtX+HbmF7Xi0dYOhYH+Q9cF/bzTuT9Op+1xcYML6RDHfLB9PtUA0trfgl
         /Ti3xD7QfqETR/MH7AarGcbqcXOKuEkxAtf9cvXVvzaat9yK+2EVZmN1ixzlh6NZLRGV
         eiPKLpnlSwwtyKb/Ms4cJi6pf5Dh1LyCcoYcWW+JY4Sdua1D986tYabjmcUWGLSP4iT0
         t4eQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@zytor.com header.s=2022090501 header.b=YMkSnoz2;
       spf=pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date
         :dkim-filter:sender:from:to:cc:subject:date;
        bh=2JkUYkWY+3T7Qkhushe58yk9r0qcoMolpJfEMS7jdhY=;
        b=m+sARqiCfBdzjaNOgOaeBWVwcKpt+S/wXID1SLblkWfwoZYqyiE+TqSlWQ9SVxCK5C
         j0scuAagnD2AFF4IwNaJNbXG/PTnSR7BsQCT4+4c4a4PdsR+WiRQ6uptcKfEVmuxcZjd
         4G4hJ0SLUUUyBSjtXX6dSYma1/6kofdUdxXia56k8jKrK7XyAgi7yhdPD0ltRnyHneD0
         QsuH/8fk5kUSkL4KRjLwGFZWLSgirFJ6sfJiqKTw8qXvEMLqPZMx2MGk7iE0t6ivqst+
         gFhl255YvbJvHpLwQBDXyHACcS4z+PgqbxRfXCZCJEUV/Y5q8LfvAQ/xC22cPVnTmC5j
         hD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-filter
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=2JkUYkWY+3T7Qkhushe58yk9r0qcoMolpJfEMS7jdhY=;
        b=NOddMwhDqWNpJPhbD1brzGJZ+8cfhbniIFYwiozthDudf4bPeXoI3+YlejfN+bnQu0
         iyxibuLpPhHjbwwyb1IXF9loAWAzUYltU5lJurT7Zj8nWplcSx5yoQQHQ4dSboEZh9i1
         VWKQwQWpZ6wxVlpRlq7R2RVbrtcLOWi05l8vkp3RyCtnC2gMzM6wtRVNYYk/EbgOrW0s
         sprVtX+bSClSLh48vW7KQ7OfrOaBSQ1h3dmbMOXkmBL0HUqMMbW7U8uiUeNjcqZF7IH4
         Qq1QM0e+V+62srDajrSvktUT/ja8L1l5Hnl8yJ+JFqZ7gonNLHVqoTOh/QLQ+PkDTwtO
         eZUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2xxedIGhc9rOBUL/B+XuHV+ssmMCYOsTOZKLsu1LUfL8JgjsF3
	4EF3dDh58QbAI+jLDGImLzo=
X-Google-Smtp-Source: AMsMyM6lOeEPDLCPo/RUx03ZTnZtFtzgGvwQ9jX0VmZDz1O2EkKmWqQiL+WWw7aU7QPHpeD0pVAM5w==
X-Received: by 2002:a02:8804:0:b0:35b:7425:82af with SMTP id r4-20020a028804000000b0035b742582afmr11058293jai.21.1664831227420;
        Mon, 03 Oct 2022 14:07:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:c54a:0:b0:2f9:115c:1a57 with SMTP id a10-20020a92c54a000000b002f9115c1a57ls2580143ilj.5.-pod-prod-gmail;
 Mon, 03 Oct 2022 14:07:06 -0700 (PDT)
X-Received: by 2002:a92:d4d1:0:b0:2fa:f0f:944 with SMTP id o17-20020a92d4d1000000b002fa0f0f0944mr1216189ilm.125.1664831226809;
        Mon, 03 Oct 2022 14:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664831226; cv=none;
        d=google.com; s=arc-20160816;
        b=xZULsXAO/xSXbbj+m2EkSl1sySTYaEMlTE9Bqe0RpZWwyOinSiMQjgJ1qjOr0V8IxQ
         rUHFkKOFfSDcYLO0zw0wQd40Vq06/lfKG+3vMPX1R4Xaugzleyv64GD6XAGVTO6EMGWz
         DmiZMWqkuH3XJRk9iUpUrBs0aP1jEgrNRygW3+4ZgBq+x4lciiY8iVgO8lPhYR8qwEyb
         pgj8za1va7ifHejr12lSUvHUw8WotFlNhtezI+Rr9VnYq8zjFn+V3nCJOHU84xpj4O+I
         GDSWW6MFj/4PHWvTMHyvNy+QBDcHoEllKujB+KX7/Fb1owavgB7yk5YZJEO2Uk5f/TIT
         YJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature
         :dkim-filter;
        bh=/JSxe+u/I+83ths9qOEPL2v7hS1kkD9Op8hnO2pWF/o=;
        b=o2T/+7RmLpakcsTR1sl6D2LXHIuARXAxPV/aejJVhF5QSGOHA5jgPwZRdqyHMIvgRf
         0q6x89EKIHzoNAiZItkqGBubDIND5YOejSbYkjqYMQ35sfs6nzp9ZCY8fgCgCUd+m2Gc
         ZaCXv4kN0GJ6i/q7OTY6jEqY7s4Zp9vLyIkNNAPaooYSyTc7aBLkfwnuSWuE9qu0ho9H
         Gd91yG/hzt4hRWzqMcf1rDb/vWAQOzaEzOv0ol4BoIZBsQOuGQIwER05rRjs6CfwtKm/
         5gCCnOBQxzXg7ZdtlWaX2dyyo5Z0Mr2h2aQb667xU9yOTDWQhVVrOsT2F4T+ZEI3uRRg
         DWAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@zytor.com header.s=2022090501 header.b=YMkSnoz2;
       spf=pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com ([2607:7c80:54:3::138])
        by gmr-mx.google.com with ESMTPS id p8-20020a056e02144800b002f5f5eb3583si339132ilo.5.2022.10.03.14.07.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 14:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as permitted sender) client-ip=2607:7c80:54:3::138;
Received: from [127.0.0.1] ([73.223.250.219])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 293L6Wqg3110779
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 3 Oct 2022 14:06:32 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 293L6Wqg3110779
Date: Mon, 03 Oct 2022 14:06:30 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Nadav Amit <namit@vmware.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
        Alexander Graf <graf@amazon.com>
CC: Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        Srivatsa Bhat <srivatsab@vmware.com>,
        "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
        Alexey Makhalov <amakhalov@vmware.com>,
        Vasavi Sirnapalli <vsirnapalli@vmware.com>,
        "er.ajay.kaher@gmail.com" <er.ajay.kaher@gmail.com>,
        "willy@infradead.org" <willy@infradead.org>,
        "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
        "helgaas@kernel.org" <helgaas@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
User-Agent: K-9 Mail for Android
In-Reply-To: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com> <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com> <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
Message-ID: <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@zytor.com header.s=2022090501 header.b=YMkSnoz2;       spf=pass
 (google.com: domain of hpa@zytor.com designates 2607:7c80:54:3::138 as
 permitted sender) smtp.mailfrom=hpa@zytor.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=zytor.com
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

On October 3, 2022 10:34:15 AM PDT, Nadav Amit <namit@vmware.com> wrote:
>On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>> better, introducing a new global var is our 'last resort' and should be
>> avoided whenever possible. Alternatively, you can add a
>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>> hypervisor_x86' but I'm unsure if it's better.
>>=20
>> Also, please check Alex' question/suggestion.
>
>Here is my take (and Ajay knows probably more than me):
>
>Looking briefly on MCFG, I do not see a clean way of using the ACPI table.
>The two options are either to use a reserved field (which who knows, might
>be used one day) or some OEM ID. I am also not familiar with
>PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about that.
>
>Anyhow, I understand (although not relate) to the objection for a new glob=
al
>variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=E2=
=80=9D and using
>the proper infrastructure? Calling it explicitly a bug may even push whoev=
er
>can to resolve it.
>
>IOW, how about doing something along the lines of (not tested):
>
>
>-- >8 --
>
>Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
>
>---
> arch/x86/include/asm/cpufeatures.h | 1 +
> arch/x86/kernel/cpu/common.c       | 2 ++
> arch/x86/kernel/cpu/vmware.c       | 2 ++
> arch/x86/pci/common.c              | 6 ++++--
> 4 files changed, 9 insertions(+), 2 deletions(-)
>
>diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpu=
features.h
>index ef4775c6db01..216b6f357b6d 100644
>--- a/arch/x86/include/asm/cpufeatures.h
>+++ b/arch/x86/include/asm/cpufeatures.h
>@@ -460,5 +460,6 @@
> #define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) /* CPU is too old and its MMIO =
Stale Data status is unknown */
> #define X86_BUG_RETBLEED		X86_BUG(27) /* CPU is affected by RETBleed */
> #define X86_BUG_EIBRS_PBRSB		X86_BUG(28) /* EIBRS is vulnerable to Post B=
arrier RSB Predictions */
>+#define X86_BUG_ECAM_MMIO		X86_BUG(29) /* ECAM MMIO is buggy and PIO is p=
referable */
>=20
> #endif /* _ASM_X86_CPUFEATURES_H */
>diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
>index 3e508f239098..c94175fa304b 100644
>--- a/arch/x86/kernel/cpu/common.c
>+++ b/arch/x86/kernel/cpu/common.c
>@@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuinfo_x=
86 *c)
> {
> 	u64 ia32_cap =3D x86_read_arch_cap_msr();
>=20
>+	setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
>+
> 	/* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not mitigate=
d */
> 	if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
> 	    !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
>diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
>index 02039ec3597d..8903776284a6 100644
>--- a/arch/x86/kernel/cpu/vmware.c
>+++ b/arch/x86/kernel/cpu/vmware.c
>@@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
> 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
> 	else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_VMMCALL)
> 		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
>+
>+	setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
> }
>=20
> static void __init vmware_platform_setup(void)
>diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>index ddb798603201..bc81cf4c1014 100644
>--- a/arch/x86/pci/common.c
>+++ b/arch/x86/pci/common.c
>@@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_ops;
> int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devf=
n,
> 						int reg, int len, u32 *val)
> {
>-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>+	    (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
> 		return raw_pci_ops->read(domain, bus, devfn, reg, len, val);
> 	if (raw_pci_ext_ops)
> 		return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, val);
>@@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus, =
unsigned int devfn,
> int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int dev=
fn,
> 						int reg, int len, u32 val)
> {
>-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>+	    (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
> 		return raw_pci_ops->write(domain, bus, devfn, reg, len, val);
> 	if (raw_pci_ext_ops)
> 		return raw_pci_ext_ops->write(domain, bus, devfn, reg, len, val);

Also... any reason we can't just set raw_pci_ops =3D=3D raw_ext_pci_ops for=
 the case when the latter is preferred, and dispense with the conditionals =
in the use path? Similarly, raw_ext_pci_ops could be pointed to error routi=
nes instead of left at NULL.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/42CFC548-F8FE-4BD9-89AB-198B2B3F1091%40zytor.com.

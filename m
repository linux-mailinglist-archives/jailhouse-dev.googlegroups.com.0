Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM6VY3VAKGQED6APVOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9858A555
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 20:06:44 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id d65sf127118wmd.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 11:06:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565633204; cv=pass;
        d=google.com; s=arc-20160816;
        b=MEzOawGEp8J/Wn1rEW0+4fjPFNTwjLt8EWGLkrwagXAvu+0rpGYPgzZgJ5ktmfZVXg
         wcQ9JSaD5QdIwxBiIlQB3gceV6XLzW/9U1zxpUACaoF4TZHwrrPNgZwbp5P+1L0GvgrY
         YqykVuSyjoiwoqS+94cs1c0Xc0DlmljjvIwbrXDJloy9yzsOUdWHJagA0hBRrNi8m2hl
         uB3yffO4piP1StKtaffS6Ptz9fHOBCmytF7TWlss7WApgLN0B8M2j2raY90sEqFtFVkj
         2aIIoD/yynLGGpnxT8SYDWv2tAck6SfccC7n+efoO62vbQQ/Gxs+oSq/cqTd8b0+GKCW
         GKOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=pYabfac5Mr/MMyJCreOX8xwJL+jp3775tonmBZ3KRwI=;
        b=E3jxFArat1O1aiXgq9dQLBOMpW8Tr2n+LBkzi+DVF9eHEZACs/q3C+4waAF4jIMlEK
         TKURqSWiWtd7x3A+9hUX9AZ+NxI5dQcFkPu6WUQr65vFYhIT6nGjfx4xoudf0b1d7BH0
         e+rHMcD4Bh1nj1loscV+9BL1xul6Py8F5yZt2rLjhV7ejxo25x60erCb0f2iHGx4OmLV
         Im7Ekw9cQ4ppPDi68KR1SmfFj9rhFtvATBga4soA7bdeGdu0ncn+CdmAQvPmjfMKIS/g
         FBRwa7Fjmm3uzvLrnBqwvJ5VPhVcsDgrTiHmTyvXRCg52/up3Jo715+Wl/YQrIXTVzI8
         j9SA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pYabfac5Mr/MMyJCreOX8xwJL+jp3775tonmBZ3KRwI=;
        b=ZUPt5a3qbDdEyTjjix08s6ki5ZB8G7rDXdy0vk2JLDGfIAevyVoedD/v/FN5Ru7YmQ
         7aUo2kaZ/hr1j2zBou0087uUD/ZEbqjmEnIrt2u8Bi4zbQ+5zmw7t1xkhf+nOCcsIOWS
         6OmGyfllbLw8LjnxpdWN6/pm1zyMpBBPdCwtvapLpk6jTA8q6ycDXXGfkOgLNsqgYTrQ
         K3JBq2n27bXv73o8i14DM2FVSzWNPq2+nBDtHcE/BqvIDCxlpERqXbe4w/Z7B21VBdFV
         qY0ukpsBCxrlhxJmaW0jGt13rBC2+AmGRAfYoi/CKb63h69EPcofmWmkAdrhSyH5tGUy
         R3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pYabfac5Mr/MMyJCreOX8xwJL+jp3775tonmBZ3KRwI=;
        b=Pd3HOtriQ4+sxBZtJ60G+ocHdT7Zycinga5bIkrgPaT/Yxd837CRCLOmHl+Zuzvp0H
         WxbWpCMkT4HveVzK0a3DNhKQVc3dhZ/Dp7mwDDYs+7N7A9emgPAaYGqXnaldgWJGzYxL
         022m6Jkhlc++UQl8dTUdqoU/G+lO5VQHvQ2bbPN0QsbB9Lq2TZoACpiFkfCtlflRSJeW
         Fuq2W/nhZrTnwxY9PatLN37JMCWwDu+LQGC2JcGsO1NSE55G0niZ0gWo3amle+XIH5An
         mu/v1IoKW9A5jrvb8tQ3Kzkn35OGfhGON4yKOZpdYDGX/iCYgXFSjBSHGkymXAaEizNW
         uPNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVHWCrYhWUYOrDdrPgfkby7Ii4DcrpR1QPeKLqeCKw5sUshSNpH
	vhwPv4mreVOIlXi33NGSJRY=
X-Google-Smtp-Source: APXvYqzklNR7zzSTjwbjRL87AI1NypMr/h7l8WHWjf8N4RP+hoIXKzldjAWpN0b6NDrxyCzLoOifUg==
X-Received: by 2002:a5d:6981:: with SMTP id g1mr21766031wru.193.1565633204165;
        Mon, 12 Aug 2019 11:06:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:514b:: with SMTP id u11ls3506524wrt.8.gmail; Mon, 12 Aug
 2019 11:06:43 -0700 (PDT)
X-Received: by 2002:a05:6000:1603:: with SMTP id u3mr39099107wrb.286.1565633203339;
        Mon, 12 Aug 2019 11:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565633203; cv=none;
        d=google.com; s=arc-20160816;
        b=ooKwfL3eu0wTy/FzQIy12hSGTx9DSnEZdaQAPheE9Fb1G+3Jqj2k7kPcRxzbhD6Ccq
         h4qNuV/RSN9NbAr6inkOBFnebtg3H5bIBPumDIpuggjZ3cTGLGTYSD8Eaa45YxEZqlRi
         YKCcQsx0IFzbfBWRQNe0nUZXcIElJmYNJjPWjFBXv0LQy0uKKzm9k6AJVem/T5SZOck6
         +398FytI7LHaivLQgJEiBAML2uXJrGsMmHM73wugvRrsv5NDKvxDduau4ZWfX3g2hvhe
         KJbmicDvjvcx/itnQabQ6F+hXfs2yxsj5M/WLYmdQGapqDt2XEIYmk+RfhUeAEF5Hfy+
         3D0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1tRHLh0Wwq8PLrqkQLuoH5BbkH2Y2z2iqbkaaaFbGq8=;
        b=IElbDYkmyJfVCYPmBBmejuY0A2d+Qye6ByCyvSUMDT/6UsjgE2pkARers8iYt6cy8A
         9A8ee+jvFiUbpE3dd6kigMrSK/VKpImi1fYNIvw2vp1iMEmZ+ZV7WOfE66DpDTCnu7oI
         Tas3PFRLYkgAAUjj8YYYcWVuV0ItwHEIyYy6KivVIuN78AfNNaZ6WmPS2jSE8x/X497q
         leESWbF42wNdyV/U/vBjoSpT4dsbExqsDGLoaOPrPdpt0J4G3IXROGYeKTYlSTOMvNM5
         Vfh8Wglw7zAug+MkBOsxczq/pp0V+DFAqhdyZGtR+Bf7PIaiQ6G2OkSaf2USdi/8LMRH
         zYXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e7si625147wru.1.2019.08.12.11.06.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 11:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x7CI6f79006269
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2019 20:06:41 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7CI6f6C000911;
	Mon, 12 Aug 2019 20:06:41 +0200
Subject: Re: [PATCH v2 1/2] x86/jailhouse: improve setup data version
 comparison
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
Cc: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
 <20190812110650.631305-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f815dd0f-2b94-3aa4-d537-f394bfaa977c@siemens.com>
Date: Mon, 12 Aug 2019 20:06:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812110650.631305-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 12.08.19 13:06, Ralf Ramsauer wrote:
> We will soon introduce a new setup_data version and extend the
> structure. This requires some preparational work for the sanity check of
> the header and the check of the version.
> 
> Use the following strategy:
> 
> 1. Ensure that the header declares at least enough space for the version
>     and the compatible_version as we must hold that fields for any
>     version. Furthermore, the location and semantics of those fields will
>     never change.
> 
> 2. Copy over data -- as much as we can. The length is either limited by
>     the header length, or the length of setup_data.
> 
> 3. Things are now in place -- sanity check if the header length complies
>     the actual version.
> 
> For future versions of the setup_data, only step 3 requires alignment.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   arch/x86/include/uapi/asm/bootparam.h | 22 +++++++-----
>   arch/x86/kernel/jailhouse.c           | 49 ++++++++++++++++-----------
>   2 files changed, 43 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
> index a06cbf019744..6163b1afa7b3 100644
> --- a/arch/x86/include/uapi/asm/bootparam.h
> +++ b/arch/x86/include/uapi/asm/bootparam.h
> @@ -137,15 +137,19 @@ struct boot_e820_entry {
>    * setup data structure.
>    */
>   struct jailhouse_setup_data {
> -	__u16	version;
> -	__u16	compatible_version;
> -	__u16	pm_timer_address;
> -	__u16	num_cpus;
> -	__u64	pci_mmconfig_base;
> -	__u32	tsc_khz;
> -	__u32	apic_khz;
> -	__u8	standard_ioapic;
> -	__u8	cpu_ids[255];
> +	struct {
> +		__u16	version;
> +		__u16	compatible_version;
> +	} __attribute__((packed)) hdr;
> +	struct {
> +		__u16	pm_timer_address;
> +		__u16	num_cpus;
> +		__u64	pci_mmconfig_base;
> +		__u32	tsc_khz;
> +		__u32	apic_khz;
> +		__u8	standard_ioapic;
> +		__u8	cpu_ids[255];
> +	} __attribute__((packed)) v1;
>   } __attribute__((packed));
>   
>   /* The so-called "zeropage" */
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index 108c48d0d40e..e5ac35efc4b3 100644
> --- a/arch/x86/kernel/jailhouse.c
> +++ b/arch/x86/kernel/jailhouse.c
> @@ -21,6 +21,8 @@
>   #include <asm/setup.h>
>   
>   static __initdata struct jailhouse_setup_data setup_data;
> +#define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
> +
>   static unsigned int precalibrated_tsc_khz;
>   
>   static uint32_t jailhouse_cpuid_base(void)
> @@ -44,7 +46,7 @@ static void jailhouse_get_wallclock(struct timespec64 *now)
>   
>   static void __init jailhouse_timer_init(void)
>   {
> -	lapic_timer_frequency = setup_data.apic_khz * (1000 / HZ);
> +	lapic_timer_frequency = setup_data.v1.apic_khz * (1000 / HZ);
>   }
>   
>   static unsigned long jailhouse_get_tsc(void)
> @@ -87,14 +89,14 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>   
>   	register_lapic_address(0xfee00000);
>   
> -	for (cpu = 0; cpu < setup_data.num_cpus; cpu++) {
> -		generic_processor_info(setup_data.cpu_ids[cpu],
> +	for (cpu = 0; cpu < setup_data.v1.num_cpus; cpu++) {
> +		generic_processor_info(setup_data.v1.cpu_ids[cpu],
>   				       boot_cpu_apic_version);
>   	}
>   
>   	smp_found_config = 1;
>   
> -	if (setup_data.standard_ioapic) {
> +	if (setup_data.v1.standard_ioapic) {
>   		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>   
>   		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> @@ -125,9 +127,9 @@ static int __init jailhouse_pci_arch_init(void)
>   		pcibios_last_bus = 0xff;
>   
>   #ifdef CONFIG_PCI_MMCONFIG
> -	if (setup_data.pci_mmconfig_base) {
> +	if (setup_data.v1.pci_mmconfig_base) {
>   		pci_mmconfig_add(0, 0, pcibios_last_bus,
> -				 setup_data.pci_mmconfig_base);
> +				 setup_data.v1.pci_mmconfig_base);
>   		pci_mmcfg_arch_init();
>   	}
>   #endif
> @@ -162,16 +164,8 @@ static void __init jailhouse_init_platform(void)
>   		memcpy(&header, mapping, sizeof(header));
>   		early_memunmap(mapping, sizeof(header));
>   
> -		if (header.type == SETUP_JAILHOUSE &&
> -		    header.len >= sizeof(setup_data)) {
> -			pa_data += offsetof(struct setup_data, data);
> -
> -			mapping = early_memremap(pa_data, sizeof(setup_data));
> -			memcpy(&setup_data, mapping, sizeof(setup_data));
> -			early_memunmap(mapping, sizeof(setup_data));
> -
> +		if (header.type == SETUP_JAILHOUSE)
>   			break;
> -		}
>   
>   		pa_data = header.next;
>   	}
> @@ -179,13 +173,26 @@ static void __init jailhouse_init_platform(void)
>   	if (!pa_data)
>   		panic("Jailhouse: No valid setup data found");
>   
> -	if (setup_data.compatible_version > JAILHOUSE_SETUP_REQUIRED_VERSION)
> -		panic("Jailhouse: Unsupported setup data structure");
> +	/* setup data must at least contain the header */
> +	if (header.len < sizeof(setup_data.hdr))
> +		goto unsupported;
>   
> -	pmtmr_ioport = setup_data.pm_timer_address;
> +	pa_data += offsetof(struct setup_data, data);
> +	mapping = early_memremap(pa_data, header.len);
> +	memcpy(&setup_data.hdr, mapping,
> +	       min(sizeof(setup_data), (unsigned long)header.len));
> +	early_memunmap(mapping, sizeof(setup_data));

You should probably calculate the mapping and copying size only once and use 
that - will avoid imbalances like here (remap vs. unmap).

> +
> +	if (setup_data.hdr.version == 0 ||
> +	    setup_data.hdr.compatible_version !=
> +		JAILHOUSE_SETUP_REQUIRED_VERSION ||
> +	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
> +		goto unsupported;
> +
> +	pmtmr_ioport = setup_data.v1.pm_timer_address;
>   	pr_debug("Jailhouse: PM-Timer IO Port: %#x\n", pmtmr_ioport);
>   
> -	precalibrated_tsc_khz = setup_data.tsc_khz;
> +	precalibrated_tsc_khz = setup_data.v1.tsc_khz;
>   	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
>   
>   	pci_probe = 0;
> @@ -195,6 +202,10 @@ static void __init jailhouse_init_platform(void)
>   	 * are none in a non-root cell.
>   	 */
>   	disable_acpi();
> +	return;
> +
> +unsupported:
> +	panic("Jailhouse: Unsupported setup data structure");
>   }
>   
>   bool jailhouse_paravirt(void)
> 

Looks good otherwise.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f815dd0f-2b94-3aa4-d537-f394bfaa977c%40siemens.com.

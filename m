Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCORT3UAKGQELPRNQUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 3298B485F7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 16:49:46 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t4sf4756000wrs.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 07:49:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560782986; cv=pass;
        d=google.com; s=arc-20160816;
        b=UYMo8iFE/rBthRxLS35/YYSF/odCT1EGmywGcIfW1oHjRJcUDnjTlekJhDwrDS4kUQ
         PjSFdRAvUHwb9LFetfmrQPAveEQCsk8upS+K3VTVris/uWp/zr8kAewWQ8RlbwPDdr6M
         9DMTXsF5dhzBlReqVREHXl0XHRMDqCg3vaO4vtABRcrFs01j6cGYWIbpEVS15cKv5lzs
         r4OIB5MVtqJx0+D45TiJlemyPIDnZVew2oncGB7M0rl9jdTnxrRBRyU/S6BM1p1ip7Iy
         S9hfo8hHz1OTunoCdEPQOiwAgvtj9z4MfSMkbxsANOadsyeOA3CTu+zefUWk/yXUiZzj
         m9GQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=f9Lw5ODHfAmnBV3Pm/BvkYpZaeLVxzt1YR37lZ2ut6Q=;
        b=gxoPrLCKwK/T8cn/tJxS1uvGm9vV4MgAcVxThgPtPm+6zQ34PS134prAwxEDukVBIl
         eVFV28jyxfttULWNwjtstA4yKH1hOTY80WPUADmt4RFZAi155mWTJVp4HRBGRwLZ59/8
         amrAoCsDZnniTpp0C48qD9duLVaeLuz45/gMbc3Vknc6AW9Hd3V0XT5vnE86M2hU1yny
         cV77W0GM45JdOC3Y0Cx2u1+ByB6gvc0syr8Xe1GJSvFZnHJdDk+PZFrMz8FaYtHqPWzA
         4WRg5Mz0I2kCoCfqq1P15puUr28EQqpS3qxx3BccbStjctMmJ6GxZIBN4YICA6QCyLYo
         Ovrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f9Lw5ODHfAmnBV3Pm/BvkYpZaeLVxzt1YR37lZ2ut6Q=;
        b=qW6ok8aFXseEsOjztPXoW13eHwjiMuzSvVD8CdgqzCLFB3WeF0TXTdkAdmXt6pvilU
         rGRV53GEs1hH0sjSRcXEouapOAg/+QrZbNWwqQPWS1x+JnDJp3eKa2FMOUcrLwf/I0o+
         wkDOT6too7DiM2xA3xVU7sXFTuCqfWO8P+18XTAc4/9y+zZdyGl/PQ11BMFEFw9buzTn
         DhzdO7jg/Q2iNYeF3fGr6sFOY/xAjMyPrj2812BJBSfd6w8WO+fr5xW4aAChkl0oiQeP
         trmH3mU9SDG1SoRfiHYfgMZFinwC/qsGi1FvasV+2llbRscMFl6zVooZTAXdBGBQW4I6
         jSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=f9Lw5ODHfAmnBV3Pm/BvkYpZaeLVxzt1YR37lZ2ut6Q=;
        b=qxRjapbvV+PhfvKZS6/VvC3V4EcthY8YFYo3rQpT0ipnSsPfRq2uP0yJJ3/KXcdNDM
         B6l+RDI95sBr7fGdVck8xbpFqknEMstbF7goRQte6hYD9sAu5yteyDa8Dko+54xwpLn6
         dC9fJDsUyZNF6JW8KWRfdrOT4c1UTzSfla9s4bzu/1EiccIP/kMOW/hj59eZCZaWwsIA
         G8xaltqAto1/LRcpS27cBcMJzXGtxYAYcHC/pW6XzK9wDnt+jHuszMQOcntJK/kzpQ8h
         ckWk9RvDVSB5+hDqXLOYYmm7+T+/9kg7P3hex3IrcawI8lgVriyPk3IOM6X7MCtY6gDn
         5YSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWlB0KuETm+AyVlRsm8vc1qulJYVhMljDXj/TEm3ChMqVEE/ai0
	PvBlzDawwE65AtfPZskkx2k=
X-Google-Smtp-Source: APXvYqzrEa2J7qwPGT9aQ/m5lAlgvCl3V9HCiLH8h9uf3AuNcdTJE4LSbcPVgSeJPv9kBFOhc6zwdQ==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr20398840wml.124.1560782985957;
        Mon, 17 Jun 2019 07:49:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d02:: with SMTP id t2ls5044907wmt.0.canary-gmail; Mon,
 17 Jun 2019 07:49:45 -0700 (PDT)
X-Received: by 2002:a1c:f519:: with SMTP id t25mr19834544wmh.58.1560782985342;
        Mon, 17 Jun 2019 07:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560782985; cv=none;
        d=google.com; s=arc-20160816;
        b=TCMSNp+4T9haV1CtGZIkIg/VO1Dpa0BPRx0H6faf35AdN0+S/4PN768bjyhvd+rkOR
         +0uhEnLoPUefByLFBdC0ST3GYtnfkMKzNzVn7MCmliI0R5QMSfZ5x1GMut1+zV6VAbip
         1tVig3HZGJoZ5tUj3Rvubnc2Y+AkxjCKot+XiJBxkA6r2UlQV02vSvHcM78CyTYcsD+D
         Gi2JV0EqjOmSrCLmZ27izH3pAL4dB/YuwOXHUpAfZY7/OHFr1QPgKAGji8Q7lXjvPW8u
         PYAQTsl0dU75cKbcF4pnOdq1gJaJWOF9+NErQHEhESKTAlepsc/cCVc9hAKE+TIJcMOl
         raRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+/1Iez6szuFP6/K2gCWILGyEYLbyrsPQhu6i9XKHAWs=;
        b=n1lsEKUhs721uE8a+7Ve+aa2XJxPYxryZm6Fm9j7WezEwrv6criQFCsFILNPfh5Ehi
         GOXTGA5nLd1O7pj4Yx+JL3XdImdv3Q+WQvjorVu7wz7PcI5iFYe6Mlb3e/sn7eOvlhpW
         ySVneugLcEU88VaXVH0qQnMb5p/YYJdiBXf8Vyfnh1+MVyCmGQ2tyMuDbagezL/5TqnY
         X2JXVJyXm95q+eeNJJYXVXYjFqlJU/7jJCnwicRsOm38mZAscdPGdiDY4/BMC92Ef87B
         Eh3HJXQq/ZgH425E7cq9QDfnpj9pZ2JfyvTYdBrbXg8Sa75benYbaaZunVJrOL87dMHG
         2hlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id m18si165860wrb.2.2019.06.17.07.49.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5HEniC6011875
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 16:49:45 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HEniou012810;
	Mon, 17 Jun 2019 16:49:44 +0200
Subject: Re: [PATCH 1/2] x86: vtd: Print BDF instead of hexadecimal device
 address
To: Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <38a7ba28-df47-2ac1-1dce-a381d6dc4571@siemens.com>
Date: Mon, 17 Jun 2019 16:49:44 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 17.06.19 15:13, Mario Mintel wrote:
> As it improves readability of hypervisor messages for debugging purposes.
> 
> Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
> ---
>   hypervisor/arch/x86/vtd.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
> index 1cae0dcb..8e076b4b 100644
> --- a/hypervisor/arch/x86/vtd.c
> +++ b/hypervisor/arch/x86/vtd.c
> @@ -621,8 +621,9 @@ static int vtd_reserve_int_remap_region(u16 device_id, unsigned int length)
>   		if (start < 0)
>   			start = n;
>   		if (n + 1 == start + length) {
> -			printk("Reserving %u interrupt(s) for device %04x "
> -			       "at index %d\n", length, device_id, start);
> +			printk("Reserving %u interrupt(s) for device "
> +			       "%02x:%02x.%x at index %d\n", length,
> +			       PCI_BDF_PARAMS(device_id), start);
>   			for (n = start; n < start + length; n++) {
>   				int_remap_table[n].field.assigned = 1;
>   				int_remap_table[n].field.sid = device_id;
> @@ -639,8 +640,8 @@ static void vtd_free_int_remap_region(u16 device_id, unsigned int length)
>   	int pos = vtd_find_int_remap_region(device_id);
>   
>   	if (pos >= 0) {
> -		printk("Freeing %u interrupt(s) for device %04x at index %d\n",
> -		       length, device_id, pos);
> +		printk("Freeing %u interrupt(s) for device %02x:%02x.%x at "
> +		       "index %d\n", length, PCI_BDF_PARAMS(device_id), pos);
>   		while (length-- > 0)
>   			vtd_update_irte(pos++, free_irte);
>   	}
> 

Not all devices listed here are PCI devices (actually only the IOAPIC, we do not 
support the HPET yet). I guess the original idea was to avoid confusion when a 
device shows up that is not visible as PCI. But avoiding to parse the value for 
all the other devices remains a value of its own.

Applied to next, thanks.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/38a7ba28-df47-2ac1-1dce-a381d6dc4571%40siemens.com.
For more options, visit https://groups.google.com/d/optout.

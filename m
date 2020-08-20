Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPU67H4QKGQEWXZACFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id D389E24B56E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 12:23:59 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id m13sf530423lfr.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 03:23:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597919039; cv=pass;
        d=google.com; s=arc-20160816;
        b=UjUh9gNdnOppqhz1cL9wOlWVRMdWprrGi5O6YcMZFhRwO0av7SHg4b35+Y0EWrXCo9
         aGZYsdm0FK0WsrxMUq7t0AxkY8poEQo0yR9/zc4ZxN3X/pc17gr9UupUW4VJ9gC/loxm
         K5d8g3A8L9yDC6sSq6kcgkKTTdPkR6v/Yrr5kyjnH2ip2qoj3hLdkQZ7vsl3Lmbj8ELE
         NKRYafrKRRS7KHubIoKMIOFPoiWyaE2RX7joB19vowhN/N03ZqT3kt5SUga68cNTJiUY
         hJvho21PteI1ayqhsh/aKuyVZRbNWfea8GbI62nlkikK163K0r4IXsnidy0wmlbuiKCU
         MBjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=i9TdyOJ3o9aihTGlAO30FrIRF8l0dia5QnyyUyR7/14=;
        b=QIipYnVhr/3mdL2gkLXfWN4JRmt3V9gDcVu+pusfQlCTL0W4YpBjZ0uZ6ejIoOcbsu
         BCGK31mejIiUgMWKSye7I2q9Z/UDN9Dfog+eHTVzaPFyQZoaYp3XYHN7V2ND/ztH+0bI
         YDDlTwqVd0u4vmz1G99B448itQ3jHTfZkqbVjzSUcZxX1hfXLOTwpKuqbqDbQeQ+tTdl
         JRcV8kL64/cS+Y91t8w/SREhNniXWMx62D1AGyz6L+KV30fLwrxzD0QRmJg4sS1SZW0j
         NMsUyDUCT5S/CWK7C5AufmDtaC7h/2o9KeA+RXalau0jRZtj6bKIQKrjM+7WQT+JeZOS
         bolQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i9TdyOJ3o9aihTGlAO30FrIRF8l0dia5QnyyUyR7/14=;
        b=rJns9CUnLFbUt66GEpVlpRAf2UUx/KUJDsKfMObxa5JCuw9B6AfsOhIIVnmari5cXY
         7jj/7FoCTaxEcsM5C2P/m+0hxezNuugUks2rybntuj7W5R9jpa4LmoS5Pv/M2TSHfkiq
         iiNOQbt11cVRMAw5WQBouHZ81Y/ogpPUiB4VHJCabCPgjUfNr3McxA2TfasK2vz9YzPS
         GvwU+imKh7kTZmYyVZxQVK/Q1TjxUp8gczwB8gX0jAfjlcW9bK7zYdDQckgPI4Kln2kB
         wiyTjhoW5viyaK346efcWg/tDDq9zsZQDqq56Lkxjj03RMNyNYrLu1YTd6FUziCGuxIw
         YTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i9TdyOJ3o9aihTGlAO30FrIRF8l0dia5QnyyUyR7/14=;
        b=egNYoIjZ4bU0sBSMPdw7kJB51vyPOepkj7sBGluFn5OTpjl54P6cZG7jvPYskuk5nb
         9gki3Gny4y0U8TcDQx7FRX4ufKJ3qO6BBc4uDoL0Jz9es73ncdf1oN01oaH9MyVJVyEE
         iWclgTmLNuQqkcAfjie8PSUVNJteNZRS8unaBnPHwgHZyXfhAfo3D9oi4HjPKYWpQiHc
         e1sS/eTn9JJynm0GkihRLQgXkRRZAMvhm2+IwMAuYiQ9czVVo7NsNOq0SNlXfiwDPzGj
         yEbFeh69YGhg2fCTGmh5PZjmZ6GVKSDgqsayy2jVTxsuVZf0urO1U1oF+icA7LFKGrdj
         mCqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TcQZjR+0Lqe4urAtQqHQEtY9S5LIIqXvs9ymJqOFz1LYLIItW
	hzzQDrT9ZyBJDPv3aI8CxM4=
X-Google-Smtp-Source: ABdhPJzlUo86jX28sJ//PyQnWPEAXZJ2yPM9+T81b2CIlWIqY5uRc4vznkm6zDFFbq9Zibohx9ulQw==
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr1216128lji.314.1597919039288;
        Thu, 20 Aug 2020 03:23:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a482:: with SMTP id h2ls360698lji.8.gmail; Thu, 20 Aug
 2020 03:23:58 -0700 (PDT)
X-Received: by 2002:a05:651c:1069:: with SMTP id y9mr1285988ljm.438.1597919038265;
        Thu, 20 Aug 2020 03:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597919038; cv=none;
        d=google.com; s=arc-20160816;
        b=qQnze1nKEqhuhtdAgwlsH8tcgECWvkisjM9bkNKMC9ceoBcw8pMIGu8coHpILMe0eg
         mhH33THrJB0cPQ60Hu3vIVdpjMPJj7f9CLrbTs0+6st5lYj5iWM8TCdLdvO0WHHYxHuu
         hSRSjD/DfaVP6JntcjVSvKPVMQY5WSrwV5JnE4cUON2Hj/brXosUm2Ld36X9NqM8EKPK
         ODaB6KnU66n9q0e+4qMQAAlOT4O5e2owYH8SNWEI5zDqToCAfbC7yZaJPraOjx1v94mM
         CzmjyUTMvcqEGkFhtbOm8XQG7hILlvljofbOeDUkIaeI+Gz8kAmDfIGxiDH9Dv5MC4i6
         iRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=/f4CJIwWWaVGsjcXtUzJ4us+hmequa3n/B0wEdY7ZxI=;
        b=cbts6MumVQNkNh5S2SuDsERXybQ145vV4ilrH1ZMAPKehNPbc8Pxm3NurqtMA6qYWz
         hPLnACSz3rJn5jAFh2GgNhiJSMWFcz5uhnDD7nX/7mRZSeeijAfHQnwrNmUkEi4LgyRD
         dNAqEriR0SJ6NvUFVBfLqQaIlOuBexyDbtGE+M59KJuwGXs0Ka6Wwyh6ShBd+8JhL8dW
         w4xkT0qqwxMeSmd3sYjngQa75oJPQGzOjuflQr/GPZffL95IYTk5XbWsHyZR76WJ/D/f
         eCC9YBoGX8Y2PFOUhGBq7Aji88UTE6fdSnJseFrRLoOiH6G7aO/7hk/iAujIUevBOx35
         v8/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v3si32670lji.6.2020.08.20.03.23.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07KANvll002509
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Aug 2020 12:23:57 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07KANuIB007961;
	Thu, 20 Aug 2020 12:23:57 +0200
Subject: Re: [PATCH 3/5] arm64: allow accessing simd/floating-point registers
 in inmate
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200820100707.20013-1-peng.fan@nxp.com>
 <20200820100707.20013-3-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b1878841-429c-aa31-d8bd-16685392b3c4@siemens.com>
Date: Thu, 20 Aug 2020 12:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820100707.20013-3-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 20.08.20 12:07, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Set bit 30 of FPEXC32_EL2 to enables access to the Advanced SIMD and
> floating-point functionality from all Exception levels.
> 
> Set CPACR_EL1.FPEN to not trap accessing to SIMD or floating point
> registers.
> 
> Reported-by: Alice Guo <alice.guo@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm64/control.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
> index 7bc3cab1..a45a5d32 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -21,6 +21,7 @@
>  void arm_cpu_reset(unsigned long pc, bool aarch32)
>  {
>  	u64 hcr_el2;
> +	u32 fpexc32_el2;
>  
>  	/* put the cpu in a reset state */
>  	/* AARCH64_TODO: handle big endian support */
> @@ -43,7 +44,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>  	arm_write_sysreg(AFSR1_EL1, 0);
>  	arm_write_sysreg(AMAIR_EL1, 0);
>  	arm_write_sysreg(CONTEXTIDR_EL1, 0);
> -	arm_write_sysreg(CPACR_EL1, 0);
> +	arm_write_sysreg(CPACR_EL1, 0x300000);

Can you do that via telling constant?

>  	arm_write_sysreg(CSSELR_EL1, 0);
>  	arm_write_sysreg(ESR_EL1, 0);
>  	arm_write_sysreg(FAR_EL1, 0);
> @@ -57,6 +58,11 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>  	arm_write_sysreg(TTBR1_EL1, 0);
>  	arm_write_sysreg(VBAR_EL1, 0);
>  
> +	arm_read_sysreg(FPEXC32_EL2, fpexc32_el2);
> +	fpexc32_el2 |= (1 << 30);

Same here.

> +	arm_write_sysreg(FPEXC32_EL2, fpexc32_el2);
> +	arm_read_sysreg(FPEXC32_EL2, fpexc32_el2);
> +
>  	/* wipe timer registers */
>  	arm_write_sysreg(CNTP_CTL_EL0, 0);
>  	arm_write_sysreg(CNTP_CVAL_EL0, 0);
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b1878841-429c-aa31-d8bd-16685392b3c4%40siemens.com.

Return-Path: <jailhouse-dev+bncBCB7D7MXMMIPD76E5UCRUBDNMJ3Q2@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 383AEE2A42
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 08:08:51 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id i25sf16936389qtm.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Oct 2019 23:08:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571897330; cv=pass;
        d=google.com; s=arc-20160816;
        b=ft3cO61EeUYbwBTQDLs9A0iI/CWP/hJXUAHqzQE2HSTMPO2F57JG4LF7vc4nUYg4qc
         M5J9YSsFFZSa1apViXDfKAfQ1fUyZkZRZjOXay/cEEczgZFvyLrWStIKWJVj9x6CoUc3
         bsdJX3QzXLQXBdWaTGaX7WmiDpAHjbzbckGzb+6td/V8IJLsXwzCnh1jreMfStChCbGf
         7CeJInaMHOuNycYFpzId0eSyNcUP6GXqWHTLLsQXKnK0CDY2Y226nl6NPuzOrphlfYtn
         D8y94ufP3AppUsxUju38JVye+ej9lcnBuUaeI5BeJMTZVVL5tJ57CnpQpVYgHpX9HtXG
         aSuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=0YRbNw2QiCqk3UkVyIz6N4bJu9PR7oBd9VD+swiLOIc=;
        b=AKBKKmc7RyA1zmi2qGraLdJodzLH1Ccnh68EFTBgEtyyreX9fi56vhBomBdDBJ73XR
         tGwdyOoDz+zFJL4nKecWWMWa1/EpScS3eJVpajCi8cjfhSSx/VXN2w5c3faBITd5DTxD
         FVOb/X0cBgpnTV0c7PdtZqWjVtuCD5RMs/hqRmk2nFwrMXhE3Wq/67eRNv35zQmrYKgD
         d9vymCh6DvV9d7eRgI1sVwSFpyM/OWM6hOYiNRiYGbnI1320j0lfl1+ktwu53yTk9TjG
         E3i1k3v9a8TOjtgfmIDHrcy3lykj7PT7LODY7JB5NbH5hcx9x/NqXWqdt0Ilp3M2skR/
         hh9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pHr2B9Jf;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=0YRbNw2QiCqk3UkVyIz6N4bJu9PR7oBd9VD+swiLOIc=;
        b=UwsxZfeT97lpIUOmpwP0jagLhs+qJck0+PGWOz2/OcFPUtTl6BPNSaVK2yEp8IMGk5
         caN3lC4ctpztAq11MloePQSZd4cVaQB3fNCQpoa0bWs/zFX71JjDje2EPdicKQXCBNcj
         Na9JRu4x3873rRSZy9InOM5DG4khasGP2wOw/9q4tizFhg/7RFodE2X+kZ5HCtCScyb6
         CRNeS/9oxY4Py/v83dwQsLaAyjpcLcwwuN1atdX14SWHT3PMhIrxPCjq3M1k+D8SU7cA
         QYBe8OHT0O0D4+68/ixf80V/3/IY/paTxdzPo0cqvihTWh4HrMD/68TMM0eWznYKEKqr
         Rf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0YRbNw2QiCqk3UkVyIz6N4bJu9PR7oBd9VD+swiLOIc=;
        b=gyatprn7D1nJnz2p28cbXZMsan2tqa1/uWEuh7S1XXaNFY0P/zOZ9qqKrXsgSMfR/b
         QI7z1zpTTq6RJXtZ6DK/gQZgCRfWt97AA0hENEO7yd0Nkvmb6mN9EeyY4rvQg4qxWX9q
         RHtL+5Zknpoeoe0X+VGuZn8MRA7OOjbuMJyVcj3AmJHHx6iDJCrd4OzQtB8HjLnJwjSl
         DmZ59RVhN9CFRAIDNjHkY7eBrxlSZqn4d9HrirqityrPmPremyZlJboDeK38PcXfRzhF
         n5uzYBmRTmMV2AUM8xmxDleGXSl22m3zaxQrdxeLW0ZPMR8s+2niWzAuwXI9O6uQlj1R
         UFeQ==
X-Gm-Message-State: APjAAAXHtn5O7fC5VMvMDkCXaS6AyESKD6ZpVGX/rVvSyejyna4rifr6
	BXLX5NjFqvxAi+Dkegk4TTg=
X-Google-Smtp-Source: APXvYqxzYGz/VSGuw80CBZZnVZOy/3/REjXbzraL8ouV79ewYahlI/c32ePEXnNo+YvhEYg2nqXbFA==
X-Received: by 2002:a0c:ee8f:: with SMTP id u15mr4723616qvr.0.1571897329905;
        Wed, 23 Oct 2019 23:08:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:9e0e:: with SMTP id h14ls1625182qke.7.gmail; Wed, 23 Oct
 2019 23:08:49 -0700 (PDT)
X-Received: by 2002:a37:bf05:: with SMTP id p5mr4968825qkf.111.1571897329277;
        Wed, 23 Oct 2019 23:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571897329; cv=none;
        d=google.com; s=arc-20160816;
        b=lMDehtrmbLW0nNh1LJpiHFfR5lh7GqipvECrg0NnYZKTtSWZM2te4o4C8shvY2M5oA
         ZiRuBUdrJ6HskoI6hqHCAt82raujbKRxIv6oBiJ1qR52l74hPtBgGtFB+ssGmsryCYBn
         nVjOvDAw9UKfr8UGM/oHW3kR6oJZCIMPJ+epRyCxmKigprOJI4vK2RLjU0cye+TEbr1f
         TydWpMH5PFcqNwlFvpIw6+Bl7THFO0kLR4XKoEa7ZxWIqFo8BAzgb7P0qMK50pdYs28k
         VzFa4hBZ61xYF6OuPdL6aBRDlINxdo/8BgU4dqJ0cVtggfiIRTyBLlVy3WjT8waGir+x
         w6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=v3ceStc3VwcMclH2PpOsZ5Te5+7h9Kep3qIRrIblPHc=;
        b=RpEsi7xX08tNCozrK2eU05ZIG9UP+zMN4wOc83314TNh+e5F3BVCPW/7BucMghWnaS
         tFisfW2QoHVcBOM0Va5AfwGnC6mZB8wQEtlvSyfiW8+ckJ1+5fsIcQotmhHEudBC9n6r
         i1m+zz+7yiVK7MBliUUM9+lgCHKG/48P31h/0u1/Qeki4PgEczXWP74zURIE8GA30+g3
         baAakum3ntNxvk716woA0Bsy3SOhIB5JA64H8BLGQ60qp7hg4khh+1JBWkZu/BOyOipa
         io0l52fNhkzvTWzHPPpI4qlYiJeSFwHGA1snOv6Y+nfoqQReDIqV46MKAcXLV/ukJ7MR
         RK5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pHr2B9Jf;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id c78si1020742qkb.7.2019.10.23.23.08.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 23:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9O68mM6025204;
	Thu, 24 Oct 2019 01:08:48 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O68mHU007666;
	Thu, 24 Oct 2019 01:08:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 01:08:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 01:08:37 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O68gpj006300;
	Thu, 24 Oct 2019 01:08:46 -0500
Subject: Re: kernel build failure
To: Peng Fan <peng.fan@nxp.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
Date: Thu, 24 Oct 2019 11:37:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=pHr2B9Jf;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 23/10/19 3:47 PM, Peng Fan wrote:
> Hi Jan,
> 
> When MODVERSIONS and ASM_MODVERSIONS defined, your queue/jailhouse tree will have build failure for ARM64.
> 
> MODPOST vmlinux.o
> WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version generation failed, symbol will not be versioned.
>   MODINFO modules.builtin.modinfo
>   LD      .tmp_vmlinux1
> aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used when making a shared object

allmodconfig fails as well without this hack. We are also carrying something
similar:

http://git.ti.com/cgit/cgit.cgi/ti-linux-kernel/ti-linux-kernel.git/commit/?h=ti-linux-4.19.y&id=6c809904ef4483971166142a12302c8a0522e23f

Thank and regards,
Lokesh

> make: *** [Makefile:1074: vmlinux] Error 1
> 
> I did a hack, and it could build pass. ptrace.h is not a good place, but kvm_asm.h not work.
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index fbebb411ae20..3d4dcf691135 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -234,6 +234,8 @@ extern int regs_query_register_offset(const char *name);
>  extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
>                                                unsigned int n);
> 
> +extern char __hyp_stub_vectors[];
> +
>  /**
>   * regs_get_register() - get register value from its offset
>   * @regs:      pt_regs from which register value is gotten
> 
> Regards,
> Peng.
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b%40ti.com.

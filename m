Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB25A3L4QKGQEZZYD2ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210B244A59
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 15:23:56 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id r14sf3387714wrq.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 06:23:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597411436; cv=pass;
        d=google.com; s=arc-20160816;
        b=bhHm2j+FmsyIySnltnXtb5SSNNs0cwRn+g6bLkglg2Daml/f/s8XodljlOTwSdj7b/
         OCTag7jBAbFl2CzSfZErtI3X9jTHBy2DCj+Rw3WC0+p/+3f8BRNwYyPr9cSWSVw7aaHa
         WMqOPVzaKN9BCem29wcQ51FtlxiefL8eix06nqASfw10VlNfhmegqQg/h+AXQZ8qsZ7I
         39ATDG1cShFo7EP1ABYZXdi4OkQSQxnlTCpaLy80n/Xo1tmPoR5peNCC3iLTRJCK/p5l
         ytxKOUHVJMswoDBQy/2Rhq5tF0agHcHlt+CKjTwXKRPB6ZqA4GX1ktlRDl5DRPxIEuTg
         XE3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=VJ+zKYrFPsL1yND28/YJaPeERcqQyNVcih+dv+7CLNA=;
        b=aHqC2lr7XOd2lMqnjYx/xl9Fkt/tfaoESAWws1ywUkggAqi+KgPkzaNXII7QZEhZxq
         gpCneiM6MIkDn3Zn4q/nSE8z8L5hHtQSHhNdgK+UPFQnhgHSbXiRUrYN0ELoh+c5MGDK
         TpS3uR/jyN+60NpW/hoUVOixj/1ytjm/Ood3SzdZjDF/zX+uCiI/54R8+TetBzVQX7BK
         boUmPGn+5eh9Mt3u6ADaMi8MR5xkdfREFYA5ozpNOphIKsvcjc8RGtPwn0l4rxJ5iRk9
         o9VIY/mrJq+GXhuTa8JhGbzuKVl/Ff7ZDyNkGQsw4Ds0CR3kfBPIBOTSALUCo7qILNiX
         ct/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VJ+zKYrFPsL1yND28/YJaPeERcqQyNVcih+dv+7CLNA=;
        b=I0ncB39TuGl5KvewF86e4FgfAKfej+yaeytlIEpJTyWGm8khnqPmeeC63L1lNTL2l/
         6jlzIN8RHvjNOjSojHHGCSgZfg3TK7nVKhz+pjbMe8va497EepPOstd5itTNuDpboByT
         XFmrV3Hdoa1HR2wSzx8aefd4lial+gpjvC6PEzQXC3s4alT1hy1BaozTgp6EhBJNrQVo
         6DeF82gPRHBkVGjP7/QfVEfjxckew/8H99MV+GpaNAi0cXz06ulIjZZSSVJWEd6DijfC
         zZNuxfcpdjZWjukSXRTI/0G0yCppFtwUIv8/DtHBzpliHlYIA5bENmRU98e+m+XD20Hx
         HaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VJ+zKYrFPsL1yND28/YJaPeERcqQyNVcih+dv+7CLNA=;
        b=mYmjnCGsyT+8baPo2WG0tVnC2ILCE1vpESyjxWZKyn/czZMIJY/9NEL8o+pcPgB5St
         lNZkqOAXsWK8UnyRmq1r0/bjHrt53pwplGNaZgsuboyOLAzL+EjOCNlRym25Jq0DGpXh
         X7VzP85HPgyNrN1O04WSYfh8e2vGX6YxpkiaSwqZ368NcfUmAgIMcbG476yRt9TLLUq3
         V58AgsQp/5104p7Dy+K7aSaVEeVJqVFqFGS27u556RnPHv3Y70AbxvC5K7ElRrEDoieO
         8dmd/21L/SA9C1QDsFyGcWonmpOT9jI1tc0/cN7ozWdBKVf/E3tPlT4Om2BJNWDColxX
         +Cdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530o6RvjcMFmp/GQpNuwiJ5v76XLR7RhWNcJlk8PHV/sABeRDsze
	8nQVfd294gz9ERJIW4fK2W0=
X-Google-Smtp-Source: ABdhPJygQL61OQPfuZbcNwmNbjq3TQILBMELpzbCILw/2ILPq9QDVInmawsT55+Puy18Spv4CFf6pA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr2887177wru.372.1597411436341;
        Fri, 14 Aug 2020 06:23:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls4326wra.2.gmail; Fri, 14 Aug
 2020 06:23:55 -0700 (PDT)
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr2896329wrm.16.1597411435473;
        Fri, 14 Aug 2020 06:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597411435; cv=none;
        d=google.com; s=arc-20160816;
        b=OgGbuN/9TJZVAKA5GXI9T2ZraVqoDowNZaycvI2oSe4zbIW46p5EMqf7zkTNC17zJ7
         TGjVBlOf+wjVCU7WARKSffBn/wklyPsgbxdb9JKDb8tfo6QELMbq39cmCgJX0zbJ+Q7z
         qFceHHLwsXjECKIhKS9x3nZWps7ETF11U124VfhPS8DbuZ+BnsNQrNuIe1Ak7HvRZ7ZV
         PPw92Dz36kUIkluY7ERRwqumgoy7ayQszo03z8Ue2PbpjHpZmP6O3j3Elk0Vs++Spncv
         ZHESU+9IzCzGi1InRzOXRK5ausV2hr+HgA9lz2G+tpH3Ugt8GwJvfY/6kjl23Myv9Lg5
         IrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=RwEL78415JbFqaXbSQnC+cVmx5shbEyeFAS6kxWuirY=;
        b=CjI88dyhoDj2d97y6mWSH27OolOH7/4UhdTvHFKQbxgHePMoP3ELmcAgKI9b92qEfL
         RpC8KAiH7E36SgVGRdvVCvgFppEPPrcSqhFbAh255aUu6/4vkzYUs19Zzrk6YUuzk3Mr
         eC/GXYnAbtph+WC38/LmOGjjr2lVDRhDdHRkF98xebOMqZyRaI0Q8EVRlI5iuYoP4bea
         C9rwws8fib2Jy0SnRMng1tTIeF+uXu9UYxPBT9GDaqQdOkuGLZU0yLT8WFU2d4YNuv0c
         jw3gF4qK/2feqiTVQgHFSrPgUqwjePkfqoh37ltxJp63iW4o7DaTfctoX+ZoV/iv6REp
         HTdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h11si442211wrc.2.2020.08.14.06.23.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 06:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EDNtgk032634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 15:23:55 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EDNsCi025316;
	Fri, 14 Aug 2020 15:23:54 +0200
Subject: Re: [PATCH V2 3/4] hypervisor: gic-v3: solve incompatibility problems
 in gic_v3_init()
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <20200815190949.6837-3-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <72d6b271-de4c-077c-5e94-890907ac4f35@siemens.com>
Date: Fri, 14 Aug 2020 15:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200815190949.6837-3-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Subject line is not reflecting what this commit does.

"Add support for reading GICR_TYPER high word separately" or so.

On 15.08.20 21:09, Alice Guo wrote:
> Because use mmio_read32() to read 64-bit GICR_ TYPER in twice, add
> processing case for reading the higher 32 bits of GICR_TYPER in
> gicv3_handle_redist_access().

Reasoning should be around "this is needed for 32-bit guests that cannot 
issue 64-bit accesses".

> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   hypervisor/arch/arm-common/gic-v3.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 6a1d90f8..584c2c79 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -351,6 +351,9 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
>   		if (cpu_public->cpu_id == last_gicr)
>   				mmio->value |= GICR_TYPER_Last;
>   		return MMIO_HANDLED;
> +	case GICR_TYPER + 4:
> +		mmio_perform_access(cpu_public->gicr.base, mmio);
> +		return MMIO_HANDLED;
>   	case GICR_IIDR:
>   	case 0xffd0 ... 0xfffc: /* ID registers */
>   		/*
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72d6b271-de4c-077c-5e94-890907ac4f35%40siemens.com.

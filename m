Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXNEQLWQKGQEXQSWCSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED5D42EB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 16:31:58 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 5sf1862874lje.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 07:31:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570804318; cv=pass;
        d=google.com; s=arc-20160816;
        b=H5OnsByYeJZitmwUwQr34HMp911iYJK6xDeNSsNi0V+jqRexskB+ZOpR56dTRz4Uyq
         lBtYNDs+jCpvfM3RdlWrlaRqze7xg2AXvfy7AWfuRRhPTKqpvXj5zm/Qs+xDhqY5C+OZ
         tuKk+1ELKd3ZkCujnQQ63B8ZaQWLIKSxoFNp/fbQsfZA/WTHNcaLIxhlH9FZDMc5Ldby
         r0yC2QG3tY9scpxLMLw9LFYPSgwRMxKQfom9cfqci+UYQPQivszytPyUCWs0bcfnsrR2
         oMmGW1B4awqExpkqg0awXu/q2dQxxfVjU1u/MaB4f/+2U9mjb/9BJXe3yPS3R+eZypYG
         tqxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=lJMlVYifa6BEhfqVnSToayxSa+dWtQ6knbqvdxZPsCA=;
        b=kBh0jOHhyUnH5+JY9deduioKNYA249oPfzv9/DH5YP0PxaZlr+WzDl+J+aRF/MovHn
         pnSgMyBt8Vx5IWQv+mERrvZ9oxVAkfj6W1VDU5+0KAyZRwqXsnbPVPLdUxEJzlVmgJ+K
         0GnJQs7LB4QO6GaQk1voq1FnZNgN/+S1zPmbty4sFXCCBtqb1BS9g+6MGZFN1HF/KkGU
         eaVCQEUGuWuq6bOIxIzmsiGMPGVZMnBCG09W0rwSxlaA/rXSQOXVCUccgrJZQNHdlxm1
         5+5gzuo89cyHbBxg0QRn+wDFcOHe7FvF94c46NIe3F7S17ZjQtGH4fZuupuioDG6ZiFf
         cEcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lJMlVYifa6BEhfqVnSToayxSa+dWtQ6knbqvdxZPsCA=;
        b=Pqr7OzCtbvPjfsOpmn3v396ItMvKZXEianx3/wC0uu9SyN446/vuQRXWYK8jnlQUm9
         ZOIqPdmqG+T5RzY892kPP9Otc66jsVnjB7ojNbxX/LynV2GE2tVWFy7elpbZh/LfaSwU
         E2MGPl8HyfdYgFXTJwkgSJYzy+2I8rfXL1AZejIjOHWJQWuYQGW272pfYw+5k+/VOpuM
         SGCecK/zjDgDZBG2pXF2ntrL3370jWsbrJyeezkP/nSQm92e6Nu11AMIm0rt3jl9U6jZ
         8z74UpueVVZ5ks/pxkZ9KyF0atTM2cmvLzsOlDIqm9MnQs2DVaV+ktVdMCJ7xV28CQlm
         n7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lJMlVYifa6BEhfqVnSToayxSa+dWtQ6knbqvdxZPsCA=;
        b=BEzdrFMjPhaLEaYuG76UhmraN0FRg5SZdoL11I3efgJJXnoxbxWgVctFjQOJeGHF04
         X0ATP8Urx1oQvVT22Y5gQR1W5kmEbMK6+ZAZOe4A51kkqP2bM3TVosFtVFAYRDEeWrWo
         N1vbyxbIT4aXCRdPohOIhbVI9NiPgZOqKGFy9b2tHYzFc8uUb4u0XQrZEfaAFcJ2jcrT
         3KvV5zm6QysCkTWmmOHGoo/KiEY9sTagyKeT/ZYrivEJnZXS+fL+Yzs+Ammbh7G0Mvmy
         YTKKdVeKTnyzHlAKkCltU74gwZ+MpMyu9DCipXVlPMPvAOjRq5Ssr8DpvWvnPO1awi6j
         d14w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXkLNBCGAzyiBB600YpXOMFhBaxjroPRCvRCNscYR2/vbPRkxLb
	MPUFjwZnJAfKse/qlTTpZPc=
X-Google-Smtp-Source: APXvYqwUdf0a2Qbiih8kIdTx/U6EsKksuQmsCELM+oXkZ7geu07P/s8u0RnjpsUjUK+fkuixXLNHMQ==
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr9447642ljc.97.1570804317967;
        Fri, 11 Oct 2019 07:31:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7d02:: with SMTP id y2ls1014521ljc.8.gmail; Fri, 11 Oct
 2019 07:31:56 -0700 (PDT)
X-Received: by 2002:a05:651c:237:: with SMTP id z23mr1148684ljn.214.1570804316522;
        Fri, 11 Oct 2019 07:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570804316; cv=none;
        d=google.com; s=arc-20160816;
        b=yguGmqXtTeZPmd7I7k78c13/sI/BM7/BlZAZkUOPfepeIg/opthifCcoaYKLpTV6EJ
         AuZbW1GQ42Y5Vaty6S/E9es5lliRMO7PgYdshw01bKPH2USgBknMy+yoZbO9L79aOpPc
         7GQaGy0VuYgWag0Bg1aJ56t8MtTG5N2SDgsf4l1MIXKlI3lYwogAOrkFVFC3pZJNw2HV
         dhTOJwkB6BX24yVXT42D2U7rx1vAp5qC+JyMKMO5GXMP7a0yf+MCpvoSib/jDpjiGXBf
         Cg1kVxXR+H5M+wpq0/fBHHzvEnUPi2W+qsmq74HqiGGjFSXXWES8AWpmoKLVfzpy+xhV
         GvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=NxeIgDUCNz7Ww7hyOG4aGxnS9q6M1eNznUI/Rma5cls=;
        b=puUhunzh0Sy2XMInudMqUBGgztjjNp6iBYK8hghHBxUWoUnwT42Fkt8sCO7m8aWHnG
         mCSs2Yo4noC53ByZqTrnyzaZ8LbeNlkiCQFVM7SDY/g1VeQMGYpDCMj5U2q/rBmdMDuo
         TiXMs7J6XQNqNDvGo6rnXRgrBL5pjUYa5teElnTlnwi2AjbK1P8KodkKkc73wU681ZlC
         Z34WFAZJxrM7pF9BvgtmV1m/sRID7fro1QRNGVHykyFEPDcaoS8YVFPKx/Zon1ZN3cBZ
         34I421G1Dsn4r6306VtjY/S3djVI9piyBzrmHOl4roVsfu5Z+acYMwcZUTWbaREx9UW5
         JmLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h6si173364lfc.3.2019.10.11.07.31.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 07:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9BEVtbW017439
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2019 16:31:55 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9BEVt8O003386;
	Fri, 11 Oct 2019 16:31:55 +0200
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>, jailhouse-dev@googlegroups.com
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
Date: Fri, 11 Oct 2019 16:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
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

On 11.10.19 15:30, Oliver Schwartz wrote:
> This patch adds the SMC SiP IDs that are used by Petalinux to the root cell
> of zynqmp-zcu102.c. The SiP calls are:
> 
> 0x0f: PM_SET_REQUIREMENT
> 0x24: PM_CLOCK_ENABLE
> 0x25: PM_CLOCK_DISABLE

I suspect that this punches pretty large holes into the isolation. Don't 
we rather need filtering on /which/ clocks a guest is allowed to 
control? Rather than allowing to power /all/ clocks or none?

Jan

> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
> ---
>   configs/arm64/zynqmp-zcu102.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
> index 9de04d6..d9cd790 100644
> --- a/configs/arm64/zynqmp-zcu102.c
> +++ b/configs/arm64/zynqmp-zcu102.c
> @@ -23,6 +23,7 @@ struct {
>   	struct jailhouse_memory mem_regions[6];
>   	struct jailhouse_irqchip irqchips[1];
>   	struct jailhouse_pci_device pci_devices[2];
> +	__u32 allowed_sip_ids[3];
>   } __attribute__((packed)) config = {
>   	.header = {
>   		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -60,6 +61,7 @@ struct {
>   			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>   			.num_irqchips = ARRAY_SIZE(config.irqchips),
>   			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.num_allowed_sip_ids = ARRAY_SIZE(config.allowed_sip_ids),
> 
>   			.vpci_irq_base = 136-32,
>   		},
> @@ -146,4 +148,5 @@ struct {
>   			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>   		},
>   	},
> +	.allowed_sip_ids = { 0x0f, 0x24, 0x25 },
>   };
> --
> 2.7.4
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9e1fd041-8152-9c4d-c8e4-2914a1adab1c%40siemens.com.

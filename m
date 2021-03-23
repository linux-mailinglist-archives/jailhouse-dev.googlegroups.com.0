Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI5642BAMGQEGN4Y2GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0734591D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 08:56:20 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id p4sf978131ljj.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 00:56:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616486180; cv=pass;
        d=google.com; s=arc-20160816;
        b=N8KyamxHiuiXactr9DeJb1TTeHqEi/RXbO2dtQTo5HslygMVJ1lD8nxFg65AhxocyD
         OHjZvekZuZT2w8av/W0JDV6ffY4+fjy5LACTIUpVVKgqYvR9ddEMgpYiiWfK3lAXof69
         1PKOl+xLoxdElyy/zn3DBwqFuiBIMsxlU92UmjDeBxCHHdWdfnZ21IScSLrjoWnOXgfq
         zwEGgAwFYoMv0wTgtwbinlpZL46aN4QJlO6u3cSbFg1whRyKNg1eRVO2sdc8VUfX6b6z
         UVlyRsAZ8u5Y5eU2dXR4NTJLIaZO/QZKlNtYPr/3ATiDyV3k87Jk6krib3S2Ov3gytDj
         LdUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=n5jsZqtkNjBJkEPJExl68Sd4LVXrRWEi09GJfvuJGjo=;
        b=wWBLU3qpMptZ/acewyXRdoTmyZ/IcPiK7Ffz4PurQ0LU+KZtCPqRcS0O08GkzbgVUv
         XfuQsSuH0VgdHUTjbsLWD1eJGSd5im9GztkF53Z93bRl6NE5g1HRSzo7UWvuCA6GTL9Y
         teo631fNxOeaWM/YRl28s6oOe7XgZiyIAJfGmrGTZxH2uzN/r6woxJJB5SV35shA2Oa5
         7DBRczRj8KEH0T8lW9Re+I0Y0lD/Z35Jb1W/FWt09ghv75c6WJ4aT2vqqP5fCxUVtO/3
         mHs3VIMhOMaY4IjFSBGbkBUNILvSNckhqBfutosOyhs3/7cpXwCPhmUNROIOb6PUHXeo
         3lCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n5jsZqtkNjBJkEPJExl68Sd4LVXrRWEi09GJfvuJGjo=;
        b=PhavQy5SA0soH3dYOmfQ7L5ofcfEVyL8mFkneX5tNVz6qkqFbZPAGMzO/U1E0hKDQ6
         Sk4s0Hqp4Xs84sEp3tK7GjMYGd4o5w1IhsuCp/GetSp6unlZtJgqgP3yAo0MThU26OPI
         Iv3wHHYHr4b5pcdBX52Iimo3JuedFurwmBREuMPbCKKhChQw/jmB0SfPKn2gRcSp7lhy
         w6d2xt00WuFRa6Uk+BvsPK0FabK9vuNIIRJ+K8ySe8KyjIlLbB+vX88tG7VAUD6qMTkE
         E/rNQVpE8xJ9wEvVqDURVmedlXK+aLN0e6Ub9jq41LJCDVzaagoR//7wxKEoPv6w9rT4
         nNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=n5jsZqtkNjBJkEPJExl68Sd4LVXrRWEi09GJfvuJGjo=;
        b=EunRTeqrqUsMGXSEczK7BSZ0dx6deEmkoh8vUENIP9uttvl5dQ70kyzZ2au147LhPi
         2fkRoOkKyWNEYExvcoT/SpiFAZIyn10j5LeGwuazvZDy2apuy+VmEGqgroyKo7e+335j
         GI1pwMBZ5sqAa/oUPMiX/Nr08th5d4NZvS3ca9/mp3u5Cm+5weAVm5Bp/haJf/HRX4QK
         giKTLvYfyaf7btcoNP+l3hzF6XniPPsork/sAnoHesRivbH2YpIvr2Idxmd2MtzR3dZG
         BASQGQWw8CZvUX4H1DWxxyAajEzTilJUCY8FHmZ4F1kCcOilYrUVM+8WZ+Ajy/DQukLj
         bj9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530K8VL7cIib3TYHKNYWekI6fxXjlyTQrLmlbUvM5x3K1xpuW+V1
	uLN6QvPKu1CKZ/A8VSUrxuA=
X-Google-Smtp-Source: ABdhPJwV8ne1IhqQRSASt1vGPB+OMxYAefkfcxmsiH15ih+Ut4LKYWWInzOtRv4qZ00yFbRey60dCA==
X-Received: by 2002:a19:9109:: with SMTP id t9mr1947021lfd.49.1616486180072;
        Tue, 23 Mar 2021 00:56:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a48:: with SMTP id k8ls2942674ljj.10.gmail; Tue, 23 Mar
 2021 00:56:18 -0700 (PDT)
X-Received: by 2002:a2e:8084:: with SMTP id i4mr2427573ljg.122.1616486178906;
        Tue, 23 Mar 2021 00:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616486178; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0UsIF5J72mQ1evmcye2D8izLyCYfOt3KIfPMB68Ax3326vOs9EzEJg1PbeODY5bqm
         ltM/vILVvX6Wqw4PhwGD9i0uTZisIb6cwHMIj+eLz37NYPfbCfpI+74wUvUxDRULW/h2
         ZMhbkG8nFSO2KLLxIHPKWRrWXzkcvHXU8qPjInz4/BEeWMUUE9Sq1rXulKoUtS57DzvK
         CGsRevzZtPP5ln2dBRNGWPPA9/xN5kr3oLuAUXJiV8kuuPVKj7uj8j5Urp4E82GfMjQ1
         gKKn0VvgHQZfklgqKPbTxy+OAIK18o4jK4A+60XNtw+oBvfjK6AtPA8RrmV1bVW913Pw
         E9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=wckGjUAkVNnpaPaOHBKUHsRIWTULx+9bf6UtQk8GSrY=;
        b=QlYgfgxv7O8su8o1gmwQNC6FRO/oXb4/a4X4xtE6JP2b7SYiZ66TUgWYKnOzxW79on
         cCeXqABxSvU4f0DW91tQHOBs8Rb+TWprhNvrJs/4jDLnWPIBhNPhK9uy+qUoZDx0BgXF
         C1nfnxsEHR98J+F6f7JaQ5UCg+ucg5j+hLWMNEzrPmC2fpWlXx4B/fYUcYcVUx4Oa+Lq
         dMf5dydn0KO9VisJkVEHZNx18jRffytG8ZmMyRjZqQdhX2i+isvW9EWQx54NUIXnIQAi
         LtXCD2M/DrOaQ5UzTkZfQbptfyrC6j/RlO5nVkeWRVWnn3kHvMrZIvTDhUhzoS9YTpkL
         4dSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n13si174271lfi.5.2021.03.23.00.56.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 00:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12N7uI0F020857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 08:56:18 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12N7pHNr026562;
	Tue, 23 Mar 2021 08:51:17 +0100
Subject: Re: [PATCH 2/5] Check UART UCR1_UARTEN bit before writing data
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-2-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <69cf89e6-dc86-a3d7-01fa-1e5abee7f1e8@siemens.com>
Date: Tue, 23 Mar 2021 08:51:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323062536.3888-2-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 23.03.21 07:25, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is frequent start/shutdown operation in kernel reboot process.
> And at the end of kernel reboot, kernel will switch to use console
> output,saying imx_console_write on i.MX8MM.
> 
> imx_console_write will save/restore uart configuration.
> However before imx_console_write the UCR1_UARTEN already set to 0.
> when restore, it is also 0. Then when we runs into jailhouse
> disable, jailhouse write to uart will trigger errors.

What kind of errors? Hardware exceptions or what?

> 
> So let's add a check.
> 
> However to hypervisor itself, there is still risk that
> kernel disable uart, whenh jailhouse is going to write
> data registers even with this patch applied.
> 
> There is no good way to avoid such contention,
> the best way to avoid such issue is that
> use a different uart from Linux or remove
> `.type = JAILHOUSE_CON_TYPE_IMX,` from configs/arm64/imx8mm.c.
> 
> Remove `.type = JAILHOUSE_CON_TYPE_IMX,` means
> jailhouse hypervisor will not output to uart, but you still
> could see jailhouse log by `cat /dev/jailhouse`

There is no separate UART available, to have kernel and Jailhouse on
different channels?

Another alternative is to avoid using the UART as console under Linux,
right?

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/uart-imx.c | 4 ++++
>  inmates/lib/arm-common/uart-imx.c     | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/uart-imx.c b/hypervisor/arch/arm-common/uart-imx.c
> index 849f8fca..6485f36e 100644
> --- a/hypervisor/arch/arm-common/uart-imx.c
> +++ b/hypervisor/arch/arm-common/uart-imx.c
> @@ -15,6 +15,8 @@
>  
>  #define UTS			0xb4
>  #define UTXD			0x40
> +#define UCR1			0x80
> +#define UCR1_UARTEN		(1<<0)
>  #define UTS_TXEMPTY		(1 << 6)
>  
>  static void uart_init(struct uart_chip *chip)
> @@ -29,6 +31,8 @@ static bool uart_is_busy(struct uart_chip *chip)
>  
>  static void uart_write_char(struct uart_chip *chip, char c)
>  {
> +	if ((mmio_read32(chip->virt_base + UCR1) & UCR1_UARTEN) != UCR1_UARTEN)

if (mmio_read32(chip->virt_base + UCR1) & UCR1_UARTEN)
	mmio_write32(chip->virt_base + UTXD, c);

And a comment on the "why" here would be good.

> +		return;
>  	mmio_write32(chip->virt_base + UTXD, c);
>  }
>  
> diff --git a/inmates/lib/arm-common/uart-imx.c b/inmates/lib/arm-common/uart-imx.c
> index 984dc218..9cdf9089 100644
> --- a/inmates/lib/arm-common/uart-imx.c
> +++ b/inmates/lib/arm-common/uart-imx.c
> @@ -39,6 +39,8 @@
>  
>  #define UTS			0xb4
>  #define UTXD			0x40
> +#define UCR1			0x80
> +#define UCR1_UARTEN		(1<<0)
>  #define UTS_TXEMPTY		(1 << 6)
>  
>  static void uart_imx_init(struct uart_chip *chip)
> @@ -53,6 +55,8 @@ static bool uart_imx_is_busy(struct uart_chip *chip)
>  
>  static void uart_imx_write(struct uart_chip *chip, char c)
>  {
> +	if ((mmio_read32(chip->base + UCR1) & UCR1_UARTEN) != UCR1_UARTEN)
> +		return;
>  	mmio_write32(chip->base + UTXD, c);
>  }
>  
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69cf89e6-dc86-a3d7-01fa-1e5abee7f1e8%40siemens.com.

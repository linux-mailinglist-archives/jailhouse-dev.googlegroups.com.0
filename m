Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW6ETDXQKGQEXXH22PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847210FA34
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 09:52:43 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id f16sf713508lfc.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 00:52:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575363163; cv=pass;
        d=google.com; s=arc-20160816;
        b=CvXejQTDWFjggax5KpaK7MN1V4GC6/CrXnU/6fHU+oY01yp1d8w6ivDJKdXlalhfz+
         Z21RloxxGn9CkwOJUd1KmfzRrkacrsII+AzG5vifpb68SlfABOmlNCdaC2cs1AjVv2fH
         Sqr+jHlVXjvdjnwFAh6gGf9Lw+NovX6H8y870vYxHX+cne4ro4JDF2pxjmXCJf5Ptxn3
         nDRJuoZqcvmrk5ssyeZO9szGeV16wP/1HZiqvNip4lkTuxn0QBncSAlgqN77UmgcbMHI
         Vquu3IsqDrKuHYosRaobDapPi4nPqbHQrnQSCxWOEmdLNLZRVAKIJSJFnXIn9eYc3p2S
         p1Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=W35X73leOR8ZVvP+XLJHwtKRZwfl3Gf7xXV1r49aeI8=;
        b=ymOLyKn/7YLR9dsq1dG8t/2JD+O/7pdabobbMtKYjFagz3UEZqr8t8nIUswKsCCVBM
         d6FPy7P61NzcOmzehhBbtOLNbAfastCEUAfrIazNalilxCpOVBgWRRO7GTlUm+4Tifg4
         XiHdj46PNEcASz48QY7/iA9dEh8YXBadi9CXtRhv87MSyQQ1rOyXP4B0HXfqv/AaylMv
         OodMjHINUibsGWM/0P/2IDf6BvI5BXx/tjrNJ1KfCZp1vgpx9MNvdvAeBBtpRsiL2OIw
         YOY7OHfiAfG6pOWiAo1ya/uSp2JNmCyKadapgDBf39o5s7HYAGNmLjjzMQnrYiMi4k14
         05Fg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W35X73leOR8ZVvP+XLJHwtKRZwfl3Gf7xXV1r49aeI8=;
        b=HO/o4IMi3OSiwgamxbWEvFJp4kCW9c/9gkkTHKLQ0LGi7UUvM0uS2xAzdBtDawJ8RE
         pmh5HH8u3qGghLN4Pr2cv2FTlaNpVOM03PpON5fLCS7w5pptTk+hGljG1tB9oUibAx+/
         +VSIYNBk68/D9XLXFffgv3GYIRwwtx4xIgL+1fl0KLjMKNA/nuViJnsRnMFA81ADOJaF
         suAPVpfYyJtLQYyzA8xzg6BcA2uy3/k9qL/z7DkFgjTT6SV15VRFEszvegADgpp3WArm
         LzitrnWLUehaTd5E21NQccgDUoxZpmAO3feRbtzGbT9vR0l490/HZDnq8QKXBTaAbiHl
         6X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=W35X73leOR8ZVvP+XLJHwtKRZwfl3Gf7xXV1r49aeI8=;
        b=Zj1/Od3VxE9FvSULziHZPvfMeImofMATJly5U9DOnNrGMC3GTpfSm2aoPDlCx0+fm2
         QJKjQSiffiRKl1M9qyPFOFW+pcg2j2hMVdWpsOUjniLBIxGWJQSYR2sCZnBmwHXWTsfm
         3FT1u2XBncdf5XgA/VEh567z8XAC4sC3NcMS6/81+chIQt7TeBoaKaUDUPXW/iK9RZne
         lHFO9/znEtgWhX7e46VBs0o1jQSNdjfqS63rK57Rv2n5M8YzbF3xIotZpLl1nwrzi2Sy
         +AdMxwXMhH0utMaEpvetk6wDwNo+3las1I//k6RrW8HpWLXdzfl5SHDnEioKTH2t9DTU
         l9/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXeZBAW7DJSSd4IWVKXSgTTEmGGgxGEb0CrG7BIGbb3yKZitUa3
	qtkDADln2E0cyMQjejJ97lY=
X-Google-Smtp-Source: APXvYqw5A4QTCYbp7wn9Z0O97Naa7kPw1lFsTwyqDN/tMsd9mUv9HUnEq5sMOhxQ9VpgKIq/oEfOaQ==
X-Received: by 2002:a2e:995a:: with SMTP id r26mr1885560ljj.78.1575363163100;
        Tue, 03 Dec 2019 00:52:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7410:: with SMTP id v16ls270096lfe.15.gmail; Tue, 03 Dec
 2019 00:52:42 -0800 (PST)
X-Received: by 2002:a19:2353:: with SMTP id j80mr1960794lfj.55.1575363162349;
        Tue, 03 Dec 2019 00:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575363162; cv=none;
        d=google.com; s=arc-20160816;
        b=hPiGnglImhe94632OdkYvb1O/knf4LHv0Y7DcZb5U8SCPKmdFVZwsbfIjOG3p0lTtn
         HGbeakl9uj5Y7aZ1WypDW3qcQSJB2SloCyjOsXrocG8CUun6k528JQp7AlAe+ljz1yKc
         eQnudZrrgVl2bS5yQJ6d5rD6NZ/EemJjPbkig4nWeMmMLpse4rj/49izLRmuaySG5Slp
         A4TjNZrHXMaheIrPolYz5yQST/vWDAtox8/TAJ2EFeKXIPnQEH7OczJIqpO4je8wCTtJ
         LVZk9zdmlkof7U5vZLNqYV7clqGzXvGAVymYfIxOdEpA6cB/UxqMlDaAnvEfQFH1g+Em
         bM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=El2r1ZDn7cxcRgKhVKvY/kyRe39SHsRt8WIvte40hYg=;
        b=l4J5BJaG1okISWB4x9WhXMQP7/WZYyMLhwOiDYAow6/M8nne7OIPHoHXYB3twsztZK
         7qFdGH9jnNZOLtiAKNQWxgIVKuz+XuXLFjBjhOgIWLa2H+vXfWp+b8lFf4rjK+7a1AIj
         V5eM5XP/7EQ3K7EOxGKnpZ9aqZ3KVKHbBds0YbMKXHuYK0FqxARguM5VRUoQDeuBOQlx
         PBOHKN3xklcFyz+khgqLyqXhlieH7Vf6MgE4O6AI78+6JePakxEkxDljxNRqQaPMmV8f
         oXuziP+CX90vtMpohfP/PQn2Qv8Y+n8lERXhrrzDZ1/xE/98BEuzJ8X+98/F0DanPedO
         HwCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j30si159829lfp.5.2019.12.03.00.52.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 00:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xB38qfuh018383
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2019 09:52:41 +0100
Received: from [167.87.51.101] ([167.87.51.101])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB38qerp012015;
	Tue, 3 Dec 2019 09:52:40 +0100
Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
Date: Tue, 3 Dec 2019 09:52:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203084553.20669-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 03.12.19 09:27, Peng Fan wrote:
> Thinking about core0 is inject SGI to core1, core1 is handling SGI
> interrupt.
> 
> That means core0 might be in path to enqueue SGI into the pending_irqs
> array, core1 might be in path handling SGI and pick one from
> pending_irqs array. So need to use lock to protect unqueue, not only
> enqueue.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V1:
>  The best case is only lock one entry, so no good solution, because
>  there is possibility that inject fail.
> 
>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index 1c881b64..fbaa3099 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
>  	struct pending_irqs *pending = &this_cpu_public()->pending_irqs;
>  	u16 irq_id, sender;
>  
> +	spin_lock(&pending->lock);
> +
>  	while (pending->head != pending->tail) {
>  		irq_id = pending->irqs[pending->head];
>  		sender = pending->sender[pending->head];
>  
>  		if (irqchip.inject_irq(irq_id, sender) == -EBUSY) {
> +			spin_unlock(&pending->lock);
>  			/*
>  			 * The list registers are full, trigger maintenance
>  			 * interrupt and leave.
> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
>  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
>  	}
>  
> +	spin_unlock(&pending->lock);
> +
>  	/*
>  	 * The software interrupt queue is empty - turn off the maintenance
>  	 * interrupt.
> 

Did you see real corruptions?

The idea behind this was that the injection to the lock-less queue
happens in a way that it won't make changes visible to the consumer that
are inconsistent, hence the barrier in irqchip_set_pending. Looking that
again, though, we possibly need another barrier, right before updating
pending->tail.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3408fd87-22fa-31bc-657d-8661ad3998f3%40siemens.com.

Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU6IRT3QKGQE26R5GEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F051F7403
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 08:44:36 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id w27sf2351404lfq.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 23:44:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591944275; cv=pass;
        d=google.com; s=arc-20160816;
        b=VLxCH+Em+i9ZVgcNhKkcyHlwEZhJL7eYgg6xZE+3HsSzqUwetDHFCHWnsiHms1Gwib
         ycm+12mTGuLD+pFhNqSbnf4oXnF/JAnvE62iiWrXw9I4alOz1Knrldq03Fx1TI+hbIgk
         v+hPrMZoCWM65VSVV2O7KOEEIp1nCJFlqm6fBP6eaoWH9qfpvvqi0tdCxqZTROsvmfAa
         i/x8mh+FjUNI9Z0h+cNgoNNKyHRd0T2s3+xaIkZTNdJblfYQWUzR1NTRG5y5veLwGuq0
         VVACjzE3jyFSfrnveqwfJvHL/ZI5gjTUJCCJtTAP/DO9pj6LLyw9c7WDq1D6Qq8QViI2
         7esA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=9OvL/KP6OIONsLFobra+y2MOLqZaMMH7C1WR+RV7Fdw=;
        b=o8RZW6BH5vTty0mIE9b6FfS02y7oujefKiz1VtDRF/gz6ZrLcXjkDL5DjC63cp3yEu
         +UQnNVKIaYPrPbjG0KtC3jF9J4+S69kxWcqFwWe/IhoMGmcaUyvEfrKw0suxrk1WN1+T
         RtmGhoTH5SgoFIIWJ9vrWG3UrCenb0dgwnV5oD64+RYAmyjekwB1mZlOwIvEc5/FD9oy
         Mr6zF5Ddw4rLCOLJYJSrBDbZsncMsUObyZaO1TXU2jxnrCmeZuTZHVpJ1W7Ais3q6NeB
         XpusYWDyymG6iZbe8FcX/En2P37ltM5jze0Y/uCicYe4ZHx/k95eJS08KZuPIkbez8hK
         /JVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9OvL/KP6OIONsLFobra+y2MOLqZaMMH7C1WR+RV7Fdw=;
        b=UYSWNwObkEdA3Oq1ZFj7tqqJogov3n+11rDyiHaj61ZEJQ5CAtdDH3bzCN3o1sbHvd
         g6G+KVwbuvLEzARg2xYU5xwne2sgOh9rC3BOo/UHzc+0JCr1V4zuEY+/2GFRbQzzKNIa
         jDzILD6ZYHdQZsyGCb0dLbJ21YtEYN7DJpGGhPtADVFuKW62tjCgevHG5L1p8abfiLIa
         3gr+vKf6fsjiqoYyg2j7iViWBqt0bNOKaKJgDDdryW15v9zkBgNgF3rdAdyg08xlE6fT
         fjlH9FJzc9t3hJ14lhCdYhOPeg8vdRa4dhfHUwXy6ov7ElOT9ES/4AOvlPM3ByMV1gUy
         SjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9OvL/KP6OIONsLFobra+y2MOLqZaMMH7C1WR+RV7Fdw=;
        b=rBrOjsK2RdZoK7ZuZzfGKjf0eC/iAl8xJTTsUQpcDw78Y7PtVlilsq7DY1L809GFlG
         HOmWhM0L0kOPra1c0q2R9PyR6G0vxXCp1JK/RPkpWhp4eTYMdTun2m1Zn7kr0yAmMiCT
         NB1IrxoSSSln0H52mDzXesFRBP8gB3pDAQJj8jGVI7ew8z9aKfD/AyM7A67CyQZMQo0G
         deHNTIK3Gq+OyPkC/ulTNO9T7v5JmNVAFYrEWYlIsNDg1bu+GpfmvOiyl/DwPNKzUN9I
         yFK9fNjL5ZPi0REUKWfbwLI/SC83FIRpbZXLXekIpNYIhSwxyN3QHHmacHlc3FiHzL9U
         UQ5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530U/0/o1U6NiRIVrUHTqdCVyJXy18HNLZHMlWeEgBseEzvJiVpa
	4hIkBd4GYey8aG89A0gi/44=
X-Google-Smtp-Source: ABdhPJzioTlyLrdQTu1B6OwG7rx28bO3x3g2hAGDOu6rGvflOSXkq0yfc6UvaGTWGdWhVqwOQdDMig==
X-Received: by 2002:a2e:8843:: with SMTP id z3mr6380065ljj.20.1591944275550;
        Thu, 11 Jun 2020 23:44:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a02:: with SMTP id h2ls981036lja.6.gmail; Thu, 11 Jun
 2020 23:44:34 -0700 (PDT)
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr6650290ljj.367.1591944274860;
        Thu, 11 Jun 2020 23:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591944274; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrvFO5PLuhhUbnzNmzlH7NKBI5DRKPAXPKTvZI3/YHMXh/O8Xao51TVhxH9pTTqn+m
         UfBZvjNqVblwI7JOJUDquGiy65QhMZ8aBm5rfQ8Qm89IE9KSmGfPwYnkGMPJnCPLESeH
         sv1ikWlHCJEw8Gm5kXJL8KeQjRhWeBIFZ89BsVg+Ba26egJLdEletm5gqlXAdNuXiX3L
         01OkfmuatC379rk7BALh45LKQrFljFY/JNYL0PeSbl7Lt7n9Dx1QNy9/Bl4GPpBVmfMK
         ri6aPKkWIMzudefTzmT/7pUCKXDOTtgmv4ggAOGCrXb0l/jU72TkhqA/jCGxxP7k+msL
         VgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=52NF2sxj7rmdIMACP6YxxKFRnqxv0BU9M1o0rUU7ABg=;
        b=hc3ZjF5BPWrsU94wmM9t7+1Dxxbp7BqnnYBWE7SotX3DngWFg/wY3NhWj2y3I5JbWH
         WidpVA1xpaTe/SVYzscW7WhMLcMLoVWDJJg68H9vXC6aiN023x1h8L4l8xrvJfwPJOtE
         +QaiiUKkCM6VH3GFYqMCsgT3dIeh4Djs3utLUBt+HsMHsi2yNVfmIqfHWzQmQCnxDGsa
         7fAMQODmAEtzNRURqiTn+qJImDS0GO2Fn5Twv4LNeTlDOswWIkg7P1TFlSQ/PotvyOhk
         cb8XDuiZ3YqrwEX2IKpzCMFGyd2JB/mCGl79fd3fdwU4l3YrQqt3bB+vez7RPSyuc2IZ
         f34A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k6si437605ljj.6.2020.06.11.23.44.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 23:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 05C6iXgq001041
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2020 08:44:34 +0200
Received: from [167.87.11.220] ([167.87.11.220])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05C6iWmt023186;
	Fri, 12 Jun 2020 08:44:33 +0200
Subject: Re: [PATCH v3 8/9] inmates: ivshmem-demo: Parse target from cmdline
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200611125423.16770-1-nikhil.nd@ti.com>
 <20200611125423.16770-9-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fe4df8b3-cea4-a701-9ec5-fa3150809c89@siemens.com>
Date: Fri, 12 Jun 2020 08:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611125423.16770-9-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 11.06.20 14:54, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Generalize the ivshmem-demo to work on different platforms
> with different number of peers and ability to send interrupt
> to any peer.
> 
> By default, the demo sends interrupt to next peer in a ring fashion.
> Optionally, allow to specify the target peer from commandline.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  inmates/demos/ivshmem-demo.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
> index e7a7f711..37a6ae3a 100644
> --- a/inmates/demos/ivshmem-demo.c
> +++ b/inmates/demos/ivshmem-demo.c
> @@ -36,7 +36,7 @@
>  
>  static int irq_counter[MAX_VECTORS];
>  static struct ivshmem_dev_data dev;
> -static unsigned int irq_base, vectors;
> +static unsigned int irq_base, vectors, target;
>  
>  struct ivshm_regs {
>  	u32 id;
> @@ -132,6 +132,9 @@ static void init_device(struct ivshmem_dev_data *d)
>  	max_peers = mmio_read32(&d->registers->max_peers);
>  	printk("IVSHMEM: max. peers is %d\n", max_peers);
>  
> +	target = (d->id + 1) % max_peers;

This breaks on ARM which has no __aeabi_uidivmod. Fixed in next be
restoring the original pattern:

target = d->id < max_peers ? (d->id + 1) : 0;

Jan

> +	target = cmdline_parse_int("target", target);
> +
>  	d->state_table_sz =
>  		pci_read_config(d->bdf, vndr_cap + IVSHMEM_CFG_STATE_TAB_SZ, 4);
>  	d->rw_section_sz =
> @@ -173,7 +176,6 @@ static void init_device(struct ivshmem_dev_data *d)
>  static void send_irq(struct ivshmem_dev_data *d)
>  {
>  	u32 int_no = d->msix_cap > 0 ? (d->id + 1) : 0;
> -	u32 target = d->id < 2 ? (d->id + 1) : 0;
>  
>  	disable_irqs();
>  	printk("\nIVSHMEM: sending IRQ %d to peer %d\n", int_no, target);
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fe4df8b3-cea4-a701-9ec5-fa3150809c89%40siemens.com.

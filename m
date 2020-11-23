Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVGO5X6QKGQEI6OSJCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F922C009C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 08:40:04 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id b3sf4011203wrs.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Nov 2020 23:40:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606117204; cv=pass;
        d=google.com; s=arc-20160816;
        b=ixSFEMnu65DV+S/5KtnnSChLeNGXxS4K5s6WU9WzTRQ5JiclEI86s+rYMTWFqGeBvf
         AgKPMJHkLMC7uFpExlpEva2fO2Bin/UAQy28N449SaWJCaT8I5OU8GQj3HR2gs4I0BE1
         U0NvKHOHyNg1iQOMuB14/S3oSz+PP+84qDEE812LmPByEdgaHhZaL3DzY9wlLZlvr99z
         sE3Rz9ZHE0YayAhRiUiyXKUDvCbjE78cJEDR+HVUkdxw3UHUXHn8EilnDqh26a9ZAXDB
         XyCk99jY/N65EH0aPBRMQo1rcfZIo+i6SkEVvvtY9tDuMsbcI+X1Pw06VrCbofrfEw9i
         xwZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=jmNzZ2DqzXuPZVA6eBHXtp7r635yXgEvZjOKBEpBwHw=;
        b=yd0zA/opYULENBtfM8g3C9PiRrXZNC0VYUJKtGLgXdxra79OYUvejBLKxR75Z1WP+H
         v59f9FMeWESvZlO79vHsDdzc/+fZoD6L0bjgbfnv8Z8JhMq2yfiEvI1VNMjJEgmTqXFd
         MFIW0ko4l43CvnX9tHKaWQpzlQ0DoGwueePhymTSitb11ZRJO2yGEjqCIQXHjRkrkBPo
         N4FHP70TyF4XPu6A2TYq7ELLpg1Xl5ZAkC5FNTJ7Y30YVa/S/nt9iClJgb/ZyUI0uhRD
         azWATReg0cRLFYsD39SAwZy+8BsImWJfHsAb/g2bYsdeVUh1IpIkGldJhZ1AkicemRXu
         rHug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jmNzZ2DqzXuPZVA6eBHXtp7r635yXgEvZjOKBEpBwHw=;
        b=kOHt7SnMMYEjbo4O0ce1zEfo/0sSlnMP7llbfw/VMj2oyoHWiWT6weLK7uUUvmt6n3
         qA28qoJGYMeBUCeZSgEjumIWEzPrfLUmxQzOVbxnzGv//KO+v/sJcor6M8+5qxeVI4O4
         c75oOmNEoHdgvAndpHe/0ly8+hPzK8zFmPhrwdj8SarR1E89j2ZBbMX6vf2Tj3aBJybj
         zxPEkHaAjY2j59rUYg0sAqohEWztaIR/Nv7XNd4ze33wyS49fr+ZzVxgL83lmMJh4cEg
         NewUpXNs1qQyXjles5jUlmxAfLHq8JA7/Sdcs2P430sXlVMz8bnDVzngB0ztui+fV/jN
         Yu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jmNzZ2DqzXuPZVA6eBHXtp7r635yXgEvZjOKBEpBwHw=;
        b=AWgTq9l+DCpIu9Crj58K6tkrw/WRoAkmA+E7+T4kQqANeK65JFk5HGhkpky80qqWet
         EVX6E1linjd/837z16DVBsX7QgCCdd1fu48nbMy0r8sR+LwrL9mdmKIe6ZBjzkU9RkLG
         hmnwkbgjIHL3W1LdRwpNjPi6WFNtmCrDfGFtvUpOkpiZ8GY3pqqYkUBYpM8zyh3FJC1L
         ASfGee0JFTTDCFtttEd7IAtaQz1YDTAjejqYgM8ixMt5iBwcCplKrsP5tH7+y3rjIcdM
         kJFieCBwhg9WWuTrIobR8YkRd9ffjYpyVX2J4W2ZkSbURff8HYg6LlnCZJpEbthJgAIQ
         9faQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531K0uRnHy9eMbR2l8UTfZbWdDp+VgEYRD/9lyfqtIRL4kUQVnDJ
	wixt7z3vr4lPak02ckEFF+8=
X-Google-Smtp-Source: ABdhPJze629opzI5shk2ZMZuaObrjRD28eVHqNIxHoS3lYndFvvRGrqJfOsqjiuuYkNVkZt5INi0iw==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr22832913wmf.147.1606117204631;
        Sun, 22 Nov 2020 23:40:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f70d:: with SMTP id r13ls6267403wrp.1.gmail; Sun, 22 Nov
 2020 23:40:03 -0800 (PST)
X-Received: by 2002:a05:6000:182:: with SMTP id p2mr31290073wrx.116.1606117203641;
        Sun, 22 Nov 2020 23:40:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606117203; cv=none;
        d=google.com; s=arc-20160816;
        b=SrltyZy3Yf9yxwm1nmM1xfEmxMnZQr1dX57gR7u0gjkDnTT8AM0gf7tzZKUGfoXwQO
         NAqCK+jAuA7+EWVE89s5ZCoIQ88vtXVhfVhJSiW+G0IEsiVHLuWIwuvo7Pr4s2jEIDwb
         d0pQgoTprZg2n3gTsXDnePE9QOQL2Eo5lg58GFRw2u0fXOlW2HJhCN8moc+YX42Pwih+
         A0MVKqhm0VmAJYUJZH9oyb6EG1vp9iKigZdbQzzv0N8v6BzNzGXcyCrdJDRIfTzagtGF
         U9SNyCIORD1YFbUtxtlpLrNNvpEoBCmLydyL6PjlUYCYNUBn63dUPARtweQI3WAm9IsD
         Il1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=lImAimvlvem1W0sB5D9g/CQAURPpiI/f5+/s9TcY+I8=;
        b=BMtvI2LRWGg/fc2TXXdVgk/KNpd5GQzy5aj0hU5l3PLPhl8r40mVCoKftFDYvnV2dE
         gpGrfkb8kTg/QU1j371GCf2bfVyuSL/bUsfpgmMsuJIW4IcFZdBjE8U9wcMIYo7YXAQm
         DIDE1zDQs3BCiXVJIG8jJbeNzIQVUHaMAmdqGlmpxlYN56PrwgdwCFXYQ24TQ8qRQSec
         65hDKdYnnyXL2O2r6svWekEm2eY/60yOWJ0cdBRHQ73u9BkaYFt//kR93LOTegRMtTEM
         aCtiChjKFLhXRRVqt3oHMIUkCm1XJ6aYVg/15XO4GqDUEuiWSzPzEfvSfo7zAvoP6r8J
         5ViA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z83si818004wmc.3.2020.11.22.23.40.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 23:40:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AN7e2Bh005675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2020 08:40:02 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AN7e2n5003493;
	Mon, 23 Nov 2020 08:40:02 +0100
Subject: Re: [linux-kernel][PATCH 2/2] ivshmem-net: Fix and rework carrier
 management
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
        Peter pan <peter.panjf@gmail.com>
References: <62ae1173-ee15-c179-8fcf-735527a96027@siemens.com>
Message-ID: <93643562-d6ee-c66d-ac8d-180f98e5acd1@siemens.com>
Date: Mon, 23 Nov 2020 08:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <62ae1173-ee15-c179-8fcf-735527a96027@siemens.com>
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

On 23.11.20 08:37, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The carrier of our virtual link is supposed to go on only when both
> sides are in RUN state. So far, it only went on when one side entered
> RUN by being int READY before and not when RUN was reached via
> ivshm_net_open().
> 
> Fix this by moving the carrier management into ivshm_net_run and
> ivshm_net_do_stop, respectively. Make sure that netif_carrier_on is only
> called when the peer in in RUN state already.
> 
> Reported-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  drivers/net/ivshmem-net.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
> index 1b22b1cc5ea3..56c2c87e7498 100644
> --- a/drivers/net/ivshmem-net.c
> +++ b/drivers/net/ivshmem-net.c
> @@ -549,6 +549,9 @@ static void ivshm_net_run(struct net_device *ndev)
>  	if (!netif_running(ndev))
>  		return;
>  
> +	if (in->last_peer_state == IVSHM_NET_STATE_RUN)
> +		netif_carrier_on(ndev);
> +
>  	if (test_and_set_bit(IVSHM_NET_FLAG_RUN, &in->flags))
>  		return;
>  
> @@ -567,6 +570,7 @@ static void ivshm_net_do_stop(struct net_device *ndev)
>  	if (!test_and_clear_bit(IVSHM_NET_FLAG_RUN, &in->flags))
>  		return;
>  
> +	netif_carrier_off(ndev);
>  	netif_stop_queue(ndev);
>  	napi_disable(&in->napi);
>  }
> @@ -616,22 +620,18 @@ static void ivshm_net_state_change(struct work_struct *work)
>  		break;
>  
>  	case IVSHM_NET_STATE_READY:
> -		/*
> -		 * Link is up and we are running once the remote is in READY or
> -		 * RUN.
> -		 */
> +	case IVSHM_NET_STATE_RUN:
>  		if (peer_state >= IVSHM_NET_STATE_READY) {
> -			netif_carrier_on(ndev);
> +			/*
> +			 * Link is up and we are running once the remote is in
> +			 * READY or RUN.
> +			 */
>  			ivshm_net_run(ndev);
> -			break;
> -		}
> -		/* fall through */
> -	case IVSHM_NET_STATE_RUN:
> -		/*
> -		 * If the remote goes to RESET, we need to follow immediately.
> -		 */
> -		if (peer_state == IVSHM_NET_STATE_RESET) {
> -			netif_carrier_off(ndev);
> +		} else if (peer_state == IVSHM_NET_STATE_RESET) {
> +			/*
> +			 * If the remote goes to RESET, we need to follow
> +			 * immediately.
> +			 */
>  			ivshm_net_do_stop(ndev);
>  		}
>  		break;
> 

5.10-rc5 queue was updated on
http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse.
Once you can confirm that this works for you, I will also update
jailhouse/enabling queues with the two patches.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/93643562-d6ee-c66d-ac8d-180f98e5acd1%40siemens.com.

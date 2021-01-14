Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXMJQCAAMGQE5POKNVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E942F5C99
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Jan 2021 09:46:22 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id k7sf734955lfu.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Jan 2021 00:46:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610613981; cv=pass;
        d=google.com; s=arc-20160816;
        b=fs2K6rypyG5xU6bSk80EDdwle0rsDDr5d5OJ6expOgZN9dHWkm+UDH1x15HKJhlro8
         3Oj2533tngi71yB1ia3dfzZG7erF7H4LM4ucTj44yrx8JLuUDZ94Ai+e0kgGSnXeqQV0
         evHkjb8eWEYkGiucAPmyE72mlvp88lWbTJdjhlX0bo7wKX18JWoye5qfaZ+c8lKdzVGV
         NSTQ4ZJtUxN6yD30VEwsWsUH52UlGg7zX5Wt29gPqxbLAYuKRCBHGMW263ydDMWl7x8o
         v0CZGUdi1hjLfNsA3T/vkbuG8XuCaoV7xYyKuRkz8coYLSTtzlH2Ht7zJbrm+upW98o0
         vXOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=WHs6O37kMEZYwnmAS34I/2naNDlZQcVE1Q/0zvUJrkA=;
        b=u9WdieOo6XVerZCKWAbMX2NKOKZydGrx/P3Lk+Y3QP/KgjXaTBv28xJBwWwDHvKnUi
         2upVwopGrPYyFtLtDd3aknWED5eqLrzSQaqMv/6x/54VTymDnbaY7/Or4OkrgTT1I72O
         GQuOtiVAmzx60a0qEcaANuORLePaSEOWDTcPPlo/uYip/KlnQidsTjRFTeMoTWtcBs7+
         9cT72qKbi6fqoanW0wtnxqmeNiswGSxAl24pYi5riLbKyg8nWNCccpUA/bFj0q5YMA3X
         +6BRPQcQ5QVKjDKaK8Lb0uWVH787rAPvu+mSHb/zb3zBZICMVDcqXswtDucnqEcMlt2f
         ivUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WHs6O37kMEZYwnmAS34I/2naNDlZQcVE1Q/0zvUJrkA=;
        b=Yn1pFm8vPaWZa4lg7bL1FBEKajiadywe/sL05yRZZ43g4Dl7J0C5vzL7PP7KUbMHFo
         x+78pfprH5r/w9SBLQ+zQHbbZOjEpcmAwkaaytfEe+xYq/9lHCHkh+KiZNhcVHa5n9Ng
         bO6SAQjV8Y4d4Aw8XRpv3g7SHV+D/NJ0JOnWrPkxVpi0yY40YoDGZHVYK3iLnucmx1tU
         blRbhH6i0G5XBFR3w/WmWYvVYyEUEgF9L8yYkHithPxncsEbY+ihlEBpvRTT3sbfOh4q
         yqNS2yen1D9rOtgWMw6EF6rBNh7cXgAO1lWOfhU+S0kz2aF1MY/XkhhZ+ha2Gx8gcNkD
         0K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WHs6O37kMEZYwnmAS34I/2naNDlZQcVE1Q/0zvUJrkA=;
        b=SB3dl68y9Er99mFIrxiCu8LSDCeeX7/O+c4l3yBPfeYVvnH0SUNifKP1Sp2lTic+V3
         /gaNmgBRo883d6VxFs4jTALUhTx4QNLVBJmbX8JqTh1jP6iVW1EewGT/ueDuVBwWwCps
         nC7IQ3e5FTuJb0pgfAg4AN2o40fGi3LsQfWTaj0y568C2ZTu2BeqdBfaElLagjAxqYE8
         iOpl4h7vxxS8KCajkjHjWc0+H+9vZzxwbcGMTs3WTJ6GCkRRFs3OIu1I1TV4M9LS1etD
         v/LSKdo5GVEzgIJyg779wd/0JIu0VHOAycreAptXInDEVLrdaiFNaF5/PrwRyVKiGEbq
         H+Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NTmFi14Ss8J73icIMiqO6hSxslk8hUCsgJnFh/FmNOes1goEz
	R75XEZ3uyjKqNIv51k00TQE=
X-Google-Smtp-Source: ABdhPJwnKvIZllbZxx+8PK0ITURby336jVRvE1uqflBD9UkLT74NhyB0gz0S/L4Wnrk7/PkGWMPtgg==
X-Received: by 2002:a2e:80d0:: with SMTP id r16mr2673574ljg.231.1610613981662;
        Thu, 14 Jan 2021 00:46:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls585371lfu.3.gmail; Thu, 14
 Jan 2021 00:46:20 -0800 (PST)
X-Received: by 2002:ac2:48b1:: with SMTP id u17mr2867180lfg.134.1610613980552;
        Thu, 14 Jan 2021 00:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610613980; cv=none;
        d=google.com; s=arc-20160816;
        b=cX1oFz3wemgZo8Fw8XZWbYMZ7lKJ8lGa4WqsdQpyCUJsD/GD2JFdLpXZCU+u29DFH3
         oFAB0n0pi7pXOVkRz59kT6STASKXTpvNJVwpQXgbRJ1EIQMGr0ya17cjj/wiYDymp3Lz
         SQyXwkhLBxjJiC4TczGYmRqt7wRc8KECIa7zu7Hpo0+kZkVPzHVHMOXMIJb+WNq5Aplc
         8528ocsPg9ICL5zj3VwWp9wgmbanbLuYs5KeVPKwNhKi0yHLFclBM3i/lbYD0dTB5/fZ
         XHCkJh3n5wwoXU4LgWyya1Eq3aYshkQKNhby0UyEX/dmb4lG6zNj6/rjM7tyjfutY+YL
         uAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=EpUfE/ODkJXjKhZkB6E41Q1PHy7JIJ+RCHphb+Gr06Y=;
        b=0gUqB07gm3BorcNccjqMRX/YLqSNoQxv0LRYO9NrCL4P6eNZaz2OFaB3gTXUVmp6Lt
         A0yf9WVYNyIRVbKjp/bTXPVeFA8F/Q0l64Wk8fV4tf89Da1Zc65WxLPyERExpw+3ra8u
         PBxtAkw7CdSObdeoZ4OKMC2biVRLHJrR14weUjc7fTj5dp2VGrQBDXomOW+I0yFSN9q8
         0nA52CtCQ1fVczSXH6jcKXu45L5PhKe/zuWAKZBeB8h3liG+nkeUQHOVXoYo8Q+E8/Ek
         a0D0uBWE2u5/fGFXgRM+It4yRzWerX520c5Mu/nPWuEXH8VgjEVjTpNQA0xazRiUuuLC
         l5yQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e8si232131ljo.5.2021.01.14.00.46.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jan 2021 00:46:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 10E8kJfV024125
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Jan 2021 09:46:19 +0100
Received: from [167.87.43.185] ([167.87.43.185])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10E8kJxm031449;
	Thu, 14 Jan 2021 09:46:19 +0100
Subject: Re: [PATCH] virtio: ivshmem: check peer_state early
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com,
        Peng Fan <peng.fan@nxp.com>
References: <20210113103946.359-1-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1b188b78-f0bd-5b63-84e4-e1439bc2c6da@siemens.com>
Date: Thu, 14 Jan 2021 09:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113103946.359-1-peng.fan@oss.nxp.com>
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

On 13.01.21 11:39, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> We enable the virtio_ivshmem driver and add
> shared memory region including pci devices in cell file. But we not
> start backend.
> 
> There might be garbage data in "vi_dev->virtio_header", so we need to
> check peer_state to abort the probe earlier.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/virtio/virtio_ivshmem.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ivshmem.c b/drivers/virtio/virtio_ivshmem.c
> index bf62377790b1..7132cf0e25fe 100644
> --- a/drivers/virtio/virtio_ivshmem.c
> +++ b/drivers/virtio/virtio_ivshmem.c
> @@ -846,6 +846,10 @@ static int virtio_ivshmem_probe(struct pci_dev *pci_dev,
>  		return -ENOMEM;
>  
>  	vi_dev->peer_state = &state_table[vi_dev->peer_id];
> +	if (*vi_dev->peer_state != VIRTIO_STATE_READY) {
> +		dev_err(&pci_dev->dev, "backend not ready\n");
> +		return -ENODEV;
> +	}
>  
>  	section_addr += section_sz;
>  
> @@ -898,11 +902,6 @@ static int virtio_ivshmem_probe(struct pci_dev *pci_dev,
>  
>  	set_dma_ops(&pci_dev->dev, &virtio_ivshmem_dma_ops);
>  
> -	if (*vi_dev->peer_state != VIRTIO_STATE_READY) {
> -		dev_err(&pci_dev->dev, "backend not ready\n");
> -		return -ENODEV;
> -	}
> -
>  	pci_set_master(pci_dev);
>  	pci_write_config_byte(pci_dev, vendor_cap + IVSHM_CFG_PRIV_CNTL, 0);
>  
> 

Thanks, picked up for queues/jailhouse.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b188b78-f0bd-5b63-84e4-e1439bc2c6da%40siemens.com.

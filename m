Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBGEO6DYAKGQE2LGYNVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375C138B81
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 06:58:49 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id t74sf1877229lff.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Jan 2020 21:58:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578895129; cv=pass;
        d=google.com; s=arc-20160816;
        b=IoY8DG43Wg29NRHoaxCGiVy26O+7KGp0ynHT5y2lfSDG/sf08EMVVobM7SCMi20xvg
         jueQQ5SAlCf2hRo+W1kppNHAwRNj1oz+HLsqXU1xzbmTJrcKrmukkGIBp3BMYp0nWM1Z
         6z04ZVDL4DJPu6NJgb+WAJN2yqr7dzjP46vmbEVh+nOc8DDj56glRl0YMhuHyndqfQ37
         1S0cfSEuxphDLyCC5EnARMuRC6HqWIPjJYw/gr3iWET/IzUGTFE6dgXg0/UmYHxQNdsJ
         9YLQf6g695hB4M9QFbPbcbhVB434jThc/bV7DYFlutZUGxANR1pDgITtEgyERqp1o436
         KwEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=H1gVnRQY4jyoeVaCV9Qc36gdqRsNghlw2VnT3u+f7dU=;
        b=Kvz7FCns1cLvqZ3peGoY6IOdKpj2sA52x9xMCltzZnBCKB23yvrW94dLW4kbGErWp4
         oz8kWMtKomc824sKWXGIEt50eRO3Ph2ww4n/P3br9oy5avH0T3/Aa8WQ9HTP4uY4oTEn
         /geajxT1sK/uwQPqpvppDD1yW2+eeSrTQHL1JCafAT/EofepqQkx3nr+dYSCB1vdeUvy
         69PrtqQKz+Pz7vyimluZi68fmFEHsjR2rwiNFd+HuVd+/Im5h0RhIoIN+hpK82Yzw8D6
         JPzZQhEg5gIlSF6QwEZfRCPcvk+gFIL2u7o6ertcjbXJ4KMax0M2YkF8AJB2qeynIqZI
         /mzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=erETl7xC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H1gVnRQY4jyoeVaCV9Qc36gdqRsNghlw2VnT3u+f7dU=;
        b=lk0U8nbX1jXc3gUpKaqIcK1GIHImSapUAqyDvhEocBZu/gNeSxQ0nXGEzlgn2F1HbX
         hzGDu6yyMgsDD9Lt2Y0oIhg4h2e0wmC4gCZGKqW/1s8Mx4Ws4AoOfty3Hj0AfvPVHtF1
         FXHKgl29bvV1kSt+MO4UOKvwQW5/3b/KWMrFDNtzIJd7bnsKsZOUMbbS6jl+dSqnN5F0
         fj8EVkwJW0+7OGLl63MwQ/SOCsM+V9QeRDNXyE4YSjc370ABZx9ryc+kPushKkK3tRhz
         VHZWQLGV81+tosBUHkBjRL4+VH7WjYlzaEpI8LD24II/pNl2SOuP11upddxyLwQ9D6TR
         Z7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H1gVnRQY4jyoeVaCV9Qc36gdqRsNghlw2VnT3u+f7dU=;
        b=J7SkuEpTGwJ5KgfzJHf4bi9RCpqyQEhxEsPV5pJivaNSTKHAKvvowohXPc0t21mRuU
         Pv2+VNUsyVVjMsiZq9ob0G+rfx68YMNkgNUYxx1vHk4oHHPrGuY57rzwhZJ4xGsA7IkF
         Ysxk8n26Egh3r5rYUyfiXAtxzfAEpP3ytgOSb2jJQ3oZKvbNu0dT7xnejzUf3t1ladCM
         2HL412ZNnjokmWJ0RBX4dhG+Ux3oUuC0z/yMpb9vMmyE6VednGA28F95BUQJjTpxPGuE
         z3aGYJZIw8VELfdeaR9Y34psg4dQI6qJNsN8+moYDThseDwftA1jRngIMjlWKjIPtY8u
         fqjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUfnmFIgkuD8UKosAu3mRxcDIcZJ/DesaghQ+oheHhkU2ImQNVy
	/wQBFUStmqHnCleApcwpDG4=
X-Google-Smtp-Source: APXvYqxQq8UnsJg21SyaqLgl32m/51seGmhpRNOpmM34xjX0NPw4YrqqB+cwC8jhr2QBBmsSDX+Bjw==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr8867317lfp.121.1578895128932;
        Sun, 12 Jan 2020 21:58:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:1608:: with SMTP id w8ls1388803ljd.5.gmail; Sun, 12 Jan
 2020 21:58:48 -0800 (PST)
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr9739748ljn.40.1578895128161;
        Sun, 12 Jan 2020 21:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578895128; cv=none;
        d=google.com; s=arc-20160816;
        b=MNWA55XNa3zrqKhUMbMMvlMkkq2ZZNQMojoeBS7RxH1IRHO6ok8vNCApBSnZPRZwm5
         QI/iWyNzIoZyUBZdykGxmHRLGtUcxyW47TezqrVtCDd5Tzw8zTovMoNLnzBFOW54e89m
         BItpcTaNRLqFZyMHyqiaXgorrUOg5ipAP7Bq8aiUE1jg+zLAGO9Macg1+vKQQ6ljOwPB
         8QqfIQ0iEe5mSbITXkiC9ocz7qaqzqP0QNBe46hsC62A9eptAAZ9ptgMbus6527EtcfN
         AhBxhmcjxIQqW/3yypveZnxR4SqBHW7zXrqHI5NsJrTAMMRZo6kNz2ySoaWGIYMCw2qh
         WZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=PUxXY+XxPM//WP6qxEWEMYbXULqODGl1rBwbf47TSUA=;
        b=AktYj6G26exNGRx6pKamqQXSq35teu/FRMcpgjm9w3KcqRuEIlE9L1Qs+TQGtA6D+X
         arDVRcZbahTV4jagLd491UGrOHh97AWOTiWDEiW2RZOqV+beqf8Mdm5wCzSsRg0yRC+u
         pPUCVkWtuLt7w0xsEESnHnvq0VFUmgTfFXfxycJbhwN6IR70PnvayXWR2CcyiTHBpOXY
         26vjnwZEbu2gKRA/upAcks9CoNeBA9Rm6FTGU5oxZJyOK9rQ5LfVvxMpUxGI+DusQgAL
         dDn3gN+Bn8lpAlvAAkpVXZtUIeMBE3cuVSurdowqAyrPXI2Sb/rwYyJiZs7ImbYaQ5Am
         7O2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=erETl7xC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id a4si303504lfg.1.2020.01.12.21.58.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 21:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lnmpz-1jJMTI0m7j-00hyo5; Mon, 13
 Jan 2020 06:58:47 +0100
Subject: Re: [PATCH v2 3/3] configs: arm64: k3-j721e-evm: Add SMMUv3 IOMMU in
 platform_data
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
References: <20200108111512.9844-1-nikhil.nd@ti.com>
 <20200108111512.9844-3-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <a7ab0c74-db64-01c3-509a-0984c654b930@web.de>
Date: Mon, 13 Jan 2020 06:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200108111512.9844-3-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:kh48qO9rm4Xz5n8bmBIDy+PSa1zuyROvLgRoI6JOcnlTW0rvty0
 JtEZKR9YnKuoTbdvvcEDKOa+oWm2+dRWKEufI2p/MvhZMtfVCakVDvlrmCDkKRm4EiYqb3v
 qJR2KL8W1rdFM8pBd77fP0Lv6doCo7AHlLDGcefPJ5PznrqrYJAleR5ouBom0Kzr8srbRXH
 eUGb6iuYejqlJUmSFTIxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PZCkLXfMUm8=:bb+4TBgkKtM6L6EMgcxQTF
 3/dChYzliIP1hXML2sdJ8zt/4Ho8PJ0wCmBq/Shm9nIotxyswlyGoVwXsY9q39pNRKsFMndbh
 0rtXseTC8Sysqr4y0WSKvtfxDPGTO/yHi+rLTjvODfsNclr/0G5e578HQKX68S2uw5AAA3RQV
 XJMPXAeaNNBHv7MxnIb09Fq486VFUJH/N3uPPsdbCgS3P5NzEtufpkiaxmJl5k9SQ0BEZC7+v
 cTFNZd6HR13g5Gul96RAdTxoTNOEzRQXEfg4rZin/9Bh9FMUCQyORmJrUUbN+ueShgPas5sGb
 p3viubQ2tp99d2KZ+BArtMC5kNt0lwoh2zw3LWeKlTTCdRdlewgDO26MNd6irqFGbnYJweJqH
 mEu3f0siuYKVqXFYUaym5QRIlOU1Nwued4X8koXYMX9v9aiAvMg2FYbHbQdR0K7u74VRaqQYg
 iK6tqBvZ3t2MoPfZoRsth6eUrRK8RXjFO0xabNcpnSIsbfteFIHRRKQdHsk32E7KiTqWE/NI3
 jEuxHKxt7Rf4aoayG47FxxTXmwE8nD4Z7eQ8HEDKD+dOnfgqkL4QCQUP9cLmhTmQ55c0FfUHJ
 dhR2DN9fKBgZzv9+LWQmIWUMCHa7WFuISF9cq916JXVJbK9R2XSL8Kvw8o1BHGQVofHZPeibK
 /11/kixpkUOLdYsIrPUNisy9qV23aW1xi1hjRrP/eShDA9wBhF/Zco9NnrKUcbT3HQwgyL7sW
 GANToravso4Wln1ZjvpPkhGjCvt6Y4MQec+1NhXbPXpXh+nVMT4GI1sm+UNdJb7Law1wBek8O
 2lgslRu+XOz8yxU7UcZZ/0WGUMNQ+t13VRsRshOxoM6UtjwdneTzyygydqWXsCR5QQrSNgDZl
 ocMUWsRaZ3Bt8QXQ0QJI93Z+rAxe0nth/evtS9lpEqltBvU8ieHudfEuqedfr5Ech/wDIMNH7
 CTu6J//MjG19IaSZznhm+eJgNM8Uj9XCD5Vi1vomfIoDQyifEtnqI7wi5g46V4c/xvXoApEtC
 QovgA2cjVVGu1EChdBkvXDPdXzxMOt2vjEupUJp/Dl3/jYWsQlRp1IeM1DW+e+6NVsEK//Dvj
 GhBzlIXXiosyO264xgk5wVWMECbRa+sG5goiJFZZbyDGHqMYFjG9nQenpcehF8On1jF7jDhvc
 J/n9ghdM8vuuold5UgpREiS5FvRZfKSSIwJNwMhV2aXEiXNrRBxH5zMM4idLja4EzQrT3QGCp
 1payraPG36AY2ZixaD28KlZArzI2v1L56NLjEgSc/nroeLaTJ6L/hTqe3wHA=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=erETl7xC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 08.01.20 12:15, nikhil.nd via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> J721e has a single ARM System MMU version3 for 2 stage
> address translation of DMA requests from different peripherals.
> Add this as iommu unit in the k3-j721e root cell configuration.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   configs/arm64/k3-j721e-evm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> index 17ffb0f4..1de90416 100644
> --- a/configs/arm64/k3-j721e-evm.c
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -50,6 +50,13 @@ struct {
>   				.gicr_base = 0x01900000,
>   				.maintenance_irq = 25,
>   			},
> +			.arm.iommu_units= {
> +				{
> +					.type = JAILHOUSE_IOMMU_SMMUV3,
> +					.base = 0x36600000,
> +					.size = 0x100000,
> +				},
> +			},
>   		},
>   		.root_cell = {
>   			.name = "k3-j721e-evm",
>

All three applied to next, thanks.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7ab0c74-db64-01c3-509a-0984c654b930%40web.de.

Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB5Z7D3AKGQEKQZVNAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 851FF1F1742
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:10:00 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id h16sf1768501lja.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591614600; cv=pass;
        d=google.com; s=arc-20160816;
        b=HVnSt2ugNRu+cuhlGz+NQ1Sp51k5HaWZYfUOOwth3rkWc+G6vMiEq/RQ02RYxUwuK9
         8/hPUaxnvVqtLlVZbCPqUHr3gKeHo6FWovEwRUeieU5uaHMLBP48T/gKSzoSQIxJ8Y1y
         oripDJd6pj7t15BJrff6YaBZLrJPAjutyHbP2yA1PYhet7Q4cNUtHIAkDYSqve6DC4ls
         ldDE+Xs/Ekw/6khMxzal/lhH7JpHb3akQ3lU+KkYouyuug2nKpfymlL2ZQwnmwNri5Rh
         zTiUA0RE2N3LJVQqDStdE1c8ef45y5rSlrS2E5GKDdRp6kcfYkgErc2uikVzeqF0M9tv
         eIMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=hHCdiOZbMKINk8zVH6rAgCiL6U3T3P0fdJyk6g0KJ/0=;
        b=AQx/wyxGpyJfGuIWX1elfCWwBY8KQc70n512J3fKiIUKVlIsefZ9VSZwgvax5r7Hk0
         nsGuJR0GfH87vsJWj2d9BhTIgzTpusShm6ZhJZAPmc8h/C+bLwmMk03XSY87Y1fxMfCo
         VhBTSjf5pqXYkKas9c3NCieIkDFsMyVcJE2Vqh4ksECytjA0vryVTHMK+Eo6tjOWQNOr
         JxNKVKkYxwzkA3dX+Yk4Bt2QcX4JKCqibYWik/yFIS7xh2kKwOV4NA6zKhJk2ALfMF49
         9gLLu7pjw+EzbrFFsWF3bzU1XCGOMBDPWorOLcnCKhNhpTH90+pPhMNSAGlZwdvIYJ7p
         FRog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hHCdiOZbMKINk8zVH6rAgCiL6U3T3P0fdJyk6g0KJ/0=;
        b=T57zeqjY996D3Xj0Zfcy+7VSc0eTLeVNj7q1CMmWa92ew4b01sqrT8u2Zqj3pjEfOv
         gChIm0ibFv907sgle89HpqTQDhs9AXdbqNMpTGzg30IoM6rU+734nUNWAzKeuFJBcYyB
         TfYa24zDcEFdK9jw13Xhrl+Pu+U6FzSKYsPyy18h03Bp27tX44Brtp5WHoMJIX9H9n5A
         ZrR12xvgXKGeDMdVn+6xlTZ8CY/6e4YceFLWbT/BO8RMb52B6A3vrlIgHE0GskNBTdzC
         RoHoM5d2XgSOUK+nd22COg2PT5SRyeyxPgokXxdC7/BJnrYgJTroL2mobrornPoYlrah
         6itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hHCdiOZbMKINk8zVH6rAgCiL6U3T3P0fdJyk6g0KJ/0=;
        b=SO8jhSh0HZ2yQCTJcqromfGp2KAtktWxTniOKDa7WP8k9SHpsc4r0I1yb/eprs+EyQ
         ZtImGRNhLSZRVgfk2IrzlVYA3HxFTML5LlJKPScZeyj2We2rC6U0GoiYnXVkQZ69mzxv
         4L3jUHwh7+vX12Cjf+Tqusg9gdKFQqJrgOpvK7N3uI6jFfz3ozktqohDRxckLcnUlN5K
         251E45xkUC0fPMOMm+JYf4XWDC2LN5mUWMyX/GaASVXEipaL68Y0irsH25Ba/k7qZCbj
         L/zY76/RxJWxph6oHmac7JG11lPRreBMKezOUqT9ZKap3VpTF+M0OZRJCvClbXF0tyZa
         tELg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533teuoiA3qJVix9ujSdm5BV2mukyrvrslO3OS+iFPkSG7qL7PYc
	ACNCnPum0BjnJMD30DP7VEw=
X-Google-Smtp-Source: ABdhPJytWjpFA9k+LUbO5z21E1F17pClXDpmFTCyI5EZC46UjAmNaOLtj0pIZm2Y1G5ebeaTK23zCg==
X-Received: by 2002:a19:3fc7:: with SMTP id m190mr11568468lfa.84.1591614599989;
        Mon, 08 Jun 2020 04:09:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:96d2:: with SMTP id d18ls1452643ljj.1.gmail; Mon, 08 Jun
 2020 04:09:59 -0700 (PDT)
X-Received: by 2002:a2e:45d6:: with SMTP id s205mr11779882lja.101.1591614599160;
        Mon, 08 Jun 2020 04:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591614599; cv=none;
        d=google.com; s=arc-20160816;
        b=Hi3D+WFClnM49DJWO3mgp0q0lsH+ZeHD2NbioTmXlUmrsty/zNDd6IRJQUmJ8URno7
         TIUXhvixaJePfyPXgEeaYSH0JfExF11MFwE9wqNks2jPUnTX+8XgCtLECQrTF/NNt+Fh
         Xq2LuFlYKlKNzNHJwKMNLkdHppfxhB1dq1+MhEqvXlAj+5sN2WHZD75GPCjOl0A9oq8M
         j93a2Zx9JIPS5lUH/nVT9d9i5KCL7V9DqYpHpho30i2JW30iRkiLA0S+cNkLVQZB690V
         dHcer1c4CjvtlzWgTKorWpXWM8VXK3Cir7PsCsmMA8RHQabtmrS4vKLIOEGrZsHFlDmA
         Esog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=yRFwSL00CWCNgDV//HMRJcgzwyWSyiqNM6JobXe7Ixw=;
        b=txtw+mHJQ9Ro7qju+z/OuUo1DRDZ/AI2kl4B8hPKkn00x1PPPRkTAWAFlCapv5b6BE
         +5a4ACt3MZftN1Vz7Qc6jBSqqUiGEW7frNN8V/AM1g37CT/hRUknA74PTJFtRpKj0nVR
         6Sx3cYEAw1vb3PLd/ctZVYfrxCjEVBtTX6EMdI9/128S6W6KsHQlQy7tgXuNKrBDpwyj
         CzS5q1uaovEPMRBoaUxvsurmNhyo03jphVbWpRoIotneO03hhJHte+kAuwn4ATU/tCVV
         WBt66uO9HahLDV9XqTFt4KeDpUrYfaI5JfmWHaE5kphVahLBFq89p16KoKL4wLQMXEsF
         2yPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 130si469028lfi.3.2020.06.08.04.09.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 058B9wjj014704
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 13:09:58 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058B9vdj001082;
	Mon, 8 Jun 2020 13:09:57 +0200
Subject: Re: [PATCH v2 9/9] configs: k3-j721e-evm: Fix memory overlaps
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-10-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0@siemens.com>
Date: Mon, 8 Jun 2020 13:09:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608104255.18358-10-nikhil.nd@ti.com>
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

On 08.06.20 12:42, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Fix errors reported by jailhouse-config-check
> Fix overlap of baremetal demos with IVSHMEM.
> Remove regions of memory which is already covered as part of
> some other memory region.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  configs/arm64/k3-j721e-evm-inmate-demo.c |  4 +--
>  configs/arm64/k3-j721e-evm-linux-demo.c  |  4 +--
>  configs/arm64/k3-j721e-evm.c             | 31 ++++--------------------
>  3 files changed, 9 insertions(+), 30 deletions(-)
> 
> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
> index 39c6c414..b070e643 100644
> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
> @@ -86,9 +86,9 @@ struct {
>  				JAILHOUSE_MEM_IO,
>  		},
>  		/* RAM */ {
> -			.phys_start = 0x89ff00000,
> +			.phys_start = 0x89ff40000,
>  			.virt_start = 0,
> -			.size = 0x00010000,
> +			.size = 0x000c0000,

Why making it larger?

>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  		},
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> index 05517751..02b0a248 100644
> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -163,9 +163,9 @@ struct {
>  				JAILHOUSE_MEM_IO,
>  		},
>  		/* linux-loader space */ {
> -			.phys_start = 0x89ff00000,
> +			.phys_start = 0x89ff40000,
>  			.virt_start = 0x0,
> -			.size = 0x10000,	/* 64KB */
> +			.size = 0xc0000,	/* 64KB */

Also here. Plus the comment is now wrong.

>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  		},
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> index 41f4c456..971aac22 100644
> --- a/configs/arm64/k3-j721e-evm.c
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -152,20 +152,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> -		/* usbss0 */ {
> -			.phys_start = 0x06000000,
> -			.virt_start = 0x06000000,
> -			.size = 0x00400000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_IO,
> -		},
> -		/* usbss1 */ {
> -			.phys_start = 0x06400000,
> -			.virt_start = 0x06400000,
> -			.size = 0x00400000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_IO,
> -		},
>  		/* Most peripherals */ {
>  			.phys_start = 0x01000000,
>  			.virt_start = 0x01000000,
> @@ -222,13 +208,6 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> -		/* MSMC SRAM */ {
> -			.phys_start = 0x4E20000000,
> -			.virt_start = 0x4E20000000,
> -			.size = 0x00080000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_DMA,
> -		},
>  
>  		/* MCU NAVSS */ {
>  			.phys_start = 0x28380000,
> @@ -275,7 +254,7 @@ struct {
>  		/* MCU WKUP peripheral window */ {
>  			.phys_start = 0x42040000,
>  			.virt_start = 0x42040000,
> -			.size = 0x03ac3000,
> +			.size = 0x030c0000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> @@ -338,10 +317,10 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* RAM - reserved for ivshmem and baremetal apps */ {
> -			.phys_start = 0x89fe00000,
> -			.virt_start = 0x89fe00000,
> -			.size = 0x200000,
> +		/* RAM - reserved for baremetal apps */ {
> +			.phys_start = 0x89ff40000,
> +			.virt_start = 0x89ff40000,
> +			.size = 0xc0000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  		},
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/85d95c1b-2ef9-185e-bfb3-44f5a4d7dbe0%40siemens.com.

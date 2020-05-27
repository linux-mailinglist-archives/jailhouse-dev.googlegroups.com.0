Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCGOXH3AKGQEYGZX33Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6CA1E42F2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:11:37 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id d14sf935183ejt.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:11:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590585097; cv=pass;
        d=google.com; s=arc-20160816;
        b=fms94dGumnTLZEoiMAQQUS1mlMZJONNr6K3EGknMfr0DJyQuexOKfST8Vh4ok/g+Wc
         B8J+8+WOAYCoNbhBQ9czIYrafdMc/E9fpUNseBd98InKfm500ARkfabFfV23kkSsh2gy
         g8Sov/PGNI2bgV3tZwxxaLzrTtte2johXaFHHsDdoJ0gnvAgg29Acgzq1LEGPw4v1/Zr
         OyAvtl7GjmOm0VV2AASQujHqOteMxfotYErUCtEcSnkquVe5uQjgsDX0Yo8B2Y50mzo4
         T2z0r0h7Za7ZL32Gelb7bMcCysmQOIbQSMUHttoJNGqVWF2Uyf7LnA1BVrDYH9H4DrQX
         EEtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=t/iugLavXxdwaeS+73mktABYqIWHphSZqqXPWWW6Krk=;
        b=Dos4tN/f2d+IgLEc+p+DMFly3sXpxrvgVgZcGwOuSVM7T0WooV26AFsGDa9+2cB/b+
         quiS6PA2A/cauf/t9WaNfs6UBk4zdJWTiJ9EySHTAfCNwoIGAwRl4uzWFF1t43zp6U3W
         bABrBsFbxuBKkmOoqUApzgZYDRto5uI+54dGECh5BCHMQs+I/8PAfRqe1OgmJeGwo9Nc
         SGIezWT/RPU3GZ4pcLixSV46YcWE5pvXdulbZsk1ikhhfn0oR9IubZ2vzSBGz8ma0ILG
         Ik2KWSE7+OXy+gYZFe5oLng15ncazE7IpljC3j/YUBOzFxVVcvmVtxs018UiCa9VC1uz
         sdLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t/iugLavXxdwaeS+73mktABYqIWHphSZqqXPWWW6Krk=;
        b=dyTWJk3kulyNNi1U+kvs9a9B+/TS2wfaMBM0wjdsE3fzu+V54rACcqKbBECZSCkNE5
         jFFdhXylJXLZftPVqg9/ylfg0q1aJdRJvImZPU4tz7oc0SCyuS4g5vApxKt8/KJehTEl
         kNaPK0S1AGNhu7qW6+r/YqYQNaqUIqjiou/prj9yhATM/g9q1OU7HofFmjRgNIU0vPN0
         9vMnVwlXfJa3/erPl//whX9qcyuu632f6oQD0O/Lw1xfOzoNsy3DTJkZuGBsq42wAXJ8
         GqG+S2dwtNILWaS5gFsMhbf3WqoZ9KixcBDZ7bNZ52jEGGjZLCex7y5uTNP9xOrzZeXK
         m9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=t/iugLavXxdwaeS+73mktABYqIWHphSZqqXPWWW6Krk=;
        b=aCEcZH83ZjudzmSby6BkI7vCY86Sg4J2ow1Z/6uvNOfNnx+IG+gXawWApkJB7slL4U
         eibBzRqzXVkXmjUbP9+OknpoIg25OtbT2K9oqHHOqy5tq43/r9ZJliae8qEM+N+fLHiQ
         2SF09u4mvKzfRc4e8RQnz5eYGNQtzYiHYbZfmr4v5b2aCrNyutojkoZblyzDfEBbxrTE
         2/NUacqgymJk76E7nmbG4WwpnmM47Gd1IgaQ9ZLgH2HCliumaCDCdd3eyafL1EjYSGCe
         VBLK9WtnpwQTC5GuzNiz9WRNfI5gqr3jY15gU6j1GAN6mFIcaT+JT0VT9TH7CrNQ8A7L
         EzGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532km1tulELxns+2nnJLtwjwxH6Fz776gDcYw64q9hDM8zKaJHOU
	qMQvf1jyRYkgPYg5t3K4h9I=
X-Google-Smtp-Source: ABdhPJxWBtbuT44HiQ/tRro2drp3i68dTap2GN7aiT7GyG30H6Jp25uGQOabqKhJYd9ecQLYIzvAcw==
X-Received: by 2002:a17:906:48ce:: with SMTP id d14mr3722216ejt.468.1590585097193;
        Wed, 27 May 2020 06:11:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:793:: with SMTP id l19ls6935757ejc.1.gmail; Wed, 27
 May 2020 06:11:36 -0700 (PDT)
X-Received: by 2002:a17:906:b2c1:: with SMTP id cf1mr6420877ejb.135.1590585096374;
        Wed, 27 May 2020 06:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590585096; cv=none;
        d=google.com; s=arc-20160816;
        b=OnwgTmk4XqeqmN/NS4Cg96Vz0+EmHq+LV7TdUTmwro3nwzWI42QrqxdA/mMoC8w3SA
         tutsGlpmL2+72jZv8QXngS72CiVj1FH7OqlDtf7ATWeRnrwEG1SvNKMxNwsYwFqs5dde
         UPSYE8nwTvcD1JJpJJ0F9M5/YeCjxjlV48OLzB19j4Sgi3NXIJN3YJtxPpWaXZztjTtz
         doMgqKiKRsY/tdBdMZsiQ8P63/BJiwAW1GhaVdrwIYnZtPJxS7kiH/SY0pewQTAAHDmP
         ZhXNztCq/YIIzwD1p2xGfJWzp91fLQ3bYzfcezf9gr1kr0NP4iKrq7W8fXQq0U0Jsjg1
         orEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=4cns7GrtmzSMC84UJa1qqniNygRLAKx1fy+D7QjUbC0=;
        b=OpXyEg+mUMCrB3UKB/ojFfZ5p6lFQZUDShl7Sql67PVPf0Xtt+1doY7520IP2yR8R5
         GtjduS5JGxUuIfNY01z+Mkv1p+U2ApYR9aysM5usqg1QLDxV3b7p2/Un9UZnPzyLZzLO
         TaLkpWhq6jIgxdpAACP02JpSb4ttQSo3DcIho5GvEoixGRkq2GFrMa+h4u3Wxy7drT8g
         b/CTwblSG8A6FzYZFpwezENID4Dz+ZmybNWQMjCxOIZPNCLRQeyDfs+YjjuJ2/oS78jx
         LgeST57xPK+JEucnkFaxELOen3/o1QqKwBrQPXIoMeQvrO1UmCrjjK0LCsss8MqeK2br
         34lg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m17si36004eda.1.2020.05.27.06.11.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RDBZVB013496
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:11:35 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDBY8e012001;
	Wed, 27 May 2020 15:11:35 +0200
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
Date: Wed, 27 May 2020 15:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527123225.31726-5-nikhil.nd@ti.com>
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

On 27.05.20 14:32, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Number of peers available on a platform is different.
> Do not hard code the target peer_id used for interrupt.
> Parse this from the command line argument.
> 
> This de-couples the dependency between number of peers.
> ivshmem-demo can be run to communicate with desired target

No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
target. All that is accessible via the register interface. But then all
demos should be updated, ie. also the bare-metal version.

Jan

> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  tools/ivshmem-demo.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
> index 163653e1..98d24111 100644
> --- a/tools/ivshmem-demo.c
> +++ b/tools/ivshmem-demo.c
> @@ -91,10 +91,11 @@ int main(int argc, char *argv[])
>  
>  	pgsize = getpagesize();
>  
> -	if (argc < 2)
> -		path = strdup("/dev/uio0");
> -	else
> -		path = strdup(argv[1]);
> +	if (argc !=  3)
> +		error(1, EINVAL, "Usage: ivshmem-demo </dev/uioX> <peer_id>");
> +	path = strdup(argv[1]);
> +	target = atoi(argv[2]);
> +
>  	fds[0].fd = open(path, O_RDWR);
>  	if (fds[0].fd < 0)
>  		error(1, errno, "open(%s)", path);
> @@ -113,6 +114,8 @@ int main(int argc, char *argv[])
>  
>  	id = mmio_read32(&regs->id);
>  	printf("ID = %d\n", id);
> +	if (target >= regs->max_peers || target == id)
> +		error(1, EINVAL, "invalid peer number");
>  
>  	offset += pgsize;
>  	size = uio_read_mem_size(path, 1);
> @@ -180,7 +183,6 @@ int main(int argc, char *argv[])
>  				error(1, errno, "read(sigfd)");
>  
>  			int_no = has_msix ? (id + 1) : 0;
> -			target = (id + 1) % 3;
>  			printf("\nSending interrupt %d to peer %d\n",
>  			       int_no, target);
>  			mmio_write32(&regs->doorbell, int_no | (target << 16));
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/98bf4c5b-9812-d2d4-8da0-c887b44277b9%40siemens.com.

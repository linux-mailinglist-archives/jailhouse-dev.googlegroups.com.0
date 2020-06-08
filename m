Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT527D3AKGQESZJALDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D381F1759
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:13:20 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id g9sf5951253ejs.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:13:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591614799; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ka+SAvkmQ/pdHlOMzlWxjRsLyTe6kaClzfCQBEwPQPVTVmjS5+75aTV+K/i6G7AVvE
         vNtg8ZOMfArmv/em7XiYrPhYu9WMuSfGyKsapx1k9iDVQO1rYufSGkDImFuDjY1vUCxK
         m6bDqXdnqUvUwy6ims7Vm8eTK3ZUq0U2f7fiKi/qIiYQrhDhmmBnU6SS0wQJD6C3Y4r/
         aWWsK2AvadVR02icWTMnAeTbDXrikSWfBJ6hH6eXi2K1Ol2PP13EGDHWszckF5+mWqWA
         RH2OwoAWtQLVdfulxpltDBdM0WecaTbsKAnMoEMsdExyOBnfW8YlJ1G16b13s6T//JQg
         inNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Ab+07bidGjJjVLUejFLswlBeN8Hpk/fX8mjp5ywKFuQ=;
        b=XdJ81WF/ZlLiB1QiDvAXdXlIWqBuJxmJ1PpaJZiLvf67/125aTYWJG7SLS5qMrvx+n
         DEIjc4bt+c/vjN2oAgEBCQ7ZWWFV56kE5Sbejog0dE6SV6rtns+RUK1BzKusN+1inycX
         YdXrPfxFDMsOeCjHOLxQYWCuvU4BweGlfqioS94qPbHqR8pHAK6b+CLb4QPjbXFFYeDe
         9lUWY9D7UPVUWg4k0p1NcySU3Dy7glkidvCxNQAGPSoYFPUXxDNEv2irIM0HIY9+ma4T
         mlyaQ369ytxpsfnbplabUldKDB653gneBjJQtKbBroJiUhyXOqaRE45w+Vti3kQ3PUjM
         iT2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ab+07bidGjJjVLUejFLswlBeN8Hpk/fX8mjp5ywKFuQ=;
        b=VpRwnS66u/hOYb9Og8QIKS6Mz0sRF64uiaH8UTOBMlZIzn/7NItEulw6K/pFd6XtFS
         k8gJmoRz2tXN3ypccm3Y/u67Bjy6f0JBZmmqr5Wqo8Qi2gRhEUGqxpcsPMJRrtTo6V+O
         bSjEk1PcQkH36Cym48Y5r4wzG5WsOx5Qvedg0elhWpTPQdFHBDL5RvBkOOr+uBdtiM3o
         0CeaVvSZKLic2MC8S//LAaAqT24D///nAyNet5VE7JFT7hF5fJpnA2toJKuFs/FgkQC9
         df2piEJKotBSAdnL/Mnu6jAtfOb07w+uv4+dm7y8QEQuUNT/12h1UTdfU0EIY3T2oYyF
         a3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ab+07bidGjJjVLUejFLswlBeN8Hpk/fX8mjp5ywKFuQ=;
        b=EuO6Cfmj3PmIsiTx17ZLqdwccf+boy3TaYKr6THY4Cafx8Pu3DxEX7u+C7/F/JM2oM
         oQROgHgMZo80xYMupxTMSORKHf9UP/+EF49tBAeBu1Eedna+BLX40J83LoOI5HRKIUUK
         bnpyKdPEFfVeJtjJnnC2GJO4kI0If1JakKeb2rPeuEKJdCSecXqjJqqd22QmKyC0Oj36
         vuTHJ9P2/YQYLPmoKoyr75r6h1FLZztMqJs+TvytEoBbLsayAyDulZ8KpQvXa5tusRFi
         WUHG5sYjW6t1vRquepmSXpzFEa6l7ZZW+zmVyiySHLy+XwScDVc/sLHp5QHZwV2RC/SZ
         f1dQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531P+9iC46S0K6HEam0gAXrUsU+hDJHzwvoeJ5yuF4aMdCQHBYpu
	Cb7kMg1U12MzUv41qzr6qPg=
X-Google-Smtp-Source: ABdhPJwUoy9nu7GdW05/mJtuZajtNQfJA4RiScRMfEVewqWvKHuTXeZ8W+OAv6rHBPxu2fgsjYbfpA==
X-Received: by 2002:a17:906:f745:: with SMTP id jp5mr13581911ejb.440.1591614799735;
        Mon, 08 Jun 2020 04:13:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d987:: with SMTP id u7ls16607777eds.3.gmail; Mon, 08 Jun
 2020 04:13:19 -0700 (PDT)
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr21967912eds.385.1591614798994;
        Mon, 08 Jun 2020 04:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591614798; cv=none;
        d=google.com; s=arc-20160816;
        b=NEJvjUVCiyzAF++FyPp0ZnhGdaaJnvAF4a2bOTZAuITliM71L+qms4a2nMY8LEk2pH
         htSdXxF5If7Gb6IRQPqTwzlUR9Ng7AtIpLKESMbtGm74zuBlENYuGEsBVXwd+BzWrU0i
         MYMbiXEIkwvxt9GRZpkNsirVlIazjC7JyHUtkFtnE+CvZqBcW8Pr7+b4ICjwGxAwxWdN
         qVqAwtMq+SmLRB3wEU9XtixAf8/vAxnXZQcNBctXe+zla72rZtZ73k9WwfInO1pDmWTA
         rDiDV1Mx2D8NHQ59Mmd/VeBgAjSYZtwvpn41rsncJJDsQIUcaudArsF+QjXOwFRaQDzg
         UJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jzWUDYCveVLl8b3FQTIVzIP6HKNW0YVMUe/J8CDoDow=;
        b=b13SQ7QKC4OIyj7Ah3pLcsSxtErIfAy+zGBnuCV7VDCQ4BZauQ+S+oXUjQMSAh/24J
         bsnspLce1PgzABmsLTwGIoex86FaNQTfa0eWQReTxXRNF9fDhV8TwzCNg5AVW6AMicZt
         iMm8twCwShybtNxZzXW6rV57qxPXuDCd851XOYVLSNsXESFLahc/RjRJwoSnXMjRn9ja
         HeZwTu0f7VPoIOVWR5w10pYnDrQv/B/LKF8VE0PUSIwJhCZBDJZo+SU9QnBQy1py3BxQ
         kErjyTMlvDrknTIN8WZdplVi3Pw6oFoAfcZxjmvAQEanDX5R29QLr1e3h+wwj56HIbcn
         XipQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id fx6si788453ejb.0.2020.06.08.04.13.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 058BDIPV017102
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 13:13:18 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058BDHn7004568;
	Mon, 8 Jun 2020 13:13:17 +0200
Subject: Re: [PATCH v2 7/9] tools: ivshmem-demo: Pass peer_id command line
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-8-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0cc3f3d4-f04c-55e2-031b-63a8576d7aff@siemens.com>
Date: Mon, 8 Jun 2020 13:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608104255.18358-8-nikhil.nd@ti.com>
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

On 08.06.20 12:42, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Number of peers available on a platform is different.
> Do not hard code the target peer_id used for interrupt.
> Parse this from the command line argument.
> 
> This de-couples the dependency between number of peers.
> ivshmem-demo can be run to communicate with desired target
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

Please make peer_id an option, not a must. Maybe -t|--target <target>.

Jan

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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0cc3f3d4-f04c-55e2-031b-63a8576d7aff%40siemens.com.

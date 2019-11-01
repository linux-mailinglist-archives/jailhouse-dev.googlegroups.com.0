Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7WD57WQKGQEVKDE6VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id E5528EBE8C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Nov 2019 08:42:54 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id b10sf3717839wmh.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Nov 2019 00:42:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572594174; cv=pass;
        d=google.com; s=arc-20160816;
        b=zcXiBUWmGUfiJ6/VYI++Pe8shMGBVL1/5Npp6GiHDNqf2F/AZhaUXiW5FqTCJoK4A5
         2blhxT0DBOdJgfLMivGLu7UNSfvNc2T1Y/jzm1KIzodmzzZJTw9f2ja7uMc8EKqRtkZY
         qQkk2FXfDolRHRkCs0hGUx8q5kWtjtfchgWZRjgtU/mdJlIAkxDnrzIlLR7BT/YvxItJ
         Pj+8/YEFmNd5uhR49TPzcVZJDC1cn9ZC5VhX1D7zh1dgkr/jp87gzbt5VsyDVgq2PuCX
         1tv6wahMsY3HlzymdeyzttrsUfIl7dm4cm/UtYgfBfBXz9dZXbGV7cZ+piLP3zXSSCRX
         dhxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=CDHUnxzugIBKgxCoTX/bpskujcpK+lzpvMC7zUZc8zM=;
        b=krtBTeteCtPyE1AkZQD1poPJj/zKIgbK4BlSZuYifcZY5JdDtgbdv8u3F6sAXPrA4Y
         CfG/CtC5a3IRSU0QAzav2Gvx5a2DRPX4uqWZK8rjYpoLCo8zKDIsmd6IGKRRwYGmfdT8
         /iLTovQsGukP0PFXBl2p1yK1gc00gH5+iMuIgb8oxMM05cs1m0Ap4GGafiVRAw4k0wks
         VhvXmA2qD+66cmjvqw4WevJqVUhQdchdR4VWU7dpq8Ix4yc60HUn5EgMrf396nVGofLU
         xSMbNBhf6G7himbRYAMyCk95VM1L/MsXT7/Lk+biKRRaXkB3VFqn40Yu7wqfHaV/vn5q
         ae7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CDHUnxzugIBKgxCoTX/bpskujcpK+lzpvMC7zUZc8zM=;
        b=J4UAFcwIfuqIEqKphBHh8jvGJMHLjx1CD+IYFqrimNVUAYkbtRo9YCBsqOyNxisaKx
         /5RMfdsHtnvzPAWvClC9ZWbrkaHfbLKP7KXi+oLH8utjRxioMrETp/RgoR+87YvIwfVS
         5agnMyFcwwejbXw8AhCs1S4JxQgly8WxIf7mj+q+07VFVd7smdgzQ0p/3D1WP4bzCP3d
         q29n4RDEH2JQecwWCspZn/tR6F502WxDWPD4cNaamk0ZzkPawBatb38tEBibdzId+RH6
         nTo1UUSOCybKmcEpHY7lTqC62/YuOqYWU9ywEHcy/INAmWU5fKuHgJH2Q9xzlEWoqtgx
         8iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CDHUnxzugIBKgxCoTX/bpskujcpK+lzpvMC7zUZc8zM=;
        b=ht2kIftGCd4UwGMyarWE+F5QS/ffe2O6OEsblx5aWf4ke7/OBp4BSGlq6OuZeyp8/Z
         LA3Nz3L4kQSGOOAijJIQ/IPDL2CCROqCHzqgHz6L1ncE7XIMXVMUHxRFQ2AqbYbr/QTA
         Waqdi4c4D4TvyjCnDJJYcfRD/27ZAjTlrUj93B8ark2OzJobTRDrpbAluH9GddhGRFIh
         56s7WHZW6UsRTHtmK86Np9QA1fs6EcvGn07Mkqo3Hj7vWeB/eoaIJxt3O/iQE2UBgkBu
         VpqxziWpjiYnfrhoWHQA0IULFkiW+UiRSCQQ61kTeCTDFhq2HLX7l+dEJGZxMHw89tVS
         qsUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXF2mhdQs/QTeCc/VOk14Y4EDb1oDetcqs6RXiYAKsmGe/x7LTw
	5cXxKReNZRE7maoKxZ2hEew=
X-Google-Smtp-Source: APXvYqyQawL4g9v8nCqMqGHfZPT6s1nKz4dRMLzmASHGHwLKNLvFLaxgFyaD5ohOFw58EqqqkeZFIw==
X-Received: by 2002:a05:600c:22c4:: with SMTP id 4mr9294256wmg.177.1572594174596;
        Fri, 01 Nov 2019 00:42:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1:: with SMTP id g1ls7133577wmc.2.canary-gmail;
 Fri, 01 Nov 2019 00:42:53 -0700 (PDT)
X-Received: by 2002:a1c:9dd3:: with SMTP id g202mr9334942wme.43.1572594173912;
        Fri, 01 Nov 2019 00:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572594173; cv=none;
        d=google.com; s=arc-20160816;
        b=KXk382zVhV/33p8uktJl2jgibAELzaM+HSHMsrpgDOuIOCvp8XycbkjO6N74UQdN8T
         s9M94GFqZj2fC+jv3+7I+3t6vcatACDUUNtwvjl64fQjdhRJj5KPFkF38KU+xMspw+62
         C2O5iJCrmhpJwBdNazywXmqq7jJVNiz+TH/LeDT9153hXLw2DErySi3snZT0MWc3/csT
         Kw+UYhVza8HhQYVZxeBT4w8UFuM7hFOKfQCM0lhfXtAj5M23VlI4ToPqNcLZNCrHXWAn
         +g7Rm6hJyuystQaxzV0ZvNvUKiylxiC7S5ZbdhRApqPSiHZ++r3ucD0MSltWb7XoRjRK
         ppnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=frD12ir+3mUGvFEHlikGeFzkfRGGiAuscsgO7wG5DgM=;
        b=nSYVz7FfZmMu3HpJPwtmC6xqcX8QFfrGgwze58aZx4kgZGETedfgvHDt9gJK2/Fc7D
         5tlzJpYGdkViEosBMkakHhEFRiCIEInsyYN23fC5tWmzQd5adOx/LMeTzvz1rU1tXSKM
         c4ElGXvbElHL0A5j4KoViLCPXoZndzyn1bRXtVuq+rwKJ/D20N+2+TLf+MZaETjJXWra
         mwzytoVcvJOQGeHkJQcIQxIUiulaPjO3bhuINNGEQIQU+wLC4SFNmAl/htvkkBJyfTmw
         Hw7XLK2/xnOcFSS2U16SYVty5nGPv2HCub/JywkqPTPUyghI0VMKWcZUD0RPAryCD66v
         p3Pw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x2si305413wrv.1.2019.11.01.00.42.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 00:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xA17grl4025381
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 1 Nov 2019 08:42:53 +0100
Received: from [167.87.40.255] ([167.87.40.255])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA17grVt015246
	for <jailhouse-dev@googlegroups.com>; Fri, 1 Nov 2019 08:42:53 +0100
Subject: Re: PoC: virtio over ivshmem for Jailhouse
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
Message-ID: <6584cb63-4409-0910-6486-1be3776de309@siemens.com>
Date: Fri, 1 Nov 2019 08:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 14.10.19 19:04, Jan Kiszka wrote:
> Hi all,
> 
> it's still basically a PoC, not yet specified and with a lot of sharp
> edges, but it works too well for not being pointed out:
> 
> The queues/jailhouse-ivshmem2 branch on [1] contains a virtio-ivshmem
> transport driver [2] for Linux front-end guests and a simple virtio
> console backend device model [3], also for Linux. Combining that with
> the wip/ivshmem2 branch of Jailhouse, you can call in the root cell
> 
> # echo "4a48 4a48 4a48 4a48 ffc003 ffffff" \
>    > /sys/bus/pci/drivers/uio_ivshm/new_id
> # virtio-ivshmem-console /dev/uio0
> 
> and then start the Linux demo inmate which uses "console=hvc0". You will
> both see the (late) boot logs and be able to log into the guest, like it
> were a serial console. And all that without touching anything in
> Jailhouse (beyond generic ivshmem 2.0 support)!
> 
> More to come, latest at [4].
> 
> Jan
> 
> [1] http://git.kiszka.org/linux.git/
> [2]
> http://git.kiszka.org/?p=linux.git;a=blob;f=drivers/virtio/virtio_ivshmem.c;hb=refs/heads/queues/jailhouse-ivshmem2
> [3]
> http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-console.c;hb=refs/heads/queues/jailhouse-ivshmem2
> [4] https://sched.co/TmxI
> 

Slides for my presentation on this topic yesterday are now available
(recording will follow later):

https://static.sched.com/hosted_files/kvmforum2019/4b/KVM-Forum19_ivshmem2.pdf

The overall feedback was very positive. I think we have a good chance
that things will move forward much faster now towards upstream
integration in the related projects - and into Jailhouse master.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6584cb63-4409-0910-6486-1be3776de309%40siemens.com.

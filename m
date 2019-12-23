Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBF4VQXYAKGQEZSGHJRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E5129BBE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 00:15:35 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id x201sf2943030lfa.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 15:15:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577142935; cv=pass;
        d=google.com; s=arc-20160816;
        b=gonigl1/aavqXFMcRMabOhFoNMXIs2ORCyqXymRL0TD7T3aqJG+xqft/szONek0aTZ
         ijz8JntfpZpbCi62kzj97S5QQ9pPw/fiMKMGLedkAnzvjSMDG9FbY4N0nrMstQAaRBpS
         atQ6H9/wXZbqXCf6NXG4TZoSbfcHJI65oEYJiJCSRtHRSKT5HTHwS6UnhDDUCrvMVWam
         8S74cPRdbJI6hYKhs6+N8TAsc8xlG/ujvMBw2DrpWk7h6xGk5MaFIoln6E9RimrBjmEN
         pXnoNUIRmXx62h6ZVbpn+7F3/C3QL4DKfm/8H7C45ccoN4yQM+d8iwWExpRu/5a0nw7p
         RpSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=7BCrThji+d5beXbiNvC+W8Rhr9SsUy08DvfQR2bo3Zs=;
        b=pWUPJe8rduAv3c8qB1E9VsloNT9OHIHZllhzw70HiYFdfZvUVFi/blfuQ7Cuxs8uJF
         n9zlCa9wgBlErCDXoV/sI6pcOFjAL1oiqSw18QfoWfRDWYkZTirowzRMTi7iwmThpLHo
         88Bqm9buFXs+qrbElfMbYX1rplFOaeM85vkIVqR9OzVQkRsgG2JkE2m6J4kTdtMmUj/Y
         0Jp0IsHJIlDDRe2/REJYKRoP2YaNy/jxlruBg472OZEPYPyPiBlPOmvQaFQOcNtAyqDd
         QYK4Rw80Q0l1q9hFQnPB9XNLXMi6YHJO1KuaFlEJnXNhuK+DhvTO+vhMtMGpN3LcRI2C
         I7WA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=snD0L23G;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7BCrThji+d5beXbiNvC+W8Rhr9SsUy08DvfQR2bo3Zs=;
        b=TeG0iNS2xxxWQfBvV39AOzw7DZIhFh2L7a1ENk7W80PYqYxgyKIpZXLB515PWQhJJ9
         R3IU2b2eIwIy+szhqZ8zMXq+llnpUdK5+xB8gs2JGk6q51ooCHv4tsr5vSzyoZy9j9BM
         a0LPmdlxiT6Tcwr4lm6LI7FOQKF5TcECLK2Z5YzYT3z8OQt5HGK8elfuvW/5ncIBkk6b
         tXrpvXfsypqdXC47bsSViTAFrmr21FEmiYpgwpaH/ABzmX7pMC8EwtacKNqGVDLGKydp
         xMI2KV1jk9uVVsON064Atz9btUwjtxgCJvWmnPRERXA6YyNDKH4+hOo299RL/EGA4ewf
         BdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7BCrThji+d5beXbiNvC+W8Rhr9SsUy08DvfQR2bo3Zs=;
        b=oEUS9+jfndgHsWBViAzfgqD3tKtfJHlZ3wHd9qMSj/4wGc1Sbvl+b6+5naFuahMeuR
         VsEr6bqgna4YzeZWq/sVlUkh4UiDyqvCxlUJ2hToVaAmtiZNfCBwozhG6BY1Wrt1vcJt
         qPgvS2zOyGZWq9UUB7ASuulLZown1vHXEiSEZV44U9CeSzJBcCpOQKGjwBf7jhn61xXN
         2L21+U0QHfwxDat2joexLsgbj/bIqvrUojRRzcJ/DTbDwBkK91YG4grA9VY01ARlOpKR
         PU5aUZYrhxMTVrDUFfc2cgHMeHivnDpnahmTEeyP6riIpyNv9vSolhOX6pkL6+bApLdZ
         1p/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIntFff7iBOqJY3yfbtPuZDUUBaP1k3mXVVhj52ksBC7h2GUjS
	WeUwGnE277MM7OO2I9vRdSA=
X-Google-Smtp-Source: APXvYqwNQXvWNYv8BLuUVSXPjbvYCHQJKzPfpSyzjPJjIkdRQizzRh/w8r85B0aSDKlqfWyXXovYnA==
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr18601578lfn.150.1577142935237;
        Mon, 23 Dec 2019 15:15:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8808:: with SMTP id k8ls1626351lfd.6.gmail; Mon, 23 Dec
 2019 15:15:34 -0800 (PST)
X-Received: by 2002:ac2:51a4:: with SMTP id f4mr19154883lfk.76.1577142934586;
        Mon, 23 Dec 2019 15:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577142934; cv=none;
        d=google.com; s=arc-20160816;
        b=E6tMs+iT8E+uj5JI+obAoIdaFk7NFkkzJs6yDvsL4SSAZkYA3WFImGsJZXkkSizEkO
         Vio5GF9VNK81fpdGUbYmkZ3GmNjD1M001qryqjPSYjKMRvc6j+EDcKP6bsl73mfLPYFh
         6XLB7wBDbOhTH3fBl5uHZ5jWbBnETeTJ6OyNMYAnk8byGBTNwOMLZNIQowVHG0r7rgtM
         7dJlzYjeGSNxcqkZLybIVkShg7Xx4tQffAIn8FQ+SEJtXvURcHKhGm60mUMeLdiJ1iyd
         Wm7dq4xyBEedq89YIipkuBNebJlq+3NA3zHVc1hkM/evUwvkD+O9/oZ0pmskGZyytzjJ
         2HAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uMxrZX6jLDU0S1yxFo1CIbqEFT3o55ClEwjGZTZu1HA=;
        b=ICRpGCoRoxnQdsDEjclgFIkcwEnAZqJYh9WwH5NyyIpw35Q6AZGfn93WtWX6SVLzeR
         YMikGPxYIjKSA655wBZP0DW8VUoqhc6wv0bFcqUpz8yHTUrcvzhvlXR4cbZcgwTw7MJw
         UtSYsPglWWeDJUmSSI0StTf7BkNplmhvr3qbCNOINs6kOTIC8I3UwJITBaiiy0hqbeAU
         LmZYNjE4jDnUbaGxclT/TLOvLgHh1dVuVgb0MXeauSP3dHeUHneN9HbLfZLZrXDbaYer
         liApai1hd4DfhvvP6PuBFgCxGyXwPtES4OICG8YJrjtBTiRPLvpzg2cYPN1NG+9UgbSP
         xVmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=snD0L23G;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id e3si923877ljg.2.2019.12.23.15.15.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 15:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LetYx-1jZgWg2WQ3-00qfBZ; Tue, 24
 Dec 2019 00:15:33 +0100
Subject: Re: [PATCH v4 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191223151353.22495-1-nikhil.nd@ti.com>
 <20191223151353.22495-5-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fbc3620e-2e7b-ccf5-bfe7-39fd61d0af11@web.de>
Date: Tue, 24 Dec 2019 00:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191223151353.22495-5-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:+LuekxZYJh1+jAiZwTiiQ74Hfo+XYTNojvTBRPG2DDgHhvBnKAb
 IEaDbVXBYY2QqE0fAbcelEhEIAaLW1bL3zWCQZiNnOn/9SKh/ikzWybiwnrpSXrqF1lWy8e
 8jYwlHm0Qkthmrah+TQjP858XRiaGeZdOSa0lBdb0XoGollb7zPCfjJPx+db6sJAfTgl2Ev
 u91Yy3pt8mGKhdn8axw6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mqv+RWtQwz8=:8OG2MYJVeqJBWSseDHdSif
 gJnE51jGl5ARCO9HHXXrKecaAf0Kpe5hcNXnZ5Xf/bRj4eJyUUHzHl+7xckakgMGeV7NVUcrM
 9YW8tTmkyzhoriJuKz3d7Pdt+Sttd+EwtHNfXw+9YfAQu2lJ31N7tCNI255A6vRjRBVUUh5j5
 qDmfmstZuIu3veQvqUVrG+PFe6I302HbIJ/8sseF/L62yY1XJVltO0fYswGsRko7uS2Pl2QDd
 k8aGfQ2GBe8vDG65g+dZB6Hl1TAYfj/cfSVjUN+U+9Z1gExniSzdBvPFfhzPCamUOVFGj3jXS
 8LgnA0Y2SMBZByYMHPEwhfaTzYBSu6vIOLhZ46H+wPUUd1xj+xiVQGd22zbTuotRMZufHsHZj
 vfluel2iLPT2en2e4VXDZzFSzyDbJR1PxpjGKDaKWi+hpOue4CZXN6Q1vT2GIRw1qXjx+AlOV
 wlZFbobRlVOKchwSl7kAWdeMPlI4AJNzyOSZp01nTa3K7FircJtHejyqGeIhxvrt8X8VHiW/L
 rvqIBOB8UNl/njOdpccFfQfav/thoIDDq3E0Uvekq0FjnKUwjg1Wgu9Bhx4Nf9EyN0a1RrUsm
 xeIdQ4chJFBrZ4i1D2J+Ra1jboUhYyHdHak1yQ1X3yvLqDzCsNYXSOxS2gbC9JV/caQbkkqxx
 O+86QKL7sMZhiAUokmi8xSO0+XppcQS7xP1peC59LSx4TTHEoHBxFGcgBsocSb3t/Y0+C8eM9
 eY6rmGm+HfJ3ctwty5qASdhI72VaiXdcRzJoKpkkBSdj8CZNQXXpjuEVabOy2/V7T2A4BVjkd
 4qHq0GcphrBqwbez87q9RYjCi04eBcHl+5DSHre3MkBaJoNesr1K+zBq1k76lMcNYDzrzFBz/
 ZWxhf4n68kd7qoYWXGlUHgZkCAhOCQbjwoPA1wh4hZIWxuT3U0yJepb5VZOQVeroak9ktGzzR
 NPqLp+ySC5ytYT2C+o5lIlxykB0fk2gCMCFCd8hXiYSp7wBDVmHmla1BIZsYSHIev6tgxHeBZ
 MHE9dgFr4Jip5KIqMmTkowKYp7XkXnH+Eg/6XuWo873YWM6PIAv6qHjchLSD9QAwaCya3Ikfo
 LMe/Y8nvEdnVQNVWDg6jL9hDSI+amKmPdRWHGF55WqXx465aHIwZvf5IZQu2uSQN/u6q3W+4R
 eUQD2w470GKvHzmmukqgc9lbkFMbosdaOKg9wVDE2cvV0KSTlAXKDzkWXI3tfNYRbWf7bWSGI
 uSBTgmyZ5IQHt8wOTienm65HN608W27n+uTmd7M/5yzepGw0YDkXthkrsiTw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=snD0L23G;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 23.12.19 16:13, 'Nikhil Devshatwar' via Jailhouse wrote:
> Add the linux demo cell config for j721e-evm board.
> Also add the required device tree for booting Linux kernel
> in the inmate cell.
>
> This cell config acts as a reference for partitioning
> devices across the 2 Linux cells.
> This will be updated as support for more devices get added.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>
> Notes:
>      Changes from v3:
>      * Add gpio, emmc and USB device in the DTS with upstream bindings
>      * Describe the irqmap for easy understanding and verification
>      * Update power-domains properties
>
>      Changes from v2:
>      * Only add the DT entries for devices with stable bindings
>      * Organize the DTS to match the bus topology with upstream kernel
>
>      Changes from v1:
>      * Split up the peripheral mem_region to match with kernel dts
>      * Add GPU, multimedia decoder and display devices
>
>   configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
>   configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
>   2 files changed, 695 insertions(+)
>   create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>   create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
>
> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> new file mode 100644
> index 00000000..51470a57
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> @@ -0,0 +1,433 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for J721E Jailhouse inmate kernel
> + *
> + * Copyright (C) 2016-2019 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/k3.h>

This is too recent for "older" kernels, even 4.19. We are building this
unconditional, though, so we need to avoid breaking such builds. I'm
importing the needed defines into this file.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fbc3620e-2e7b-ccf5-bfe7-39fd61d0af11%40web.de.
